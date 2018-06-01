<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="ViewSchedule.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.ManageSchedule.ViewSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
        <span>Welcome to View Schedule Page</span>
    </div>
    <table >
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label1" runat="server" Text="Faculty:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlFaculty" runat="server" Height="27px" Width="212px" OnSelectedIndexChanged="ddlFaculty_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
            </td>

        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label2" runat="server" Text="Department:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlDepartment" runat="server" Height="27px" Width="212px" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
            </td>

        </tr>
        <tr>
            <td colspan="2" style="align-content: center">
                <div style="margin-left:auto">
                    <center> <asp:Label style="font-weight:bold" ID="labMessagesucesse" runat="server"></asp:Label></center> 
                <asp:GridView ID="ScheduleGrid" runat="server" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="ScheduleID" HeaderText="Scedule ID" SortExpression="ScheduleID" />
                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" />
                        <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
                        <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                        <asp:BoundField DataField="Agenda" HeaderText="Agenda" SortExpression="Agenda" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                </asp:GridView>

                </div>

            </td>

        </tr>
    </table>
</asp:Content>
