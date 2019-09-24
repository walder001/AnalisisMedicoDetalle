using AnalisisMedicoDetalle.Utilitarios;
using BLL;
using DAL;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnalisisMedicoDetalle
{
    public partial class AnalisisWF : System.Web.UI.Page
    {
        public Analisis ana = new Analisis();
        private List<Analisis> analis = new List<Analisis>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FechaTextBox.Text = DateTime.Now.ToString("yyyy-MM-dd");
                ViewState["Analisis"] = new Analisis();
                LLenarCombo();
                this.BindGrid();
            }

        }
        public void LLenarCombo()
        {
            RepositorioBase<Pacientes> repositorio = new RepositorioBase<Pacientes>(new Contexto());
            var Lista = new List<Pacientes>();
            Lista = repositorio.GetList(a => true);
            PacienteDropDownList.DataSource = Lista;
            PacienteDropDownList.DataValueField = "PacienteId";
            PacienteDropDownList.DataTextField = "Nombres";
            PacienteDropDownList.DataBind();
        }

        protected void BindGrid()
        {
            DetalleGridView.DataSource = ((Analisis)ViewState["Analisis"]).Detalles;
            DetalleGridView.DataBind();
        }

        //LLena clase
        public Analisis LlenarClase()
        {
            Analisis analisis = new Analisis();

            analisis = (Analisis)ViewState["Analisis"];
            analisis.AnalisisId = Utils.ToInt(AnalisisId.Text);
            analisis.FechaAnalisis = Utils.ToDateTime(FechaTextBox.Text);
            analisis.PacienteId = Utils.ToInt(PacienteDropDownList.SelectedItem.Value);
            return analisis;

        }

        public Pacientes LlenarClasePaciente()
        {
            Pacientes pacientes = new Pacientes();

            pacientes.PacienteId = Utils.ToInt(PacienteId.Text);
            pacientes.Nombres = Nombre.Text;
            pacientes.Balance = Utils.ToDecimal(BalanceTextBox.Text);
            return pacientes;

        }

        public TipoAnalisis LlenarClaseTipo()
        {
            TipoAnalisis tipo = new TipoAnalisis();

            tipo.TipoAnalisisId = Utils.ToInt(TipoAnalisisId.Text);
            tipo.Descripcion = Descripcion.Text;
            tipo.Precio = Utils.ToDecimal(Precio.Text);
            return tipo;

        }

        //LLena Campo
        public void LlenarCampos(Analisis analisis)
        {
            Limpiar();
            ((Analisis)ViewState["Analisis"]).Detalles = analisis.Detalles;
            AnalisisId.Text = Convert.ToString(analisis.AnalisisId);
            FechaTextBox.Text = analisis.FechaAnalisis.ToString("yyyy-MM-dd");
            PacienteDropDownList.SelectedValue = Convert.ToString(analisis.PacienteId);

            this.BindGrid();
        }

        public void LlenarCamposPaciente(Pacientes pacientes)
        {
            PacienteId.Text = Convert.ToString(pacientes.PacienteId);
            Nombre.Text = pacientes.Nombres;
            Balance.Text = Convert.ToString(pacientes.Balance);
        }

        public void LlenarCamposTipo(TipoAnalisis tipo)
        {
            PacienteId.Text = Convert.ToString(tipo.TipoAnalisisId);
            Descripcion.Text = tipo.Descripcion;
            Precio.Text = Convert.ToString(tipo.Precio);
        }
        public void Limpiar()
        {
            AnalisisId.Text = string.Empty;
            PacienteDropDownList.Enabled = true;
            TipoDropDownList.Enabled = true;
            ResultadoTextBox.Text = "";
            ViewState["Analisis"] = new Analisis();
            this.BindGrid();

        }
        public void LimpiarPaciente()
        {
            PacienteId.Text = string.Empty;
            Nombre.Text = string.Empty;
            ResultadoTextBox.Text = string.Empty;
        }

        public void LimpiarTipo()
        {
            TipoAnalisisId.Text = string.Empty;
            Descripcion.Text = string.Empty;
            Precio.Text = String.Empty;
        }
        protected void BuscarButton_Click(object sender, EventArgs e)
        {
            RepositorioBase<Analisis> repositorio = new RepositorioBase<Analisis>(new Contexto());

            var Presupuesto = repositorio.Buscar(
                Utilitarios.Utils.ToInt(AnalisisId.Text));
            if (Presupuesto != null)
            {
                LlenarCampos(Presupuesto);
                Utilitarios.Utils.ShowToastr(this, "Busqueda exitosa", "Exito");
            }
            else
            {
                Limpiar();
                Utilitarios.Utils.ShowToastr(this,
                    "No se pudo encontrar el presupuesto especificado",
                    "Error", "error");
            }
        }

        private void LlenarValores()
        {
            List<DetalleAnalisis> detalle = new List<DetalleAnalisis>();


            if (DetalleGridView.DataSource != null)
            {
                detalle = (List<DetalleAnalisis>)DetalleGridView.DataSource;
            }

        }
        protected void AgregarButton_Click1(object sender, EventArgs e)
        {

            Analisis egreso = new Analisis();
            egreso = (Analisis)ViewState["Analisis"];
            egreso.AgregarDetalle(0,0, Utils.ToInt(PacienteDropDownList.SelectedValue), 0, ResultadoTextBox.Text, Convert.ToDecimal(MontoTextBox.Text));

            //egreso.AgregarDetalle(0,Convert.ToInt32(AnalisisId.Text),Convert.ToInt32(PacienteId.Text), Convert.ToInt32(TipoAnalisisId.Text),ResultadoTextBox.Text,Convert.ToDecimal(MontoTextBox.Text));
            ViewState["Analisis"] = egreso;

            this.BindGrid();
            LlenarValores();

        }

        protected void LimpiarButton_Click1(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void GuardarButton_Click(object sender, EventArgs e)
        {
            bool paso = false;
            Analisis analisis = new Analisis();
            RepositorioAnalisis repositorio = new RepositorioAnalisis(new Contexto());


            analisis = LlenarClase();

            if (analisis.AnalisisId == 0)
            {
                repositorio.Guardar(analisis);
                Limpiar();

            }
            else
            {
                RepositorioBase<Analisis> repository = new RepositorioBase<Analisis>(new Contexto());
                int id = Convert.ToInt32(AnalisisId.Text);
                analisis = repository.Buscar(id);

                if (analisis != null)
                {
                    paso = repository.Modificar(LlenarClase());
                }
                else
                    Response.Write("<script>alert('Id no existe');</script>");

            }

            if (paso)
            {
                Utilitarios.Utils.ShowToastr(this, "Transacción exitosa", "Exito", "success");
                Limpiar();
            }

        }

        protected void EliminarButton_Click(object sender, EventArgs e)
        {
            Analisis analisis = new Analisis();
            RepositorioAnalisis repositorio = new RepositorioAnalisis(new Contexto());

            if (repositorio.Eliminar(Convert.ToInt32(AnalisisId.Text)))
            {

                Utilitarios.Utils.ShowToastr(this, "Registro eliminado", "Exito", "success");
                Limpiar();
            }
            else
                EliminarRequiredFieldValidator.IsValid = false;

        }

        protected void GuardarPaciente_Click(object sender, EventArgs e)
        {
            bool paso = false;
            RepositorioBase<Pacientes> repositorio = new RepositorioBase<Pacientes>(new Contexto());
            Pacientes pacientes = new Pacientes();

            pacientes = LlenarClasePaciente();

            if (pacientes.PacienteId == 0)
            {
                repositorio.Guardar(pacientes);
                Limpiar();

            }
            else
            {
                Pacientes egre = new Pacientes();
                RepositorioBase<Pacientes> repository = new RepositorioBase<Pacientes>(new Contexto());
                int id = Convert.ToInt32(PacienteId.Text);
                egre = repository.Buscar(id);

                if (egre != null)
                {
                    paso = repository.Modificar(LlenarClasePaciente());
                }
                else
                    Response.Write("<script>alert('Id no existe');</script>");

            }

            if (paso)
            {
                Utilitarios.Utils.ShowToastr(this, "Transacción exitosa", "Exito", "success");
                Limpiar();
            }

        }

        protected void EliminarPaciente_Click(object sender, EventArgs e)
        {

        }

        protected void LimpiarPaciente_Click(object sender, EventArgs e)
        {
            LimpiarPaciente();
        }

        protected void BuscarTipoAnalisis_Click(object sender, EventArgs e)
        {

        }

        protected void LimpiarTipoAnalisis_Click(object sender, EventArgs e)
        {
            LimpiarTipo();
        }

        protected void GuardarTipoAnalisis_Click(object sender, EventArgs e)
        {
            bool paso = false;
            RepositorioBase<TipoAnalisis> repositorio = new RepositorioBase<TipoAnalisis>(new Contexto());
            TipoAnalisis tipo = new TipoAnalisis();

            tipo = LlenarClaseTipo();

            if (tipo.TipoAnalisisId == 0)
            {
                repositorio.Guardar(tipo);
                Limpiar();

            }
            else
            {
                TipoAnalisis egre = new TipoAnalisis();
                RepositorioBase<TipoAnalisis> repository = new RepositorioBase<TipoAnalisis>(new Contexto());
                int id = Convert.ToInt32(TipoAnalisisId.Text);
                egre = repository.Buscar(id);

                if (egre != null)
                {
                    paso = repository.Modificar(LlenarClaseTipo());
                }
                else
                    Response.Write("<script>alert('Id no existe');</script>");

            }

            if (paso)
            {
                Utilitarios.Utils.ShowToastr(this, "Transacción exitosa", "Exito", "success");
                Limpiar();
            }

        }

        protected void EliminarTipoAnalisis_Click(object sender, EventArgs e)
        {

        }

        protected void BuscarPaciente_Click(object sender, EventArgs e)
        {

        }

        protected void DetalleGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DetalleGridView_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void PacienteDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            LLenarCombo();

        }
    }
}