<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.MyAccount.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="divSpan">
      <span>Welcome to ChangePassword Page</span>
        </div>
    <p>
        Use the form below to change your password.
    </p>
    <p>
        <%--New passwords are required to be a minimum of <%= Membership.MinRequiredPasswordLength %> characters in length.--%>
    </p>
     <asp:Label ID="lblMessage" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server" CssClass="failureNotification" />
            <div class="accountInfo">
                <fieldset class="changePassword">
                    <legend>Account Information</legend>
                    <table>
                   <tr><td>
                        <asp:Label ID="CurrentPasswordLabel" runat="server" 
                            AssociatedControlID="CurrentPassword" Width="183px" 
                           >Old Password:</asp:Label></td>
                       <td>
                        <asp:TextBox ID="CurrentPassword" runat="server" CssClass="passwordEntry" 
                            Height="28px" Width="327px" ReadOnly="true"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" 
                             CssClass="failureNotification" ErrorMessage="Old Password is required." ToolTip="Old Password is required." >*</asp:RequiredFieldValidator>
                  </td>  </tr>
                    <tr><td class="auto-style1">
                        <asp:Label ID="NewPasswordLabel" runat="server" 
                            AssociatedControlID="NewPassword" >New Password:</asp:Label></td>
                        <td><asp:TextBox ID="NewPassword" runat="server" CssClass="passwordEntry" 
                            TextMode="Password"  Height="28px" Width="327px" MaxLength="16" MinLength="8"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" 
                             CssClass="failureNotification" ErrorMessage="New Password is required." ToolTip="New Password is required." >*</asp:RequiredFieldValidator>
                            </td></tr>
                    <tr><td>
                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" 
                            AssociatedControlID="ConfirmNewPassword" 
                           >Confirm New Password:</asp:Label></td>
                       <td><asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="passwordEntry" 
                            TextMode="Password"  Height="28px" Width="327px" MaxLength="16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" 
                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="Confirm New Password is required."
                             ToolTip="Confirm New Password is required." >*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                            ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry.">*</asp:CompareValidator>
                    </td></tr>
                    <tr><td class="auto-style1">
                    <asp:Label ID="QuestionLabel" runat="server" 
                            AssociatedControlID="Question" 
                           >Question:</asp:Label></td>
                    <td><asp:DropDownList ID="Question" runat="server" CssClass="textEntry" Height="28px">
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
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" 
                             CssClass="failureNotification" ErrorMessage="Question is required." ToolTip="Question is required." >*</asp:RequiredFieldValidator>
                    </td></tr>
                    <tr><td class="auto-style1">
                        <asp:Label ID="AnswerLabel" runat="server" 
                            AssociatedControlID="Answer" 
                           >Answer:</asp:Label></td>
                       <td> <asp:TextBox ID="Answer" runat="server" CssClass="textEntry" 
                              Height="28px" Width="327px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" 
                             CssClass="failureNotification" ErrorMessage="Answer is required." ToolTip="Answer is required." >*</asp:RequiredFieldValidator>
                   </td></tr>
                    



 
                <tr><td colspan="2" style="text-align:center">
                    <asp:Button ID="ChangePasswordPushButton" runat="server" 
                        CommandName="ChangePassword" Text="Change Password" OnClick="ChangePasswordPushButton_Click" Width="139px"/>
                    <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"  OnClick="CancelPushButton_Click"/>
                </td></tr>
                        </table>
                </fieldset>
            </div>
   
                
</asp:Content>
