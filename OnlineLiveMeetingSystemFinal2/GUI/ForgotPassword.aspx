<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Default.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.ManageAccount.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
      <span> Welcome to Password Recover Page</span>
    </div> 
        <table>
            <tr>
                <td colspan="3" style="text-align:center; font-family:'Times New Roman';font-size:18px;font:bold">Please Enter You Information then click Continue</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="UserNameLabel" runat="server" Text="Login Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="UserName" runat="server" Height="28px" Width="314px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Login Name is Required." ControlToValidate="UserName" CssClass="failureNotification">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="PasswordQuestionLabel" runat="server" Text="Your Security Question:"></asp:Label>
                </td>
                
                <td>
                    <asp:DropDownList ID="Question1" runat="server" CssClass="textEntry" Height="28px" Width="314px">
                        <asp:ListItem Text="Choose The Question..." Value=""></asp:ListItem>
                            <asp:ListItem Text="What Is your favorite book?" Value="What Is your favorite book?"></asp:ListItem>
                            <asp:ListItem Text="What is the name of the road you grew up on?" Value="What is the name of the road you grew up on?"></asp:ListItem>
                            <asp:ListItem Text="What is your mother’s maiden name?" Value="What is your mother’s maiden name?"></asp:ListItem>
                            <asp:ListItem Text="What was the name of your first/current/favorite pet?" Value="What was the name of your first/current/favorite pet?"></asp:ListItem>
                            <asp:ListItem Text="What was the first company that you worked for?" Value="What was the first company that you worked for?"></asp:ListItem>
                            <asp:ListItem Text="Where did you meet your spouse?" Value="Where did you meet your spouse?"></asp:ListItem>
                            <asp:ListItem Text="Where did you go to high school/college?" Value="Where did you go to high school/college?"></asp:ListItem>
                            <asp:ListItem Text="What is your favorite food?" Value="What is your favorite food?"></asp:ListItem>
                            <asp:ListItem Text="What city were you born in?" Value="What city were you born in?"></asp:ListItem>
                            <asp:ListItem Text="Where is your favorite place to vacation?" Value="here is your favorite place to vacation?"></asp:ListItem>
                    </asp:DropDownList></td>
                  <td><asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question1" 
                             CssClass="failureNotification" ErrorMessage="Question is required." ToolTip="Question is required." >*</asp:RequiredFieldValidator>
                       </td>
                      </tr>
            <tr>
                <td >
                    <asp:Label ID="PasswordAnswerLabel" runat="server" Text="Your Secrity Answer:"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="Answer" runat="server" Height="28px" Width="314px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Your Password Answer is Required." ControlToValidate="Answer" CssClass="failureNotification">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Label ID="lblMessage" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
                    <asp:Button ID="Continue" runat="server"  Height="42px" Text="Continue" Width="80px" OnClick="Continue_Click" />
                    <asp:Button ID="Cancel" runat="server"  CausesValidation="False" Height="42px" Text="Cancel" Width="80px" OnClick="Cancel_Click" />
                </td>
            </tr>
        </table>
    </asp:Content>
