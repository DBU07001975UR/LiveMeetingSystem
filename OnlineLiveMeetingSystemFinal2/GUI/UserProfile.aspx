<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.MyAccount.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
      <span>MY Profile</span>
        </div>
    <asp:Label ID="lblMessage" runat="server" Text="Message" Visible="false"></asp:Label>
    <table class="style1">
        <tr>
            <td class="style2">
                User Name :
            </td>
            <td class="style3">
                <asp:Label ID="username" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
         <tr>
            <td class="style2">
                First
                Name :
            </td>
            <td class="style3">
               <%-- <%= User.Identity.Name %>--%>
                <asp:Label ID="firstname" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Last Name :
            </td>
            <td class="style3">
                <asp:Label ID="lastname" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Password :
            </td>
            <td class="style3">
                <asp:Label ID="password" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center">
                <a href="ChangePassword.aspx">Change Password</a>
            </td>
        </tr>
    </table>
</asp:Content>
