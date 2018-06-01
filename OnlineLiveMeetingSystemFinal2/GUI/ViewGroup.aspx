<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="ViewGroup.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.ManageGroup.ViewGroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
      <span>Welcome to View Meeting Group page</span>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="GroupID" DataSourceID="SqlDataSource1" Height="80%"  BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="GroupID" HeaderText="GroupID" InsertVisible="False" ReadOnly="True" SortExpression="GroupID" />
                <asp:BoundField DataField="GroupName" HeaderText="GroupName" SortExpression="GroupName" />
                <asp:BoundField DataField="PlenaryID" HeaderText="PlenaryID" SortExpression="PlenaryID" />
                <asp:BoundField DataField="LeaderID" HeaderText="LeaderID" SortExpression="LeaderID" />
                <asp:BoundField DataField="ScheduleID" HeaderText="ScheduleID" SortExpression="ScheduleID" />
                <asp:BoundField DataField="FacultyName" HeaderText="FacultyName" SortExpression="FacultyName" />
                <asp:BoundField DataField="DeptName" HeaderText="DeptName" SortExpression="DeptName" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" SelectCommand="SELECT MeetingGroup.GroupID, MeetingGroup.GroupName, MeetingGroup.PlenaryID, MeetingGroup.LeaderID, MeetingGroup.ScheduleID, Faculty.FacultyName, Department.DeptName FROM Faculty INNER JOIN Department ON Faculty.FacultyCode = Department.DeptFacultyCode INNER JOIN MeetingGroup ON Department.DeptCode = MeetingGroup.DeptCode"></asp:SqlDataSource>
</asp:Content>
