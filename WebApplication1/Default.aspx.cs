using dominio;
using negocio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Default : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        public List<Articulo> carritoActual { get; set; }
        public List<Imagen> listaImagenes { get; set; }
        public Imagen img { get; set; }

      

        public NegocioImagen negocioImg = new NegocioImagen();
        protected void Page_Load(object sender, EventArgs e)
        {

            NegocioArticulo negocio = new NegocioArticulo();
            ListaArticulos = negocio.Listar();
            NegocioImagen negocioImg = new NegocioImagen();
           
            carritoActual = this.Session["listaDeCompras"] != null ? (List<Articulo>)Session["listaDeCompras"] :  new List<Articulo>();

           
          
            if (!IsPostBack)
            {
                
                rprCards.DataSource = ListaArticulos;
                rprCards.DataBind();


                


            }else
            {
                lblCompra.CssClass = "count";
            }
            
            lblCompra.Text = this.Session["listaDeCompras"] != null ? ((List<Articulo>)Session["listaDeCompras"]).Count.ToString() : lblCompra.CssClass = "invisible"; 

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
           
            string valor = ((Button)sender).CommandArgument;
           
               
            carritoActual.Add(buscarArticulo(valor));
            this.Session.Add("listaDeCompras", carritoActual);

            
            Response.Redirect("Default.aspx", false);
        }
        public Articulo buscarArticulo(string id)
        {
            Articulo aux = new Articulo();
            int val=0;
            bool numero = int.TryParse(id,out val);
            foreach (var item in ListaArticulos)
            {
                if (item.Id == val)
                {
                    aux = item;
                    
                }
            }
            return aux;
        }

        protected void btnCarro_Click(object sender, EventArgs e)
        {
           
                Session.Add("listaDeCompras", carritoActual);
                Response.Redirect("Carrito.aspx", false);


            
        }
    }
}