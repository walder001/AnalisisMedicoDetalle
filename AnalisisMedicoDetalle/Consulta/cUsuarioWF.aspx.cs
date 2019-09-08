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
    public partial class cUsuarioWF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DesdeTextBox.Text = DateTime.Today.ToString("yyyy-MM-dd");
                HastaTextBox.Text = DateTime.Today.ToString("yyyy-MM-dd");
            }

        }

        protected void BuscarButton_click(object sender, EventArgs e)
        {
            Expression<Func<Analisis, bool> > Filtros = x => true;
            RepositorioBase<Analisis> repositorio = new RepositorioBase<Analisis>(new Contexto());
            List<Analisis> analises = new List<Analisis>();

            DateTime Desde = Utils.ToDateTime(DesdeTextBox.Text);
            DateTime Hasta = Utils.ToDateTime(HastaTextBox.Text);

            int id;
            id = Utils.ToInt(CriterioTextBox.Text);

            if (CheckBoxFecha.Checked == true)
            {
                switch (FiltroDropDown.SelectedIndex)
                {
                    case 0: //Todo
                        repositorio.GetList(c => true);
                        break;
                    case 1: //ID                  
                        Filtros = c => c.AnalisisId == id && c.FechaAnalisis >= Desde && c.FechaAnalisis <= Hasta;

                        break;
                    case 2: //Paciente
                       // Filtros = c => c.Paciente.Contains(CriterioTextBox.Text) && c.FechaAnalisis >= Desde && c.FechaAnalisis <= Hasta;
                        break;
                }
            }
            else
            {
                switch (FiltroDropDown.SelectedIndex)
                {
                    case 0: //Todo
                        Filtros = c => true;
                        break;
                    case 1: //ID                  
                        Filtros = c => c.AnalisisId == id;
                        break;
                }
            }
            DatosGridView.DataSource = repositorio.GetList(Filtros);
            DatosGridView.DataBind();
        }

    }
    }
