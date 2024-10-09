using KWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KWeb.Controllers
{
    public class LoginController : Controller
    {
        [HttpGet]
        public ActionResult RegistroUsuario()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RegistroUsuario(Usuario model)
        {
            using (var context = new KDataBaseEntities())
            {
                context.RegistroUsuario(model.Identificacion, model.Nombre, model.CorreoElectronico, model.Contrasenna);

                //var tabla = new tUsuario();
                //tabla.Consecutivo = 0;
                //tabla.Identificacion = model.Identificacion;
                //tabla.Nombre = model.Nombre;
                //tabla.CorreoElectronico = model.CorreoElectronico;
                //tabla.Contrasenna = model.Contrasenna;
                //tabla.ConsecutivoRol = 2;
                //tabla.Activo = true;

                //context.tUsuario.Add(tabla);
                //context.SaveChanges();
            }

            return RedirectToAction("InicioSesion", "Login");
        }



        [HttpGet]
        public ActionResult InicioSesion()
        {
            return View();
        }

        [HttpPost]
        public ActionResult InicioSesion(Usuario model)
        {
            using (var context = new KDataBaseEntities())
            {
                var datos = context.InicioSesion(model.Identificacion, model.Contrasenna).ToList();

                //var datos = context.tUsuario.Where(x => x.Identificacion == model.Identificacion
                //                                     && x.Contrasenna == model.Contrasenna
                //                                     && x.Activo == true).ToList();

                if (datos.Count() > 0)
                {
                    return RedirectToAction("Index", "Home");
                }
            }

            return View();
        }



        [HttpGet]
        public ActionResult RecuperarAcceso()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RecuperarAcceso(Usuario model)
        {
            using (var context = new KDataBaseEntities())
            {
                var datos = context.tUsuario.Where(x => x.Identificacion == model.Identificacion).ToList();

                if (datos.Count() > 0)
                {
                    //Mandar un correo
                    return RedirectToAction("InicioSesion", "Login");
                }
            }

            return View();
        }

    }
}