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
                ViewState["Analisis"] = new Analisis();
                this.BindGrid();

            }

        }

        protected void BindGrid()
        {
            DetalleGridView.DataSource = ((Analisis)ViewState["Analisis"]).Detalles;
            DetalleGridView.DataBind();

        }

        public Analisis LlenarClase()
        {
            Analisis analisis = new Analisis();

            analisis = (Analisis)ViewState["Analisis"];
            analisis.AnalisisId = Utils.ToInt(AnalisisId.Text);
            analisis.FechaAnalisis = Utils.ToDateTime(FechaTextBox.Text);
            analisis.PacienteId = Utils.ToInt(PacienteDropDownList.SelectedValue);
            return analisis;

        }

        public void LlenarCampos(Analisis analisis)
        {
            Limpiar();
            AnalisisId.Text = Convert.ToString(analisis.AnalisisId);
            FechaTextBox.Text = analisis.FechaAnalisis.ToString("yyyy-MM-dd");
            PacienteDropDownList.SelectedValue = Convert.ToString(analisis.PacienteId);

            this.BindGrid();
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

            egreso.AgregarDetalle(0,0, 0, ResultadoTextBox.Text);
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
            RepositorioBase<Analisis> repositorio = new RepositorioBase<Analisis>(new Contexto());
            Analisis analisis = new Analisis();

            analisis = LlenarClase();

            if (analisis.AnalisisId == 0)
            {
                repositorio.Guardar(analisis);
                Limpiar();

            }
            else
            {
                Analisis egre = new Analisis();
                RepositorioBase<Analisis> repository = new RepositorioBase<Analisis>(new Contexto());
                int id = Convert.ToInt32(AnalisisId.Text);
                egre = repository.Buscar(id);

                if (egre != null)
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

        }

        protected void EliminarPaciente_Click(object sender, EventArgs e)
        {

        }

        protected void LimpiarPaciente_Click(object sender, EventArgs e)
        {

        }

        protected void BuscarTipoAnalisis_Click(object sender, EventArgs e)
        {

        }

        protected void LimpiarTipoAnalisis_Click(object sender, EventArgs e)
        {

        }

        protected void GuardarTipoAnalisis_Click(object sender, EventArgs e)
        {

        }

        protected void EliminarTipoAnalisis_Click(object sender, EventArgs e)
        {

        }
    }
}