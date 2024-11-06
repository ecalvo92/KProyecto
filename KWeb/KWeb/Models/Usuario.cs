using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KWeb.Models
{
    public class Usuario
    {
        public long Consecutivo { get; set; }
        public string Identificacion { get; set; }
        public string Nombre { get; set; }
        public string CorreoElectronico { get; set; }
        public string Contrasenna { get; set; }
        public string ContrasennaAnterior { get; set; }
        public string ConfirmarContrasenna { get; set; }
        public string Estado { get; set; }

        public int ConsecutivoRol { get; set; }
        public string NombreRol { get; set; }
    }
}