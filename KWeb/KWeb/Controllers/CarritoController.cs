using KWeb.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace KWeb.Controllers
{
    public class CarritoController : Controller
    {
        [HttpPost]
        public ActionResult AgregarCarrito(long Consecutivo, int Cantidad)
        {
            using (var context = new KDataBaseEntities())
            {
                var consecutivoUsuarioLogueado = long.Parse(Session["Consecutivo"].ToString());

                var cantidadExistenteCarrito = context.tCarrito.Where(
                    x => x.ConsecutivoUsuario == consecutivoUsuarioLogueado
                 && x.ConsecutivoProducto == Consecutivo).FirstOrDefault();

                if (cantidadExistenteCarrito != null)
                {
                    cantidadExistenteCarrito.Cantidad = Cantidad;
                    cantidadExistenteCarrito.Fecha = DateTime.Now;
                }
                else
                {
                    var tabla = new tCarrito();
                    tabla.Consecutivo = 0;
                    tabla.ConsecutivoUsuario = consecutivoUsuarioLogueado;
                    tabla.ConsecutivoProducto = Consecutivo;
                    tabla.Cantidad = Cantidad;
                    tabla.Fecha = DateTime.Now;
                    context.tCarrito.Add(tabla);                    
                }

                var respuesta = context.SaveChanges();
                var mensaje = (respuesta > 0 ? "OK" : "ERROR");

                ActualizarCarrito();

                return Json(mensaje, JsonRequestBehavior.AllowGet);
            }
        }

        private void ActualizarCarrito()
        {
            using (var context = new KDataBaseEntities())
            {
                var consecutivoUsuarioLogueado = long.Parse(Session["Consecutivo"].ToString());

                var datos = context.tCarrito.Where(x => x.ConsecutivoUsuario == consecutivoUsuarioLogueado).ToList();

                if (datos.Count > 0)
                {
                    int contador = 0;
                    decimal total = 0;
                    foreach (var item in datos)
                    {
                        total += item.Cantidad * item.tProducto.Precio;
                        contador++;
                    }

                    Session["Cantidad"] = contador;
                    Session["Total"] = total;
                }
                else
                {
                    Session["Cantidad"] = 0;
                    Session["Total"] = 0;
                }

            }
        }

    }
}