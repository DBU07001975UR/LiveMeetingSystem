<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="ViewUserAccount.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.ManageAccount.ViewUserAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="divSpan">
      <span> View User Account Information</span>
    </div> 
         <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="SqlDataSource1" Height="80%" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" style="margin-right: 0px">
             <AlternatingRowStyle BackColor="#CCCCCC" />
             <Columns>
                 <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" />
                 <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                 <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                 <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                 <asp:BoundField DataField="RoleId" HeaderText="RoleId" SortExpression="RoleId" />
                 <asp:BoundField DataField="RoleName" HeaderText="RoleName" SortExpression="RoleName" />
             </Columns>
             <FooterStyle BackColor="#CCCCCC" />
             <HeaderStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
             <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F1F1F1" />
             <SortedAscendingHeaderStyle BackColor="Gray" />
             <SortedDescendingCellStyle BackColor="#CAC9C9" />
             <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>"
             SelectCommand="SELECT UserAccount.UserId, UserAccount.UserName, UserAccount.Password, UserAccount.Status, UserRole.RoleId, Role.RoleName FROM UserAccount INNER JOIN UserRole ON UserAccount.UserId = UserRole.UserId INNER JOIN Role ON UserRole.RoleId = Role.RoleId"></asp:SqlDataSource>
</asp:Content>

