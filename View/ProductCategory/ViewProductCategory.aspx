<%@ Page Title="Product categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProductCategory.aspx.cs" Inherits="ChainStores.View.ViewProductCategory.ViewProductCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
           <br />       <br />
        <div>
            <div>   
            <asp:TextBox ID="textSearch" runat="server" CssClass="form-control" ></asp:TextBox>
            <asp:Button ID="buttonSearch" runat="server" Text="Filter" OnClick="buttonSearch_Click"  CssClass="btn btn-primary" />
            <asp:Button ID="ButtonOpenAdd" Text="Add" runat="server" OnClick="ButtonOpenAdd_Click"  CssClass="btn btn-primary"/>
                </div>
               <asp:GridView Id="gridViewProductCategoty" OnRowCommand="gridViewProductCategoty_RowCommand" runat="server" OnRowDataBound="gridViewProductCategoty_RowDataBound"  AutoGenerateColumns="false" CssClass="table"   > 
                    <Columns>
                        <asp:TemplateField HeaderText="Code">
                          <ItemTemplate>
                              <asp:Label ID="LabelCode" runat="server" Text='<%# Bind("Code") %>' ToolTip ='<%# Bind("Code") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Name">
                          <ItemTemplate>
                              <asp:Label ID="LabelTitle" runat="server" Text='<%# Bind("Title") %>' ToolTip ='<%# Bind("Title") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Additional information">
                          <ItemTemplate>
                              <asp:Label ID="LabelInfo" runat="server" Text='<%# Bind("Info") %>' ToolTip ='<%# Bind("Info") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
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
             &nbsp;</section>
</asp:Content>
 