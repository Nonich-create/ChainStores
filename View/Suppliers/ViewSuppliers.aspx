<%@ Page Title="Suppliers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSuppliers.aspx.cs" Inherits="ChainStores.View.Suppliers.ViewSuppliers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<section>
       <br />       <br />
    <asp:TextBox ID="textSearch" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:Button ID="buttonSearch" runat="server" Text="Filter" OnClick="buttonSearch_Click" CssClass="btn btn-primary" />
    <asp:Button ID="ButtonOpenAdd"  Text="Add" runat="server" OnClick="ButtonOpenAdd_Click" CssClass="btn btn-primary"/>
        <div>
               <asp:GridView OnRowCommand="gridViewSuppliers_RowCommand" OnRowDataBound="gridViewSuppliers_RowDataBound" Id="gridViewSuppliers" runat="server"  AutoGenerateColumns="false"  CssClass="table"> 
                    <Columns> 
                        <asp:TemplateField HeaderText="Name">
                          <ItemTemplate>
                              <asp:Label ID="LabelTitle" runat="server" Text='<%# Bind("Title") %>' ToolTip ='<%# Bind("Title") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                      <%--  <asp:TemplateField HeaderText="Adress">
                          <ItemTemplate>
                              <asp:Label ID="LabelAdress" runat="server" Text='<%# Bind("Adress") %>' ToolTip ='<%# Bind("Adress") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField> --%>    
                        <asp:TemplateField HeaderText="Phone number">
                          <ItemTemplate>
                              <asp:Label ID="LabelPhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>' ToolTip ='<%# Bind("PhoneNumber") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                          <ItemTemplate>
                              <asp:Label ID="LabelEmail" runat="server" Text='<%# Bind("Email") %>' ToolTip ='<%# Bind("Email") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Country">
                          <ItemTemplate>
                              <asp:Label ID="LabelCountry" runat="server" Text='<%# Bind("Country") %>' ToolTip ='<%# Bind("Country") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                      <%--  <asp:TemplateField HeaderText="Payment account">
                          <ItemTemplate>
                              <asp:Label ID="LabelPaymentAccount" runat="server" Text='<%# Bind("PaymentAccount") %>' ToolTip ='<%# Bind("PaymentAccount") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Category">
                          <ItemTemplate>
                              <asp:Label ID="LabelCategory" runat="server" Text='<%# Bind("Category") %>' ToolTip ='<%# Bind("Category") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact person">
                          <ItemTemplate>
                              <asp:Label ID="LabelContactPerson" runat="server" Text='<%# Bind("ContactPerson") %>' ToolTip ='<%# Bind("ContactPerson") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                 <%--       <asp:TemplateField HeaderText="Additional information">
                          <ItemTemplate>
                              <asp:Label ID="LabelInfo" runat="server" Text='<%# Bind("Info") %>' ToolTip ='<%# Bind("Info") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>--%>
                           <asp:TemplateField HeaderText="Control">
                          <ItemTemplate>
                           <asp:LinkButton ID="LinkButtonDelete" CssClass="btn btn-primary"  
                                       CommandArgument='<%# Eval("Id") %>' 
                                       CommandName="Delete" runat="server">
                                       Delete</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButtonUpdate" CssClass="btn btn-primary"  
                                       CommandArgument='<%# Eval("Id") %>' 
                                       CommandName="Update" runat="server">
                                       Update</asp:LinkButton>
                           </ItemTemplate>                     
                        </asp:TemplateField>
                    </Columns>
               </asp:GridView> 
        </div>
    </section>
</asp:Content>
 

 