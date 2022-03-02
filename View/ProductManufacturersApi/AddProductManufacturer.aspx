<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProductManufacturer.aspx.cs" Inherits="ChainStores.View.ProductManufacturersApi.AddProductManufacturer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <webopt:bundlereference runat="server" path="~/Content/css" />
     <webopt:BundleReference runat="server" Path="~/Content/PreLoader.css"></webopt:BundleReference>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add manufacturer</title>
</head>
<body>
     <form id="form1" runat="server">
           <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference   Path="~/Scripts/ViewScripts/Twister.js" />
            </Scripts>
        </asp:ScriptManager>

            <fieldset id="controlForms"/>  
    <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;">    
          <div id="errorSummary" style="margin: auto; color: #FF0000; background:#FFC0CB; outline: 2px solid #FFC0CB; padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary ID="validationSum" runat="server" CssClass="error"/>
            </div>
            <div> 
                      <h3 id="message"></h3>
            </div>
        <label>Name</label>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textTitle"  ErrorMessage="The name must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textTitle" runat="server" CssClass="form-control"></asp:TextBox> 
        
        <label>Country</label> 
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textCountry"  ErrorMessage="The country must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textCountry" runat="server" CssClass="form-control"></asp:TextBox> 
        
        <label>Address</label> 
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textAddress"  ErrorMessage="The address must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textAddress" runat="server" CssClass="form-control"></asp:TextBox> 
        
        <label>Additional information</label> 
        <asp:TextBox ID="textInfo" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox> 
 
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
        <input onclick="ClickAddManufacturerPrealoader()" style="width:280px" type="button" class="btn btn-primary" value="Saves with visual accompaniment"/>
        <input onclick="ClickAddManufacturer()" style="width:280px" type="submit" class="btn btn-primary" value="Save" />
        <asp:Button ID="ButtonBack" CausesValidation="false" Text="Back" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
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

    async function AddManufacturer(title, address, info, country) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/AddManufacturer/?title=' + title
                + '&address=' + address + '&info=' + info + '&country=' + country,
            type: 'GET',
            success: function (data) {
            }
        });
    }

     async function AddManufacturerPrealoader(title, address, info, country) {
         await $.ajax({
             headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
             url: webApi.value + '/AddManufacturer/?title=' + title
                 + '&address=' + address + '&info=' + info + '&country=' + country,
             type: 'GET',
             success: function (data) {
                 WaitLoad('Successful saving', 'message', 'Preloader');
             },
             error: function () {
                 WaitLoad('An Error occured during implementations save', 'message', 'Preloader');
             }
         });
     }

     async function ClickAddManufacturerPrealoader() {
         $("#controlForms").prop('disabled', true);
         var div = document.getElementById('Preloader');
         div.hidden = "";
         var Title = document.getElementById('textTitle').value;
         var Country = document.getElementById('textCountry').value;
         var Address = document.getElementById('textAddress').value;
         var Info = document.getElementById('textInfo').value;
         await AddManufacturerPrealoader(Title, Address, Info, Country);
     }

    async function ClickAddManufacturer() {
         var Title = document.getElementById('textTitle').value;
         var Country = document.getElementById('textCountry').value;
         var Address = document.getElementById('textAddress').value;
         var Info = document.getElementById('textInfo').value;
         await AddManufacturer(Title, Address, Info, Country);
    }

   // $('form').submit(function () {
   //     document.location.href = "https://localhost:44346/View/ProductManufacturersApi/ViewProductManufacturers";
   // });
 </script>