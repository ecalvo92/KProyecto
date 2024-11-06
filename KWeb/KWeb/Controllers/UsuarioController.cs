using Antlr.Runtime.Misc;
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
                var respuesta = context.ActualizarPerfil(model.Identificacion, model.Nombre, model.CorreoElectronico, Consecutivo, 0);

                if (respuesta > 0)
                {
                    Session["NombreUsuario"] = model.Nombre;
                    return RedirectToAction("Index", "Home");
                }

                ViewBag.MensajePantalla = "Su información no se ha podido actualizar correctamente";
                return View();
            }
        }



        [HttpGet]
        public ActionResult ConsultarUsuarios()
        {
            using (var context = new KDataBaseEntities())
            {
                long consecutivoUsuarioLogueado = long.Parse(Session["Consecutivo"].ToString());
                var datos = context.tUsuario.Where(x => x.Consecutivo != consecutivoUsuarioLogueado).ToList();

                var usuarios = new List<Usuario>();
                foreach (var item in datos)
                {
                    usuarios.Add(new Usuario 
                    { 
                        Consecutivo = item.Consecutivo,
                        Identificacion = item.Identificacion,
                        Nombre = item.Nombre,
                        CorreoElectronico = item.CorreoElectronico,
                        NombreRol = item.tRol.NombreRol,
                        Estado = (item.Activo == true ? "Activo" : "Inactivo") 
                    });
                }
                
                return View(usuarios);
            }
        }



        [HttpGet]
        public ActionResult ActualizarUsuario(long q)
        {
            CargarRoles();

            using (var context = new KDataBaseEntities())
            {
                var datos = context.tUsuario.Where(x => x.Consecutivo == q).FirstOrDefault();

                var usuario = new Usuario();
                usuario.Consecutivo = datos.Consecutivo;
                usuario.Identificacion = datos.Identificacion;
                usuario.Nombre = datos.Nombre;
                usuario.CorreoElectronico = datos.CorreoElectronico;
                usuario.ConsecutivoRol = datos.ConsecutivoRol;
                usuario.NombreRol = datos.tRol.NombreRol;
                usuario.Estado = (datos.Activo == true ? "Activo" : "Inactivo");

                return View(usuario);
            }
        }

        [HttpPost]
        public ActionResult ActualizarUsuario(Usuario model)
        {
            using (var context = new KDataBaseEntities())
            {
                var respuesta = context.ActualizarPerfil(model.Identificacion, model.Nombre, model.CorreoElectronico, model.Consecutivo, model.ConsecutivoRol);

                if (respuesta > 0)
                {
                    return RedirectToAction("Index", "Home");
                }

                ViewBag.MensajePantalla = "La información no se ha podido actualizar correctamente";
                CargarRoles();
                return View();
            }
        }



        private void CargarRoles()
        {
            using (var context = new KDataBaseEntities())
            {
                var datos = context.tRol.ToList();

                var roles = new List<SelectListItem>();

                roles.Add(new SelectListItem
                {
                    Text = "Seleccione",
                    Value = string.Empty
                });

                foreach (var item in datos)
                {
                    roles.Add(new SelectListItem
                    {
                        Text = item.NombreRol,
                        Value = item.Consecutivo.ToString()
                    });
                }

                ViewBag.listaRoles = roles;
            }
        }

    }
}