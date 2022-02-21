<%@ Page Title="Positions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewPositions.aspx.cs" Inherits="ChainStores.View.Positions.ViewPositions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div>      <br />       <br />
            <asp:TextBox ID="textSearch" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Button ID="buttonSearch" runat="server" Text="Filter" OnClick="buttonSearch_Click"  CssClass="btn btn-primary"/>
             <asp:Button ID="s" Text="Add" runat="server" OnClick="ButtonAdd_Click" CssClass="btn btn-primary"/>
                <asp:GridView Id="gridViewPositions" runat="server" OnRowCommand="gridViewPositions_RowCommand" OnRowDataBound="gridViewPositions_RowDataBound"  AutoGenerateColumns="false" CssClass="table" > 
                    <Columns> 
                         <asp:TemplateField HeaderText="Code position">
                          <ItemTemplate>
                              <asp:Label ID="LabelCode" runat="server" Text='<%# Bind("CodePosition") %>' ToolTip ='<%# Bind("CodePosition") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Position">
                          <ItemTemplate>
                              <asp:Label ID="LabelTitle" runat="server" Text='<%# Bind("Title") %>' ToolTip ='<%# Bind("Title") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Salary">
                          <ItemTemplate>
                              <asp:Label ID="LabelSalary" runat="server" Text='<%# Bind("Salary") %>' ToolTip ='<%# Bind("Salary") %>'></asp:Label>
                          </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Job descriptions">
                          <ItemTemplate>
                              <asp:Label ID="LabelJobDescriptions" runat="server" Text='<%# Bind("JobDescriptions") %>' ToolTip ='<%# Bind("JobDescriptions") %>'></asp:Label>
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