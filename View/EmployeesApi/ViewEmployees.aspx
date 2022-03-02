<%@ Page Title="Employees" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewEmployees.aspx.cs" Inherits="ChainStores.View.EmployeesApi.ViewEmployees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
           <br />       <br />
    <input type="text"   id="textSearch" class="form-control"/>
    <button onclick="FillingTableSearchResult()" style="margin-top:4px" type="button" class="btn btn-primary">Filter</button>
    <a id="OpenAddEmployee"  style="margin-top: 4px" class="btn btn-primary">Add</a>
       
        <div>
               <table class="table" border="1" style="border-collapse:collapse;">
                   <thead>
                       <tr>
                           <th title="Full name">Full name</th>
                           <th title="Phone number">Phone number</th>   
                           <th title="Shop name">Shop name</th>
                           <th title="Position">Position</th>
                           <th title="Age">Age</th>
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
     document.getElementById('OpenAddEmployee').href = location.protocol + '//' + location.host + '/View/EmployeesApi/AddEmployees';
   
     var webApi = document.getElementById('LblWebApi');
        async function getEmployees() {
            var array = [];
            await $.ajax({
                headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                url: webApi.value +'/GetEmployeeAll',
                type: 'GET',
                success: function (data) {
                    array = data;

                }
            });
            return array;
        }
 
        async function searchEmployees(stringSearch) {
            var array = [];
            await $.ajax({
                headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                url: webApi.value +'/Api/Employee?stringSearch=' + stringSearch,
                type: 'GET',
                success: function (data) {
                    array = data;
                }
            });
            return array;
        };

        async function deleteEmployee(Id) {
            await $.ajax({
                headers: { 'Access-Control-Allow-Origin': 'http://localhost'},
                url: webApi.value +'/DeleteEmployee?Id=' + Id,
                type: 'GET',
                success: function (data) {
                }
            });
        }

        async function FillingTableSearchResult() {
            var searchString = document.getElementById('textSearch').value;
            if (searchString != "") {
                let Employees = await searchEmployees(searchString);
                updateTable(Employees);
            } else {
                await LoadingInitial();
            }

        };

        async function LoadingInitial() {
            let Employees = await getEmployees();
            updateTable(Employees);
        };
        LoadingInitial();

        function updateTable(array) {
            var tbody = document.querySelector('tbody');
            tbody.innerHTML = ''

            for (let i = 0; i < array.length; i++) {
                let Id = array[i].Id;
                let tr = document.createElement('tr');
                tr.innerHTML =
                    '<td>' + '<span title="' + CheckElem(array[i].LastName) + ' '+
                    CheckElem(array[i].FirstName) +' '+
                    CheckElem(array[i].MiddleName)+'">' +
                    CheckElem(array[i].LastName) + ' ' +
                    CheckElem(array[i].FirstName) + ' ' +
                    CheckElem(array[i].MiddleName) + '</span>' + '</td>' +
                    CreateTd(array[i].PhoneNumber) +
                    CreateTd(array[i].Shop.Title) +
                    CreateTd(array[i].Position.Title) +
                    CreateTd(array[i].Age) +
                    '<td>' + '<span>' +
                '<button onClick="ClickDeleteEmployee(this)" value="' + Id + '" type="submit" class="btn btn-primary">Delete</button>' +
                    ' <a href='+location.protocol+'//'+location.host+'/View/EmployeesApi/UpdateEmployees.aspx?Id=' + Id + '" class="btn btn-primary">Update</a>' +
                    '</span>' + '</td>'
                tbody.appendChild(tr);
            }
        };

        async function ClickDeleteEmployee(button) {
            await deleteEmployee(button.value);
        };

        function CreateTd(elem) {
            if (elem == null) {
                return '<td>' + '<span>' + " " + '</span>' + '</td>'
            }
            else {
                return '<td>' + '<span  title="' + elem +'">' + elem + '</span>' + '</td>'
            }
        };
        function CheckElem(elem) {
            if (elem == null) {
                return " "
            }
            else {
                return elem
            }
        };
 </script>
</asp:Content>
 