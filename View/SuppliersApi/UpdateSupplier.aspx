<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateSupplier.aspx.cs" Inherits="ChainStores.View.SuppliersApi.UpdateSupplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Update supplier</title>
      <webopt:bundlereference runat="server" path="~/Content/css" />
</head>
<body>
   
    <form id="form1" runat="server">
      <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;">   
             <div style="margin: auto; color: #FF0000; height: 225px; background:#FFC0CB; outline: 2px solid #000;padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary  runat="server" CssClass="error"/>
            </div>
            <div hidden="hidden">
            <asp:Label runat="server" ID="LabelId"></asp:Label>
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
            
        <button onclick="ClickUpdateSupplier()" style="width:280px" type="submit" class="btn btn-primary">Save</button>
        <asp:Button ID="ButtonBack" CausesValidation="false"  Text="Back" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
       </div>
    </form>
</body>
</html>
<script>
    async function getSupplier(Id) {
        var supplier = {};
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: 'https://localhost:44375/Api/Supplier/' + Id,
            type: 'GET',
            success: function (data) {
                supplier = data;
            }
        });
        return supplier;
    };

    async function UpdateSupplier(title, adress, category, country, email, phoneNumber, info, paymentAccount, contactPerson, Id) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: 'https://localhost:44375/UpdateSupplier/?title=' + title
                + '&adress=' + adress + '&category=' + category
                + '&country=' + country + '&email=' + email
                + '&phoneNumber=' + phoneNumber + '&info=' + info
                + '&paymentAccount=' + paymentAccount + '&contactPerson=' + contactPerson
                + "&Id=" + Id,
            type: 'GET',
            success: function (data) {
            }
        });
    };

    async function OnLoadData() {
        var Id = '<%=Request.QueryString["Id"]%>';
        let supplier = await getSupplier(Id);

        document.getElementById('textCategory').value = supplier.Category;
        document.getElementById('textTitle').value = supplier.Title;
        document.getElementById('textAdress').value = supplier.Adress;
        document.getElementById('textCountry').value = supplier.Country;
        document.getElementById('textEmail').value = supplier.Email;
        document.getElementById('textPhoneNumber').value = supplier.PhoneNumber;
        document.getElementById('textPaymentAccount').value = supplier.PaymentAccount;
        document.getElementById('textInfo').value = supplier.Info;
        document.getElementById('textContactPerson').value = supplier.ContactPerson;
    };

    async function ClickUpdateSupplier() {
        var Id = '<%=Request.QueryString["Id"]%>';
        var Category = document.getElementById('textCategory').value;
        var Title = document.getElementById('textTitle').value;
        var Adress = document.getElementById('textAdress').value;
        var Country = document.getElementById('textCountry').value;
        var Email = document.getElementById('textEmail').value;
        var PhoneNumber = document.getElementById('textPhoneNumber').value;
        var PaymentAccount = document.getElementById('textPaymentAccount').value;
        var Info = document.getElementById('textInfo').value;
        var ContactPerson = document.getElementById('textContactPerson').value;
        await UpdateSupplier(Title, Adress, Category, Country, Email, PhoneNumber, Info, PaymentAccount, ContactPerson, Id);
     }
    $('form').submit(function () {
        document.location.href = "https://localhost:44346/View/SuppliersApi/ViewSuppliers";
    });
    OnLoadData();
</script>