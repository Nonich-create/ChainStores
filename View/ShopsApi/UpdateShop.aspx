<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateShop.aspx.cs" Inherits="ChainStores.View.ShopsApi.UpdateShop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Update shop</title>
    <webopt:bundlereference runat="server" path="~/Content/css" />
     <webopt:BundleReference runat="server" Path="~/Content/PreLoader.css"></webopt:BundleReference>
</head>
<body>
    <form id="form1" runat="server">
               <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference   Path="~/Scripts/ViewScripts/Twister.js" />
            </Scripts>
        </asp:ScriptManager>

       <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;" runat="server">    
               <div id="errorSummary" style="margin: auto; color: #FF0000; background:#FFC0CB; outline: 2px solid #FFC0CB; padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary ID="validationSum"  runat="server" CssClass="error"/>
            </div> 

                  <fieldset id="controlForms"/>  
                  <div> 
                      <h3 id="message"></h3>
            </div>
        <label>Shop name</label> 
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textTitle"  ErrorMessage="The name must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textTitle" runat="server"  CssClass="form-control"></asp:TextBox> 

        <label>Address</label> 
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textAddress"  ErrorMessage="The adress must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textAddress" runat="server" CssClass="form-control"  TextMode="MultiLine"></asp:TextBox> 
      
           <label>Phone number</label> 
            <asp:RegularExpressionValidator  ForeColor="Red" ValidationExpression="^(?:\+375)\b.\d{2}\b.\d{3}-.\d{1}-.\d{1}$" runat="server" ControlToValidate="textPhoneNumber" ErrorMessage="Incorrectly entered phone number +375 12 345-67-89"  CssClass="error" Text="*" />
           <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textPhoneNumber"  ErrorMessage="The phone number must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textPhoneNumber" runat="server"  CssClass="form-control" ></asp:TextBox> 

        <label>Form trade service</label> 
        <asp:TextBox ID="textFormTradeService" runat="server" CssClass="form-control"   TextMode="MultiLine"></asp:TextBox>
       
           <label>Product range</label> 
        <asp:TextBox ID="textProductRange" runat="server" CssClass="form-control"  TextMode="MultiLine"></asp:TextBox> 
       
           <label>Retail space, m2</label> 
        <asp:TextBox ID="textRetailSpace" CssClass="form-control" runat="server"></asp:TextBox>
       
           <label>Category</label> 
            <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textCategory"  ErrorMessage="The category must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textCategory" runat="server" CssClass="form-control"  TextMode="MultiLine" ></asp:TextBox> 
      
        <label>MCC</label> 
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textMCC"  ErrorMessage="The MCC must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textMCC" runat="server" CssClass="form-control"  MaxLength="4"></asp:TextBox> 
       
           <label>Web site</label> 
        <asp:TextBox ID="textWebSite" runat="server" CssClass="form-control"   TextMode="MultiLine" ></asp:TextBox> 
        
           <label>Additional information</label> 
        <asp:TextBox ID="TextInfo" runat="server" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox> 
        
            <div id="Preloader" hidden="hidden">   
            <br />
            <div class='loader' style="margin: auto;">
                <div class='circle1'></div>
                <div class='circle2'></div>
                <div class='circle3'></div>
                <div class='circle4'></div>
                <div class='circle5'></div>
                <div class='circle6'></div>
                <div class='circle7'></div>
                <div class='circle8'></div>
             </div>
            <br />
           </div>
         <input onclick="ClickUpdateShopPrealoader()" style="width:280px" type="button" class="btn btn-primary" value="Saves with visual accompaniment"/>
        <input onclick="ClickUpdateShop()" style="width:280px" type="submit" class="btn btn-primary" value="Save" />
        <asp:Button ID="ButtonBack" CausesValidation="false" style="width:280px"  Text="Back" runat="server" CssClass="btn btn-primary" OnClick="ButtonBack_Click"/>
       </div>
    </form>
    <input hidden="hidden" id="LblWebApi" value="<%= WebApi %>"/>
</body> 
</html>
     
 <script>
     var webApi = document.getElementById('LblWebApi');
    function CheckValidation() {
        var divError = document.getElementById('errorSummary');
        var validationSummary = document.getElementById('validationSum');
        if (validationSummary.textContent == '\n\n') {
            divError.hidden = true;
        }
        else {
            divError.hidden = false;
        }
    };
    CheckValidation();

    async function getShop(Id) {
        var shop = {};
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/Api/Shop/' + Id,
            type: 'GET',
            success: function (data) {
                shop = data;
            }
        });
        return shop;
    };

    async function UpdateShop(title, address, info, category, mcc,
        formTradeService, phoneNumber, productRange, retailSpace, webSite, Id) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/UpdateShop/?title=' + title
                + '&address=' + address + '&info=' + info
                + '&category=' + category + '&mcc=' + mcc
                + '&formTradeService=' + formTradeService + '&phoneNumber=' + phoneNumber
                + '&productRange=' + productRange + '&retailSpace=' + retailSpace +
                '&webSite=' + webSite+ "&Id=" + Id,
            type: 'GET',
            success: function (data) {
            }
        });
    };

     async function UpdateShopPrealoader(title, address, info, category, mcc,
         formTradeService, phoneNumber, productRange, retailSpace, webSite, Id) {
         await $.ajax({
             headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
             url: webApi.value + '/UpdateShop/?title=' + title
                 + '&address=' + address + '&info=' + info
                 + '&category=' + category + '&mcc=' + mcc
                 + '&formTradeService=' + formTradeService + '&phoneNumber=' + phoneNumber
                 + '&productRange=' + productRange + '&retailSpace=' + retailSpace +
                 '&webSite=' + webSite + "&Id=" + Id,
             type: 'GET',
             success: function (data) {
                 WaitLoad('Successful saving', 'message', 'Preloader');
             },
             error: function () {
                 WaitLoad('An Error occured during implementations save', 'message', 'Preloader');
             }
         });
     };

    async function OnLoadData() {
        var Id = '<%=Request.QueryString["Id"]%>';
        let Shop = await getShop(Id);

        document.getElementById('textTitle').value = Shop.Title;
        document.getElementById('textAddress').value = Shop.Adress;
        document.getElementById('TextInfo').value = Shop.Info;
        document.getElementById('textCategory').value = Shop.Category;
        document.getElementById('textMCC').value = Shop.MCC;
        document.getElementById('textFormTradeService').value = Shop.FormTradeService;
        document.getElementById('textPhoneNumber').value = Shop.PhoneNumber;
        document.getElementById('textProductRange').value = Shop.ProductRange;
        document.getElementById('textRetailSpace').value = Shop.RetailSpace;
        document.getElementById('textWebSite').value = Shop.WebSite;
    };

    async function ClickUpdateShop(){
        var Id = '<%=Request.QueryString["Id"]%>';
        var Title = document.getElementById('textTitle').value;
        var Address = document.getElementById('textAddress').value;
        var Info = document.getElementById('TextInfo').value;
        var Category = document.getElementById('textCategory').value;
        var MCC = document.getElementById('textMCC').value;
        var FormTradeService = document.getElementById('textFormTradeService').value;
        var PhoneNumber = document.getElementById('textPhoneNumber').value;
        var ProductRange = document.getElementById('textProductRange').value;
        var RetailSpace = document.getElementById('textRetailSpace').value;
        var WebSite = document.getElementById('textWebSite').value;

        await UpdateShop(Title, Address, Info, Category, MCC, FormTradeService, PhoneNumber, ProductRange,
            RetailSpace, WebSite, Id);

     };

     async function ClickUpdateShopPrealoader() {
         $("#controlForms").prop('disabled', true);
         var div = document.getElementById('Preloader');
         div.hidden = "";
        var Id = '<%=Request.QueryString["Id"]%>';
        var Title = document.getElementById('textTitle').value;
        var Address = document.getElementById('textAddress').value;
        var Info = document.getElementById('TextInfo').value;
        var Category = document.getElementById('textCategory').value;
        var MCC = document.getElementById('textMCC').value;
        var FormTradeService = document.getElementById('textFormTradeService').value;
        var PhoneNumber = document.getElementById('textPhoneNumber').value;
        var ProductRange = document.getElementById('textProductRange').value;
        var RetailSpace = document.getElementById('textRetailSpace').value;
        var WebSite = document.getElementById('textWebSite').value;

        await UpdateShopPrealoader(Title, Address, Info, Category, MCC, FormTradeService, PhoneNumber, ProductRange,
            RetailSpace, WebSite, Id);
     };
   //$('form').submit(function () {
   //    document.location.href = "https://localhost:44346/View/ShopsApi/ViewShops";
   //});
    OnLoadData();
 </script>