<%@ Page Title="Suppliers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSuppliers.aspx.cs" Inherits="ChainStores.View.SuppliersApi.ViewSuppliers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<section>
       <br />       <br />
    <input type="text"   id="textSearch" class="form-control"/>
    <button onclick="FillingTableSearchResult()" style="margin-top:4px" type="button" class="btn btn-primary">Filter</button>
    <a id="OpenAddSupplier" style="margin-top: 4px" class="btn btn-primary">Add</a>
        <div>
               <table class="table" border="1" style="border-collapse:collapse;">
                   <thead>
                       <tr>
                           <th title="Name">Name</th>
                           <th title="Phone number">Phone number</th>   
                           <th title="Email">Email</th>
                           <th title="Country">Country</th>
                           <th title="Category">Category</th>
                           <th title="Contact person">Contact person</th>
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
     document.getElementById('OpenAddSupplier').href = location.protocol + '//' + location.host + '/View/SuppliersApi/AddSupplier';
     var webApi = document.getElementById('LblWebApi');
               async function getSuppliers() {
                   var array = [];
                   await $.ajax({
                       headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                       url: webApi.value +'/GetAllSupplier',
                       type: 'GET',
                       success: function (data) {
                           array = data;
                          
                       }
                   });
               
                   return array;
               }

               async function searchSuppliers(stringSearch) {
                  var array = [];
                  await $.ajax({
                      headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                      url: webApi.value +'/Api/Supplier?stringSearch=' + stringSearch,
                      type: 'GET',
                      success: function (data) {
                          array = data;
                      }
                  });
                  return array;
              };

               async function deleteSupplier(Id) {
                   await $.ajax({
                       headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
                       url: webApi.value +'/DeleteSupplier?Id=' + Id,
                       type: 'GET',
                       success: function (data) {
             
                       }
                   });
               }

               async function FillingTableSearchResult() {
                   var searchString = document.getElementById('textSearch').value;
                   if (searchString != "") {
                       let Suppliers = await searchSuppliers(searchString);
                       updateTable(Suppliers);
                   } else {
                       await LoadingInitial();
                   }
                   
              };

               async function LoadingInitial() {
                   let Suppliers = await getSuppliers();
                  
                   updateTable(Suppliers);
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
                           CreateTd(array[i].PhoneNumber) +
                           CreateTd(array[i].Email) +
                           CreateTd(array[i].Country) +
                           CreateTd(array[i].Category) +
                           CreateTd(array[i].ContactPerson) +
                           '<td>' + '<span>' +
                           '<button onClick="ClickDeleteSupplier(this)" value="' + Id + '" type="submit" class="btn btn-primary">Delete</button>' +
                       ' <a href="' + location.protocol +'/View/SuppliersApi/UpdateSupplier.aspx?Id=' + Id + '" class="btn btn-primary">Update</a>' +
                           '</span>' + '</td>'
                       tbody.appendChild(tr);
                   }
               };
      
               async function ClickDeleteSupplier(button) {
                      await deleteSupplier(button.value);
               };
              
               function CreateTd(elem) {
                   if (elem == null) {
                       return '<td>' + '<span>' + " " + '</span>' + '</td>'
                   }
                   else {
                       return '<td>' + '<span title="'+ elem+'">' + elem + '</span>' + '</td>'
                   }
               };
 </script>
</asp:Content>
 

 