<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProductCategory.aspx.cs" Inherits="ChainStores.View.ProductCategory.AddProductCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <webopt:bundlereference runat="server" path="~/Content/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add category product</title>
</head>
<body>
  <form id="form1" runat="server">
    <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;">
    <div style="margin: auto; color: #FF0000; height: 75px; background:#FFC0CB; outline: 2px solid #000;padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary ShowSummary="true" runat="server" CssClass="error"/>
            </div>
       
        <label>Code</label>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textCode"  ErrorMessage="The code must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textCode" runat="server" CssClass="form-control"></asp:TextBox>
       
        <label>Name</label>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="TextTitle"  ErrorMessage="The name must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="TextTitle" runat="server"  CssClass="form-control"></asp:TextBox> 
        
        <label>Additional information</label> 
        <asp:TextBox ID="textInfo" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox> 
        
        <asp:Button ID="ButtonSave" Text="Save" runat="server" OnClick="ButtonSave_Click" CssClass="btn btn-primary"  />
        <asp:Button ID="ButtonBack" CausesValidation="false" Text="Back" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
      </div>    
   </form>   
</body>
</html>
