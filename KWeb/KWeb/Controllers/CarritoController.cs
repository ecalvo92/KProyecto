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
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
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

        [HttpPost]
        public ActionResult RemoverProductoCarrito(Carrito model)
        {
            using (var context = new KDataBaseEntities())
            {
                var consecutivoUsuarioLogueado = long.Parse(Session["Consecutivo"].ToString());

                var datos = context.tCarrito.Where(x => x.ConsecutivoProducto == model.ConsecutivoProducto
                                                    && x.ConsecutivoUsuario == consecutivoUsuarioLogueado).FirstOrDefault();

                if (datos != null)
                {
                    context.tCarrito.Remove(datos);
                    context.SaveChanges();

                    ActualizarCarrito();

                    return RedirectToAction("ConsultarCarrito", "Carrito");
                }

                ViewBag.MensajePantalla = "El producto no se ha podido remover de su carrito";
                return View();
            }
        }

        [HttpGet]
        public ActionResult ConsultarCarrito()
        {
            return View(ConsultarDatosCarrito());
        }

        [HttpPost]
        public ActionResult PagarCarrito()
        {
            using (var context = new KDataBaseEntities())
            {
                var consecutivoUsuarioLogueado = long.Parse(Session["Consecutivo"].ToString());

                var validacion = context.ValidarCantidadInventario(consecutivoUsuarioLogueado).ToList();

                if (validacion.Count() == 0)
                {
                    context.PagarCarrito(consecutivoUsuarioLogueado);
                    ActualizarCarrito();
                    return RedirectToAction("ConsultarCarrito", "Carrito");
                }
                else
                {
                    ViewBag.MensajePantalla = "No se ha podido realizar el pago de su carrito, valide la disponibilidad de sus productos";
                    return View("ConsultarCarrito", ConsultarDatosCarrito());
                }
                
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

        private List<Carrito> ConsultarDatosCarrito()
        {
            using (var context = new KDataBaseEntities())
            {
                var consecutivoUsuarioLogueado = long.Parse(Session["Consecutivo"].ToString());

                var datos = context.ConsultarCarritoUsuario(consecutivoUsuarioLogueado).ToList();

                var carrito = new List<Carrito>();
                foreach (var item in datos)
                {
                    carrito.Add(new Carrito
                    {
                        Consecutivo = item.Consecutivo,
                        ConsecutivoUsuario = item.ConsecutivoUsuario,
                        ConsecutivoProducto = item.ConsecutivoProducto,
                        Precio = item.Precio,
                        Cantidad = item.Cantidad,
                        Fecha = item.Fecha,
                        Total = item.Total,
                        Nombre = item.Nombre
                    });
                }

                return carrito;
            }
        }

    }
}