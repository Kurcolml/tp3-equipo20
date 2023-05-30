using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        public List<Imagen> listaImagenes { get; set; }
        public Imagen img { get; set; }

        public NegocioImagen negocioImg = new NegocioImagen();
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioArticulo negocio = new NegocioArticulo();
            ListaArticulos = negocio.ListarConSP();

            NegocioImagen negocioImg = new NegocioImagen();

        }
    }
}