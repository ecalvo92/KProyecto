using KWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KWeb.Controllers
{
    public class UsuarioController : Controller
    {
        [HttpGet]
        public ActionResult ActualizarPerfil()
        {
            using (var context = new KDataBaseEntities())
            {
                long Consecutivo = long.Parse(Session["Consecutivo"].ToString());
                var datos = context.tUsuario.Where(x => x.Consecutivo == Consecutivo).FirstOrDefault();

                var usuario = new Usuario();
                usuario.Identificacion = datos.Identificacion;
                usuario.Nombre = datos.Nombre;
                usuario.CorreoElectronico = datos.CorreoElectronico;
                usuario.NombreRol = datos.tRol.NombreRol;
               
                return View(usuario);
            }
        }

        [HttpPost]
        public ActionResult ActualizarPerfil(Usuario model)
        {
            using (var context = new KDataBaseEntities())
            {
                long Consecutivo = long.Parse(Session["Consecutivo"].ToString());
                var respuesta = context.ActualizarPerfil(model.Identificacion, model.Nombre, model.CorreoElectronico, Consecutivo);

                if (respuesta > 0)
                {
                    Session["NombreUsuario"] = model.Nombre;
                    return RedirectToAction("Index", "Home");
                }

                ViewBag.MensajePantalla = "Su información no se ha podido actualizar correctamente";
                return View();
            }
        }

    }
}