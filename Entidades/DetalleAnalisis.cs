using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    [Serializable]
    public class DetalleAnalisis
    {
        [Key]
        public int DetalleAnalsisId { get; set; }
        public string Analsis { get; set; }
        public string Resultado { get; set; }
        public DetalleAnalisis()
        {
            DetalleAnalsisId = 0;
            Analsis = string.Empty;
            Resultado = string.Empty;
                
        }

        public DetalleAnalisis(int detalleAnalisisId, string analisi, string resultado)
        {
            DetalleAnalsisId = detalleAnalisisId;
            Analsis = analisi;
            Resultado = resultado;
        }
    }
}
