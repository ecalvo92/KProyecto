using KWeb.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Objects;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace KWeb.Controllers
{
    [FiltroDirectorMedico]
    public class ProductoController : Controller
    {
        [HttpGet]
        public ActionResult ConsultarProductos()
        {
            using (var context = new KDataBaseEntities())
            {
                var datos = context.tProducto.ToList();

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

        [HttpGet]
        public ActionResult AgregarProducto()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AgregarProducto(Producto model, HttpPostedFileBase ImagenProducto)
        {
            using (var context = new KDataBaseEntities())
            {
                var tabla = new tProducto();
                tabla.Consecutivo = 0;
                tabla.Nombre = model.Nombre;
                tabla.Descripcion = model.Descripcion;
                tabla.Precio = model.Precio;
                tabla.Cantidad = model.Cantidad;
                tabla.Imagen = string.Empty;

                context.tProducto.Add(tabla);
                var respuesta = context.SaveChanges();

                if (respuesta > 0)
                {
                    string extension = Path.GetExtension(ImagenProducto.FileName);
                    string ruta = AppDomain.CurrentDomain.BaseDirectory + "ImgProductos\\" + tabla.Consecutivo + extension;
                    ImagenProducto.SaveAs(ruta);

                    tabla.Imagen = "/ImgProductos/" + tabla.Consecutivo + extension;
                    context.SaveChanges();

                    return RedirectToAction("ConsultarProductos", "Producto");
                }

                ViewBag.MensajePantalla = "El producto no se ha podido registrar correctamente";
                return View();
            }
        }


        [HttpGet]
        public ActionResult ActualizarProducto(long q)
        {
            using (var context = new KDataBaseEntities())
            {
                var datos = context.tProducto.Where(x => x.Consecutivo == q).FirstOrDefault();
                var producto = new Producto();

                if (datos != null)
                {
                    producto.Consecutivo = datos.Consecutivo;
                    producto.Nombre = datos.Nombre;
                    producto.Descripcion = datos.Descripcion;
                    producto.Precio = datos.Precio;
                    producto.Cantidad = datos.Cantidad;
                    producto.Imagen = datos.Imagen;
                }

                return View(producto);
            }
        }

        [HttpPost]
        public ActionResult ActualizarProducto(Producto model, HttpPostedFileBase ImagenProducto)
        {
            using (var context = new KDataBaseEntities())
            {
                var datos = context.tProducto.Where(x => x.Consecutivo == model.Consecutivo).FirstOrDefault();

                if (datos != null)
                {
                    datos.Nombre = model.Nombre;
                    datos.Descripcion = model.Descripcion;
                    datos.Precio = model.Precio;
                    datos.Cantidad = model.Cantidad;                    

                    if (ImagenProducto != null)
                    {
                        System.IO.File.Delete(AppDomain.CurrentDomain.BaseDirectory + model.Imagen);

                        string extension = Path.GetExtension(ImagenProducto.FileName);
                        string ruta = AppDomain.CurrentDomain.BaseDirectory + "ImgProductos\\" + model.Consecutivo + extension;
                        ImagenProducto.SaveAs(ruta);

                        datos.Imagen = "/ImgProductos/" + model.Consecutivo + extension;
                    }                    

                    var respuesta = context.SaveChanges();

                    if (respuesta > 0)
                    {
                        return RedirectToAction("ConsultarProductos", "Producto");
                    }
                }                

                ViewBag.MensajePantalla = "El producto no se ha podido actualizar correctamente";
                return View();
            }
        }

    }
}