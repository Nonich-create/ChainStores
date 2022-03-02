<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="AddProduct.aspx.cs" Inherits="ChainStores.View.ProductsApi.AddProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add product</title>
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

           <fieldset id="controlForms"/>  
       <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;">    
           <div id="errorSummary"   style="margin: auto; color: #FF0000; background:#FFC0CB; outline: 2px solid #FFC0CB; padding: 10px;border-radius: 10px;">
           <asp:ValidationSummary ID="validationSum" runat="server" CssClass="error"/>
            </div>
             <div> 
                      <h3 id="message"></h3>
            </div>
        <label>Article</label>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textArticle" ErrorMessage="The article must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textArticle" Text="" runat="server" CssClass="form-control"></asp:TextBox>

        <label>Name</label>
         <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="TextTitle" CssClass="error" ErrorMessage="The name must be specified" Text="*" />
        <asp:TextBox ID="TextTitle" runat="server" CssClass="form-control"></asp:TextBox>

        <label>Product unit price</label>
         <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textPrice" CssClass="error" ErrorMessage="The price must be specified" Text="*" />
        <asp:TextBox ID="textPrice" runat="server" CssClass="form-control" ></asp:TextBox>
 
         <label>Expiration date</label>
         <input type="date" id="textExpirationDate"/>  

        <label>Сertificate</label>
        <asp:TextBox ID="textСertificate" runat="server" CssClass="form-control"  TextMode="MultiLine"></asp:TextBox>
       
         <label>Date of manufacture</label>
         <input type="date" id="textDateManufacture"/>  

        <label>Product composition</label>
        <asp:TextBox ID="textProductComposition" runat="server" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox>

        <label>Description product</label>
        <asp:TextBox ID="textDescription" runat="server" CssClass="form-control" TextMode="MultiLine"  ></asp:TextBox>

        <label>Choose a category</label>
        <asp:DropDownList ID="dropDownCategories" runat="server" ItemType="System.String" CssClass="btn btn-secondary dropdown-toggle"/>

        <label>Choose a manufacturer</label>
        <asp:DropDownList ID="dropDownManufacturers" runat="server" ItemType="System.String" CssClass="btn btn-secondary dropdown-toggle"/>

        <label>Select a unit of measurement</label>
        <asp:DropDownList ID="dropDownCommoаdityUnit" runat="server" ItemType="System.String" CssClass="btn btn-secondary dropdown-toggle"/>

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
        <input onclick="ClickAddProductPrealoader()" style="width:280px" type="button" class="btn btn-primary" value="Saves with visual accompaniment"/>
        <input onclick="ClickAddProduct()" style="width:280px" type="submit" class="btn btn-primary" value="Save" />
        <asp:Button ID="ButtonBack"  CausesValidation="false"  Text="Back" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
      </div>
    </form>
       <input hidden="hidden" id="LblWebApi" value="<%= WebApi %>"/>
</body>
</html>
<script>
    var webApi = document.getElementById('LblWebApi');
    onLoad();
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

    async function getProductCategoris() {
        array = [];
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/GetProductCategoryAll',
            type: 'GET',
            success: function (data) {
                array = data;
            }
        });
        return array;
    }

    async function getManufacturers() {
        var array = [];
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/GetManufacturerAll',
            type: 'GET',
            success: function (data) {
                array = data;
            }
        });
        return array;
    }

    async function getCommoаdityUnits() {
        array = [];
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/GetCommoаdityUnitAll',
            type: 'GET',
            success: function (data) {
                array = data;
            }
        });
        return array;
    }

    async function onLoad() {
        let categorySelect = document.getElementById('dropDownCategories').options;
        let manufacturerSelect = document.getElementById('dropDownManufacturers').options;
        let commoаdityUnitSelect = document.getElementById('dropDownCommoаdityUnit').options;
         
        let productCategoris = await getProductCategoris();
        let manufacturers = await getManufacturers();
        let commoаdityUnits = await getCommoаdityUnits();

        fillingSelection(productCategoris, categorySelect);
        fillingSelection(manufacturers, manufacturerSelect);
        fillingSelection(commoаdityUnits, commoаdityUnitSelect);
    };
 

    function fillingSelection(array, optionList) {
        array.forEach(option =>
            optionList.add(
                new Option(option.Title)
            )
        );
    }

    async function AddProduct( title,  unitPrice,  productCategory,  productManufacturer
        ,  commoаdityUnit,  description,  dateManufacture,  expirationDate,
         article,  certificate,  productComposition) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/AddProduct/?title=' + title
                + '&unitPrice=' + unitPrice + '&productCategory=' + productCategory
                + '&productManufacturer=' + productManufacturer + '&commoаdityUnit=' + commoаdityUnit
                + '&description=' + description + '&dateManufacture=' + dateManufacture+ '&expirationDate=' + expirationDate
                + '&article=' + article + '&certificate=' + certificate + '&productComposition=' + productComposition,
            type: 'GET',
            success: function (data) {
            }
        });
    }

    async function AddProductPrealoader(title, unitPrice, productCategory, productManufacturer
        , commoаdityUnit, description, dateManufacture, expirationDate,
        article, certificate, productComposition) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value + '/AddProduct/?title=' + title
                + '&unitPrice=' + unitPrice + '&productCategory=' + productCategory
                + '&productManufacturer=' + productManufacturer + '&commoаdityUnit=' + commoаdityUnit
                + '&description=' + description + '&dateManufacture=' + dateManufacture + '&expirationDate=' + expirationDate
                + '&article=' + article + '&certificate=' + certificate + '&productComposition=' + productComposition,
            type: 'GET',
            success: function (data) {
                WaitLoad('Successful saving', 'message', 'Preloader');
            },
            error: function () {
                WaitLoad('An Error occured during implementations save', 'message', 'Preloader');
            }
        });
    }

    async function ClickAddProductPrealoader() {
 
        var title = document.getElementById('TextTitle').value;
        var unitPrice = document.getElementById('textPrice').value;
        var categoriesSelect = document.getElementById('dropDownCategories');
        var productCategory = categoriesSelect.options[categoriesSelect.selectedIndex].text
        var manufacturersSelect = document.getElementById('dropDownManufacturers');
        var productManufacturer = manufacturersSelect.options[manufacturersSelect.selectedIndex].text
        var commoаdityUnitsSelect = document.getElementById('dropDownCommoаdityUnit');
        var commoаdityUnit = commoаdityUnitsSelect.options[commoаdityUnitsSelect.selectedIndex].text;
        var description = document.getElementById('textDescription').value;
        var dateManufacture = document.getElementById('textDateManufacture').value;
        var expirationDate = document.getElementById('textExpirationDate').value;
        var article = document.getElementById('textArticle').value;
        var certificate = document.getElementById('textСertificate').value;
        var productComposition = document.getElementById('textProductComposition').value;

        $("#controlForms").prop('disabled', true);
        var div = document.getElementById('Preloader');
        div.hidden = ""

        await AddProductPrealoader(title, unitPrice, productCategory, productManufacturer
            , commoаdityUnit, description, dateManufacture, expirationDate,
            article, certificate, productComposition);
    }

    async function ClickAddProduct() {
        var title = document.getElementById('TextTitle').value;
        var unitPrice = document.getElementById('textPrice').value;
        var categoriesSelect = document.getElementById('dropDownCategories');
        var productCategory = categoriesSelect.options[categoriesSelect.selectedIndex].text
        var manufacturersSelect = document.getElementById('dropDownManufacturers');
        var productManufacturer = manufacturersSelect.options[manufacturersSelect.selectedIndex].text
        var commoаdityUnitsSelect = document.getElementById('dropDownCommoаdityUnit');
        var commoаdityUnit = commoаdityUnitsSelect.options[commoаdityUnitsSelect.selectedIndex].text;
        var description = document.getElementById('textDescription').value;
        var dateManufacture = document.getElementById('textDateManufacture').value;
        var expirationDate = document.getElementById('textExpirationDate').value;
        var article = document.getElementById('textArticle').value;
        var certificate = document.getElementById('textСertificate').value;
        var productComposition = document.getElementById('textProductComposition').value;
        await AddProduct( title,  unitPrice,  productCategory,  productManufacturer
            ,  commoаdityUnit,  description,  dateManufacture,  expirationDate,
             article,  certificate,  productComposition);
    }

   //$('form').submit(function () {
   //    document.location.href = "https://localhost:44346/View/ProductsApi/ViewProducts";
   //});
</script>
 
  
 
        
             
                
     
                   
              
             
                    
 
                