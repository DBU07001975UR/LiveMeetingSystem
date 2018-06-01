<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.ManageAccount.CreateAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
      <span> Welcome to Create User Page</span>
    </div> 
    <span class="failureNotification">
        <asp:Label ID="lblMessage" runat="server" Text="Message" Visible="false"></asp:Label>
        <asp:ValidationSummary ID = "ValidationSummary1" runat="server" />
            </span>
    <fieldset style="width:50%;text-align:center"><legend> Welcome to Create Account Page</legend>
        <table>
            <tr>
                <td  style="margin-left:10%">
                    <asp:Label ID = "UserIDLabel" runat="server" Text="UserID"  meta:resourcekey="UserIDLabelResource1"></asp:Label>
                    :</td>
                <td>
                    <asp:TextBox ID = "UserID" runat="server" CssClass="textEntry"  meta:resourcekey="UserIDResource1" Height="28px" Width="320px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID = "UserIDRequired" runat="server" ErrorMessage="Please Enter User Id and Search First"
                         ControlToValidate="UserID" CssClass="failureNotification" 
                         meta:resourcekey="UserIDRequiredResource1">*</asp:RequiredFieldValidator>
                    <asp:Button ID = "Search" runat="server" Text="Search" OnClick="Search_Click" CausesValidation="False" ValidateRequestMode="Disabled" ValidationGroup="ValidationSummary1" ViewStateMode="Disabled" />
                </td>
            </tr>
            <tr>
                <td>
            <asp:Label ID = "FullNameLabel" runat="server" Text="Full Name:"  meta:resourcekey="FullNameLabelResource1"></asp:Label>
                </td>
                <td>
            <asp:TextBox ID = "FirstName" runat="server" CssClass="textEntry"  meta:resourcekey="FullNameResource1" ReadOnly="True" Width="156px" Height="28px" Enabled="False"></asp:TextBox>
                    <asp:TextBox ID="LastName" runat="server" CssClass="textEntry" ReadOnly="True" Width="156px" Height="28px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID = "UserNameLabel" runat="server" Text="User Name:" meta:resourcekey="UserNameLabelResource1"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID = "UserName" runat="server" CssClass="textEntry" meta:resourcekey="UserNameResource1" Height="28px" Enabled="False" ReadOnly="True" Width="320px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID = "PasswordLabel" runat="server" Text="Password" meta:resourcekey="PasswordLabelResource1"></asp:Label>
                    :</td>
                <td>
                    <asp:TextBox ID = "Password" runat="server" CssClass="passwordEntry" meta:resourcekey="PasswordResource1" Height="28px" Enabled="False" ReadOnly="True" Width="320px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID = "ConfirmPasswordLabel" runat="server" Text="ConfirmPassword:" meta:resourcekey="ConfirmPasswordLabelResource1">
                    </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID = "ConfirmPassword" runat="server" CssClass="passwordEntry"
                         meta:resourcekey="ConfirmPasswordResource1" Height="28px" Enabled="False" ReadOnly="True" Width="320px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID = "StatusLabel" runat="server" Text="Status:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:CheckBox ID = "Status" runat="server" CssClass="inline" Text="Active" Height="28px" Checked="True" Enabled="False" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Button ID = "CreateButton" runat="server" Text="Create"
                         ValidateRequestMode="Enabled" CausesValidation="true" OnClick="CreateButton_Click" Height="30px" Width="60px" />
                    <asp:Button ID="Cancel" runat="server" CausesValidation="False" Height="30px" OnClick="Cancel_Click" Text="Cancel" Width="60px" />
                    <asp:Button ID="Clear" runat="server"  CausesValidation="False" Height="30px" OnClick="Clear_Click" Text="Clear" Width="60px" />
                </td>
            </tr>
        </table>

 </fieldset>  
</asp:Content>
