<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="AddEmployees.aspx.cs" Inherits="ChainStores.View.EmployeesApi.AddEmployees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add employee</title>
        <webopt:bundlereference runat="server" path="~/Content/css" />
 
</head>
<body>
    <form id="form1" runat="server">
        <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;"> 
            <div style="margin: auto; color: #FF0000; height: 175px; background:#FFC0CB; outline: 2px solid #000;padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary runat="server" CssClass="error"/>
            </div>
         
        <label>Last name</label> 
        <asp:RequiredFieldValidator runat="server" ControlToValidate="textLastName"  ErrorMessage="The last name must be specified" CssClass="error" Text="*" ForeColor="Red" />
        <asp:TextBox ID="textLastName" runat="server" MaxLength="100" CssClass="form-control" ValidateRequestMode="Enabled"></asp:TextBox> 
       
        <label>First name</label> 
        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textFirstName"  ErrorMessage="The first must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textFirstName" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox> 
        
        <label>Middle name</label> 
        <asp:TextBox ID="textMiddleName"  runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox> 

        <label>Age</label> 
        <asp:RangeValidator ForeColor="Red" runat="server" ControlToValidate="textAge" MinimumValue="14" MaximumValue="70" Type="Integer" CssClass="error" ErrorMessage="The age must be from 14 to 70!" Text="*"></asp:RangeValidator>
        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textAge"  ErrorMessage="The age must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textAge" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox> 
        
        <label>Date of appointment</label>
        <input type="date" id="textAppointment"/>  

        <label>SSN</label>
         <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textSSN"  ErrorMessage="The SSN must be specified" CssClass="error" Text="*" />
         <asp:RegularExpressionValidator  ForeColor="Red" ValidationExpression="[0-9]{3}-[0-9]{2}-[0-9]{4}$" runat="server" ControlToValidate="textSSN"  ErrorMessage="Incorrectly entered ssn number 123-45-6789" CssClass="error" Text="*" />
        <asp:TextBox ID="textSSN" runat="server" MaxLength="30" CssClass="form-control"></asp:TextBox> 

        <label>Phone number</label>
        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textPhoneNumber"  ErrorMessage="The phone number must be specified" CssClass="error" Text="*" />
        <asp:RegularExpressionValidator  ForeColor="Red" ValidationExpression="^(?:\+375)\b.\d{2}\b.\d{3}-.\d{1}-.\d{1}$" runat="server" ControlToValidate="textPhoneNumber"  ErrorMessage="Incorrectly entered phone number +375 12 345-67-89" CssClass="error" Text="*" />
        <asp:TextBox ID="textPhoneNumber" TextMode="Phone" runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Additional information</label> 
        <asp:TextBox ID="textInfo" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox> 
      
        <label>Chose position</label>
        <asp:DropDownList ID="dropDownPositions" runat="server" ItemType="System." CssClass="btn btn-secondary dropdown-toggle"/> 

        <label>Chose shop</label> 
        <asp:DropDownList ID="dropDownShop" runat="server" ItemType="System." CssClass="btn btn-secondary dropdown-toggle"/> 

        <button onclick="ClickAddEmployee()" style="width:280px" type="submit" class="btn btn-primary">Save</button>
        <a href="https://localhost:44346/View/EmployeesApi/ViewEmployees" style="margin-top: 4px; width:280px" class="btn btn-primary">Back</a>
       </div>
    </form>

</body>
</html>
<script>
    $('form').submit(function () {
        document.location.href = "https://localhost:44346/View/EmployeesApi/ViewEmployees";
    });
    document.getElementById('textSSN').placeholder = '123-45-6789';
    document.getElementById('textPhoneNumber').placeholder = '+375 12 345-67-89';

    async function getPositions() {
        array = [];
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: 'https://localhost:44375/GetPositions',
            type: 'GET',
            success: function (data) {
                array = data;
            }
        });
        return array;
    }

    async function getShops() {
        array = [];
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: 'https://localhost:44375/GetShops',
            type: 'GET',
            success: function (data) {
                array = data;
            }
        });
        return array;
    }

    async function onLoad(){
        let positionSelect = document.getElementById('dropDownPositions').options;
        let shopSelect = document.getElementById('dropDownShop').options;

        let positions = await getPositions();
        let shops = await getShops();

        fillingSelection(positions, positionSelect)
        fillingSelection(shops, shopSelect)
    };
    onLoad();
     
    function fillingSelection(array, optionList) {
        array.forEach(option =>
            optionList.add(
                new Option(option)
            )
        );
    }

    async function AddEmployee(firstName,lastName,middleName,age
        ,info,appointment,phoneNumber,ssn,position,shop) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: 'https://localhost:44375/AddEmployee/?firstName=' + firstName
                + '&lastName=' + lastName + '&lastName=' + lastName
                + '&middleName=' + middleName + '&age=' + age
                + '&info=' + info + '&appointment=' + appointment
                + '&phoneNumber=' + phoneNumber + '&ssn=' + ssn + '&position=' + position
                + '&shop=' + shop,
            type: 'GET',
            success: function (data) {
            }
        });
    }
    async function ClickAddEmployee() {
        var firstName = document.getElementById('textLastName').value;
        var lastName = document.getElementById('textFirstName').value;
        var middleName = document.getElementById('textMiddleName').value;
        var age = document.getElementById('textAge').value;
        var info = document.getElementById('textInfo').value;
        var appointment = document.getElementById('textAppointment').value;
        var phoneNumber = document.getElementById('textPhoneNumber').value;
        var ssn = document.getElementById('textSSN').value;
        var positionSelect = document.getElementById('dropDownPositions');
        var position = positionSelect.options[positionSelect.selectedIndex].text;
        var shopSelect  = document.getElementById('dropDownShop');
        var shop = shopSelect.options[shopSelect.selectedIndex].text;
        await AddEmployee(firstName, lastName, middleName, age
            , info, appointment, phoneNumber, ssn, position, shop);
    }
</script>
 