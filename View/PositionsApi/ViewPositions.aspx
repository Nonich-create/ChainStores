<%@ Page Title="Positions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewPositions.aspx.cs" Inherits="ChainStores.View.PositionsApi.ViewPositions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div> 
            <br />       <br />       
            <input type="text"   id="textSearch" class="form-control"/>
            <button onclick="FillingTableSearchResult()" style="margin-top:4px" type="button" class="btn btn-primary">Filter</button>
            <a href="https://localhost:44346/View/PositionsApi/AddPosition" style="margin-top: 4px" class="btn btn-primary">Add</a>
               <table class="table" border="1" style="border-collapse:collapse;">
                   <thead>
                       <tr>
                           <th title="Code position">Code position</th>
                           <th title="Position">Position</th>   
                           <th title="Salary">Salary</th>
                           <th title="Job descriptions">Job descriptions</th>
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
     async function getPositions() {
         var array = [];
       await  $.ajax({
             headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
           url: 'https://localhost:44375/GetPositionAll',
           type: 'GET',
           success: function (data) {
               array = data;
             }
         });
         return array;
     }

     async function searchPositions(stringSearch) {
         var array = [];
         await $.ajax({
             headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
             url: 'https://localhost:44375/Api/Position?stringSearch=' + stringSearch,
             type: 'GET',
             success: function (data) {
                 array = data;
             }
         });
         return array;
     }

     async function deletePosition(Id) {
         await $.ajax({
             headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
             url: 'https://localhost:44375/DeletePosition?Id=' + Id,
             type: 'DELETE',
             success: function (data) {
                  
             }
         });
     }

    async function FillingTableSearchResult() {
        var searchString = document.getElementById('textSearch').value;
        if (searchString != "") {
            let Positions = await searchPositions(searchString);
            updateTable(Positions);
        } else {
            await LoadingInitial();
        }  
    }

     async function ClickDeletePosition(button) {
         await deletePosition(button.value);
     }

     async function LoadingInitial() {
         let Positions = await getPositions();
         updateTable(Positions);
     }
     LoadingInitial();

     function updateTable(array) {
         var tbody = document.querySelector('tbody');
         tbody.innerHTML = ''
 
         for (let i = 0; i < array.length; i++) {
             let Id = array[i].Id;
         let tr = document.createElement('tr');
         tr.innerHTML =
             CreateTd(array[i].CodePosition) +
             CreateTd(array[i].Title) +
             CreateTd(array[i].Salary) +
             CreateTd(array[i].JobDescriptions) +
             CreateTd(array[i].Info) +   
         '<td>' + '<span>' +
         '<button onClick="ClickDeletePosition(this)" value="' + Id +'" type="submit" class="btn btn-primary">Delete</button>' +
         ' <a href="https://localhost:44346/View/PositionsApi/UpdatePosition.aspx?Id=' + Id +'" class="btn btn-primary">Update</a>' +
         '</span>' + '</td>'
         tbody.appendChild(tr);
         }
     }

     function CreateTd(elem) {
         if (elem == null) {
             return '<td>' + '<span>' + " " + '</span>' + '</td>'
         }
         else
         {
             return '<td>' + '<span title="' + elem +'">' + elem + '</span>' + '</td>'
         }
     }
 </script>
</asp:Content> 
 