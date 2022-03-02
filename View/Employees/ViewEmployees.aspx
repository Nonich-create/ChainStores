<%@ Page Title="Employees" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewEmployees.aspx.cs" Inherits="ChainStores.View.Employees.ViewEmployees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
           <br />       <br />
        <div>
                  <div> 
                  <asp:TextBox ID="textSearch" runat="server" CssClass="form-control"></asp:TextBox>
                  <asp:Button ID="buttonSearch" runat="server" Text="Filter" OnClick="buttonSearch_Click" CssClass="btn btn-primary"/>
                  <asp:Button ID="ButtonOpenAdd" Text="Add" runat="server" OnClick="ButtonOpenAdd_Click" CssClass="btn btn-primary"/>
                       </div>
     <asp:GridView Id="gridViewEmployees" OnRowCommand="gridViewEmployees_RowCommand" runat="server" OnRowDataBound="gridViewEmployees_RowDataBound"  AutoGenerateColumns="False" CssClass="table"     > 
                    <Columns> 
                       <asp:TemplateField HeaderText="Full name">
                             <ItemTemplate>
                                 <asp:Label ID="fullName" runat="server" Text='<%#Eval("LastName") + " " + Eval("FirstName") + " " + Eval("MiddleName")%>' 
                                     ToolTip =' <%#Eval("LastName") + " " + Eval("FirstName") + " " + Eval("MiddleName")%>'></asp:Label>
                             </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone number">
                          <ItemTemplate>
                              <asp:Label ID="LabelPhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>' ToolTip ='<%# Bind("PhoneNumber") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Shop name">
                          <ItemTemplate>
                              <asp:Label ID="LabelShop" runat="server" Text='<%# Bind("Shop.Title") %>' ToolTip ='<%# Bind("Shop.Title") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Position">
                          <ItemTemplate>
                              <asp:Label ID="LabelPosition" runat="server" Text='<%# Bind("Position.Title") %>' ToolTip ='<%# Bind("Position.Title") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Age">
                          <ItemTemplate>
                              <asp:Label ID="LabelAge" runat="server" Text='<%# Bind("Age") %>' ToolTip ='<%# Bind("Age") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                       <%-- <asp:TemplateField HeaderText="SSN">
                          <ItemTemplate>
                              <asp:Label ID="LabelSSN" runat="server" Text='<%# Bind("InsurancePolicy") %>' ToolTip ='<%# Bind("InsurancePolicy") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>--%>
                       <%-- <asp:TemplateField HeaderText="Additional information">
                          <ItemTemplate>
                              <asp:Label ID="LabelInfo" runat="server" Text='<%# Bind("Info") %>' ToolTip ='<%# Bind("Info") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>--%>
                          <%-- <asp:BoundField DataField="DateEmployment" HeaderText="Date of employment" DataFormatString="{0:dd-MM-yyyy}"/>--%>
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