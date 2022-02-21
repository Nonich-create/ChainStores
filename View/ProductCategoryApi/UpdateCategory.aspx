<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCategory.aspx.cs" Inherits="ChainStores.View.ProductCategoryApi.UpdateCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <webopt:bundlereference runat="server" path="~/Content/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Update category product</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;">
                <div style="margin: auto; color: #FF0000; height: 75px; background:#FFC0CB; outline: 2px solid #000;padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary ShowSummary="true" runat="server" CssClass="error"/>
            </div>
        <div hidden="hidden">
            <asp:Label runat="server" ID="LabelId"></asp:Label>
        </div>
        <asp:ValidationSummary runat="server" CssClass="error"/>
        <label>Code</label> 
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="textCode"  ErrorMessage="The code must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textCode" runat="server" CssClass="form-control"></asp:TextBox> 
        <label>Name</label>
        <asp:RequiredFieldValidator ForeColor="#FF0000" runat="server" ControlToValidate="TextTitle"  ErrorMessage="The name must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textTitle" runat="server"  CssClass="form-control"></asp:TextBox> 
        <label>Additional information</label> 
        <asp:TextBox ID="textInfo" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox> 

        <button onclick="ClickUpdateProductCategory()" style="width:280px" type="submit" class="btn btn-primary">Save</button>
        <asp:Button ID="ButtonBack" Text="Back" CausesValidation="false" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
      </div>    
    </form>
</body>
</html>
<script>
    async function getProductCategory(Id) {
        var productCategory = {};
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: 'https://localhost:44375/Api/ProductCategory/' + Id,
            type: 'GET',
            success: function (data) {
                productCategory = data;
            }
        });
        return productCategory;
    }

    async function updateProductCategory(title, code, info, Id) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: 'https://localhost:44375/UpdateProductCategory/?title=' + title
                + '&code=' + code + '&info=' + info + "&Id=" + Id,
            type: 'GET',
            success: function (data) {
            }
        });
    }

    async function OnLoadData() {
        var Id = '<%=Request.QueryString["Id"]%>';
        let productCategory = await getProductCategory(Id);

        document.getElementById('textTitle').value = productCategory.Title;
        document.getElementById('textCode').value = productCategory.Code;
        document.getElementById('textInfo').value = productCategory.Info;
    }

    async function ClickUpdateProductCategory() {
        var Id = '<%=Request.QueryString["Id"]%>';
        var Title = document.getElementById('textTitle').value;
        var Code = document.getElementById('textCode').value;
        var Info = document.getElementById('textInfo').value;
        await updateProductCategory(Title, Code, Info, Id);
    }

    OnLoadData();

    $('form').submit(function () {
        document.location.href = "https://localhost:44346/View/ProductCategoryApi/ViewProductCategory";
    });
</script>