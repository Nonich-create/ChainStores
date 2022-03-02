<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEmployees.aspx.cs" Inherits="ChainStores.View.Employees.AddEmployees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add employee</title>
        <webopt:bundlereference runat="server" path="~/Content/css" />
 
</head>
<body>
    <form id="form1" runat="server">
        <div  style="width:300px;margin:0 auto;outline: 2px solid #000;padding: 10px;border-radius: 10px;"> 
             <h2>Client validation dynamick</h2>
           <asp:ValidationSummary   runat="server" CssClass="error"/>
 
        <label>Last name</label> 
        <asp:TextBox ID="textLastName" onchange="OnChangeText(this)" runat="server" MaxLength="100" CssClass="form-control" ValidateRequestMode="Enabled"></asp:TextBox> 
       <asp:RequiredFieldValidator runat="server" ControlToValidate="textLastName" CssClass="error" Text="The last name must be specified" ForeColor="Red" />
 
       <br />

        <label>First name</label> 
        <asp:TextBox ID="textFirstName" onchange="OnChangeText(this)" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox> 
        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textFirstName" CssClass="error" Text="The first must be specified" />
              <br />

        <label>Middle name</label> 
        <asp:TextBox ID="textMiddleName"  runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox> 

        <label>Age</label> 
        <asp:TextBox ID="textAge" runat="server" onchange="OnChangeAge(this)" TextMode="Number" CssClass="form-control"></asp:TextBox> 
                 <div  hidden="hidden" id="RangeDivAge"> 
               <asp:RangeValidator  ForeColor="Red" runat="server" ControlToValidate="textAge" MinimumValue="14" MaximumValue="70" Type="Integer" CssClass="error" Text="The age must be from 14 to 70!"></asp:RangeValidator>
                 </div>
             <div  hidden="hidden" id="RequiredDivAge"> 
                     <asp:RequiredFieldValidator  ForeColor="Red" runat="server" ControlToValidate="textAge"   CssClass="error" Text="The age must be specified" />
             </div>
    
        <label>Date of appointment</label>
        <input type="date" onchange="CopyDateToText(this,'textAppointment')"/>  
             <div hidden="hidden"> 
        <asp:TextBox ID="textAppointment"  Visible="true" runat="server" CssClass="form-control" TextMode="DateTime" MaxLength="10"></asp:TextBox>
        </div>
              <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textAppointment"    CssClass="error" Text="The date must be specified" />
            <br />
        <label>SSN</label>
        <asp:TextBox ID="textInsurancePolicy"  onchange="OnChangeSSN(this)" oninput="ChangeSSN(this)" runat="server" MaxLength="11" CssClass="form-control" TextMode="Phone"></asp:TextBox>  
            <div  hidden="hidden" id="RequiredDivSSN">  
        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textInsurancePolicy" CssClass="error" Text="The SSN must be specified" />
            </div>
           <div hidden="hidden" id="RegularDivSSN">  
        <asp:RegularExpressionValidator ForeColor="Red" ValidationExpression="[0-9]{3}-[0-9]{2}-[0-9]{4}$" runat="server" ControlToValidate="textInsurancePolicy" CssClass="error" Text="Incorrectly entered ssn number 123-45-6789"/>
             </div>
          
        <label>Phone number</label>
        <asp:TextBox ID="textPhoneNumber" onchange="OnChangeNumber(this)" oninput="ChangeNumber(this)" TextMode="Phone" runat="server" CssClass="form-control" MaxLength="17"></asp:TextBox> 
           <div  hidden="hidden" id="RequiredDivNumber"> 
            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textPhoneNumber"  CssClass="error" Text="The phone number must be specified" />
           </div>  
           <div hidden="hidden" id="RegularDivNumber">  
            <asp:RegularExpressionValidator  ForeColor="Red" ValidationExpression="^(?:\+375)\b.\d{2}\b.\d{3}-.\d{1}-.\d{1}$" runat="server" ControlToValidate="textPhoneNumber"  CssClass="error" Text="Incorrectly entered phone number +375 12 345-67-89" />
           </div>   
 
        <label>Additional information</label> 
        <asp:TextBox ID="textInfo" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox> 
      
        <label>Chose position</label>
        <asp:DropDownList ID="dropDownPositions" runat="server" ItemType="System.String" SelectMethod="GetPositions" CssClass="btn btn-secondary dropdown-toggle"/> 

        <label>Chose shop</label> 
        <asp:DropDownList ID="dropDownShop" runat="server" ItemType="System.String" SelectMethod="GetShops" CssClass="btn btn-secondary dropdown-toggle"/> 

         <button onclick="ClickAddShop()" style="width:280px" type="submit" class="btn btn-primary">Save</button>
        <asp:Button ID="ButtonBack" CausesValidation="false"  Text="Back" runat="server" OnClick="ButtonBack_Click" CssClass="btn btn-primary"/>
       </div>
    </form>
    
</body>
</html>
<script>
    let inp = document.getElementById('textPhoneNumber');
    let inpSSN = document.getElementById('textInsurancePolicy');
   
    inp.placeholder = '+375 12 345-67-89';
    inpSSN.placeholder = '123-45-6789';

    function OnChangeText(txt) {
        if (txt.value == '') {

            txt.style = "border-color:Red;"

        }
        else {
            txt.style = ""
        }
    };

    function OnChangeAge(txt) {
        let RequiredDivAge = document.getElementById('RequiredDivAge');
        let RangeDivAge = document.getElementById('RangeDivAge');

        if (txt.value == '') {

            RequiredDivAge.hidden = false;
            txt.style = "border-color:Red;"

        }
        else {
            txt.style = ""
            RangeDivAge.hidden = true;
        }

        if (txt.value <= 14 || txt.value >= 70) {
            RangeDivAge.hidden = false;
            txt.style = "border-color:Red;"
        }
        else {
            txt.style = ""
            RequiredDivAge.hidden = true;
        }
    };
    function OnChangeSSN(txt) {
        let RequiredDivSSN = document.getElementById('RequiredDivSSN');
        let RegularDivSSN = document.getElementById('RegularDivSSN');
    
        if (txt.value == '') {

            RequiredDivSSN.hidden = "";
            txt.style = "border-color:Red;"
    
        }
        else {  
            txt.style = ""
            RegularDivSSN.hidden = "hidden";
        }
         
        var pattern = /[0-9]{3}-[0-9]{2}-[0-9]{4}$/, str = txt.value;
        if (pattern.test(str) == false) {
            RegularDivSSN.hidden = "";
            txt.style = "border-color:Red;"
        }
        else {
            txt.style = ""
            RequiredDivSSN.hidden = "hidden";
        }
    };
    function OnChangeNumber(txt) {
        let RegularDivNumber = document.getElementById('RegularDivNumber');
        let RequiredDivNumber = document.getElementById('RequiredDivNumber');

        if (txt.value == '') {

            RequiredDivNumber.hidden = "";
            txt.style = "border-color:Red;"

        }
        else {
            txt.style = ""
            RegularDivNumber.hidden = "hidden";
        }

        var pattern = /^(?:\+375)\b.\d{2}\b.\d{3}-.\d{1}-.\d{1}$/, str = txt.value;
        if (pattern.test(str) == false) {
            RegularDivNumber.hidden = "";
            txt.style = "border-color:Red;"
        }
        else {
            txt.style = ""
            RequiredDivNumber.hidden = "hidden";
        }
    };
            
    
    
    inpSSN.addEventListener('keypress', e => {
        if (!/\d/.test(e.key))
            e.preventDefault();
    });

    inp.addEventListener('focus', _ => {
        if (inp.value == '') {
            if (!/^\+\d*$/.test(inp.value))
                inp.value = '+375 ';
        }
    });

    inp.addEventListener('keypress', e => {
        if (!/\d/.test(e.key))
            e.preventDefault();
    });

    function ChangeSSN(txt) {
        if (txt.value.length == 3) {
            txt.value += '-';
        }
        if (txt.value.length == 6) {
            txt.value += '-';
        }
    }
    function ChangeNumber(txt) {
        if (txt.value.length == 4) {
            txt.value += ' ';
        }
        if (txt.value.length == 7) {
            txt.value += ' ';
        }
        if (txt.value.length == 11) {
            txt.value += '-';
        }
        if (txt.value.length == 14) {
            txt.value += '-';
        }
    }
   
    function CopyDateToText(date, docId) {
        var text = document.getElementById(docId);
        text.value = date.value;
    }
</script>
 