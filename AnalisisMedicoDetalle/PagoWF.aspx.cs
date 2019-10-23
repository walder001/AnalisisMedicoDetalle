using AnalisisMedicoDetalle.Utilitarios;
using BLL;
using DAL;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnalisisMedicoDetalle
{
    public partial class PagoWF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                base.ViewState["Pago"] = new Pago();
                ValoresDeDropdowns();
                LLenaDetalle();
                this.BindGrid();
                PacienteDropDown.SelectedItem.Value.IndexOf("2");

            }

        }

        protected void BindGrid()
        {
            DatosGridView.DataSource = ((Pago)base.ViewState["Pago"]).DetallePagos;
            DatosGridView.DataBind();

        }

        public Pago LlenarClase()
        {
            Entidades.Pago pago = new Entidades.Pago();

            pago = (Entidades.Pago)base.ViewState["Pago"];
            pago.PagoId = Utils.ToInt(PagoId.Text);
            pago.AnalisisId = 0;
            pago.PacienteId = Utils.ToInt(PacienteDropDown.SelectedItem.Value);
            pago.FechaPago = Utils.ToDateTime(DateTime.Now.ToString());
            return pago;

        }

        public void LlenarCampos(Entidades.Pago pago)
        {
            Limpiar();
            ((Pago)ViewState["Pago"]).DetallePagos = pago.DetallePagos;
            PagoId.Text = Convert.ToString(pago.PagoId);
            PacienteDropDown.SelectedIndex = Convert.ToInt32(pago.AnalisisId);
            this.BindGrid();
        }
        private void ValoresDeDropdowns()
        {
            RepositorioBase<Pacientes> db = new RepositorioBase<Pacientes>(new Contexto());
            var listado = new List<Pacientes>();
            listado = db.GetList(p => true);
            PacienteDropDown.DataSource = listado;
            PacienteDropDown.DataValueField = "PacienteId";
            PacienteDropDown.DataTextField = "Nombres";
            PacienteDropDown.DataBind();

        }
        
        public void Limpiar()
        {
            PagoId.Text = string.Empty;
            PacienteDropDown.Enabled = true;
            
            base.ViewState["Pago"] = new Entidades.Pago();
            this.BindGrid();

        }

        protected void LimpiarTipoAnalisis_Click(object sender, EventArgs e)
        {
            Limpiar();

        }

        protected void GuardarTipoAnalisis_Click(object sender, EventArgs e)
        {
            bool paso = false;
            PagoBLL repositorio = new PagoBLL(new Contexto());
            Entidades.Pago pago = new Entidades.Pago();

            pago = LlenarClase();

            if (pago.PagoId == 0)
            {
                repositorio.Guardar(pago);
                Limpiar();

            }
            else
            {
                Pago egre = new Pago();
                PagoBLL repository = new PagoBLL(new Contexto());
                int id = Convert.ToInt32(PacienteDropDown.SelectedIndex);
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

        protected void EliminarTipoAnalisis_Click(object sender, EventArgs e)
        {
            PagoBLL repositorio = new PagoBLL(new Contexto());
            Entidades.Pago pago = new Entidades.Pago();

            if (repositorio.Eliminar(Convert.ToInt32(PacienteDropDown.SelectedIndex)))
            {

                Utilitarios.Utils.ShowToastr(this, "Registro eliminado", "Exito", "success");
                Limpiar();
            }
            else
            {
               // EliminarRequiredFieldValidator.IsValid = false;


            }


        }

        protected void PagoBuscarAnalisis_Click(object sender, EventArgs e)
        {
            RepositorioBase<DetallePago> pago = new RepositorioBase<DetallePago>(new Contexto());
            int id;
            id = Utils.ToInt(PagoId.Text);

            DatosGridView.DataSource = pago.GetList(c => c.PagoId == id);
            DatosGridView.DataBind();
        }

        protected void AgregarButton_Click1(object sender, EventArgs e)
        {

            Entidades.Pago pago = new Entidades.Pago();
            pago = (Entidades.Pago)base.ViewState["Pago"];

            pago.AgregarPago(0,Utils.ToInt(PagoId.Text),Utils.ToInt(PacienteDropDown.SelectedItem.Value),pago.AnalisisId, Convert.ToDecimal(MontoAPagar.Text));
            ViewState["Pago"] = pago;

            this.BindGrid();
        }

        public void LLenaDetalle()
        {

            RepositorioBase<DetalleAnalisis> repositorio = new RepositorioBase<DetalleAnalisis>(new Contexto());
            int id = Utils.ToInt(PacienteDropDown.SelectedValue);
            DetalleDropDownList1.DataSource = repositorio.GetList(a => a.PacienteId == id); ;
            DetalleDropDownList1.DataValueField = "DetalleAnalsisId";
            DetalleDropDownList1.DataTextField = "Monto";
            DetalleDropDownList1.DataBind();

            //Monto.Text = PacienteDropDown.SelectedItem.Value;

        }
        protected void DetalleDropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

          
        }

        protected void AnalisisDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void AnalisisDropDown_TextChanged(object sender, EventArgs e)
        {
            LLenaDetalle();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            LLenaDetalle();
        }
    }

   
}