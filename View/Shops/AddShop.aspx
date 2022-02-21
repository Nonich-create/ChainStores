<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddShop.aspx.cs" Inherits="ChainStores.View.Shops.AddShop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add shop</title>
        <webopt:bundlereference runat="server" path="~/Content/css" />
</head>
 
<body>
    <form id="form1" runat="server">
       <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;" runat="server">    
               <h2>Server validation</h2>
            <div style="margin: auto; color: #FF0000; height: 150px; background:#FFC0CB; outline: 2px solid #000;padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary EnableClientScript="false" runat="server" CssClass="error"/>
            </div> 
        <label>Shop name</label> 
        <asp:RequiredFieldValidator ForeColor="#FF0000" EnableClientScript="false" runat="server" ControlToValidate="textTitle"  ErrorMessage="The name must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textTitle" runat="server"  CssClass="form-control"></asp:TextBox> 

        <label>Adress</label> 
        <asp:RequiredFieldValidator ForeColor="#FF0000" EnableClientScript="false"  runat="server" ControlToValidate="textAdress"  ErrorMessage="The adress must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textAdress" runat="server" CssClass="form-control"  TextMode="MultiLine"></asp:TextBox> 
      
           <label>Phone number</label> 
           <asp:RequiredFieldValidator ForeColor="#FF0000" EnableClientScript="false"  runat="server" ControlToValidate="textPhoneNumber"  ErrorMessage="The phone number must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textPhoneNumber" runat="server"  CssClass="form-control" ></asp:TextBox> 

        <label>Form trade service</label> 
        <asp:TextBox ID="textFormTradeService" runat="server" CssClass="form-control"   TextMode="MultiLine"></asp:TextBox>
       
           <label>Product range</label> 
        <asp:TextBox ID="textProductRange" runat="server" CssClass="form-control"  TextMode="MultiLine"></asp:TextBox> 
       
           <label>Retail space, m2</label> 
        <asp:TextBox ID="textRetailSpace" CssClass="form-control" runat="server"></asp:TextBox>
       
           <label>Category</label> 
            <asp:RequiredFieldValidator ForeColor="#FF0000" EnableClientScript="false" runat="server" ControlToValidate="textCategory"  ErrorMessage="The category must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textCategory" runat="server" CssClass="form-control"  TextMode="MultiLine" ></asp:TextBox> 
      
           <label>MCC</label> 
            <asp:RequiredFieldValidator ForeColor="#FF0000" EnableClientScript="false"  runat="server" ControlToValidate="textMCC"  ErrorMessage="The MCC must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textMCC" runat="server" CssClass="form-control"  MaxLength="4"></asp:TextBox> 
       
           <label>Web site</label> 
        <asp:TextBox ID="textWebSite" runat="server" CssClass="form-control"   TextMode="MultiLine" ></asp:TextBox> 
        
           <label>Additional information</label> 
        <asp:TextBox ID="TextInfo" runat="server" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox> 
        
           <asp:Button ID="ButtonAdd" Text="Save" runat="server" CssClass="btn btn-primary" OnClick="ButtonAdd_Click"/>
        <asp:Button ID="ButtonBack"  CausesValidation="false"  Text="Back" runat="server" CssClass="btn btn-primary" OnClick="ButtonBack_Click"/>
       </div>
    </form>
</body>
</html>
 
 