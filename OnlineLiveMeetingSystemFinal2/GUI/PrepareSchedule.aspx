<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="PrepareSchedule.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.ManageSchedule.PrepareSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
      <span>Welcome to Prepare Schedule Page</span>
        </div>

        <table style="text-align:center; margin-left:10%">
            <tr>
                <td colspan="3" style="color:red">
                    <asp:Label ID="lblMessage" runat="server" Text="Label" Visible="false"></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="failureNotification" />
                </td>
            </tr>
            <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Faculty :"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlFaculty" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFaculty_SelectedIndexChanged" Height="43px" Width="449px">
                        </asp:DropDownList></td><td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlFaculty"
                            Display="Dynamic" ErrorMessage="Required" ForeColor="#FF3300" InitialValue="-1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Department :"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="True" Height="29px" Width="450px">
                        </asp:DropDownList></td><td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlDepartment"
                            Display="Dynamic" ErrorMessage="Required" ForeColor="#FF3300" InitialValue="-1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
            <tr>
                <td>
                    <asp:Label ID="StartDateLabel" runat="server" Text="Start Date:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="StartDate" runat="server" TextMode="DateTimeLocal" Height="22px" Width="450px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Start Date is Required" CssClass="failureNotification" ControlToValidate="StartDate">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="EndDateLabel" runat="server" Text="End Date:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="EndDate" runat="server" TextMode="DateTimeLocal" Height="22px" Width="450px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Star Date is Required" CssClass="failureNotification" ControlToValidate="EndDate">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="MonthLabel" runat="server" Text="Month:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="Month" runat="server" TextMode="Month" Height="22px" Width="450px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Month is Required" CssClass="failureNotification" ControlToValidate="Month">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="AgendaLabel" runat="server" Text="Agenda:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="Agenda" runat="server" Height="250px" TextMode="MultiLine" Width="450px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                    <asp:Button ID="Save" runat="server" Text="Save" Height="28px" Width="60px" OnClick="Save_Click" />
                    <asp:Button ID="Cancel" runat="server" Text="Cancel" Height="28px" Width="60px" OnClick="Cancel_Click" CausesValidation="False" />
                    <asp:Button ID="Clear" runat="server" Text="Clear" Height="28px" Width="60px"  OnClick="Clear_Click" CausesValidation="False" /></td>
            </tr>
        </table>
</asp:Content>
