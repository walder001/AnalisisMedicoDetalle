using AnalisisMedicoDetalle.Utilitarios;
using BLL;
using DAL;
using Entidades;
using Microsoft.Reporting.WebForms;
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
            if (!Page.IsPostBack)
            {
                RepositorioBase<DetallePago> repositorio = new RepositorioBase<DetallePago>(new Contexto());
                var lista = repositorio.GetList(x => true);

                MyReportViewer.ProcessingMode = ProcessingMode.Local;
                MyReportViewer.LocalReport.ReportPath = Server.MapPath(@"~\Reportes\Pago.rdlc");
                MyReportViewer.LocalReport.DataSources.Add(new ReportDataSource("Pago", lista));
                MyReportViewer.LocalReport.Refresh();
            }
        }

        protected void BuscarButton_click(object sender, EventArgs e)
        {

            Expression<Func<DetallePago, bool>> Filtros = x => true;
            RepositorioBase<DetallePago> repositorio = new RepositorioBase<DetallePago>(new Contexto());

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


        public void LlenaReport()
        {
         
            RepositorioBase<DetallePago> repositorio = new RepositorioBase<DetallePago>(new Contexto());
            MyReportViewer.ProcessingMode = ProcessingMode.Local;
            MyReportViewer.LocalReport.ReportPath = Server.MapPath(@"~\Reportes\PagoReport.rdlc");
            MyReportViewer.LocalReport.DataSources.Add(new ReportDataSource("PagoDetalle", repositorio.GetList(e => true)));
            MyReportViewer.LocalReport.Refresh();
        }

    }
}