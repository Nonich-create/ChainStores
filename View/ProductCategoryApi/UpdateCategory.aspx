<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCategory.aspx.cs" Inherits="ChainStores.View.ProductCategoryApi.UpdateCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <webopt:bundlereference runat="server" path="~/Content/css" />
     <webopt:BundleReference runat="server" Path="~/Content/PreLoader.css"></webopt:BundleReference>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Update category product</title>
</head>
<body>
    <form id="form1" runat="server">
               <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference   Path="~/Scripts/ViewScripts/Twister.js" />
            </Scripts>
        </asp:ScriptManager>

        <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;">
                <div id="errorSummary" style="margin: auto; color: #FF0000; background:#FFC0CB; outline: 2px solid #FFC0CB; padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary ID="validationSum" runat="server" CssClass="error"/>
            </div>


                   <fieldset id="controlForms"/>  
                  <div> 
                      <h3 id="message"></h3>
            </div>
        <label>Code</label> 
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textCode"  ErrorMessage="The code must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textCode" runat="server" CssClass="form-control"></asp:TextBox> 
        <label>Name</label>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="TextTitle"  ErrorMessage="The name must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textTitle" runat="server"  CssClass="form-control"></asp:TextBox> 
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
         <input onclick="ClickUpdateProductCategoryPrealoader()" style="width:280px" type="button" class="btn btn-primary" value="Saves with visual accompaniment"/>
        <input onclick="ClickUpdateProductCategory()" style="width:280px" type="submit" class="btn btn-primary" value="Save"/>
        <asp:Button ID="ButtonBack" Text="Back"  style="width:280px"  CausesValidation="false" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
      </div>    
            <input hidden="hidden" id="LblWebApi" value="<%= WebApi %>"/>
    </form>
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

    async function getProductCategory(Id) {
        var productCategory = {};
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/Api/ProductCategory/' + Id,
            type: 'GET',
            success: function (data) {
                productCategory = data;
            }
        });
        return productCategory;
    }

    async function updateProductCategory(title, code, info, Id) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/UpdateProductCategory/?title=' + title
                + '&code=' + code + '&info=' + info + "&Id=" + Id,
            type: 'GET',
            success: function (data) {
            }
        });
    }

     async function updateProductCategoryPrealoader (title, code, info, Id) {
         await $.ajax({
             headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
             url: webApi.value + '/UpdateProductCategory/?title=' + title
                 + '&code=' + code + '&info=' + info + "&Id=" + Id,
             type: 'GET',
             success: function (data) {
                 WaitLoad('Successful saving', 'message', 'Preloader');
             },
             error: function () {
                 WaitLoad('An Error occured during implementations save', 'message', 'Preloader');
             }
         });
     }

    async function OnLoadData() {
        var Id = '<%=Request.QueryString["Id"]%>';
        let productCategory = await getProductCategory(Id);

        document.getElementById('textTitle').value = productCategory.Title;
        document.getElementById('textCode').value = productCategory.Code;
        document.getElementById('textInfo').value = productCategory.Info;
    }

    async function ClickUpdateProductCategory() {
        var Id = '<%=Request.QueryString["Id"]%>';
        var Title = document.getElementById('textTitle').value;
        var Code = document.getElementById('textCode').value;
        var Info = document.getElementById('textInfo').value;
        await updateProductCategory(Title, Code, Info, Id);
     }

     async function ClickUpdateProductCategoryPrealoader() {
         $("#controlForms").prop('disabled', true);
         var div = document.getElementById('Preloader');
         div.hidden = "";
         var Id = '<%=Request.QueryString["Id"]%>';
          var Title = document.getElementById('textTitle').value;
          var Code = document.getElementById('textCode').value;
          var Info = document.getElementById('textInfo').value;
         await updateProductCategoryPrealoader(Title, Code, Info, Id);
      }

    OnLoadData();

    $('form').submit(function () {
        document.location.href = "https://localhost:44346/View/ProductCategoryApi/ViewProductCategory";
    });
 </script>