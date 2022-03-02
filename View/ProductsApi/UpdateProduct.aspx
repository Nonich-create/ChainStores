<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false"  CodeBehind="UpdateProduct.aspx.cs" Inherits="ChainStores.View.ProductsApi.UpdateProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Update product</title>
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

        <div>
             <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;">    
             <div id="errorSummary" style="margin: auto; color: #FF0000; background:#FFC0CB; outline: 2px solid #FFC0CB; padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary ID="validationSum" runat="server" CssClass="error"/>
            </div>

       <fieldset id="controlForms"/>  
                  <div> 
                      <h3 id="message"></h3>
            </div>
        <label>Article</label>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textArticle"  ErrorMessage="The article must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textArticle" runat="server" CssClass="form-control"></asp:TextBox>
       
        <label>Name</label>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="TextTitle"  ErrorMessage="The name must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="TextTitle" runat="server" CssClass="form-control"></asp:TextBox>
        
       
        <label>Product unit price</label>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textPrice"  ErrorMessage="The price must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textPrice" runat="server" CssClass="form-control" ></asp:TextBox>
       
         <label>Expiration date</label>
         <input type="date" style="width:280px" id="textExpirationDate" onchange="CopyDateToText(this,'textExpirationDate')"/>  

        <label>Сertificate</label>
        <asp:TextBox ID="textСertificate" runat="server" CssClass="form-control"  TextMode="MultiLine"></asp:TextBox>
        <label>Date manufacture</label>
        <input type="date" style="width:280px" id="textDateManufacture"/>  

        <label>Product composition</label>
        <asp:TextBox ID="textProductComposition" runat="server" CssClass="form-control" TextMode="MultiLine" ></asp:TextBox>
        <label>Description product</label>
        <asp:TextBox ID="textDescription" runat="server" CssClass="form-control" TextMode="MultiLine"  ></asp:TextBox>
        
        <label>Choose a category</label>
        <asp:DropDownList ID="dropDownCategories" style="width:280px" runat="server" ItemType="System.String" CssClass="btn btn-secondary dropdown-toggle"/>

        <label>Choose a manufacturer</label>
        <asp:DropDownList ID="dropDownManufacturers" style="width:280px" runat="server" ItemType="System.String" CssClass="btn btn-secondary dropdown-toggle"/>

        <label>Select a unit of measurement</label>
        <asp:DropDownList ID="dropDownCommoаdityUnit" style="width:280px" runat="server" ItemType="System.String" CssClass="btn btn-secondary dropdown-toggle"/>

         
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
         <input onclick="ClickUpdateProductPrealoader()" style="width:280px" type="button" class="btn btn-primary" value="Saves with visual accompaniment"/>
        <input onclick="ClickUpdateProduct()" style="width:280px" type="submit" class="btn btn-primary" value="Save" />
        <asp:Button ID="ButtonBack"  CausesValidation="false" style="width:280px" Text="Back" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
       </div>
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

 
 
 

    async function getProduct(Id) {
        var product = {};
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/Api/Product/' + Id,
            type: 'GET',
            success: function (data) {
                product = data;
            }
        });
        return product;
    };

    function fillingSelection(array, optionList) {
        array.forEach(option =>
            optionList.add(
                new Option(text = option.Title, value = option.Id)
            )
        );
    }

    async function OnLoadData() {
        let categorySelect = document.getElementById('dropDownCategories').options;
        let manufacturerSelect = document.getElementById('dropDownManufacturers').options;
        let commoаdityUnitSelect = document.getElementById('dropDownCommoаdityUnit').options;

        let productCategoris = await getProductCategoris();
        let manufacturers = await getManufacturers();
        let commoаdityUnits = await getCommoаdityUnits();

        fillingSelection(productCategoris, categorySelect);
        fillingSelection(manufacturers, manufacturerSelect);
        fillingSelection(commoаdityUnits, commoаdityUnitSelect);


        var Id = '<%=Request.QueryString["Id"]%>';
        let Product = await getProduct(Id);

        document.getElementById('TextTitle').value = CheckValue(Product.Title);
        document.getElementById('textArticle').value = CheckValue(Product.Article);
        document.getElementById('textСertificate').value = CheckValue(Product.Certificate);
        document.getElementById('textProductComposition').value = CheckValue(Product.ProductComposition);
        document.getElementById('textDateManufacture').value = CheckValue(Product.DateManufacture.substring(0, 10));
        document.getElementById('textExpirationDate').value = CheckValue(Product.ExpirationDate.substring(0, 10));
        document.getElementById('textPrice').value = CheckValue(Product.UnitPrice);
        document.getElementById('textDescription').value = CheckValue(Product.Description);
        document.getElementById('dropDownCategories').value = CheckValue(Product.ProductCategoryId);
        document.getElementById('dropDownManufacturers').value = CheckValue(Product.ProductManufacturerId);
        document.getElementById('dropDownCommoаdityUnit').value = CheckValue(Product.CommoаdityUnitId);
    };
    OnLoadData();

    function CheckValue(value) {
        if (value == null) {
            return ' '
        } else {
            return value;
        }
    }

    async function UpdateProduct(title, unitPrice, productCategory, productManufacturer
        , commoаdityUnit, description, dateManufacture, expirationDate,
        article, certificate, productComposition, id) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/UpdateProduct/?title=' + title
                + '&unitPrice=' + unitPrice + '&productCategory=' + productCategory
                + '&productManufacturer=' + productManufacturer + '&commoаdityUnit=' + commoаdityUnit
                + '&description=' + description + '&dateManufacture=' + dateManufacture + '&expirationDate=' + expirationDate
                + '&article=' + article + '&certificate=' + certificate + '&productComposition=' + productComposition + "&id=" + id,
            type: 'GET',
            success: function (data) {
            }
        });
    };

    async function UpdateProductPrealoader(title, unitPrice, productCategory, productManufacturer
        , commoаdityUnit, description, dateManufacture, expirationDate,
        article, certificate, productComposition, id) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value + '/UpdateProduct/?title=' + title
                + '&unitPrice=' + unitPrice + '&productCategory=' + productCategory
                + '&productManufacturer=' + productManufacturer + '&commoаdityUnit=' + commoаdityUnit
                + '&description=' + description + '&dateManufacture=' + dateManufacture + '&expirationDate=' + expirationDate
                + '&article=' + article + '&certificate=' + certificate + '&productComposition=' + productComposition + "&id=" + id,
            type: 'GET',
            success: function (data) {
                WaitLoad('Successful saving', 'message', 'Preloader');
            },
            error: function () {
                WaitLoad('An Error occured during implementations save', 'message', 'Preloader');
            }
        });
    };

    async function ClickUpdateProduct() {
        var Id = '<%=Request.QueryString["Id"]%>';
        var title = document.getElementById('TextTitle').value;
        var unitPrice = document.getElementById('textPrice').value;
        var productCategory = document.getElementById('dropDownCategories').value;
        var productManufacturer = document.getElementById('dropDownManufacturers').value;
        var commoаdityUnit = document.getElementById('dropDownCommoаdityUnit').value;
        var description = document.getElementById('textDescription').value;
        var dateManufacture = document.getElementById('textDateManufacture').value;
        var expirationDate = document.getElementById('textExpirationDate').value;
        var article = document.getElementById('textArticle').value;
        var certificate = document.getElementById('textСertificate').value;
        var productComposition = document.getElementById('textProductComposition').value;

        await UpdateProduct(title, unitPrice, productCategory, productManufacturer
            , commoаdityUnit, description, dateManufacture, expirationDate,
            article, certificate, productComposition,Id);

    }

    async function ClickUpdateProductPrealoader() {
        $("#controlForms").prop('disabled', true);
        var div = document.getElementById('Preloader');
        div.hidden = "";
        var Id = '<%=Request.QueryString["Id"]%>';
         var title = document.getElementById('TextTitle').value;
         var unitPrice = document.getElementById('textPrice').value;
         var productCategory = document.getElementById('dropDownCategories').value;
         var productManufacturer = document.getElementById('dropDownManufacturers').value;
         var commoаdityUnit = document.getElementById('dropDownCommoаdityUnit').value;
         var description = document.getElementById('textDescription').value;
         var dateManufacture = document.getElementById('textDateManufacture').value;
         var expirationDate = document.getElementById('textExpirationDate').value;
         var article = document.getElementById('textArticle').value;
         var certificate = document.getElementById('textСertificate').value;
         var productComposition = document.getElementById('textProductComposition').value;

        await UpdateProductPrealoader(title, unitPrice, productCategory, productManufacturer
             , commoаdityUnit, description, dateManufacture, expirationDate,
             article, certificate, productComposition, Id);

     }
    //$('form').submit(function () {
    //    document.location.href = "https://localhost:44346/View/ProductsApi/ViewProducts";
    //});
</script>
