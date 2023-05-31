<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                 <div class="container text-center btnCarrito " id="count">
                        <div class="row">
                            <div class="col">
                              <asp:Button ID="btnCarro" runat="server" CssClass="btn btn-primary "  OnClick="btnCarro_Click" type="button" Text="Carrito " />
                            </div>
                            <div class="col">
                                <div>           
                               <asp:Label ID="lblCompra"  runat="server" CssClass="count" ></asp:Label>
                                    </div>  
                            </div>
                        </div>
               </div>

    <section class="articulos">
     
        <div class="mega-main">
                <div class="main">
                    <asp:Repeater ID="rprCards" runat="server">
                        <ItemTemplate>
                             <div class="flip-card">
                                <div class="flip-card-inner">
                                    <div class="flip-card-front">
                                       <img src="<%--<%#Eval("img.Url") %>"--%> alt="...">
                                        <p class="title"><%#Eval("Nombre")%></p>
                                        <p><%#Eval("Descripcion") %></p>
                                        <div class="d-grid gap-2 d-md-block">              
                                        </div>
                                    </div>
                                    <div class="flip-card-back">
                                       <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                        <p class="card-text"><small class="text-body-secondary">Precio <%#Eval("Precio")%></small></p>
                                        <asp:Button ID="btnAdd" runat="server"  CssClass="btnAdd" OnClick="btnAdd_Click" type="button" Text=" Agregar " 
                                            CommandArgument='<% #Eval("Id")%>' CommandName="artId" />
                                      <a href="DetallesArticulos.aspx?Nombre=<%#Eval("Nombre") %>" class="btn btn-primary">Ver detalles</a>
                                
                           
                                    </div>
                                </div>
                            </div>    

                        </ItemTemplate>
                    </asp:Repeater>
                    </div>
            </div>
        </section>


    <%--    <%
            foreach (dominio.Articulo art in ListaArticulos)
            {
                listaImagenes = negocioImg.Listar(art.Id);
                if (listaImagenes.Count > 0)
                {
                    img = listaImagenes[0];
                }
                else
                {
                    img.Url = "data:image/png;base64,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";
                }
                %>  
                              
                <div class="flip-card">
                    <div class="flip-card-inner">
                        <div class="flip-card-front">
                            <img src="<%:img.Url%>" alt="...">
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
    </div>--%>

    <style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

.navbar h1{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    padding: 20px 10%;
    background: transparent /*crimson*/;
    color:floralwhite;
    display: flex;
    justify-content: space-between;
    align-items: center;
    z-index: 100;
    transition: .5s;
}


.articulos{
    min-height: auto;
    padding-bottom: 10rem;
}


.mega-main{
    display: flex;
    justify-content: center;
    align-items: center;
}

 .main{
    position: relative;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    padding: 5rem;
}

.flip-card {
      background-color: transparent;
      width: 300px;
      height: 450px;
      perspective: 1000px;
      font-family: sans-serif;
      padding: 2rem; 
    position: relative;
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
}

.btn-botones{
    padding:5px;
    align-items:center;
    justify-content:space-between;
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
