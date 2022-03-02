<%@ Page Title="Products" ValidateRequest="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="ChainStores.View.ProductsApi.ViewProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<section>
    <br />       <br />
       <input type="text"   id="textSearch" class="form-control"/>
    <button onclick="FillingTableSearchResult()" style="margin-top:4px" type="button" class="btn btn-primary">Filter</button>
    <a id="OpenAddProduct" style="margin-top: 4px" class="btn btn-primary">Add</a>
        <div>
               <table class="table" border="1" style="border-collapse:collapse;">
                   <thead>
                       <tr>
                           <th title="Article">Article</th>
                           <th title="Name">Name</th>   
                           <th title="Price">Price</th>
                           <th title="Expiration date">Expiration date</th>
                           <th title="Product category">Product category</th>
                           <th title=" Product manufacturer">Product manufacturer</th>
                           <th title="Control">Control</th>
                       </tr>
                   </thead>
                  <tbody>
                  </tbody>
               </table>
        </div>
     <input hidden="hidden" id="LblWebApi" value="<%= WebApi %>"/>
    </section>
 
 <script>
     var webApi = document.getElementById('LblWebApi');
     document.getElementById('OpenAddProduct').href = location.protocol + '//' + location.host + '/View/ProductsApi/AddProduct';
        async function getProducts() {
            var array = [];
            await $.ajax({
                headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                url: webApi.value +'/GetProductAll',
                type: 'GET',
                success: function (data) {
                    array = data;
                }
            });
            return array;
        }

        async function searchProducts(stringSearch) {
            var array = [];
            await $.ajax({
                headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                url: webApi.value +'/Api/Product?stringSearch=' + stringSearch,
                type: 'GET',
                success: function (data) {
                    array = data;
                }
            });
            return array;
        };

        async function deleteProduct(Id) {
            await $.ajax({
                headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                url: webApi.value +'/DeleteProduct?Id=' + Id,
                type: 'GET',
                success: function (data) {

                }
            });
        }

        async function FillingTableSearchResult() {
            var searchString = document.getElementById('textSearch').value;
            if (searchString != "") {
                let Products = await searchProducts(searchString);
                updateTable(Products);
            } else {
                await LoadingInitial();
            }

        };

        async function LoadingInitial() {
            let Products = await getProducts();
            updateTable(Products);
        };
        LoadingInitial();

        function updateTable(array) {
            var tbody = document.querySelector('tbody');
            tbody.innerHTML = ''
            for (let i = 0; i < array.length; i++) {
                let Id = array[i].Id;
                let tr = document.createElement('tr');
                tr.innerHTML =
                CreateTd(array[i].Article) +
                CreateTd(array[i].Title) +
                CreateTd(array[i].UnitPrice) +
                CreateTd(array[i].ExpirationDate.substring(0, 10).split("-").reverse().join("-")) +
                CreateTd(array[i].ProductCategory.Title) +
                CreateTd(array[i].ProductManufacturer.Title) +
                    '<td>' + '<span>' +
                    '<button onClick="ClickDeleteProduct(this)" value="' + Id + '" type="submit" class="btn btn-primary">Delete</button>' +
                ' <a href="' + location.protocol + '//' + location.host +'/View/ProductsApi/UpdateProduct.aspx?Id=' + Id + '" class="btn btn-primary">Update</a>' +
                    '</span>' + '</td>'
                tbody.appendChild(tr);
            }
        };

        async function ClickDeleteProduct(button) {
            await deleteProduct(button.value);
        };

        function CreateTd(elem) {
            if (elem == null) {
                return '<td>' + '<span>' + " " + '</span>' + '</td>'
            }
            else {
                return '<td>' + '<span title="' + elem +'">' + elem + '</span>' + '</td>'
            }
        };
 </script>
</asp:Content>
