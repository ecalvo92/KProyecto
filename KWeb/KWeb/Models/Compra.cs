using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KWeb.Models
{
    public class Compra
    {
        public long ConsecutivoMaestro { get; set; }
        public string NombreCliente { get; set; }
        public decimal Total { get; set; }
        public DateTime Fecha { get; set; }

        public string NombreProducto { get; set; }
        public int Cantidad { get; set; }
        public decimal Precio { get; set; }
          
    }
}