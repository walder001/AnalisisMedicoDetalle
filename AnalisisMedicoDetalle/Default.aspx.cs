using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AnalisisMedicoDetalle
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ViewState["Analisis"] = new Analisis();

        }

        protected void BindGrid()
        {
   
        }
      
        protected void agregarButton_Click(object sender, EventArgs e)
        {

            Analisis egreso = new Analisis();

            egreso = (Analisis)ViewState["Analisis"];
            //egreso.AgregarDetalle(0,"hola","Hola");

            ViewState["Analisis"] = egreso;

            this.BindGrid();
            //LlenarValores();
            //LimpiarDos();

        }

        protected void remoerButton_Click(object sender, EventArgs e)
        {

        }
    }
}