<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="WebApplication1.Carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-grid gap-2 d-md-block">
  
         <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click"  CssClass="btn btn-primary me-md-2" type="button" Text="Volver" />    
</div>
    <%if (contador == 0)
        {
%>
    <h1>No hay elementos en el carro</h1>
    <% }
        else
        {  %>
    <asp:GridView ID="dgvArticulos" runat="server" CssClass="table"></asp:GridView>
    <%} %>
</asp:Content>

