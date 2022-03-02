<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePosition.aspx.cs" Inherits="ChainStores.View.Positions.UpdatePosition" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Update position</title>
    <webopt:bundlereference runat="server" path="~/Content/css" />
</head>
<body>
    <form id="form1" onload="form1_Load" runat="server">
                   <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference   Path="~/Scripts/ViewScripts/CheckValidation.js" />
            </Scripts>
        </asp:ScriptManager>
        <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;">
           <div id="errorSummary" style="margin: auto; color: #FF0000;  background:#FFC0CB; outline: 2px solid #FFC0CB; padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary   ID="validationSum" ShowSummary="true" runat="server" CssClass="error"/>
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

        <asp:Button ID="ButtonSave" Text="Save" OnClientClick="CheckValidation('errorSummary', 'validationSum')" runat="server" CssClass="btn btn-primary" OnClick="ButtonSave_Click"/>
        <asp:Button ID="ButtonBack" Text="Back" CausesValidation="false" runat="server" CssClass="btn btn-primary" OnClick="ButtonBack_Click"/>
        </div>
    </form>
</body>
</html>
<script>
    CheckValidation('errorSummary', 'validationSum');
</script>
