<%@ Page Title="Product Manufacturers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProductManufacturers.aspx.cs" Inherits="ChainStores.View.ProductManufacturersApi.ViewProductManufacturers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<section>
       <br />       <br />
        <div>
            <input type="text"   id="textSearch" class="form-control"/>
            <button onclick="FillingTableSearchResult()" style="margin-top:4px" type="button" class="btn btn-primary">Filter</button>
            <a href="https://localhost:44346/View/ProductManufacturersApi/AddProductManufacturer" style="margin-top: 4px" class="btn btn-primary">Add</a>
               <table class="table" border="1" style="border-collapse:collapse;">
                   <thead>
                       <tr>
                           <th title="Name">Name</th>
                           <th title="Country">Country</th>   
                           <th title="Address">Address</th>
                           <th title="Additional information">Additional information</th>
                           <th title="Control">Control</th>
                       </tr>
                   </thead>
                  <tbody>
                  </tbody>
               </table>
            </div>
    </section>
    <script>
        async function getManufacturers() {
            var array = [];
            await $.ajax({
                headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                url: 'https://localhost:44375/GetManufacturerAll',
                type: 'GET',
                success: function (data) {
                    array = data;
                }
            });
            return array;
        }

        async function searchManufacturers(stringSearch) {
            var array = [];
            await $.ajax({
                headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                url: 'https://localhost:44375/Api/Manufacturer?stringSearch=' + stringSearch,
                type: 'GET',
                success: function (data) {
                    array = data;
                }
            });
            return array;
        }

        async function deleteManufacturer(Id) {
            await $.ajax({
                headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                url: 'https://localhost:44375/DeleteManufacturer?Id=' + Id,
                type: 'DELETE',
                success: function (data) {

                }
            });
        }

        async function FillingTableSearchResult() {
            var searchString = document.getElementById('textSearch').value;
            if (searchString != "") {
                let Manufacturer = await searchManufacturers(searchString);
                updateTable(Manufacturer);
            } else {
                await LoadingInitial();
            }
        }

        async function ClickDeleteManufacturer(button) {
            await deleteManufacturer(button.value);
        }

        async function LoadingInitial() {
            let Manufacturers = await getManufacturers();
            updateTable(Manufacturers);
        }
        LoadingInitial();

        function updateTable(array) {
            var tbody = document.querySelector('tbody');
            tbody.innerHTML = ''

            for (let i = 0; i < array.length; i++) {
                let Id = array[i].Id;
                let tr = document.createElement('tr');
                tr.innerHTML =
                    CreateTd(array[i].Title) +
                    CreateTd(array[i].Country) +
                    CreateTd(array[i].Address) +
                    CreateTd(array[i].Info) +
                    '<td>' + '<span>' +
                    '<button onClick="ClickDeleteManufacturer(this)" value="' + Id + '" type="submit" class="btn btn-primary">Delete</button>' +
                    ' <a href="https://localhost:44346/View/ProductManufacturersApi/UpdateManufacturer.aspx?Id=' + Id + '" class="btn btn-primary">Update</a>' +
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