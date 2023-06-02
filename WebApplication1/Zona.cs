using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class Zona
    {
        public string Descripcion { get; set; }
        public int id { get; set; }
        public Zona() { }
        public Zona(string d="null",int id = 0) {
            this.Descripcion = d;
            this.id = id;   
        }

    }
}