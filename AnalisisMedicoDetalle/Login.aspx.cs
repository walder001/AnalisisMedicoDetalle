using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnalisisMedicoDetalle
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ViewState["Analisis"] = new Analisis();
            BindGrid();

        }

        protected void BindGrid()
        {

            if (ViewState["Analisis"] != null)
            {
                Grid.DataSource = ((Analisis)ViewState["Analisis"]).Detalles;
                Grid.DataBind();
            }
        }
        protected void AccederButton_Click(object sender, EventArgs e)
        {

        }

        protected void AgregarGrid_Click(object sender, EventArgs e)
        {
            Analisis Analisis = new Analisis();

            Analisis = (Analisis)ViewState["Analisis"];

            Analisis.Detalles.Add(new DetalleAnalisis(0,0,0,"hola"));

            ViewState["Detalle"] = Analisis.Detalles;

            this.BindGrid();

            Grid.Columns[1].Visible = false;

        }

        protected void Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Analisis Analisis = new Analisis();

            Analisis = (Analisis)ViewState["Analisis"];

            ViewState["Detalle"] = Analisis.Detalles;

            int Fila = e.RowIndex;

            Analisis.Detalles.RemoveAt(Fila);

            this.BindGrid();

        }

        protected void Grid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Grid.DataSource = ViewState["Detalles"];

            Grid.PageIndex = e.NewPageIndex;

            Grid.DataBind();
        }
    }
    }