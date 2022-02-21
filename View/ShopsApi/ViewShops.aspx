<%@ Page Title="Shops" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewShops.aspx.cs" Inherits="ChainStores.View.ShopsApi.ViewShops" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<section>
       <br />       <br />
        <input type="text"   id="textSearch" class="form-control"/>
    <button onclick="FillingTableSearchResult()" style="margin-top:4px" type="button" class="btn btn-primary">Filter</button>
    <a href="https://localhost:44346/View/ShopsApi/AddShop" style="margin-top: 4px" class="btn btn-primary">Add</a>
        <div>
               <table class="table" border="1" style="border-collapse:collapse;">
                   <thead>
                       <tr>
                           <th title="Name">Name</th>
                           <th title="Email">Adress</th>
                           <th title="Phone number">Phone number</th>   
                           <th title="Country">Category</th>
                           <th title="Category">MCC</th>
                           <th title="Contact person">WebSite</th>
                           <th title="Control">Control</th>
                       </tr>
                   </thead>
                  <tbody>
                  </tbody>
               </table>
        </div>
    </section>
    <script>
        async function getShop() {
            var array = [];
            await $.ajax({
                headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                url: 'https://localhost:44375/GetShopAll',
                type: 'GET',
                success: function (data) {
                    array = data;

                }
            });

            return array;
        }

        async function searchShops(stringSearch) {
            var array = [];
            await $.ajax({
                headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                url: 'https://localhost:44375/Api/Shop?stringSearch=' + stringSearch,
                type: 'GET',
                success: function (data) {
                    array = data;
                }
            });
            return array;
        };

        async function deleteShop(Id) {
            await $.ajax({
                headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                url: 'https://localhost:44375/DeleteShop?Id=' + Id,
                type: 'DELETE',
                success: function (data) {

                }
            });
        }

        async function FillingTableSearchResult() {
            var searchString = document.getElementById('textSearch').value;
            if (searchString != "") {
                let Suppliers = await searchShops(searchString);
                updateTable(Suppliers);
            } else {
                await LoadingInitial();
            }

        };

        async function LoadingInitial() {
            let Shops = await getShop();

            updateTable(Shops);
        };
        LoadingInitial();

        function updateTable(array) {
            var tbody = document.querySelector('tbody');
            tbody.innerHTML = ''

            for (let i = 0; i < array.length; i++) {
                let Id = array[i].Id;
                let tr = document.createElement('tr');
                tr.innerHTML =
                    CreateTd(array[i].Title) +
                    CreateTd(array[i].Adress) +
                    CreateTd(array[i].PhoneNumber) +
                    CreateTd(array[i].Category) +
                    CreateTd(array[i].MCC) +
                    CreateTd(array[i].WebSite) +
                    '<td>' + '<span>' +
                    '<button onClick="ClickDeleteShop(this)" value="' + Id + '" type="submit" class="btn btn-primary">Delete</button>' +
                    ' <a href="https://localhost:44346/View/ShopsApi/UpdateShop.aspx?Id=' + Id + '" class="btn btn-primary">Update</a>' +
                    '</span>' + '</td>'
                tbody.appendChild(tr);
            }
        };

        async function ClickDeleteShop(button) {
            await deleteShop(button.value);
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

 