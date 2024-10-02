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
            return View();
        }


        public ActionResult InicioSesion()
        {
            return View();
        }

        public ActionResult RecuperarAcceso()
        {
            return View();
        }

    }
}