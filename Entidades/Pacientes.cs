using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    [Serializable]
    public class Pacientes
    {
        [Key]
        public int ClienteId { get; set; }
        public string Nombres { get; set; }
        public string Sexo { get; set; }
        public string Direccion { get; set; }
        public string NumeroCedula { get; set; }
        public string Celular { get; set; }
        public string Telefono { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Email { get; set; }
        public Pacientes()
        {
            ClienteId = 0;
            Nombres = string.Empty;
            Sexo = string.Empty;
            Direccion = string.Empty;
            NumeroCedula = string.Empty;
            Celular = string.Empty;
            Telefono = string.Empty;
            FechaNacimiento = DateTime.Now;
            Email = string.Empty;

        }

        public Pacientes(int clienteId, string nombres, string sexo, string direccion, string numeroCedula, string celular, string telefono, DateTime fechaNacimiento, string email)
        {
            ClienteId = clienteId;
            Nombres = nombres;
            Sexo = sexo;
            Direccion = direccion;
            NumeroCedula = numeroCedula;
            Celular = celular;
            Telefono = telefono;
            FechaNacimiento = fechaNacimiento;
            Email = email;
        }
    }
}
