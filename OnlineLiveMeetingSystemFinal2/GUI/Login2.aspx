<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.GUI.ConductMeeting.Login2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .validationSummary {
    font-family: "Segoe UI" ,Arial,Helvetica,sans-serif;
    font-size: 12px;
}
.validators input, 
.validators input.rfdTextInput {
    margin-bottom: 3px;
}
 
.fieldRow {
    margin-top: 4px;
}
.fieldRow label {
    width: 140px;
    display: block;
    float: left;
}
 
.RadForm_MetroTouch .mtFix {
    margin-top: 50px;
}
 
.demo-container strong {
    display: block;
    font-size: 14px;
    margin-bottom: 30px;
}
 
.size-custom {
    min-width:400px;
    min-height:328px;
}
 
.demo-containers {
    max-width:1000px;
    margin:0 auto;
}
        .auto-style1 {
            text-align: right;
        }
    </style>
    <script>
        (function (global, underfined) {
            var TelerikDemo = global.TelerikDemo = {};

            TelerikDemo.ResetPage = function (sender, args) {
                window.location.reload();
            };
        })(window);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="divSpan">
      <span>Login to the Meeting.</span>
        </div>
    <div style="float:left; margin:2px">
        <asp:Image ID="Image1" runat="server" Width="650px" Height="450px" ImageUrl="~/Images/login.jpg" />
    </div>
    <div class="demo-container size-custom" style="margin-top:80px; float: right">
        <fieldset><legend>
            <asp:Image ID="Image2" runat="server" Width="150px" Height="25px" ImageUrl="~/Images/loginhere.jpg" /></legend>
                            <table>
                                <tr>
                                    <td>
                                        <table >
                                            <tr>
                                                <td class="auto-style1">
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="UserName" runat="server" Height="24px" Width="256px" ReadOnly="True"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                        ErrorMessage="User Name is required." ToolTip="User Name is required."  ForeColor="Red">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style1">
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" Height="24px" Width="256px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                        ErrorMessage="Password is required." ToolTip="Password is required." ForeColor="Red">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="color: Red;">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time."  Visible="false"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="text-align: center;">
                                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" style="text-align: center" OnClick="LoginButton_Click"></asp:Button>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                    <asp:Label ID="LabelLogin" Text="" Font-Size="Large" ForeColor="Green" runat="server"></asp:Label>
            </fieldset>
            </div>
</asp:Content>
