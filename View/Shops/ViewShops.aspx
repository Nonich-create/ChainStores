<%@ Page Title="Shops" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewShops.aspx.cs" Inherits="ChainStores.View.Shops.ViewShops" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<section>
       <br />       <br />
        <div>
            <asp:TextBox ID="textSearch" runat="server"  CssClass="form-control"></asp:TextBox>
            <asp:Button ID="buttonSearch" runat="server" Text="Filter" OnClick="buttonSearch_Click"  CssClass="btn btn-primary" />
            <asp:Button ID="ButtonOpenAdd" Text="Add" runat="server" OnClick="ButtonOpenAdd_Click"  CssClass="btn btn-primary" />
                <asp:GridView Id="gridViewShops" runat="server" OnRowCommand="gridViewShops_RowCommand"  AutoGenerateColumns="false"   CssClass="table" OnRowDataBound="gridViewShops_RowDataBound" > 
                    <Columns> 
                        <asp:TemplateField HeaderText="Name">
                          <ItemTemplate>
                              <asp:Label ID="LabelTitle" runat="server" Text='<%# Bind("Title") %>' ToolTip ='<%# Bind("Title") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Adress">
                          <ItemTemplate>
                              <asp:Label ID="LabelAdress" runat="server" Text='<%# Bind("Adress") %>' ToolTip ='<%# Bind("Adress") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>       
                        <asp:TemplateField HeaderText="Phone number">
                          <ItemTemplate>
                              <asp:Label ID="LabelPhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>' ToolTip ='<%# Bind("PhoneNumber") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>       
                        <asp:TemplateField HeaderText="Category">
                          <ItemTemplate>
                              <asp:Label ID="LabelCategory" runat="server" Text='<%# Bind("Category") %>' ToolTip ='<%# Bind("Category") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MCC">
                          <ItemTemplate>
                              <asp:Label ID="LabelMCC" runat="server" Text='<%# Bind("MCC") %>' ToolTip ='<%# Bind("MCC") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                      <%--  <asp:TemplateField HeaderText="Retail space, m2">
                          <ItemTemplate>
                              <asp:Label ID="LabelRetailSpace" runat="server" Text='<%# Bind("RetailSpace") %>' ToolTip ='<%# Bind("RetailSpace") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="WebSite">
                          <ItemTemplate>
                              <asp:Label ID="LabelWebSite" runat="server" Text='<%# Bind("WebSite") %>' ToolTip ='<%# Bind("WebSite") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderText="Form of trade service">
                          <ItemTemplate>
                              <asp:Label ID="LabelFormTradeService" runat="server" Text='<%# Bind("FormTradeService") %>' ToolTip ='<%# Bind("FormTradeService") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>--%>
                       <%-- <asp:TemplateField HeaderText="Product range">
                          <ItemTemplate>
                              <asp:Label ID="LabelProductRange" runat="server" Text='<%# Bind("ProductRange") %>' ToolTip ='<%# Bind("ProductRange") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField> --%>
                       <%-- <asp:TemplateField HeaderText="Additional information">
                          <ItemTemplate>
                              <asp:Label ID="LabelInfo" runat="server" Text='<%# Bind("Info") %>' ToolTip ='<%# Bind("Info") %>'></asp:Label>
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

 