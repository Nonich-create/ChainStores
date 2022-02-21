<%@ Page Title="Deliveries" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewDeliveries.aspx.cs" Inherits="ChainStores.View.Deliveries.ViewDeliveries"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div>
            <br />
                  <asp:TextBox ID="textSearch" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:Button ID="buttonSearch" runat="server" Text="Filter" OnClick="buttonSearch_Click"  CssClass="btn btn-primary" />
                  <asp:Button ID="ButtonOpenAdd" Text="Add" runat="server" OnClick="ButtonOpenAdd_Click"  CssClass="btn btn-primary"/>
     <asp:GridView Id="gridViewDeliveries" runat="server"  AutoGenerateColumns="false" CssClass="table"> 
                    <Columns>
                        <asp:BoundField DataField="Product.Title" HeaderText="Product" />
                        <asp:BoundField DataField="Supplier.Title" HeaderText="Supplier" />
                        <asp:BoundField DataField="Shop.Title" HeaderText="Shop" />
                        <asp:BoundField DataField="Employee.LastName" HeaderText="Employee Last name" />
                        <asp:BoundField DataField="Employee.FirstName" HeaderText="Employee First name" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="TotalPrice" HeaderText="Total price"/>
                        <asp:BoundField DataField="ApplicationDate" HeaderText="Application date" DataFormatString="{0:dd-MM-yyyy}"/>
                        <asp:BoundField DataField="DateReceipt" HeaderText="Date receipt" DataFormatString="{0:dd-MM-yyyy}"/>
                        <asp:BoundField DataField="ActualDateReceipt" HeaderText="Actual date receipt" DataFormatString="{0:dd-MM-yyyy}"/>
                    </Columns>
               </asp:GridView> 
        </div>
    </section>
</asp:Content>
