using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    [Serializable]
    public class Analisis
    {
        [Key]
        public int AnalisisId { get; set; }
        public int PacienteId { get; set; }
        public DateTime FechaAnalisis { get; set; }
        public List<DetalleAnalisis> Detalles;
        public Analisis()
        {
            AnalisisId = 0;
            PacienteId = 0;
            FechaAnalisis = DateTime.Now;
            this.Detalles = new List<DetalleAnalisis>();
        }

        public Analisis(int analisisId, int pacienteId, DateTime fechaAnalisis)
        {
            AnalisisId = analisisId;
            PacienteId = pacienteId;
            FechaAnalisis = fechaAnalisis;
            this.Detalles = new List<DetalleAnalisis>();
        }
        public void AgregarDetalle(int analisisId, string tipoAnalisisId, string resultado)
        {
            this.Detalles.Add(new DetalleAnalisis(analisisId,tipoAnalisisId, resultado));
        }
    }
}
