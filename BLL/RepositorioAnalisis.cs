using DAL;
using Entidades;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class RepositorioAnalisis: RepositorioBase<Analisis>
    {
        public RepositorioAnalisis(Contexto contexto): base (contexto)
        {

        }
       
        public override Analisis Buscar(int id)
        {
            Analisis analisis = new Analisis();
            try
            {
                analisis = _contexto.analisis.Find(id);

                analisis.Detalles.Count();//Cargar la lista en este punto porque         //luego de hacer Dispose() el Contexto           //no sera posible leer la lista

                foreach (var item in analisis.Detalles) { }//Cargar los nombres de las ciudades            

            }
            catch (Exception)
            {

                throw;
            }
            return analisis;
        }


        public override bool Modificar(Analisis analsis)
        {
            bool paso = false;
            try
            {
                //buscar las entidades que no estan para removerlas
                var Anterior = _contexto.analisis.Find(analsis.AnalisisId);
                foreach (var item in Anterior.Detalles)
                {
                    /*if (!analsis.Detalles.Exists(d => d.AnalisisId == item.AnalisisId))
                    {
                        _contexto.Entry(item).State = EntityState.Deleted;
                    }*/
                }

                //recorrer el detalle
                foreach (var item in analsis.Detalles)
                {
                    /*
                    //Muy importante indicar que pasara con la entidad del detalle
                    var estado = item.AnalisisId > 0 ? EntityState.Modified : EntityState.Added;
                    _contexto.Entry(item).State = estado;*/
                }

                //Idicar que se esta modificando el encabezado
                _contexto.Entry(analsis).State = EntityState.Modified;

                if (_contexto.SaveChanges() > 0)
                    paso = true;
            }
            catch (Exception)
            {
                throw;
            }
            return paso;
        }
    }
}
