<%@ Page Title="Product Manufacturers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProductManufacturers.aspx.cs" Inherits="ChainStores.View.ProductManufacturers.ViewProductManufacturers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<section>
       <br />       <br />
        <div>
            <asp:TextBox ID="textSearch" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Button ID="buttonSearch" runat="server" Text="Filter" OnClick="buttonSearch_Click"  CssClass="btn btn-primary" />
             <asp:Button ID="ButtonOpenAdd" Text="Add" runat="server" OnClick="ButtonOpenAdd_Click"  CssClass="btn btn-primary"/>
                </div>
             <div>
               <asp:GridView Id="gridViewProductManufacturers" OnRowCommand="gridViewProductManufacturers_RowCommand" runat="server" OnRowDataBound="gridViewProductManufacturers_RowDataBound"  AutoGenerateColumns="false" CssClass="table"  > 
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                          <ItemTemplate>
                              <asp:Label ID="LabelTitle" runat="server" Text='<%# Bind("Title") %>' ToolTip ='<%# Bind("Title") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Country">
                          <ItemTemplate>
                              <asp:Label ID="LabelCountry" runat="server" Text='<%# Bind("Country") %>' ToolTip ='<%# Bind("Country") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                          <ItemTemplate>
                              <asp:Label ID="LabelAddress" runat="server" Text='<%# Bind("Address") %>' ToolTip ='<%# Bind("Address") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Additional information">
                          <ItemTemplate>
                              <asp:Label ID="LabelInfo" runat="server" Text='<%# Bind("Info") %>' ToolTip ='<%# Bind("Info") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Control">
                          <ItemTemplate>
                           <asp:LinkButton ID="LinkButtonDelete"
                                       CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-primary"
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