<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="ChainStores.View.Products.UpdateProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Update product</title>
     <webopt:bundlereference runat="server" path="~/Content/css" />
</head>
<body>
    <form id="form1" onload="form1_Load" runat="server">
        <div>
             <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;">    
             <div style="margin: auto; color: #FF0000; height: 125px; background:#FFC0CB; outline: 2px solid #000;padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary ShowSummary="true" runat="server" CssClass="error"/>
            </div>

        <label>Article</label>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textArticle"  ErrorMessage="The article must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textArticle" runat="server" CssClass="form-control"></asp:TextBox>
       
        <label>Name</label>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="TextTitle"  ErrorMessage="The name must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="TextTitle" runat="server" CssClass="form-control"></asp:TextBox>
        
       
        <label>Product unit price</label>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textPrice"  ErrorMessage="The price must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textPrice" runat="server" CssClass="form-control" ></asp:TextBox>
       
         <label>Expiration date</label>
         <input type="date" id="calendarExpiration" onchange="CopyDateToText(this,'textExpirationDate')"/>  
         <div hidden="hidden"> 
        <asp:TextBox ID="textExpirationDate" Visible="true" runat="server" CssClass="form-control" TextMode="DateTime" MaxLength="10"></asp:TextBox>
                 </div>
        <label>Сertificate</label>
        <asp:TextBox ID="textСertificate" runat="server" CssClass="form-control"  TextMode="MultiLine"></asp:TextBox>
        <label>Date manufacture</label>
         <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textDateManufacture"  ErrorMessage="The date of manufacture must be specified" CssClass="error" Text="*" />
        <input type="date" id="calendarManufacture" onchange="CopyDateToText(this,'textDateManufacture')"/>  
           <div hidden="hidden"> 
        <asp:TextBox ID="textDateManufacture" runat="server"   Visible="true"  TextMode="DateTime" MaxLength="10"></asp:TextBox>
               </div>
        <label>Product composition</label>
        <asp:TextBox ID="textProductComposition" runat="server" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox>
        <label>Description product</label>
        <asp:TextBox ID="textDescription" runat="server" CssClass="form-control" TextMode="MultiLine"  ></asp:TextBox>
        <label>Choose a category</label>
        <asp:DropDownList ID="dropDownCategories" runat="server" ItemType="System.String" SelectMethod="GetCategories" CssClass="btn btn-secondary dropdown-toggle"/>
        <label>Choose a manufacturer</label>
        <asp:DropDownList ID="dropDownManufacturers" runat="server" ItemType="System.String" SelectMethod="GetManufacturers" CssClass="btn btn-secondary dropdown-toggle"/>
        <label>Select a unit of measurement</label>
        <asp:DropDownList ID="dropDownCommoаdityUnit" runat="server" ItemType="System.String" SelectMethod="GetCommoаdityUnits" CssClass="btn btn-secondary dropdown-toggle"/>
        <asp:Button ID="ButtonAdd" Text="Save" runat="server" OnClick="ButtonAdd_Click" CssClass="btn btn-primary"/>
        <asp:Button ID="ButtonBack"  CausesValidation="false"  Text="Back" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
       </div>
        </div>
    </form>
</body>
</html>
<script>
    calendarManufacture.value = document.getElementById('textDateManufacture').value;
    calendarExpiration.value = document.getElementById('textExpirationDate').value;
 
    function CopyDateToText(date, docId) {
        var text = document.getElementById(docId);
        text.value = date.value;
    }
</script>