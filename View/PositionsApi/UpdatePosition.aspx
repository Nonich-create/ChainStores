<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePosition.aspx.cs" Inherits="ChainStores.View.PositionsApi.UpdatePosition" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Update position</title>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <webopt:BundleReference runat="server" Path="~/Content/PreLoader.css"></webopt:BundleReference>
</head>
<body>
    <form id="form1" runat="server">
       <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference Path="~/Scripts/ViewScripts/Twister.js" />
                <asp:ScriptReference Path="~/Scripts/ViewScripts/ScriptApiPosition.js" />
            </Scripts>
        </asp:ScriptManager>
        <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;">
           <div id="errorSummary" style="margin: auto; color: #FF0000; background:#FFC0CB; outline: 2px solid #FFC0CB; padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary ID="validationSum" ShowSummary="true" runat="server" CssClass="error"/>
            </div>   

             <fieldset id="controlForms"/>  
                  <div> 
                      <h3 id="message"></h3>
            </div>
        <label>Code position</label>
        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textCodePosition"  ErrorMessage="The code must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textCodePosition" runat="server" CssClass="form-control" MaxLength="7"></asp:TextBox> 

        <label>Position</label>
        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textPosition"  ErrorMessage="The position must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textPosition" runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Salary</label>
        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textSalary"  ErrorMessage="The salary must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textSalary" runat="server" CssClass="form-control"></asp:TextBox> 
       
        <label>Job descriptions</label> 
        <asp:TextBox ID="textJobDescriptions" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox> 

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
        <input onclick="ClickUpdatePositionPrealoader()" style="width:280px" type="button" class="btn btn-primary" value="Saves with visual accompaniment"/>
        <input onclick="ClickUpdatePosition()" style="width:280px" type="submit" class="btn btn-primary" value="Save" />
        <asp:Button ID="ButtonBack" Text="Back" style="width:280px" CausesValidation="false" runat="server" CssClass="btn btn-primary" OnClick="ButtonBack_Click"/>
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

    async function getPosition(Id) {
        var position = {};
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/Api/Position/' + Id,
            type: 'GET',
            success: function (data) {
                position = data;
            }
        });
        return position;
    }

     async function UpdatePositionPrealoader (title, jobDescriptions, info, code, salary, Id) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/UpdatePosition/?title=' + title
                + '&jobDescriptions=' + jobDescriptions + '&info=' + info
                + '&code=' + code + '&salary=' + salary + "&Id=" + Id,
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
        let position = await getPosition(Id);

        document.getElementById('textCodePosition').value = position.CodePosition;
        document.getElementById('textPosition').value = position.Title;
        document.getElementById('textSalary').value = position.Salary;
        document.getElementById('textJobDescriptions').value = position.JobDescriptions;
        document.getElementById('textInfo').value = position.Info;
    }

     async function ClickUpdatePosition() {
 
        var Id = '<%=Request.QueryString["Id"]%>';
        var CodePosition = document.getElementById('textCodePosition').value;
        var Title = document.getElementById('textPosition').value;
        var Salary = document.getElementById('textSalary').value;
        var JobDescriptions = document.getElementById('textJobDescriptions').value;
        var Info = document.getElementById('textInfo').value;
       
        await UpdatePosition(Title, JobDescriptions, Info, CodePosition, Salary, Id);
     }

     async function ClickUpdatePositionPrealoader() {
         $("#controlForms").prop('disabled', true);
         var div = document.getElementById('Preloader');
         div.hidden = "";
         var Id = '<%=Request.QueryString["Id"]%>';
             var CodePosition = document.getElementById('textCodePosition').value;
             var Title = document.getElementById('textPosition').value;
             var Salary = document.getElementById('textSalary').value;
             var JobDescriptions = document.getElementById('textJobDescriptions').value;
             var Info = document.getElementById('textInfo').value;
         await UpdatePositionPrealoader(Title, JobDescriptions, Info, CodePosition, Salary, Id);

     }

    OnLoadData();
 </script>