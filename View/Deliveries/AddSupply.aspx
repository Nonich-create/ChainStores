<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSupply.aspx.cs" Inherits="ChainStores.View.Deliveries.AddSupply" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
  <div style="width:300px; margin:0 auto;" runat="server">    
        <label>Chose Product</label><br />
        <asp:DropDownList ID="dropDownProducts" runat="server" ItemType="System.String" SelectMethod="GetProducts" Height="20px" Width="290px"/><br />
        <label>Chose Supplier</label><br />
        <asp:DropDownList ID="dropDownSuppliers" runat="server" ItemType="System.String" SelectMethod="GetSuppliers" Height="20px" Width="290px"/><br />
        <label>Chose Shop</label><br />
        <asp:DropDownList ID="dropDownShop" runat="server" ItemType="System.String" SelectMethod="GetShops" Height="20px" Width="290px"/><br />
        <label>Chose employee</label><br />
        <asp:DropDownList ID="dropDownEmployees" runat="server" ItemType="System.String" SelectMethod="GetEmployees" Height="20px" Width="290px"/><br />
        <label>Quantity</label><br />
        <asp:TextBox ID="textQuantity" runat="server" Height="20px" style="margin-bottom: 0px" Width="165px"></asp:TextBox><br />
         <label>Date receipt</label><br />
         <input type="date" onchange="CopyDateToText(this,'TextDateReceipt')"/><br />
           <div hidden="hidden"> 
        <asp:TextBox ID="TextDateReceipt" runat="server"  Height="0px" Width="0px" Visible="true"  TextMode="DateTime" MaxLength="10"></asp:TextBox>
               </div>
         <asp:Button ID="ButtonAdd" Text="Add" runat="server" OnClick="ButtonAdd_Click" />
         <asp:Button ID="ButtonBack" Text="Back" runat="server" OnClick="ButtonBack_Click"/>
         </div>
    </form>
</body>
</html>
<script>
    function CopyDateToText(date, docId) {
        var text = document.getElementById(docId);
        text.value = date.value;
    }
</script>
 