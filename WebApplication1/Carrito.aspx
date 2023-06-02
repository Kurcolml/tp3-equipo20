<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="WebApplication1.Carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link  href="styles/st-carrito.css" rel="stylesheet" type="text/css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click"  CssClass="btn btn-primary me-md-2" type="button" Text="Volver" />  
<div class="container">
  <div class="row border border-dark-subtle">
  <div class="col-12 " style="background:#0094ff;text-align:center;">
      
      
      <%if (contador == 0)
        {
%>
    <h1>No hay elementos en el carro</h1>
      <asp:Button ID="btnIrADefault" runat="server" OnClick="btnBack_Click"  CssClass="btn btn-primary me-md-2" type="button" Text="Continuar Comprando" />  
    <% }
        else
        {  %>
      <h1>Carrito</h1>
     <div class="row">
       <div class="col-8" style="text-align:center">

         
             <h1></h1>
              
           <asp:GridView ID="dgvArticulos" runat="server" CssClass="table" DataKeyNames="Id" AutoGenerateColumns="false" OnRowCommand="dgvArticulos_RowCommand">
               
               <Columns>
                   
                   <asp:BoundField  HeaderText="Producto" DataField="Nombre" />
                   <asp:BoundField  HeaderText="Precio" DataField="Precio" />
                     <asp:ButtonField buttontype="Button" 
            commandname="Minus" 
            headertext="" 
            text="-"  />
                    <asp:TemplateField HeaderText="Cantidad">
                       <ItemTemplate>
                          

  <asp:Label runat="server" ID="lblCantidad" ><%#ReturnCant(Container.DataItem)%> </asp:Label>
        

                       </ItemTemplate>
                   </asp:TemplateField>
                     <asp:buttonfield buttontype="Button" 
            commandname="Plus"
            headertext="" 
            text="+" 
                         />
                   

                    <asp:TemplateField HeaderText="Total" >
                   <ItemTemplate>
                       <asp:Label ID="lblTotal" runat="server"  ><%#CastPriceType(Container.DataItem)%> </asp:Label>

                   </ItemTemplate>
                       </asp:TemplateField>
                  
               </Columns>




                </asp:GridView>
           <div class="vaciar" >
               <asp:Button ID="btnErase" runat="server" OnClick="btnErase_Click"  CssClass="btn btn-primary me-md-2" type="button" Text="Vaciar Carro" /> 
           </div>
            
       </div>


         <div class="col-4" >
             <div>
 <p>Tienes un cupon de descuento?</p>
                 
     <div class="input-group mb-3" style="margin-left:80px" >
  <asp:TextBox runat="server" type="text"  ID="tbCupon"   ></asp:TextBox>
  <asp:Button runat="server"  type="button" id="btnCheckCupon" Text="Agregar" OnClick="btnCheckCupon_Click"></asp:Button>

             </div>
     
          </div>
             <asp:ScriptManager runat="server">

             </asp:ScriptManager>
            <asp:UpdatePanel runat="server"> 

               <ContentTemplate>

              <div>
 <p>A que zona perteneces?</p>
     <asp:DropDownList runat="server" ID="ddlZonas" CssClass="btn btn-danger dropdown-toggle dropdown-toggle-split" style="background:#b200ff"
         AutoPostBack="true" OnSelectedIndexChanged="ddlZonas_SelectedIndexChanged">
     <%--<asp:ListItem Text="Zona Norte"/>
         <asp:ListItem Text="Zona Sur"/>
         <asp:ListItem Text="Zona Oeste"/>
         <asp:ListItem Text="CABA"/>--%>
         </asp:DropDownList>
          </div>
               </ContentTemplate>
            </asp:UpdatePanel>



      <div class="row"style="margin-left:20px">
  <div class="col-sm-11">
      
   
      <asp:GridView ID="dgvMontos" runat="server" CssClass="table"></asp:GridView>
      
  </div>
          <div class="col-sm-11" >
   
              <p class="resultado"> Total</p>
              <asp:Label ID="lblTotal" runat="server" ></asp:Label> 
      
     
  </div>
</div>
     </div>
    
       




  </div>
      

    <%} %>
  </div>
 
  </div>
</div> 


    


 
  

    
</asp:Content>

