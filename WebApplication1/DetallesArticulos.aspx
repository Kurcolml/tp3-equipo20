<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetallesArticulos.aspx.cs" Inherits="WebApplication1.DetallesArticulos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

              <%
                  string lastURL = null;
                  foreach (dominio.Imagen img in listaImagenes)
                  {
                      if (img.Url != null && img.Url!= lastURL)
                      {
               %>  
                    
                    <div class="div-img">
                      <img src="<%:img.Url %>" class="d-block w-100" alt="...">
                    </div>

         <%           }
                  lastURL = img.Url;
             } %>

    <div class="card" style="width: 18rem;">
          <div class="card-body">
                <h3 class="card-title"><%:art.Nombre %></h3>
                <h5 class="card-text">Descripcion: <%:art.Descripcion %></h5>
                <h5 class="card-text">Precio: <%:art.Precio %></h5>
                <h5 class="card-text">Marca: <%:art.Marca %></h5>
                <h5 class="card-text">Categoria : <%:art.Categoria %></h5>
          </div>
    </div>
    
    <style>
        .div-img{
            display:flex;
            width:20%;
            height:20%;
            border: 2px solid red;
        }
    </style>

</asp:Content>
