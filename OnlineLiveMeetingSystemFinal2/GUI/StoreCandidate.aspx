<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="StoreCandidate.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.GUI.ManageVoting.StoreCandidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }

        .auto-style2 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
        <span>Welcome To set Candidates Page.</span>
    </div>
    <table runat="server" id="ddlselect" style="margin-top:40px">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Select Candidate Types:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="CandidateType" runat="server" OnSelectedIndexChanged="CandidateType_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Text="--select candidate type---" Value="-1"></asp:ListItem>
                    <asp:ListItem Text="Persons Candidate" Value="Candidate">
                    </asp:ListItem>
                    <asp:ListItem Text="Issues Candidate" Value="Issue">
                    </asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <table runat="server" id="tableissue" visible="false" style="margin-top:40px">
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Enter The Issue:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtIssue" TextMode="MultiLine" runat="server" Width="296px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Issue is required" ControlToValidate="txtIssue" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:Button ID="StoreIssue" runat="server" Text="Store Issue" OnClick="StoreIssue_Click" />
            </td>
        </tr>
    </table>
    <table runat="server" id="tablecandidate" visible="false" style="margin-top:40px">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="candidate" runat="server" Text="Selecte candidates ID :"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:DropDownList ID="userid" runat="server" Height="28px" Width="215px" DataSourceID="SqlDataSource1" DataTextField="FirstName" DataValueField="UserId"></asp:DropDownList>
            </td>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="Store" runat="server" Text="Store Candidates" OnClick="Store_Click" />
            </td>
        </tr>
    </table>
    <center>
    <asp:Label ID="lblMessage" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Button ID="Back" runat="server" Text="Goto Back" OnClick="Back_Click" Visible="false" CausesValidation="False" />
<asp:Button ID="Cancel" runat="server" Text="Cancel" CausesValidation="false" OnClick="Cancel_Click"></asp:Button>
        </center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>"
        SelectCommand="SELECT UserAccount.UserId, UserRole.RoleId, [User].FirstName, [User].LastName, [User].Sex FROM UserAccount INNER JOIN UserRole ON UserAccount.UserId = UserRole.UserId INNER JOIN [User] ON UserAccount.UserId = [User].UserId WHERE (UserRole.RoleId = 4) AND (UserAccount.UserId NOT IN (SELECT UserID FROM Candidates))"></asp:SqlDataSource>
</asp:Content>
