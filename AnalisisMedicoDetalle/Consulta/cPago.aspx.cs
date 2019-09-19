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

namespace AnalisisMedicoDetalle.Consulta
{
    public partial class cPago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BuscarButton_click(object sender, EventArgs e)
        {

            Expression<Func<Entidades.Pago, bool>> Filtros = x => true;
            RepositorioPago repositorio = new RepositorioPago(new Contexto());
            List<Analisis> analises = new List<Analisis>();


            int id;
            id = Utils.ToInt(CriterioTextBox.Text);



            switch (FiltroDropDown.SelectedIndex)
            {
                case 0: //Todo
                    repositorio.GetList(c => true);
                    break;
                case 1: //ID                  
                    Filtros = c => c.PagoId == id;
                    break;
                case 2: //ID                  
                    Filtros = c => c.AnalisisId == id;
                    break;
            }


            DatosGridView.DataSource = repositorio.GetList(Filtros);
            DatosGridView.DataBind();

        }
    }
}