<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateSupplier.aspx.cs" Inherits="ChainStores.View.Suppliers.UpdateSupplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Update supplier</title>
      <webopt:bundlereference runat="server" path="~/Content/css" />
</head>
<body>
   
    <form id="form1" runat="server" onload="form1_Load">
      <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;">   
             <div style="margin: auto; color: #FF0000; height: 225px; background:#FFC0CB; outline: 2px solid #000;padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary  runat="server" CssClass="error"/>
            </div>
        <label>Supplier name</label> 
        <asp:RequiredFieldValidator ForeColor="#FF0000"  runat="server" ControlToValidate="textTitle"  ErrorMessage="The name must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textTitle" runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Adress</label> 
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textAdress"  ErrorMessage="The adress must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textAdress" runat="server" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox>
           
        <label>Phone number</label> 
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textPhoneNumber"  ErrorMessage="The phone number must be specified" CssClass="error" Text="*" />
        <asp:RegularExpressionValidator  ForeColor="#FF0000" ValidationExpression="^(?:\+375)\b.\d{2}\b.\d{3}-.\d{1}-.\d{1}$" runat="server" ControlToValidate="textPhoneNumber"  ErrorMessage="Incorrectly entered phone number +375 12 345-67-89" CssClass="error" Text="*" />
        <asp:TextBox ID="textPhoneNumber" runat="server" CssClass="form-control"  ></asp:TextBox> 

        <label>Email</label> 
           <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textEmail"  ErrorMessage="The email number must be specified" CssClass="error" Text="*" />
            <asp:RegularExpressionValidator ForeColor="#FF0000" ValidationExpression="^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$" runat="server" ControlToValidate="textEmail"  ErrorMessage="Incorrectly entered email exaple nick@mail.com" CssClass="error" Text="*" />
        <asp:TextBox ID="textEmail" runat="server" CssClass="form-control" ></asp:TextBox>

        <label>Country</label> 
           <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textCountry"  ErrorMessage="The country number must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textCountry" runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Payment account</label> 
            <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textPaymentAccount"  ErrorMessage="The payment account number must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textPaymentAccount" runat="server"  CssClass="form-control"></asp:TextBox>

        <label>Category</label> 
        <asp:TextBox ID="textCategory" runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Contact person</label> 
        <asp:TextBox ID="textContactPerson" runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Additional information</label> 
        <asp:TextBox ID="textInfo" runat="server" CssClass="form-control"  TextMode="MultiLine" ></asp:TextBox>
            
        <asp:Button ID="ButtonSave" Text="Save" runat="server" OnClick="ButtonSave_Click" CssClass="btn btn-primary" />
        <asp:Button ID="ButtonBack" CausesValidation="false"  Text="Back" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
       </div>
    </form>
</body>
</html>
