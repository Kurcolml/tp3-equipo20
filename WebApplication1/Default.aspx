    <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>       

      <%--    <%
  <div id="search-container">
         <input type="text" id="search-box" placeholder="Buscar">
         </div>
    <>--%>
   <header class="header">
    <section class="nav-bar">

           <div id="search-container">
                      <asp:TextBox runat="server" ID="txtBusqueda" CssClass="search-box" AutoPostBack="true" OnTextChanged="Busqueda_TextChanged" AutoComplete="off" PlaceHolder="Búsqueda"/>
                      <asp:CheckBox runat="server" ID="chBusqueda" Text="Filtrar" OnCheckedChanged="chBusqueda_CheckedChanged" AutoPostBack="true"></asp:CheckBox>
                      <asp:Label runat="server" ID="BusquedaNull" Text="No se encontraron resultados" CssClass="lblBusqueda"></asp:Label>
                      <asp:CheckBox runat="server" CssClass="FiltroPrecio" ID="chMenorPrecio" Text="Menor precio" OnCheckedChanged="chMenorPrecio_CheckedChanged" AutoPostBack="true"></asp:CheckBox>
                      <asp:CheckBox runat="server" CssClass="FiltroPrecio" ID="chMayorPrecio" Text="Mayor precio" OnCheckedChanged="chMayorPrecio_CheckedChanged" AutoPostBack="true"></asp:CheckBox>
           </div>        

            <%if (FiltroAvanzado) {%> 
            <div class="BusquedaAvanzadaContenido">
            <div class="row">
                    <div class="col">
                            <div class="BusAvanzado">
                                <asp:Label Text="Categoria" runat="server" />
                                <asp:DropDownList runat="server" ID="ddlCategoria" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            </div>    
                    </div>
                    <div class="col">
                            <div class="BusAvanzado">
                                <asp:Label Text="Marca" runat="server"/>
                                <asp:DropDownList runat="server" ID="ddlMarca" OnSelectedIndexChanged="ddlMarca_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            </div>    
                    </div>
                    <div class="col">
                            <div class="BusAvanzado">
                                <asp:Label Text="Filtro" runat="server" />
                                <asp:TextBox runat="server" ID="txtBusAvanzada" CssClass="search-box" AutoPostBack="true" OnTextChanged="txtBusAvanzada_TextChanged" AutoComplete="off" Enabled="false"/>
                            </div>    
                    </div>
            </div>
                </div>
            <% } %>

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
    </section>
  </header>

    <section class="articulos">
        <div class="mega-main">
                <div class="main">
                    <asp:Repeater ID="rprCards" runat="server">
                        <ItemTemplate>
                                     <div class="flip-card">
                                        <div class="flip-card-inner">
                                            <div class="flip-card-front">
                                                   <img id="img-flip-card" src="<%#Eval("Imagenes[0].Url") %>" alt="NO IMAGE">
                                                    <p class="title"><%#Eval("Nombre")%></p>
                                                    <p><%#Eval("Descripcion") %></p>
                                                    <div class="d-grid gap-2 d-md-block">              
                                                    </div>
                                            </div>
                                            <div class="flip-card-back">
                                               <h5 class="card-title"><%#Eval("Nombre") %></h5>
                                                <p class="card-text"><small class="text-body-secondary">Precio <%#Eval("Precio")%></small></p>
                                                <div class="btns">
                                                        <asp:Button ID="btnAdd" runat="server"  CssClass="btn-botones" OnClick="btnAdd_Click" type="button" Text=" Agregar " 
                                                            CommandArgument='<% #Eval("Id")%>' CommandName="artId" />
                                                      <a href="DetallesArticulos.aspx?Nombre=<%#Eval("Nombre") %>" class="btn-botones">Detalles</a>                                                      
                                              </div>
                                           </div>
                                        </div>
                                    </div>    
                        </ItemTemplate>
                    </asp:Repeater>
                 </div>
            </div>
        </section>

    <style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
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
  box-shadow: -30px 30px 20px rgba(245,245,245,0.2);
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
  border: 2px solid #FF0060;
  border-radius: 1rem;
}

.flip-card-front {
    background: #E76161;
    color: whitesmoke;
}

.img-flip-card{
    border-bottom: 2px solid black;
}

.flip-card-back {
  justify-content:space-around;
  background: #E76161;
  color: white;
  transform: rotateY(180deg);
}

.btns{
    display:grid;
    font-size: 13px;
    padding-left: 10px;
    padding-right: 10px;
    gap:20px;
}

.btn-botones{
  text-decoration:none;
  padding: 5px 10px;
  border-radius: 5px;
  outline: 2px solid #212A3E;
  outline-offset: 0px;
  background: #394867;
  border: 0;
  font-weight: bolder;
  color: white;
  transition: all .1s ease-in-out;
  cursor: pointer;
}

.btn-botones:hover {
  outline-offset: 3px;
  outline: 3px solid #212A3E;

}
#search-container {
  position: relative;
  top: 0;
  left: 0;
  padding: 10px;
  background-color: #f2f2f2;
  transition: box-shadow 0.3s ease-in-out;
}

#search-container:focus-within {
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); 
}

 #search-box {
        width: 200px;
        padding: 5px;
        border: none;
        border-radius: 0,5px;
  } 
 .lblBusqueda {
   
     margin-left:50px;
        }
 .BusquedaAvanzadaContenido{
     
  display: flex;
  justify-content: space-around;
  margin: 0 10px;
 }
.row{
  display: flex;
  width: 100%;

}
.col{
  flex: 1;
  padding: 10px;
  margin-left:10px;
}

 .FiltroPrecio {
float:right;    
margin:15px;
padding:10px;
 }
        

    </style>

</asp:Content>

