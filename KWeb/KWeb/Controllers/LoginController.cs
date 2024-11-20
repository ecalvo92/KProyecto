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
                var respuesta = context.RegistroUsuario(model.Identificacion, model.Nombre, model.CorreoElectronico, model.Contrasenna);

                #region LinQ
                //var tabla = new tUsuario();
                //tabla.Consecutivo = 0;
                //tabla.Identificacion = model.Identificacion;
                //tabla.Nombre = model.Nombre;
                //tabla.CorreoElectronico = model.CorreoElectronico;
                //tabla.Contrasenna = model.Contrasenna;
                //tabla.ConsecutivoRol = 2;
                //tabla.Activo = true;
                //tabla.TieneContrasennaTemp = false;
                //tabla.FechaVencimientoTemp = DateTime.Now;

                //context.tUsuario.Add(tabla);
                //var respuesta = context.SaveChanges();
                #endregion

                if (respuesta > 0)
                    return RedirectToAction("InicioSesion", "Login");

                ViewBag.MensajePantalla = "Su información no se ha podido registrar correctamente";
                return View();
            }            
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

                #region LinQ
                //var datos = context.tUsuario.Where(x => x.Identificacion == model.Identificacion
                //                                     && x.Contrasenna == model.Contrasenna
                //                                     && x.Activo == true).FirstOrDefault();
                #endregion

                if (datos != null)
                {
                    if (datos.TieneContrasennaTemp && datos.FechaVencimientoTemp < DateTime.Now)
                    {
                        ViewBag.MensajePantalla = "Sus credenciales de acceso han expirado.";
                        return View();
                    }
                    else
                    {
                        Session["Consecutivo"] = datos.Consecutivo;
                        Session["NombreUsuario"] = datos.Nombre;
                        Session["ImagenUsuario"] = "/Styles/images/PerfilUsuario.jpg";
                        Session["RolUsuario"] = datos.ConsecutivoRol;
                        Session["NombreRolUsuario"] = datos.NombreRol;

                        ActualizarCarrito();

                        return RedirectToAction("Index", "Home");
                    }
                }

                ViewBag.MensajePantalla = "Su información no se ha podido validar correctamente";
                return View();
            }
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
                    datos.Contrasenna = CrearContrasenna();
                    datos.TieneContrasennaTemp = true;
                    datos.FechaVencimientoTemp = DateTime.Now.AddMinutes(double.Parse(ConfigurationManager.AppSettings["MinutosVigenciaTemporal"]));
                    context.SaveChanges();

                    string ruta = AppDomain.CurrentDomain.BaseDirectory + "\\Styles\\TemplateCorreo.html";
                    string contenido = System.IO.File.ReadAllText(ruta);

                    contenido = contenido.Replace("@@Nombre", datos.Nombre);
                    contenido = contenido.Replace("@@Contrasenna", datos.Contrasenna);
                    contenido = contenido.Replace("@@Vencimiento", datos.FechaVencimientoTemp.ToString("dd/MM/yyyy hh:mm tt"));

                    EnviarCorreo(datos.CorreoElectronico, "Contraseña Temporal", contenido);
                    return RedirectToAction("InicioSesion", "Login");
                }

                ViewBag.MensajePantalla = "Su información no se ha podido validar correctamente";
                return View();
            }
        }



        [HttpGet]
        public ActionResult CambiarContrasenna()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CambiarContrasenna(Usuario model)
        {
            if (model.ContrasennaAnterior == model.Contrasenna)
            {
                ViewBag.MensajePantalla = "Debe ingresar una contraseña nueva";
                return View();
            }
            else if (model.Contrasenna != model.ConfirmarContrasenna)
            {
                ViewBag.MensajePantalla = "Las nuevas contraseñas no coinciden";
                return View();
            }

            using (var context = new KDataBaseEntities())
            {
                long Consecutivo = long.Parse(Session["Consecutivo"].ToString());
                var datos = context.tUsuario.Where(x => x.Consecutivo == Consecutivo).FirstOrDefault();

                if (datos != null)
                {
                    if (datos.Contrasenna != model.ContrasennaAnterior)
                    {
                        ViewBag.MensajePantalla = "La contraseña anterior no coincide";
                        return View();
                    }

                    datos.Contrasenna = model.Contrasenna;
                    datos.TieneContrasennaTemp = false;
                    datos.FechaVencimientoTemp = DateTime.Now;
                    context.SaveChanges();
                    return RedirectToAction("Index", "Home");
                }

                ViewBag.MensajePantalla = "Sus credenciales no se han podido actualizar correctamente";
                return View();
            }
        }




        [HttpGet]
        public ActionResult CierreSesion()
        {
            Session.Clear();
            return RedirectToAction("InicioSesion", "Login");
        }



        private string CrearContrasenna()
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

    }
}