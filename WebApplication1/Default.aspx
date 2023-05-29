<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>ARTICULOS</h1>

    <div class="row row-cols-1 row-cols-md-3 g-4">

        <%
            foreach (dominio.Articulo art in ListaArticulos)
            { %>  
               
                <div class="flip-card">
                    <div class="flip-card-inner">
                        <div class="flip-card-front">
                            <img src="<%--<%:art.Imagenes[0].Url%--%>>" class="card-img-top" alt="...">
                            <p class="title"><%:art.Nombre %></p>
                            <p><%:art.Descripcion %></p>
                            <div class="d-grid gap-2 d-md-block">              
                            </div>
                        </div>
                        <div class="flip-card-back">
                           <h5 class="card-title"><%:art.Nombre %></h5>
                            <p class="card-text"><small class="text-body-secondary">Precio <%:art.Precio%></small></p>
                            <asp:Button ID="Button3" class="btn btn-primary" runat="server" Text="Agregar al carrito" />
                            <a href="DetallesArticulos.aspx?Nombre=<%:art.Nombre%>" class="btn btn-primary">Ver detalles</a>
                        </div>
                    </div>
                </div>

        
         <% } %>
    </div>

    <style>
        .flip-card {
  background-color: transparent;
  width: 190px;
  height: 254px;
  perspective: 1000px;
  font-family: sans-serif;
}

.title {
  font-size: 1.5em;
  font-weight: 900;
  text-align: center;
  margin: 0;
}

.flip-card-inner {
  position: relative;
  width: 100%;
  height: 100%;
  text-align: center;
  transition: transform 0.8s;
  transform-style: preserve-3d;
}

.flip-card:hover .flip-card-inner {
  transform: rotateY(180deg);
}

.flip-card-front, .flip-card-back {
  box-shadow: 0 8px 14px 0 rgba(0,0,0,0.2);
  position: absolute;
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 100%;
  height: 100%;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  border: 1px solid coral;
  border-radius: 1rem;
}

.flip-card-front {
  background: linear-gradient(120deg, bisque 60%, rgb(255, 231, 222) 88%,
     rgb(255, 211, 195) 40%, rgba(255, 127, 80, 0.603) 48%);
  color: coral;
}

.flip-card-back {
  background: linear-gradient(120deg, rgb(255, 174, 145) 30%, coral 88%,
     bisque 40%, rgb(255, 185, 160) 78%);
  color: white;
  transform: rotateY(180deg);
}
    </style>


</asp:Content>
