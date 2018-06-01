<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Default.Master" AutoEventWireup="true" CodeBehind="NewUserPassword.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.ManageAccount.NewUserPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 98%;
        }
        .auto-style2 {
            width: 629px;
            height: 340px;
        }
        .auto-style3 {
            width: 97%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
      <span> Welcome to New Password Generation Page</span>
    </div> 
           <table border="0" style="text-align:center">
        <tr>
            <td>
                <table border="0" style="text-align:center" class="auto-style3" >
                    <tr>
                        <td  colspan="1" style="font-weight: bold; font-size: 12pt; width: 528px;
                            color: black; background-color: silver;text-align:center">
                            Reset Password</td>
                    </tr>
                    <tr>
                        <td colspan="1" style="height: 19px">
                            &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1" style="font-weight: bold; font-size: 15pt; 
                            color: black;text-align:center">
                           You have successfully reset your password you may change it after login again
                            with change password option</td>
                    </tr>
                    <tr>
                        <td  colspan="1" style="font-weight: bold; font-size: 10pt; width: 528px;
                            color: #ffffff">
                            &nbsp; &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td  style="font-weight: bold; color: maroon">
                            Your &nbsp;Password Is:<asp:Label ID="lblPassword" runat="server" Font-Bold="True"
                                ForeColor="#004000" Width="178px"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="1" style="background-color: silver">
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:center" colspan="1">
                            <asp:Button ID="btnLogin" runat="server" Text="LogIn" OnClick="btnLogin_Click" Width="58px" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
