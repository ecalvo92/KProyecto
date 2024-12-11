using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KWeb.Models
{
    public class MetodosComunes
    {

        public void RegistrarErrorBD(string mensaje, string origen, object usuario)
        {
            using (var context = new KDataBaseEntities())
            {
                var tabla = new tError();
                tabla.Mensaje = mensaje;
                tabla.Origen = origen;
                tabla.ConsecutivoUsuario = (HttpContext.Current.Session["Consecutivo"] != null ? long.Parse(HttpContext.Current.Session["Consecutivo"].ToString()) : 0);
                tabla.FechaHora = DateTime.Now;

                context.tError.Add(tabla);
                context.SaveChanges();

            }
        }

    }
}