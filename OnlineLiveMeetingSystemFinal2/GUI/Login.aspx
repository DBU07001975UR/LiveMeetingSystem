<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Default.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
      <span>Welcome to User Login Page</span>
        </div>
    <div style="float:left">
                <asp:Image ID="Image1" runat="server" Width="640px" Height="450px" ImageUrl="~/Images/key_lock-animated.gif" />
    </div>
    <div style="float:right; margin-top:160px">
        <fieldset><legend>
                        <asp:Image ID="Image2" runat="server" Width="150px" Height="25px" ImageUrl="~/Images/loginhere.jpg" /></legend>
        <table class="auto-style2">
            <tr>
                <td colspan="3" class="auto-style9">
                    <asp:Label ID="labErrorUser" runat="server" Text="Incorrect Username or password" Style="color: red" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="font-size:large;" class="auto-style3">User Name :</td><td class="auto-style4"><asp:TextBox ID="txtUserName" runat="server" Height="28px" Width="296px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User Name Is Required" ControlToValidate="txtUserName" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="font-size:large;" class="auto-style1">Password :</td><td class="auto-style5"><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Height="28px" Width="296px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="PasswordRequiered" runat="server" ErrorMessage="Password is Required" ControlToValidate="txtPassword" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" class="auto-style6">
                    <asp:Button ID="btnLogin1" runat="server" Text="Login" Width="89px" OnClick="btnLogin1_Click" Height="38px" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <%-- passworrd recovery done here --%>
                    <asp:LinkButton ID="ForgotPassword" ForeColor="#000000" runat="server" OnClick="ForgotPassword_Click1" CausesValidation="False">Forgot My Password</asp:LinkButton>
                </td>
            </tr>
        </table>
            </fieldset>
        </div>
</asp:Content>
