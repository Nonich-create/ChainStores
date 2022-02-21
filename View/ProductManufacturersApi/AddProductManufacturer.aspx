<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProductManufacturer.aspx.cs" Inherits="ChainStores.View.ProductManufacturersApi.AddProductManufacturer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <webopt:bundlereference runat="server" path="~/Content/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add manufacturer</title>
</head>
<body>
     <form id="form1" runat="server">
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
 
        <button onclick="ClickAddManufacturer()" style="width:280px" type="submit" class="btn btn-primary">Save</button>
        <asp:Button ID="ButtonBack" CausesValidation="false" Text="Back" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
      </div>
    </form>
</body>
</html>
<script>
    async function AddManufacturer(title, address, info, country) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: 'https://localhost:44375/AddManufacturer/?title=' + title
                + '&address=' + address + '&info=' + info + '&country=' + country,
            type: 'GET',
            success: function (data) {
            }
        });
    }

    async function ClickAddManufacturer() {
         var Title = document.getElementById('textTitle').value;
         var Country = document.getElementById('textCountry').value;
         var Address = document.getElementById('textAddress').value;
         var Info = document.getElementById('textInfo').value;
         await AddManufacturer(Title, Address, Info, Country);
    }

    $('form').submit(function () {
        document.location.href = "https://localhost:44346/View/ProductManufacturersApi/ViewProductManufacturers";
    });
</script>