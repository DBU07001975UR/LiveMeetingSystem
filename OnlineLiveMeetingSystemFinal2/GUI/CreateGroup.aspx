<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="CreateGroup.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.ManageGroup.CreateGroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-right: 0px;
        }
        .auto-style2 {
            width: 232px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
      <span>Welcome to Create Meeting Group page</span>
        </div>
    <fieldset style="width:40%; text-align:center"><legend>Create Meeting Group</legend>

        <table>
            <tr>
                <td>
                    <asp:Label ID="lblMessage" Visible="false" runat="server" Text="Label"></asp:Label>
                </td>
                </tr>
            <tr>
                <td colspan="3" style="color:red">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                </td>
            </tr>
            <tr>
                    <td class="style1">
                        <asp:Label ID="Label1" runat="server" Text="Faculty :"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlFaculty" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFaculty_SelectedIndexChanged" Height="28px" Width="220px" CssClass="auto-style1">
                        </asp:DropDownList></td><td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlFaculty"
                            Display="Dynamic" ErrorMessage=" Faculty/Colleges are Required" ForeColor="#FF3300" InitialValue="-1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label2" runat="server" Text="Department :"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlDepartment" runat="server" AutoPostBack="True" Height="28px" Width="220px" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                        </asp:DropDownList></td><td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlDepartment"
                            Display="Dynamic" ErrorMessage=" Departments are Required" ForeColor="#FF3300" InitialValue="-1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
            <tr>
                <td>
                    <asp:Label ID="GroupNameLabel" runat="server" Text="Group Name:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="GroupName" runat="server" Height="28px" Width="220px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Group Name is Required" BackColor="#CCFFCC" ForeColor="#FF3300" ControlToValidate="GroupName">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="UserIDLabel" runat="server" Text="Plenary:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlUserID" runat="server" Height="28px" Width="220px" DataSourceID="SqlDataSource1" DataTextField="UserId" DataValueField="UserId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" SelectCommand="SELECT [UserId], [RoleId], [UserRoleId] FROM [UserRole] WHERE ([RoleId] = @RoleId)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="4" Name="RoleId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="UserRoleLabel" runat="server" Text="Meeting Leader:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlUserRole" runat="server" Height="28px" Width="220px" DataSourceID="SqlDataSource2" DataTextField="UserId" DataValueField="UserId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" SelectCommand="SELECT [UserRoleId], [UserId], [RoleId] FROM [UserRole] WHERE ([RoleId] = @RoleId)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="3" Name="RoleId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="ScheduleIDLabel" runat="server" Text="Schedules:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlScheduleID" runat="server" Height="28px" Width="220px" DataSourceID="SqlDataSource3" DataTextField="Agenda" DataValueField="ScheduleID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" SelectCommand="SELECT [ScheduleID], [Agenda] FROM [Schedule]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="text-align:center">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Create" runat="server" Text="Create" ForeColor="Black" Height="30px" Width="60px" OnClick="Create_Click" />
                    <asp:Button ID="Cancel" runat="server" Text="Cancel"  CausesValidation="False" Height="30px" Width="60px" OnClick="Cancel_Click" />
                    <asp:Button ID="Clear" runat="server" Text="Clear"  CausesValidation="False" Height="30px" Width="60px" OnClick="Clear_Click" />
                </td>
            </tr>
        </table>

    </fieldset>
</asp:Content>
