using KWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KWeb.Controllers
{
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class ComprasController : Controller
    {
        [HttpGet]
        public ActionResult ConsultarFacturas()
        {
            using (var context = new KDataBaseEntities())
            {
                var consecutivoUsuarioLogueado = long.Parse(Session["Consecutivo"].ToString());

                var datos = context.ConsultarFacturas(consecutivoUsuarioLogueado).ToList();

                var facturas = new List<Compra>();
                foreach (var item in datos)
                {
                    facturas.Add(new Compra
                    {
                        ConsecutivoMaestro = item.ConsecutivoMaestro,
                        NombreCliente = item.NombreCliente,
                        Total = item.Total,
                        Fecha = item.Fecha
                    });
                }

                return View(facturas);
            }
        }

        [HttpGet]
        public ActionResult ConsultarDetalles(long q)
        {
            using (var context = new KDataBaseEntities())
            {
                var datos = context.ConsultarDetalleFactura(q).ToList();

                var facturas = new List<Compra>();
                foreach (var item in datos)
                {
                    facturas.Add(new Compra
                    {
                        ConsecutivoMaestro = item.ConsecutivoMaestro,
                        NombreProducto = item.NombreProducto,
                        Cantidad = item.Cantidad,
                        Precio = item.Precio,
                        Total = item.Total
                    });
                }

                return View(facturas);
            }
        }
    }
}