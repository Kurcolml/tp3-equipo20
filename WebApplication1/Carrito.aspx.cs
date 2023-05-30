using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace WebApplication1
{
    public partial class Carrito : System.Web.UI.Page
    {

        public List<Articulo> listaDeCompras;
        public int contador { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            listaDeCompras  = new List<Articulo>();
            listaDeCompras = (List<Articulo>)Session["listaDeCompras"];

            contador = listaDeCompras != null ? listaDeCompras.Count : 0;
            if (contador != 0)
            {
                dgvArticulos.DataSource = listaDeCompras;
                dgvArticulos.DataBind();

            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);

        }



    }
}