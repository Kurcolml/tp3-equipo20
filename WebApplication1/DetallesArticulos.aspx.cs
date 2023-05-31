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
    public partial class DetallesArticulos : System.Web.UI.Page
    {
        public List<Articulo> artADetallar { get; set; }
        public Articulo art { get; set; }

        public List<Imagen> listaImagenes { get; set; }
        public Imagen imagenes { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            NegocioArticulo negocio = new NegocioArticulo();
            artADetallar = negocio.ListarXNombre(Request.QueryString["Nombre"].ToString());

            art = artADetallar.FirstOrDefault();

            NegocioImagen negocioImg = new NegocioImagen();
            listaImagenes = negocioImg.Listar(art.Id);

        }

        protected void Btn_volver_Click(object sender, EventArgs e)
        {
                Response.Redirect("Default.aspx", false);

            
        }
    }
}