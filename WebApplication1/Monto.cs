using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{   
    
    public class Monto
    {
        public string detalle { get; set; }
        public decimal precio { get; set; }
       
        
     
        public Monto(string s = "demo", decimal p = 100)
        {
            this.precio = p;  
            this.detalle = s;   
        }

    }
}