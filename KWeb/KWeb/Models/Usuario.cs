using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KWeb.Models
{
    public class Usuario
    {
        //Atributos, Caracteristicas o Propiedades
        public string Identificacion { get; set; }
        public string Nombre { get; set; }
        public string CorreoElectronico { get; set; }
        public string Contrasenna { get; set; }
    }
}