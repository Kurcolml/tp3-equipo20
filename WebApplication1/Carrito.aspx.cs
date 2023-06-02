using dominio;
using System;
using System.Collections.Generic;
using System.Security.Policy;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Carrito : System.Web.UI.Page
    {

        public List<Articulo> listaDeCompras;
        public int contador { get; set; }
        public List<Monto> listaMontos;
        public int cantidad = 1;
        public decimal precioPorCantidad = 0;
        public List<Zona> zonas;
        protected void Page_Load(object sender, EventArgs e)
        {


            listaDeCompras = new List<Articulo>();
            listaDeCompras = (List<Articulo>)Session["listaDeCompras"];

            listaMontos = new List<Monto>();

            contador = listaDeCompras != null ? listaDeCompras.Count : 0;
            zonas = new List<Zona>();
            zonas.Add(new Zona("Zona Norte", 0));
            zonas.Add(new Zona("Zona Sur", 1));
            zonas.Add(new Zona("Zona Oeste", 2));
            zonas.Add(new Zona("CABA", 3));


            if (!IsPostBack)
            {
                ddlZonas.DataSource = zonas;
                ddlZonas.DataValueField = "id";
                ddlZonas.DataTextField = "Descripcion";

                ddlZonas.DataBind();
            }



            if (contador != 0)
            {



                decimal acum = 0;
                //int envio = new Random().Next(800, 1800);

                foreach (var item in listaDeCompras)
                {
                    acum += item.Precio * item.Cantidad;

                }

                listaMontos.Add(new Monto("Subtotal", acum));

                if (Session["cambioDeCosto"] != null)
                {
                    listaMontos.Add(new Monto("Costo de Envio", (decimal)Session["cambioDeCosto"]));
                    ddlZonas.SelectedIndex = (int)Session["idZona"];
                    this.Session.Add("cambioDeCosto", null);


                }
                else
                {

                    decimal costo = 0;
                    int val = 0;
                    bool numero = int.TryParse(ddlZonas.SelectedItem.Value, out val);
                    calcularCostoEnvio(val, ref costo);

                    listaMontos.Add(new Monto("Costo de Envio", costo));


                }

                if (Session["cupon"] != null)
                {
                    listaMontos.Add(new Monto("Descuento Cupon", (decimal)Session["cupon"]));
                }




                decimal total = 0;
                foreach (var item in listaMontos)
                {
                    total += (decimal)item.precio;
                }
                lblTotal.Text = total.ToString();
                dgvArticulos.DataSource = listaDeCompras;
                dgvArticulos.DataBind();
                dgvMontos.DataSource = listaMontos;
                dgvMontos.DataBind();

            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);

        }

        protected void btnErase_Click(object sender, EventArgs e)
        {
            this.Session.Add("listaDeCompras", null);
            this.Session.Add("listaDeMontos", null);
            this.Session.Add("idZona", null);
            Response.Redirect("Carrito.aspx", false);
        }
        protected decimal CastPriceType(object oItem)
        {
            decimal precio = (decimal)DataBinder.Eval(oItem, "Precio") * (int)DataBinder.Eval(oItem, "Cantidad");

            // rest of your code
            return precio;
        }
        protected string ReturnCant(object oItem)
        {
            string cantidad = (DataBinder.Eval(oItem, "Cantidad")).ToString();

            // rest of your code
            return cantidad;
        }




        protected void dgvArticulos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Minus")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                if (listaDeCompras[index].Cantidad <= 1)
                {
                    listaDeCompras.RemoveAt(index);
                }
                else
                {
                    listaDeCompras[index].Cantidad--;
                }

                Response.Redirect("Carrito.aspx", false);
            }
            else
            if (e.CommandName == "Plus")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                listaDeCompras[index].Cantidad++;
                Response.Redirect("Carrito.aspx", false);
            }

        }

        protected void btnCheckCupon_Click(object sender, EventArgs e)
        {
            decimal aux = 0;
            if (tbCupon.Text == "MAXI")
            {
                aux = -50000; this.Session.Add("cupon", aux);
            }



            Response.Redirect("Carrito.aspx", false);
        }


        protected void ddlZonas_SelectedIndexChanged(object sender, EventArgs e)
        {

            var zona = int.Parse(ddlZonas.SelectedValue);
            decimal n = 0;
            calcularCostoEnvio(zona, ref n);
            listaMontos[1].precio = n;
            this.Session.Add("cambioDeCosto", n);
            this.Session.Add("idZona", zona);



            Response.Redirect("Carrito.aspx", false);


        }

        protected void calcularCostoEnvio(int lugar, ref decimal costo)
        {
            switch (lugar)
            {
                case 0:
                    costo = 750;
                    break;
                case 1:
                    costo = 1730;
                    break;
                case 2:
                    costo = 1400;
                    break;

                case 3:
                    costo = 1071;

                    break;
            }
        }
    }
}