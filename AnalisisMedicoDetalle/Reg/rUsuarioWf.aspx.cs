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
    public partial class rUsuarioWf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        void Limpiar()
        {
            UsuarioId.Text = "0";
            NombresTextBox.Text = string.Empty;
            EmailTextBox.Text = string.Empty;
            NombresTextBox.Text = string.Empty;
            UsuarioTextBox.Text = string.Empty;
            ClaveTextBox.Text = string.Empty;
            ConfirmarTextBox.Text = string.Empty;
            DropDownList.Text = string.Empty;

        }
        private Usuarios LLenaClase()
        {
            Usuarios usuarios = new Usuarios();
            usuarios.UsuarioId = Convert.ToInt32(UsuarioId.Text);
            usuarios.Nombres = NombresTextBox.Text;
            usuarios.Email = EmailTextBox.Text;
            usuarios.NivelUsuario = Convert.ToInt32(DropDownList.SelectedValue);
            usuarios.Usuario = UsuarioTextBox.Text;
            usuarios.Clave = ClaveTextBox.Text;
            usuarios.Clave = ConfirmarTextBox.Text;
            return usuarios;
        }
        public bool Validar()
        {
            bool paso = true;
            if (string.IsNullOrWhiteSpace(UsuarioId.Text) || string.IsNullOrWhiteSpace(NombresTextBox.Text) || string.IsNullOrWhiteSpace(EmailTextBox.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "Validacion()", true);
                paso = false;
            }

            return paso;
        }
        public bool Existe()
        {
            RepositorioBase<Usuarios> repositorio = new RepositorioBase<Usuarios>(new Contexto());
            Usuarios usuarios = repositorio.Buscar(Convert.ToInt32(UsuarioId.Text));
            return (usuarios != null);
        }

        public void LLenaCampo(Usuarios usuarios)
        {
            UsuarioId.Text = usuarios.UsuarioId.ToString();
            NombresTextBox.Text = usuarios.Nombres;
            EmailTextBox.Text = usuarios.Email;
            DropDownList.SelectedIndex = usuarios.NivelUsuario;
            UsuarioTextBox.Text = usuarios.Usuario;
            ClaveTextBox.Text = usuarios.Clave;
            ConfirmarTextBox.Text = usuarios.Clave;

        }


      

       

      

        protected void LimpiarButton_Click1(object sender, EventArgs e)
        {
            Limpiar();


        }

        protected void GuardarButton_Click(object sender, EventArgs e)
        {
            RepositorioBase<Usuarios> repositorio = new RepositorioBase<Usuarios>(new Contexto());
            bool paso = false;
            Usuarios usuarios = new Usuarios();

            usuarios = LLenaClase();

            if (usuarios.UsuarioId == 0)
            {
                paso = repositorio.Guardar(usuarios);
            }
            else
            {

            }
            if (paso)
            {
                Limpiar();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "Error", true);
                return;
            }

        }

        protected void EliminarButton_Click(object sender, EventArgs e)
        {
            RepositorioBase<Usuarios> repositorio = new RepositorioBase<Usuarios>(new Contexto());
            int idx;
            int.TryParse(UsuarioId.Text, out idx);

            var usuario = repositorio.Buscar(idx);
            if (usuario != null)
            {
                if (repositorio.Eliminar(idx))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "Exito()", true);
                    Limpiar();
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "Validacion()", true);
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SinExito()", true);


        }

        protected void BuscarButton_Click(object sender, EventArgs e)
        {
            RepositorioBase<Usuarios> Repositorio = new RepositorioBase<Usuarios>(new Contexto());
            Usuarios usuarios = new Usuarios();
            int.TryParse(UsuarioId.Text, out int idx);

            usuarios = Repositorio.Buscar(idx);
            if (usuarios != null)
                LLenaCampo(usuarios);
            else
                ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SinExito()", true);

        }
    }
}