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
             <h2>Client validation</h2>
            <div  id="ErorrBox" hidden="hidden"  style="margin: auto; color: #FF0000;  background:#FFC0CB; outline: 2px solid #FFC0CB;padding: 10px;border-radius: 10px;">
                <asp:ValidationSummary Visible="true" runat="server" CssClass="error"/>
            <div id="divErrorLastName" hidden="hidden"> 
              <asp:RequiredFieldValidator runat="server" ControlToValidate="textLastName" CssClass="error" Text="The last name must be specified" ForeColor="Red" />
            </div>
            <div hidden="hidden" id="divFirstName">  
               <br/><asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textFirstName" CssClass="error" Text="The first must be specified" />
            </div>
            <div hidden="hidden" id="divRangetextAge">  
               <br/><asp:RangeValidator ForeColor="Red" runat="server" ControlToValidate="textAge" MinimumValue="14" MaximumValue="70" Type="Integer" CssClass="error" Text="The age must be from 14 to 70!"></asp:RangeValidator>
            </div>
            <div hidden="hidden" id="divtextAge">  
               <br/><asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textAge" CssClass="error" Text="The age must be specified" />
            </div>
            <div hidden="hidden" id="divAppointment">  
              <br/><asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textAppointment"    CssClass="error" Text="The date must be specified" />
            </div>
            <div hidden="hidden" id="divSSN"> 
              <br/><asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textInsurancePolicy" CssClass="error" Text="The SSN must be specified" />
              <br/><asp:RegularExpressionValidator ForeColor="Red" ValidationExpression="[0-9]{3}-[0-9]{2}-[0-9]{4}$" runat="server" ControlToValidate="textInsurancePolicy" CssClass="error" Text="Incorrectly entered ssn number 123-45-6789"   />
            </div>
            <div hidden="hidden" id="divPhoneNumber"> 
               <br/><asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textPhoneNumber"  CssClass="error" Text="The phone number must be specified" />
                  <br/><asp:RegularExpressionValidator  ForeColor="Red" ValidationExpression="^(?:\+375)\b.\d{2}\b.\d{3}-.\d{1}-.\d{1}$" runat="server" ControlToValidate="textPhoneNumber"  CssClass="error" Text="Incorrectly entered phone number +375 12 345-67-89" />
            </div>
 
        </div>
         
        <label>Last name</label> 
         <asp:RequiredFieldValidator runat="server" ControlToValidate="textLastName" Display="Dynamic" CssClass="error" Text="*" ForeColor="Red" />
        <asp:TextBox ID="textLastName" onchange = "OnChangeTxt(this,'divErrorLastName')"  runat="server" MaxLength="100" CssClass="form-control" ValidateRequestMode="Enabled"></asp:TextBox> 
            <asp:DynamicValidator ForeColor="Red" ID="dynamicValidator1" Display="Static" runat="server" ControlToValidate="textLastName"/>

        <label>First name</label> 
        <asp:RequiredFieldValidator ForeColor="Red"  runat="server" ControlToValidate="textFirstName"  CssClass="error" Text="*" />
        <asp:TextBox ID="textFirstName" onchange = "OnChangeTxt(this,'divFirstName')"  runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox> 
        
        <label>Middle name</label> 
        <asp:TextBox ID="textMiddleName"  runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox> 

        <label>Age</label> 
        <asp:RangeValidator ForeColor="Red" runat="server" ControlToValidate="textAge" MinimumValue="14" MaximumValue="70" Type="Integer" CssClass="error" Text="*"></asp:RangeValidator>
        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textAge"   CssClass="error" Text="*" />
        <asp:TextBox ID="textAge"  onchange = "OnChangeTxt(this,'divtextAge')"  runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox> 
        
        <label>Date of appointment</label>
        <asp:RequiredFieldValidator ForeColor="Red"  runat="server" ControlToValidate="textAppointment" CssClass="error" Text="*" />
        <input type="date" onchange="CopyDateToText(this,'textAppointment')"/>  
             <div hidden="hidden"> 
        <asp:TextBox ID="textAppointment" onchange = "OnChangeTxt(this,'divAppointment')"  Visible="true" runat="server" CssClass="form-control" TextMode="DateTime" MaxLength="10"></asp:TextBox>
        </div>
        <label>SSN</label>
         <asp:RequiredFieldValidator ForeColor="Red"  runat="server" ControlToValidate="textInsurancePolicy" CssClass="error" Text="*" />
         <asp:RegularExpressionValidator id="regulSSN" ForeColor="Red" ValidationExpression="[0-9]{3}-[0-9]{2}-[0-9]{4}$" runat="server" ControlToValidate="textInsurancePolicy"  CssClass="error" Text="*" />
        <asp:TextBox ID="textInsurancePolicy" onchange = "OnChangeTxt(this,'divSSN')"  oninput="ChangeSSN(this)" runat="server" MaxLength="11" CssClass="form-control" TextMode="Phone"></asp:TextBox> 
             
        <label>Phone number</label>
        <asp:RequiredFieldValidator ForeColor="Red" runat="server" ControlToValidate="textPhoneNumber" CssClass="error" Text="*" />
        <asp:RegularExpressionValidator  ForeColor="Red" ValidationExpression="^(?:\+375)\b.\d{2}\b.\d{3}-.\d{1}-.\d{1}$" runat="server" ControlToValidate="textPhoneNumber" CssClass="error" Text="*" />
        <asp:DynamicValidator ForeColor="Red" ID="dynamicValidator" Display="Static" runat="server" ControlToValidate="textPhoneNumber"/>
        <asp:TextBox ID="textPhoneNumber" onchange = "OnChangeTxt(this,'divPhoneNumber')"  oninput="ChangeNumber(this)" TextMode="Phone" runat="server" CssClass="form-control" MaxLength="17"></asp:TextBox> 
 
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

  

    function OnChangeTxt(txt,divTxt) {
        let div = document.getElementById('ErorrBox');

        let divElem = document.getElementById(divTxt);

        let divErrorLN = document.getElementById('divErrorLastName');
        let divErrorFN = document.getElementById('divFirstName');
        let divErrorRA = document.getElementById('divRangetextAge');
        let divErrorAge = document.getElementById('divtextAge');
        let divErrorA = document.getElementById('divAppointment');
        let divErrorSSN = document.getElementById('divSSN');
        let divErrorPH = document.getElementById('divPhoneNumber');

        if (txt.value == '' ) {
            div.hidden = "";
            divElem.hidden = "";
            txt.style = "border-color:Red;"

        }
        else {  
            txt.style = ""
            divElem.hidden = "hidden";
        }
         
       
        if (divElem.id == divErrorSSN.id) {
            var pattern = /[0-9]{3}-[0-9]{2}-[0-9]{4}$/, str = txt.value;
            console.log(pattern.test(str));
            if (pattern.test(str) == false) {
                div.hidden = "";
                divElem.hidden = "";
                txt.style = "border-color:Red;"
            }
        };


        if (divElem.id == divErrorPH.id) {
            var pattern = /^(?:\+375)\b.\d{2}\b.\d{3}-.\d-.\d$/, str = txt.value;
            console.log(pattern.test(str));
            if (pattern.test(str) == false) {
                div.hidden = "";
                divElem.hidden = "";
                txt.style = "border-color:Red;"
            }
        };
 
        if (divErrorLN.hidden == true && divErrorFN.hidden == true && divErrorRA.hidden == true
            && divErrorAge.hidden == true && divErrorA.hidden == true && divErrorSSN.hidden == true
            && divErrorPH.hidden == true)
        {  
            div.hidden = "hidden";
        };
    }
 
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
 