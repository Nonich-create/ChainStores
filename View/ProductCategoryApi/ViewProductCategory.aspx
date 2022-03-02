<%@ Page Title="Product categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProductCategory.aspx.cs" Inherits="ChainStores.View.ProductCategoryApi.ViewProductCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
           <br />       <br />
       <div>
            <input type="text"   id="textSearch" class="form-control"/>
            <button onclick="FillingTableSearchResult()" style="margin-top:4px" type="button" class="btn btn-primary">Filter</button>
            <a id="OpenAddProductCategory"  style="margin-top: 4px" class="btn btn-primary">Add</a>
               <table class="table" border="1" style="border-collapse:collapse;">
                   <thead>
                       <tr>
                           <th title="Code">Code</th>
                           <th title="Name">Name</th>   
                           <th title="Additional information">Additional information</th>
                           <th title="Control">Control</th>
                       </tr>
                   </thead>
                  <tbody>
                  </tbody>
               </table>
            </div>
          </section>
    <input hidden="hidden" id="LblWebApi" value="<%= WebApi %>"/>
 <script>
     document.getElementById('OpenAddProductCategory').href = location.protocol + '//' + location.host + '/View/ProductCategoryApi/AddProductCategory';
     var webApi = document.getElementById('LblWebApi');
        async function GetProductCategories() {
            var array = [];
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

        async function searchProductCategories(stringSearch) {
            var array = [];
            await $.ajax({
                headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                url: webApi.value +'/Api/ProductCategory?stringSearch=' + stringSearch,
                type: 'GET',
                success: function (data) {
                    array = data;
                }
            });
            return array;
        }

        async function deleteProductCategory(Id) {
            await $.ajax({
                headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                url: webApi.value +'/DeleteProductCategory?Id=' + Id,
                type: 'GET',
                success: function (data) {

                }
            });
        }
 
        async function FillingTableSearchResult() {
            var searchString = document.getElementById('textSearch').value;
            if (searchString != "") {
                let ProductCategories = await searchProductCategories(searchString);
                updateTable(ProductCategories);
            } else {
                await LoadingInitial();
            }
        }

        async function ClickDeleteProductCategory(button) {
            await deleteProductCategory(button.value);
        }

        async function LoadingInitial() {
            let ProductCategories = await GetProductCategories();
            updateTable(ProductCategories);
        }
        LoadingInitial();

        function updateTable(array) {
            var tbody = document.querySelector('tbody');
            tbody.innerHTML = ''

            for (let i = 0; i < array.length; i++) {
                let Id = array[i].Id;
                let tr = document.createElement('tr');
                tr.innerHTML =
                    CreateTd(array[i].Code) +
                    CreateTd(array[i].Title) +
                    CreateTd(array[i].Info) +
                    '<td>' + '<span>' +
                    '<button onClick="ClickDeleteProductCategory(this)" value="' + Id + '" type="submit" class="btn btn-primary">Delete</button>' +
                ' <a href="' + location.protocol + '//' + location.host +'/View/ProductCategoryApi/UpdateCategory.aspx?Id=' + Id + '" class="btn btn-primary">Update</a>' +
                    '</span>' + '</td>'
                tbody.appendChild(tr);
            }
        }

        function CreateTd(elem) {
            if (elem == null) {
                return '<td>' + '<span>' + " " + '</span>' + '</td>'
            }
            else {
                return '<td>' + '<span title="' + elem +'">' + elem + '</span>' + '</td>'
            }
        }
 </script>
</asp:Content>
 