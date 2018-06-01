<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.Report.Attendance" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
      <span>Welcome to Attendance Page</span>
        </div>
        <table border="1" style="background-color:white; color:#05011b; font-family:Arial;">
        <tr>
            <td style="min-height:230px" class="auto-style1">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" SortExpression="UserId" />
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                        <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
                        <asp:BoundField DataField="FacultyName" HeaderText="FacultyName" SortExpression="FacultyName" />
                        <asp:BoundField DataField="DeptName" HeaderText="DeptName" SortExpression="DeptName" />
                        <asp:BoundField DataField="LoginDate" HeaderText="LoginDate" SortExpression="LoginDate" />
                        <asp:BoundField DataField="LogoutDate" HeaderText="LogoutDate" SortExpression="LogoutDate" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>"
                     SelectCommand="SELECT [User].UserId, [User].FirstName, [User].LastName, [User].Sex, Faculty.FacultyName, Department.DeptName, tbl_UserLoginHistory.LoginDate, tbl_UserLogoutHistory.LogoutDate FROM Faculty INNER JOIN Department ON Faculty.FacultyCode = Department.DeptFacultyCode INNER JOIN tbl_UserLoginHistory ON Department.DeptCode = tbl_UserLoginHistory.DeptCode INNER JOIN tbl_UserLogoutHistory ON Department.DeptCode = tbl_UserLogoutHistory.DeptCode INNER JOIN [User] ON Department.DeptCode = [User].DeptCode">
                </asp:SqlDataSource>
                </td>
            </tr>
            </table>
        </asp:Content>
