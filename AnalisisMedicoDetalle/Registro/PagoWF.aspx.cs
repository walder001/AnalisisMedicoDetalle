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

            base.ViewState["Pago"] = new Entidades.Pago();
            ValoresDeDropdowns();
            this.BindGrid();

        }

        protected void BindGrid()
        {
            DatosGridView.DataSource = ((Entidades.Pago)base.ViewState["Pago"]).DetallePagos;
            DatosGridView.DataBind();

        }

        public Pago LlenarClase()
        {
            Entidades.Pago pago = new Entidades.Pago();

            pago = (Entidades.Pago)base.ViewState["Pago"];
            pago.PagoId = Utils.ToInt(PagoId.Text);
            pago.AnalisisId = Utils.ToInt(AnalisisDropDown.SelectedValue);

            pago.FechaPago = Utils.ToDateTime(DateTime.Now.ToString());
            return pago;

        }

        public void LlenarCampos(Entidades.Pago pago)
        {
            Limpiar();
            PagoId.Text = Convert.ToString(pago.PagoId);
            AnalisisDropDown.SelectedIndex = Convert.ToInt32(pago.AnalisisId);
            this.BindGrid();
        }
        private void ValoresDeDropdowns()
        {
            RepositorioAnalisis db = new RepositorioAnalisis(new Contexto());
            var listado = new List<Analisis>();
            listado = db.GetList(p => true);
            AnalisisDropDown.DataSource = listado;
            AnalisisDropDown.DataValueField = "AnalisisId";
        //    AnalisisDropDown.DataTextField = "Nombres";
            AnalisisDropDown.DataBind();

            //RepositorioBase<TiposAnalisis> repositorio = new RepositorioBase<TiposAnalisis>();
            //var list = new List<TiposAnalisis>();
            //list = repositorio.GetList(p => true);
            //TiposAnalisisDropDown.DataSource = list;
            //TiposAnalisisDropDown.DataValueField = "TiposId";
            //TiposAnalisisDropDown.DataTextField = "Analisis";
            //TiposAnalisisDropDown.DataBind();
        }
        public void Limpiar()
        {
            PagoId.Text = string.Empty;
            AnalisisDropDown.Text = string.Empty;
            
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
            RepositorioPago repositorio = new RepositorioPago(new Contexto());
            Entidades.Pago pago = new Entidades.Pago();

            pago = LlenarClase();

            if (pago.AnalisisId == 0)
            {
                repositorio.Guardar(pago);
                Limpiar();

            }
            else
            {
                Entidades.Pago egre = new Entidades.Pago();
                RepositorioPago repository = new RepositorioPago(new Contexto());
                int id = Convert.ToInt32(AnalisisDropDown.SelectedIndex);
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
            RepositorioPago repositorio = new RepositorioPago(new Contexto());
            Entidades.Pago pago = new Entidades.Pago();

            if (repositorio.Eliminar(Convert.ToInt32(AnalisisDropDown.SelectedIndex)))
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
            Expression<Func<Analisis, bool>> filtros = x => true;
            RepositorioBase<DetalleAnalisis> pago = new RepositorioBase<DetalleAnalisis>(new Contexto());
            int id;
            id = Utils.ToInt(AnalisisDropDown.Text);

            filtros = c => c.AnalisisId == id;

            DatosGridView.DataSource = pago.GetList(c => c.AnalisisId == id);
            DatosGridView.DataBind();
        }

        protected void AgregarButton_Click1(object sender, EventArgs e)
        {

            Entidades.Pago pago = new Entidades.Pago();
            pago = (Entidades.Pago)base.ViewState["Pago"];

            pago.AgregarPago(0,AnalisisDropDown.SelectedIndex, Convert.ToDecimal(MontoAPagar.Text));
            ViewState["Pago"] = pago;

            this.BindGrid();
        }
    }

   
}