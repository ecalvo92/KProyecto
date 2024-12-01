using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KWeb.Models
{
    public class Carrito
    {
        public long Consecutivo { get; set; }
        public long ConsecutivoUsuario { get; set; }
        public long ConsecutivoProducto { get; set; }
        public decimal Precio { get; set; }
        public int Cantidad { get; set; }
        public DateTime Fecha { get; set; }
        public decimal? Total { get; set; } 
        public string Nombre { get; set; }
    }
}