<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="UpdateEmployees.aspx.cs" Inherits="ChainStores.View.EmployeesApi.UpdateEmployees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Update employee</title>
     <webopt:bundlereference runat="server" path="~/Content/css" />
     <webopt:BundleReference runat="server" Path="~/Content/PreLoader.css"></webopt:BundleReference>
</head>
<body>
    <form id="form1" runat="server">
               <asp:ScriptManager runat="server">
            <Scripts>
                <asp:ScriptReference   Path="~/Scripts/ViewScripts/Twister.js" />
            </Scripts>
        </asp:ScriptManager>

        <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;"> 
            <div id="errorSummary" style="margin: auto; color: #FF0000; background:#FFC0CB; outline: 2px solid #FFC0CB; padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary ID="validationSum" runat="server" CssClass="error"/>
            </div>

                   <fieldset id="controlForms"/>  
                  <div> 
                      <h3 id="message"></h3>
            </div>
        <label>Last name</label> 
        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textLastName"  ErrorMessage="The last name must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textLastName" runat="server" MaxLength="100" CssClass="form-control" ValidateRequestMode="Enabled"></asp:TextBox> 
       
        <label>First name</label> 
        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textFirstName"  ErrorMessage="The first must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textFirstName" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox> 
        
        <label>Middle name</label> 
        <asp:TextBox ID="textMiddleName" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox> 
      
        <label>Age</label> 
        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textAge"  ErrorMessage="The age must be specified" CssClass="error" Text="*" />
        <asp:RangeValidator ForeColor="Red" runat="server" ControlToValidate="textAge" MinimumValue="14" MaximumValue="70" Type="Integer" CssClass="error" ErrorMessage="The age must be from 14 to 70!" Text="*"></asp:RangeValidator>
        <asp:TextBox ID="textAge" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox> 

        <label>Date of appointment</label>
        <input id="textAppointment" style="width:280px"  type="date"/>  

        <label>SSN</label>
         <asp:RegularExpressionValidator  ForeColor="Red" ValidationExpression="[0-9]{3}-[0-9]{2}-[0-9]{4}$" runat="server" ControlToValidate="textSSN"  ErrorMessage="Incorrectly entered ssn number 123-45-6789" CssClass="error" Text="*" />
         <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textSSN"  ErrorMessage="The SSN must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textSSN" runat="server" MaxLength="100" CssClass="form-control"></asp:TextBox> 

        <label>Phone number</label>
          <asp:RegularExpressionValidator  ForeColor="Red" ValidationExpression="^(?:\+375)\b.\d{2}\b.\d{3}-.\d{1}-.\d{1}$" runat="server" ControlToValidate="textPhoneNumber"  ErrorMessage="Incorrectly entered phone number +375 12 345-67-89" CssClass="error" Text="*" />
          <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textPhoneNumber"  ErrorMessage="The phone number must be specified" CssClass="error" Text="*" />  
        <asp:TextBox ID="textPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Additional information</label>
        <asp:TextBox ID="textInfo" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox> 
         
        <label>Chose position</label>
        <asp:DropDownList style="width:280px"  ID="dropDownPositions" runat="server" ItemType="System.String"  CssClass="btn btn-secondary dropdown-toggle"/> 
               
        <label>Chose shop</label>
        <asp:DropDownList style="width:280px"   ID="dropDownShop" runat="server" ItemType="System.String"  CssClass="btn btn-secondary dropdown-toggle"/> 


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
         <input onclick="ClickUpdateEmployeePrealoader()" style="width:280px" type="button" class="btn btn-primary" value="Saves with visual accompaniment"/>
         <input onclick="ClickUpdateEmployee()" style="width:280px" type="submit" class="btn btn-primary" value="Save" />
         <asp:Button ID="ButtonBack" CausesValidation="false" style="width:280px" Text="Back" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
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
        console.log(validationSum);
        if (validationSummary.textContent == '\n\n') {
            divError.hidden = true;
        }
        else {
            divError.hidden = false;
        }
    };
    CheckValidation();

   //$('form').submit(function () {
   //    document.location.href = "https://localhost:44346/View/EmployeesApi/ViewEmployees";
   //});

    document.getElementById('textSSN').placeholder = '123-45-6789';
    document.getElementById('textPhoneNumber').placeholder = '+375 12 345-67-89';

    async function getPositions() {
        array = [];
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/GetPositionAll',
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
            url: webApi.value +'/GetShopAll',
            type: 'GET',
            success: function (data) {
                array = data;
            }
        });
        return array;
    }

    function fillingSelection(array, optionList) {
        array.forEach(option =>
            optionList.add(
                new Option(text = option.Title, value = option.Id)
            )
        );
    }

    async function getEmployee(Id) {
        var employee = {};
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/Api/Employee/' + Id,
            type: 'GET',
            success: function (data) {
                employee = data;
            }
        });
        return employee;
    };

    async function UpdateEmployee( firstName,  lastName,  middleName, age
        ,  info,  appointment,  phoneNumber,  ssn,
         position,  shop,  id) {
        await $.ajax({
            headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
            url: webApi.value +'/UpdateEmployee/?firstName=' + firstName
                + '&lastName=' + lastName + '&middleName=' + middleName
                + '&age=' + age + '&info=' + info
                + '&appointment=' + appointment + '&phoneNumber=' + phoneNumber
                + '&ssn=' + ssn + '&position=' + position +
                '&shop=' + shop + "&id=" + id,
            type: 'GET',
            success: function (data) {
            }
        });
     };

     async function UpdateEmployeePrealoader (firstName, lastName, middleName, age
         , info, appointment, phoneNumber, ssn,
         position, shop, id) {
         await $.ajax({
             headers: { 'Access-Control-Allow-Origin': 'http://localhost' },
             url: webApi.value + '/UpdateEmployee/?firstName=' + firstName
                 + '&lastName=' + lastName + '&middleName=' + middleName
                 + '&age=' + age + '&info=' + info
                 + '&appointment=' + appointment + '&phoneNumber=' + phoneNumber
                 + '&ssn=' + ssn + '&position=' + position +
                 '&shop=' + shop + "&id=" + id,
             type: 'GET',
             success: function (data) {
                 WaitLoad('Successful saving', 'message', 'Preloader');
             },
             error: function () {
                 WaitLoad('An Error occured during implementations save', 'message', 'Preloader');
             }
         });
     };

    async function OnLoadData() {
        let positionSelect = document.getElementById('dropDownPositions').options;
        let shopSelect = document.getElementById('dropDownShop').options;

        let positions = await getPositions();
        let shops = await getShops();

        fillingSelection(positions, positionSelect)
        fillingSelection(shops, shopSelect)


        var Id = '<%=Request.QueryString["Id"]%>';
        let Employee = await getEmployee(Id);
 
        document.getElementById('textLastName').value = Employee.LastName;
        document.getElementById('textFirstName').value = Employee.FirstName;
        document.getElementById('textMiddleName').value = Employee.MiddleName;
        document.getElementById('textAge').value = Employee.Age;
        document.getElementById('textInfo').value = Employee.Info;
        document.getElementById('textAppointment').value = Employee.DateEmployment.substring(0, 10);
        document.getElementById('textPhoneNumber').value = Employee.PhoneNumber;
        document.getElementById('textSSN').value = Employee.InsurancePolicy;
        document.getElementById('dropDownPositions').value = Employee.PositionId
        document.getElementById('dropDownShop').value = Employee.ShopId
    };

 

    async function ClickUpdateEmployee() {
        var Id = '<%=Request.QueryString["Id"]%>';
        LastName = document.getElementById('textLastName').value;
        FirstName = document.getElementById('textFirstName').value;
        MiddleName = document.getElementById('textMiddleName').value;
        Age = document.getElementById('textAge').value;
        Info = document.getElementById('textInfo').value;
        DateEmployment = document.getElementById('textAppointment').value;
        PhoneNumber = document.getElementById('textPhoneNumber').value;
        SSN = document.getElementById('textSSN').value;
        PositionId = document.getElementById('dropDownPositions').value;
        ShopId = document.getElementById('dropDownShop').value;

        await UpdateEmployee(FirstName, LastName, MiddleName, Age
            , Info, DateEmployment, PhoneNumber, SSN,
            PositionId, ShopId, Id);

     }

     async function ClickUpdateEmployeePrealoader() {
         $("#controlForms").prop('disabled', true);
         var div = document.getElementById('Preloader');
         div.hidden = "";
         var Id = '<%=Request.QueryString["Id"]%>';
             LastName = document.getElementById('textLastName').value;
             FirstName = document.getElementById('textFirstName').value;
             MiddleName = document.getElementById('textMiddleName').value;
             Age = document.getElementById('textAge').value;
             Info = document.getElementById('textInfo').value;
             DateEmployment = document.getElementById('textAppointment').value;
             PhoneNumber = document.getElementById('textPhoneNumber').value;
             SSN = document.getElementById('textSSN').value;
             PositionId = document.getElementById('dropDownPositions').value;
             ShopId = document.getElementById('dropDownShop').value;

         await UpdateEmployeePrealoader(FirstName, LastName, MiddleName, Age
                 , Info, DateEmployment, PhoneNumber, SSN,
                 PositionId, ShopId, Id);

         }

    OnLoadData();
 </script>