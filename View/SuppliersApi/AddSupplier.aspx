<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSupplier.aspx.cs" Inherits="ChainStores.View.SuppliersApi.AddSupplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add supplier</title>
        <webopt:bundlereference runat="server" path="~/Content/css" />
</head>
<body>
    <form id="form1" runat="server">
       <div  style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;" class="validation" asp-validation-summary="None">   
            <div style="margin: auto; color: #FF0000; height: 200px; background:#FFC0CB; outline: 2px solid #000;padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary   runat="server" CssClass="error"/>
            </div>
           <div hidden="hidden">  
               <asp:RequiredFieldValidator ForeColor="Red"  ID="RequiredFieldValidator" ControlToValidate="textValidator" EnableClientScript="false"  runat="server"/>
               <asp:TextBox runat="server" ID="textValidator" Text=""></asp:TextBox>
           </div>

        <label>Supplier name</label> 
        <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="The name must be specified"  ID="RequiredFieldValidatorName"    runat="server" ControlToValidate="textTitle"   CssClass="error" Text="*" />
        <asp:TextBox ID="textTitle"  runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Adress</label> 
      <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="The adress must be specified"  runat="server" ControlToValidate="textAdress"   CssClass="error" Text="*" />
        <asp:TextBox ID="textAdress" runat="server" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox>
           
        <label>Phone number</label> 
        <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="The phone number must be specified" runat="server" ControlToValidate="textPhoneNumber"   CssClass="error" Text="*" />
        <asp:RegularExpressionValidator ValidationExpression="^(?:\+375)\b.\d{2}\b.\d{3}-.\d{1}-.\d{1}$" ForeColor="Red" ErrorMessage="Incorrectly entered phone number +375 12 345-67-89"  runat="server" ControlToValidate="textPhoneNumber"   CssClass="error" Text="*" />
        <asp:TextBox ID="textPhoneNumber" runat="server" CssClass="form-control"  ></asp:TextBox> 

        <label>Email</label> 
           <asp:RequiredFieldValidator ForeColor="Red"  ErrorMessage="The email must be specified" runat="server" ControlToValidate="textEmail"  CssClass="error" Text="*" />
           <asp:RegularExpressionValidator ValidationExpression="^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$" ForeColor="Red"  ErrorMessage="Incorrectly entered email exaple nick@mail.com" runat="server" ControlToValidate="textEmail"  CssClass="error" Text="*" />
        <asp:TextBox ID="textEmail" runat="server" CssClass="form-control" ></asp:TextBox>

        <label>Country</label> 
           <asp:RequiredFieldValidator ErrorMessage="The country must be specified" ForeColor="Red"   runat="server" ControlToValidate="textCountry" CssClass="error" Text="*" />
        <asp:TextBox ID="textCountry" runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Payment account</label> 
            <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="The payment account must be specified"    runat="server" ControlToValidate="textPaymentAccount" CssClass="error" Text="*" />
        <asp:TextBox ID="textPaymentAccount" runat="server"  CssClass="form-control"></asp:TextBox>

        <label>Category</label> 
              <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="The сategory must be specified"  runat="server" ControlToValidate="textCategory" CssClass="error" Text="*" />
        <asp:TextBox ID="textCategory"  runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Contact person</label> 
        <asp:TextBox ID="textContactPerson" runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Additional information</label> 
        <asp:TextBox ID="textInfo" runat="server" CssClass="form-control"  TextMode="MultiLine" ></asp:TextBox>
           
        <button onclick="ClickAddSupplier()" style="width:280px" type="submit" class="btn btn-primary">Save</button>
        <asp:Button ID="ButtonBack" CausesValidation="false"  Text="Back" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
       </div>
    </form>
</body>
</html>
<script>
    async function AddSupplier(title, adress, category, country, email, phoneNumber, info, paymentAccount, contactPerson) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: 'https://localhost:44375/AddSupplier/?title=' + title
                + '&adress=' + adress + '&category=' + category
                + '&country=' + country + '&email=' + email
                + '&phoneNumber=' + phoneNumber + '&info=' + info
                + '&paymentAccount=' + paymentAccount + '&contactPerson=' + contactPerson,
            type: 'GET',
            success: function (data) {
            }
        });
    }
    async function ClickAddSupplier() {
        var Category = document.getElementById('textCategory').value;
        var Title = document.getElementById('textTitle').value;
        var Adress = document.getElementById('textAdress').value;
        var Country = document.getElementById('textCountry').value;
        var Email = document.getElementById('textEmail').value;
        var PhoneNumber = document.getElementById('textPhoneNumber').value;
        var PaymentAccount = document.getElementById('textPaymentAccount').value;
        var Info = document.getElementById('textInfo').value;
        var ContactPerson = document.getElementById('textContactPerson').value;
        await AddSupplier(Title, Adress, Category, Country, Email, PhoneNumber, Info, PaymentAccount, ContactPerson);

        
        
    }

    $('form').submit(function () {
        document.location.href = "https://localhost:44346/View/SuppliersApi/ViewSuppliers";
    });
</script>
 