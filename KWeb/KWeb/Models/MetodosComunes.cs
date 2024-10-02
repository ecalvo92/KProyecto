using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KWeb.Models
{
    public class MetodosComunes
    {
        //Métodos o funciones
        public int CalcularEdad(int annoNacimiento)
        {
            return DateTime.Now.Year - annoNacimiento;
        }
    }
}