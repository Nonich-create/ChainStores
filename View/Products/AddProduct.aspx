<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="ChainStores.View.Products.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add product</title>
    <webopt:bundlereference runat="server" path="~/Content/css" />
</head>
<body>
    <form id="form1" runat="server">
      <div>  
       <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;">  
           <h3>Сlient dynamic validation without ValidationSummary</h3>
          <asp:ValidationSummary runat="server" CssClass="error"/>
        <label>Article</label>
        <asp:TextBox ID="textArticle" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textArticle" CssClass="error" Text="The article must be specified" />
              <asp:DynamicValidator ForeColor="Red" ID="dynamicValidator" Display="Static" runat="server" ControlToValidate="textArticle"/>
        <br />
        <label>Name</label>
        <asp:TextBox ID="TextTitle" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="TextTitle" CssClass="error" Text="The name must be specified" />
        <br />
        <label>Product unit price</label>
        <asp:TextBox ID="textPrice" runat="server" CssClass="form-control" ></asp:TextBox>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textPrice" CssClass="error" Text="The price must be specified" />
 
         <br />
         <label>Expiration date</label>
         <input type="date" onchange="CopyDateToText(this,'textExpirationDate')"/>  
          <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textExpirationDate" CssClass="error" Text="The date of expiratio must be specified" />
         <div hidden="hidden"> 
        <asp:TextBox ID="textExpirationDate" Visible="true" runat="server" CssClass="form-control" TextMode="DateTime" MaxLength="10"></asp:TextBox>
                 </div>
                      
           <br />
        <label>Сertificate</label>
        <asp:TextBox ID="textСertificate" runat="server" CssClass="form-control"  TextMode="MultiLine"></asp:TextBox>
       
         <label>Date of manufacture</label>
         <input type="date" onchange="CopyDateToText(this,'textDateManufacture')"/>  
           <div hidden="hidden"> 
        <asp:TextBox ID="textDateManufacture" runat="server"   Visible="true"  TextMode="DateTime" MaxLength="10"></asp:TextBox>
               </div>
            <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textDateManufacture" CssClass="error" Text="The date of manufacture must be specified" />
           <br />
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
    function CopyDateToText(date, docId) {
        var text = document.getElementById(docId);
        text.value = date.value;
    }
</script>
 
  
 
        
             
                
     
                   
              
             
                    
 
                