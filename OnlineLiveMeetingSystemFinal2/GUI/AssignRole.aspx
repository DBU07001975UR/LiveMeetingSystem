<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="AssignRole.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.ManageAccount.AssignRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style3 {
        text-align: left;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
      <span> Welcome to Assign Role Page</span>
    </div> 
    <span  class="failureNotification">
        <asp:Label ID="lblMessage" runat="server" Text="Label" Visible="false"></asp:Label>
       
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" /></span>
    <p style="font-weight:bold;">Search User Account</p>

        <table style="text-align:center">
            <tr>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server" Text="User Name:"></asp:Label>
                </td>
                <td>
                    &nbsp;
                    <asp:TextBox ID="UserName" runat="server" CssClass="textEntry" Height="28px" Width="220px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" CssClass="failureNotification" ErrorMessage="Please Enter User Name and Search First.">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Button ID="SearchButton" runat="server" Text="Search" Width="76px" OnClick="SearchButton_Click" CausesValidation="False" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="FirstNameLabel" runat="server" Text="First Name:"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="FirstName" runat="server" CssClass="textEntry" Height="28px" ReadOnly="True" Width="220px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LastNameLabel" runat="server" Text="Last Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="LastName" runat="server" CssClass="textEntry" Height="28px" Width="220px" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
        </table>
          <p style="font-weight:bold"> Assign User Role</p>

        <table style="text-align:center">
            <tr>
                <td>
                    <asp:Label ID="RoleLabel" runat="server" Text="Role:"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlRole" runat="server" DataTextField="RoleName" DataValueField="RoleId" Height="28px" Width="150px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td >
                    <asp:Label ID="EffectiveDateLabel" runat="server" Text="Effective Date:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="EffectiveDate" runat="server" TextMode="DateTimeLocal" Height="28px" Width="220px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EffectiveDate" CssClass="failureNotification" ErrorMessage="Effective Date is Required">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="ExpiredDateLabel" runat="server" Text="Expired Date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="ExpiredDate" runat="server" TextMode="DateTimeLocal" Height="28px" Width="220px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ExpiredDate" CssClass="failureNotification" ErrorMessage="Expired Date is Required">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="AssignButton" runat="server" Text="Assign"  Height="30px" OnClick="AssignButton_Click1" Width="60px" />
                    <asp:Button ID="CancelButton" runat="server" Text="Cancel"  CausesValidation="False" Height="30px" OnClick="CancelButton_Click" Width="60px" />
                    <asp:Button ID="Clear" runat="server" CausesValidation="False" Height="30px" OnClick="Clear_Click" Text="Clear" Width="60px" />
                </td>
            </tr>
        </table>
</asp:Content>
