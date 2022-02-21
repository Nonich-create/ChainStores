<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateManufacturer.aspx.cs" Inherits="ChainStores.View.ProductManufacturersApi.UpdateManufacturer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Update manufacturer</title>
    <webopt:bundlereference runat="server" path="~/Content/css" />
</head>
<body>
    <form id="form1" runat="server" >
      <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;">    
            <div style="margin: auto; color: #FF0000; height: 75px; background:#FFC0CB; outline: 2px solid #000;padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary ShowSummary="true" runat="server" CssClass="error"/>
            </div>
        <label>Name</label>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textTitle"  ErrorMessage="The name must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textTitle" runat="server" CssClass="form-control"></asp:TextBox> 
        
        <label>Country</label> 
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textCountry"  ErrorMessage="The country must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textCountry" runat="server" CssClass="form-control"></asp:TextBox> 
        
        <label>Address</label> 
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textAddress"  ErrorMessage="The address must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textAddress" runat="server" CssClass="form-control"></asp:TextBox> 
        
        <label>Additional information</label> 
        <asp:TextBox ID="textInfo" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox> 
 
        <button onclick="ClickUpdatePosition()" style="width:280px" type="submit" class="btn btn-primary">Save</button>
        <asp:Button ID="ButtonBack" CausesValidation="false" Text="Back" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
      </div>
    </form>
</body>
</html>
<script>
    $('form').submit(function () {
        document.location.href = "https://localhost:44346/View/ProductManufacturersApi/ViewProductManufacturers";
    });

    async function getManufacturer(Id) {
        var manufacturer = {};
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: 'https://localhost:44375/Api/Manufacturer/' + Id,
            type: 'GET',
            success: function (data) {
                manufacturer = data;
            }
        });
        return manufacturer;
    }

    async function UpdateManufacturer(title,address,info,country,Id) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: 'https://localhost:44375/UpdateManufacturer/?title=' + title
                + '&address=' + address + '&info=' + info
                + '&country=' + country + "&Id=" + Id,
            type: 'GET',
            success: function (data) {
            }
        });
    }

    async function OnLoadData() {
        var Id = '<%=Request.QueryString["Id"]%>';
        let manufacturer = await getManufacturer(Id);

        document.getElementById('textTitle').value = manufacturer.Title;
        document.getElementById('textCountry').value = manufacturer.Country;
        document.getElementById('textAddress').value = manufacturer.Address;
        document.getElementById('textInfo').value = manufacturer.Info;
    }

    async function ClickUpdatePosition() {
        var Id = '<%=Request.QueryString["Id"]%>';
        var Title = document.getElementById('textTitle').value;
        var Country = document.getElementById('textCountry').value;
        var Address = document.getElementById('textAddress').value;
        var Info = document.getElementById('textInfo').value;
        await UpdateManufacturer(Title, Address, Info, Country, Id);
    }

    OnLoadData();
</script>
