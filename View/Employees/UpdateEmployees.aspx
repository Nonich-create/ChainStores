<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateEmployees.aspx.cs" Inherits="ChainStores.View.Employees.UpdateEmployees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Update employee</title>
     <webopt:bundlereference runat="server" path="~/Content/css" />

</head>
<body>
    <form id="form1" runat="server" onload="form1_Load">      
        <div style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;"> 
                <h2>Client validation</h2>
            <div style="margin: auto; color: #FF0000; height: 175px; background:#FFC0CB; outline: 2px solid #000;padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary runat="server" CssClass="error"/>
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
        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textAppointment"  ErrorMessage="The date must be specified" CssClass="error" Text="*" />
        <div hidden="hidden"> 
           <asp:TextBox ID="textAppointment" Visible="true" runat="server" CssClass="form-control" TextMode="DateTime" MaxLength="10"></asp:TextBox>
        </div>
        <input id="calendar" type="date" onchange="CopyDateToText(this,'textAppointment')"/>  

        <label>SSN</label>
         <asp:RegularExpressionValidator  ForeColor="Red" ValidationExpression="[0-9]{3}-[0-9]{2}-[0-9]{4}$" runat="server" ControlToValidate="textInsurancePolicy"  ErrorMessage="Incorrectly entered ssn number 123-45-6789" CssClass="error" Text="*" />
         <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textInsurancePolicy"  ErrorMessage="The SSN must be specified" CssClass="error" Text="*" />
        <asp:TextBox ID="textInsurancePolicy" runat="server" MaxLength="100" CssClass="form-control"></asp:TextBox> 

        <label>Phone number</label>
          <asp:RegularExpressionValidator  ForeColor="Red" ValidationExpression="^(?:\+375)\b.\d{2}\b.\d{3}-.\d{1}-.\d{1}$" runat="server" ControlToValidate="textPhoneNumber"  ErrorMessage="Incorrectly entered phone number +375 12 345-67-89" CssClass="error" Text="*" />
          <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textPhoneNumber"  ErrorMessage="The phone number must be specified" CssClass="error" Text="*" />  
        <asp:TextBox ID="textPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox> 

        <label>Additional information</label>
        <asp:TextBox ID="textInfo" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox> 
         
        <label>Chose position</label>
            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="dropDownPositions"  ErrorMessage="The position must be specified" CssClass="error" Text="*" />
        <asp:DropDownList ID="dropDownPositions" runat="server" ItemType="System.String" SelectMethod="GetPositions" CssClass="btn btn-secondary dropdown-toggle"/> 
               
        <label>Chose shop</label>
            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="dropDownShop"  ErrorMessage="The shop must be specified" CssClass="error" Text="*" />
        <asp:DropDownList ID="dropDownShop" runat="server" ItemType="System.String" SelectMethod="GetShops" CssClass="btn btn-secondary dropdown-toggle"/> 

            <asp:Button ID="ButtonSave" Text="Save" runat="server" OnClick="ButtonSave_Click" CssClass="btn btn-primary"/>
            <asp:Button ID="ButtonBack" CausesValidation="false" Text="Back" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
        </div>
    </form>
</body>
</html>

<script>
    document.getElementById('textInsurancePolicy').placeholder = '123-45-6789';
    document.getElementById('textPhoneNumber').placeholder = '+375 12 345-67-89';
    calendar.value = document.getElementById('textAppointment').value;
    function CopyDateToText(date, docId) {
        var text = document.getElementById(docId);
        text.value = date.value;
    }
</script>