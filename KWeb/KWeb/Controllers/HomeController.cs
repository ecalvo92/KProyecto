using KWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KWeb.Controllers
{
    [OutputCache(NoStore = true, VaryByParam = "*", Duration = 0)]
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            using (var context = new KDataBaseEntities())
            {
                var datos = context.tProducto.Where(x => x.Cantidad > 0).ToList();

                var productos = new List<Producto>();
                foreach (var item in datos)
                {
                    productos.Add(new Producto
                    {
                        Consecutivo = item.Consecutivo,
                        Nombre = item.Nombre,
                        Descripcion = item.Descripcion,
                        Precio = item.Precio,
                        Cantidad = item.Cantidad,
                        Imagen = item.Imagen
                    });
                }

                return View(productos);
            }    
        }

    }
}