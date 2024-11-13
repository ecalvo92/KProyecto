using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace KWeb.Models
{
    public class FiltroDirector : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var rolUsuario = filterContext.HttpContext.Session["RolUsuario"];

            if (rolUsuario != null && rolUsuario.ToString() == "3")
            {
                base.OnActionExecuting(filterContext);
            }
            else 
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary {
                    { "controller","Home"},
                    { "action", "Index" }
                });
            }
        }
    }

    public class FiltroDirectorMedico : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var rolUsuario = filterContext.HttpContext.Session["RolUsuario"];

            if (rolUsuario != null && (rolUsuario.ToString() == "1" || rolUsuario.ToString() == "3"))
            {
                base.OnActionExecuting(filterContext);
            }
            else
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary {
                    { "controller","Home"},
                    { "action", "Index" }
                });
            }
        }
    }
}