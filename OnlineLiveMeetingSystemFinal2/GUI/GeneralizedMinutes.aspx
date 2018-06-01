<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="GeneralizedMinutes.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.GUI.Report.GeneralizedMinutes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
      <span>Welcome to summarized meeting Page.</span>
        </div>
    <table border="1" style="background-color:white; color:#05011b; font-family:Arial;">
        <tr>
            <td style="width:1150px; height:480px"> 
                <asp:TextBox ID="txtMinutes" runat="server" Height="480px" Width="850px" ReadOnly="False" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Minutes are required ." ControlToValidate="txtMinutes" CssClass="failureNotification"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click" />
            </td>
            </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblMessage" runat="server" Text="Label" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
