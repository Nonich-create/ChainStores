<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSupplier.aspx.cs" Inherits="ChainStores.View.Suppliers.AddSupplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add supplier</title>
        <webopt:bundlereference runat="server" path="~/Content/css" />
</head>
<body>
    <form id="form1" runat="server">
            <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference   Path="~/Scripts/ViewScripts/CheckValidation.js" />
            </Scripts>
        </asp:ScriptManager>
       <div  style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;" class="validation" asp-validation-summary="None">   
        <h2>Server validation using annotations</h2>
            <div id="errorSummary"  style="margin: auto; color: #FF0000;  background:#FFC0CB; outline: 2px solid #FFC0CB;padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary   ID="validationSum"   runat="server" CssClass="error"/>
            </div>
           <div hidden="hidden">  
               <asp:RequiredFieldValidator ForeColor="Red"  ID="RequiredFieldValidator" ControlToValidate="textValidator" EnableClientScript="false"  runat="server"/>
               <asp:TextBox runat="server" ID="textValidator" Text=""></asp:TextBox>
           </div>

        <label>Supplier name</label> 
        <asp:RequiredFieldValidator ForeColor="Red"  ID="RequiredFieldValidatorName" EnableClientScript="false"  runat="server" ControlToValidate="textTitle"   CssClass="error" Text="*" />
        <asp:TextBox ID="textTitle"  runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Adress</label> 
      <asp:RequiredFieldValidator ForeColor="Red"  EnableClientScript="false" runat="server" ControlToValidate="textAdress"   CssClass="error" Text="*" />
        <asp:TextBox ID="textAdress" runat="server" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox>
           
        <label>Phone number</label> 
        <asp:RequiredFieldValidator ForeColor="Red"  EnableClientScript="false" runat="server" ControlToValidate="textPhoneNumber"   CssClass="error" Text="*" />
        <asp:TextBox ID="textPhoneNumber" runat="server" CssClass="form-control"  ></asp:TextBox> 

        <label>Email</label> 
           <asp:RequiredFieldValidator ForeColor="Red" EnableClientScript="false" runat="server" ControlToValidate="textEmail"  CssClass="error" Text="*" />
        <asp:TextBox ID="textEmail" runat="server" CssClass="form-control" ></asp:TextBox>

        <label>Country</label> 
           <asp:RequiredFieldValidator ForeColor="Red" EnableClientScript="false" runat="server" ControlToValidate="textCountry" CssClass="error" Text="*" />
        <asp:TextBox ID="textCountry" runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Payment account</label> 
            <asp:RequiredFieldValidator ForeColor="Red"  EnableClientScript="false" runat="server" ControlToValidate="textPaymentAccount" CssClass="error" Text="*" />
        <asp:TextBox ID="textPaymentAccount" runat="server"  CssClass="form-control"></asp:TextBox>

        <label>Category</label> 
              <asp:RequiredFieldValidator ForeColor="Red"  EnableClientScript="false" runat="server" ControlToValidate="textCategory" CssClass="error" Text="*" />
        <asp:TextBox ID="textCategory"  runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Contact person</label> 
        <asp:TextBox ID="textContactPerson" runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Additional information</label> 
        <asp:TextBox ID="textInfo" runat="server" CssClass="form-control"  TextMode="MultiLine" ></asp:TextBox>
           
        <asp:Button ID="ButtonAdd" Text="Save" runat="server" OnClientClick="CheckValidation('errorSummary','validationSum')" OnClick="ButtonAdd_Click" CssClass="btn btn-primary" />
        <asp:Button ID="ButtonBack" CausesValidation="false"  Text="Back" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
       </div>
    </form>
</body>
</html>
<script>
    CheckValidation('errorSummary', 'validationSum');
</script>

 