<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="ChainStores.View.Products.ViewProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<section>
    <br />       <br />
        <div>
            <asp:TextBox ID="textSearch" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Button ID="buttonSearch" runat="server" Text="Filter" OnClick="buttonSearch_Click"  CssClass="btn btn-primary" />
             <asp:Button ID="ButtonOpenAdd" Text="Add" runat="server" OnClick="ButtonOpenAdd_Click"  CssClass="btn btn-primary"/>
                <asp:GridView Id="gridViewProducts" OnRowCommand="gridViewProducts_RowCommand" OnRowDataBound="gridViewProducts_RowDataBound" runat="server"  AutoGenerateColumns="false"  CssClass="table" > 
                    <Columns> 
                        <asp:TemplateField HeaderText="Article" >
                          <ItemTemplate>
                              <asp:Label ID="LabelArticle" runat="server" Text='<%# Bind("Article") %>' ToolTip ='<%# Bind("Article") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Name">
                          <ItemTemplate>
                              <asp:Label ID="LabelTitle" runat="server" Text='<%# Bind("Title") %>' ToolTip ='<%# Bind("Title") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                          <ItemTemplate>
                              <asp:Label ID="LabelUnitPrice" runat="server" Text='<%# Bind("UnitPrice") %>' ToolTip ='<%# Bind("UnitPrice") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                      <%--  <asp:TemplateField HeaderText="Product description">
                          <ItemTemplate>
                              <asp:Label ID="LabelDescription" runat="server" Text='<%# Bind("Description") %>' ToolTip ='<%# Bind("Description") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>--%>
                        <%--<asp:TemplateField HeaderText="Certificate">
                          <ItemTemplate>
                              <asp:Label ID="LabelCertificate" runat="server" Text='<%# Bind("Сertificate") %>' ToolTip ='<%# Bind("Сertificate")%>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>--%>
                       <%-- <asp:BoundField DataField="DateManufacture" HeaderText="Date of manufacture" DataFormatString="{0:dd-MM-yyyy}" />--%>
                        <asp:BoundField DataField="ExpirationDate" HeaderText="Expiration date" DataFormatString="{0:dd-MM-yyyy}"/>
                       <%-- <asp:BoundField DataField="UpdateDate" HeaderText="Date of product change" DataFormatString="{0:dd-MM-yyyy}"/>--%>
                    <%--    <asp:TemplateField HeaderText="Product composition">
                          <ItemTemplate>
                              <asp:Label ID="LabelProductComposition" runat="server" Text='<%# Bind("ProductComposition") %>' ToolTip ='<%# Bind("ProductComposition") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Product category">
                          <ItemTemplate>
                              <asp:Label ID="LabelCategoryTitle" runat="server" Text='<%# Bind("ProductCategory.Title") %>' ToolTip ='<%# Bind("ProductCategory.Title") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product manufacturer">
                          <ItemTemplate>
                              <asp:Label ID="LabelManufacturerTitle" runat="server" Text='<%# Bind("ProductManufacturer.Title") %>' ToolTip ='<%# Bind("ProductManufacturer.Title") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                      <%--  <asp:TemplateField HeaderText="Commoаdity unit">
                          <ItemTemplate>
                              <asp:Label ID="LabelCommoаdityUnitTitle" runat="server" Text='<%# Bind("CommoаdityUnit.Title") %>' ToolTip ='<%# Bind("CommoаdityUnit.Title") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>--%>
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
