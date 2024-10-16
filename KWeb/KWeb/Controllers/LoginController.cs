using KWeb.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Text;
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
                var datos = context.InicioSesion(model.Identificacion, model.Contrasenna).FirstOrDefault();

                //var datos = context.tUsuario.Where(x => x.Identificacion == model.Identificacion
                //                                     && x.Contrasenna == model.Contrasenna
                //                                     && x.Activo == true).FirstOrDefault();

                if (datos != null)
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
                var datos = context.tUsuario.Where(x => x.Identificacion == model.Identificacion).FirstOrDefault();

                if (datos != null)
                {
                    var ContrasennaTemp = CreatePassword();
                    var TieneContrasennaTemp = true;
                    var FechaVencimientoTemp = DateTime.Now.AddMinutes(30);

                    var result = context.ActualizarContrasenna(ContrasennaTemp, TieneContrasennaTemp, FechaVencimientoTemp, datos.Consecutivo);

                    if (result > 0)
                    {
                        EnviarCorreo(datos.CorreoElectronico, "Contraseña Temporal", "Querid@ usuari@, se ha generado la siguiente contraseña temporal: " +
                            ContrasennaTemp + " que expira el: " + FechaVencimientoTemp.ToString("dd/MM/yyyy hh:mm tt"));
                    }

                    return RedirectToAction("InicioSesion", "Login");
                }
            }

            return View();
        }

        private string CreatePassword()
        {
            int length = 10;
            const string valid = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
            {
                res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }

        private void EnviarCorreo(string destino, string asunto, string contenido)
        {
            string cuenta = ConfigurationManager.AppSettings["CorreoNotificaciones"].ToString();
            string contrasenna = ConfigurationManager.AppSettings["ContrasennaNotificaciones"].ToString();

            MailMessage message = new MailMessage();
            message.From = new MailAddress(cuenta);
            message.To.Add(new MailAddress(destino));
            message.Subject = asunto;
            message.Body = contenido;
            message.Priority = MailPriority.Normal;
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.office365.com", 587);
            client.Credentials = new System.Net.NetworkCredential(cuenta, contrasenna);
            client.EnableSsl = true;
            client.Send(message);
        }

    }
}