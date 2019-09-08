using Entidades;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Contexto: DbContext
    {
        public DbSet<Pacientes> pacientes { get; set; }
        public DbSet<TipoAnalisis> tipoAnalisis { get; set; }
        public DbSet<Analisis> analisis { get; set; }
        public Contexto(): base("DbAnalisisMedicoDetalle")
        {

        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }

    }
}
