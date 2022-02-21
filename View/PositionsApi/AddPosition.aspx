<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPosition.aspx.cs" Inherits="ChainStores.View.PositionsApi.AddPosition" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add position</title>
    <webopt:bundlereference runat="server" path="~/Content/css" />
</head>
<body>
    <form id="form1" runat="server">    
        <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;">
           <div style="margin: auto; color: #FF0000; height: 75px; background:#FFC0CB; outline: 2px solid #000;padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary ShowSummary="true" runat="server" CssClass="error"/>
            </div>
        <label>Code position</label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="textCodePosition"  ErrorMessage="The code must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textCodePosition" runat="server" CssClass="form-control" MaxLength="7"></asp:TextBox> 
       
        <label>Position</label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="textPosition"  ErrorMessage="The position must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textPosition" runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Salary</label>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="textSalary"  ErrorMessage="The salary must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textSalary" runat="server" CssClass="form-control"></asp:TextBox> 
       
        <label>Job descriptions</label> 
        <asp:TextBox ID="textJobDescriptions" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox> 

        <label>Additional information</label> 
        <asp:TextBox ID="textInfo" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox> 

        <button onclick="ClickAddPosition()" style="width:280px" type="submit" class="btn btn-primary">Save</button>
        <asp:Button ID="ButtonBack" Text="Back" CausesValidation="false" runat="server" CssClass="btn btn-primary" OnClick="ButtonBack_Click"/>
        </div>
    </form>
</body>
</html>
<script>
    $('form').submit(function () {
        document.location.href = "https://localhost:44346/View/PositionsApi/ViewPositions";
    });

    async function AddPosition(title, jobDescriptions, info, code, salary) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: 'https://localhost:44375/AddPosition/?title=' + title
                + '&jobDescriptions=' + jobDescriptions + '&info=' + info
                + '&code=' + code + '&salary=' + salary,
            type: 'GET',
            success: function (data) {
                
            }
        });
    }

    async function ClickAddPosition() {
        var CodePosition = document.getElementById('textCodePosition').value;
        var Title = document.getElementById('textPosition').value;
        var Salary = document.getElementById('textSalary').value;
        var JobDescriptions = document.getElementById('textJobDescriptions').value;
        var Info = document.getElementById('textInfo').value;
        await AddPosition(Title, JobDescriptions, Info, CodePosition, Salary);
 
        
    }
    
</script>