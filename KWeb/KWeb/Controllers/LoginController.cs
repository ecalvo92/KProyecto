using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KWeb.Controllers
{
    public class LoginController : Controller
    {
        public ActionResult InicioSesion()
        {
            return View();
        }

        public ActionResult RegistroUsuario()
        {
            return View();
        }

        public ActionResult RecuperarAcceso()
        {
            return View();
        }

    }
}