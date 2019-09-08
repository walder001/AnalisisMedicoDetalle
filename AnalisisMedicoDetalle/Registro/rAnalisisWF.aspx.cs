using BLL;
using DAL;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnalisisMedicoDetalle.Registro
{
    public partial class rAnalisisWF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            TipoAnalisis tipo = new TipoAnalisis();

            if (!Page.IsPostBack)
            {
                RepositorioBase<TipoAnalisis> repositorioBase = new RepositorioBase<TipoAnalisis>(new Contexto());

                TipoDropDownList.DataSource = repositorioBase.GetList(t => true);
                TipoDropDownList.DataValueField = "TipoAnalisiId";
                TipoDropDownList.DataTextField = "Descripcion";
                TipoDropDownList.DataBind();

                ViewState["Analisis"] = new Analisis();
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

            analisis.AnalisisId = Utilitarios.Utils.ToInt(AnalisisId.Text);
            /*analisis.FechaAnalisis = DescripcionTextBox.Text;*/

            return analisis;
        }

        public void LlenarCampos(Analisis analisis)
        {
            Limpiar();
            /*PresupuestoTextBox.Text = presupuesto.PresupuestoId.ToString();
            DescripcionTextBox.Text = presupuesto.Descripcion;*/

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
     
       

        protected void GuardarButton_Click(object sender, EventArgs e)
        {
            bool paso = false;
            RepositorioAnalisis repositorio = new RepositorioAnalisis(new Contexto());
            //todo: agregar demas validaciones
            Analisis analisis = LlenarClase();

            if (Utilitarios.Utils.ToInt(AnalisisId.Text) == 0)
                paso = repositorio.Guardar(analisis);

            else
                paso = repositorio.Modificar(analisis);

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

        protected void LimpiarButton_Click1(object sender, EventArgs e)
        {
            Limpiar();

        }

        protected void AgregarButton_Click1(object sender, EventArgs e)
        {
           
            Analisis analisis = new Analisis();

            analisis = (Analisis)ViewState["analisis"];
            analisis.AgregarDetalle(0, analisis.AnalisisId,
               0, ResultadoTextBox.Text);

            ViewState["analisis"] = analisis;

            this.BindGrid();
            ResultadoTextBox.Text = "";

        }
    }
}