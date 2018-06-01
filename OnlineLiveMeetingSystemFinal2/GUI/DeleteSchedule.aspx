<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="DeleteSchedule.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.ManageSchedule.DeleteSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
      <span>Welcome to Delete Schedule page</span>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
             AutoGenerateColumns="False" 
            DataKeyNames="ScheduleID" DataSourceID="SqlDataSource1" 
             AllowSorting="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Are You sure to delete ?');" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ScheduleID" HeaderText="ScheduleID" InsertVisible="False" ReadOnly="True" SortExpression="ScheduleID" />
                <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
                <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
                <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" 
            DeleteCommand="DELETE FROM [MeetingGroup] WHERE [ScheduleID] = @ScheduleID DELETE FROM [Schedule] WHERE [ScheduleID] = @ScheduleID" 
            InsertCommand="INSERT INTO [Schedule] ([StartDate], [EndDate], [Month], [Agenda]) VALUES (@StartDate, @EndDate, @Month, @Agenda)" 
            SelectCommand="SELECT Schedule.ScheduleID, Schedule.StartDate, Schedule.EndDate, Schedule.Month, Faculty.FacultyName, Department.DeptName FROM Faculty INNER JOIN Department ON Faculty.FacultyCode = Department.DeptFacultyCode INNER JOIN Schedule ON Department.DeptCode = Schedule.DeptCode" 
            UpdateCommand="UPDATE [Schedule] SET [StartDate] = @StartDate, [EndDate] = @EndDate, [Month] = @Month, [Agenda] = @Agenda WHERE [ScheduleID] = @ScheduleID">
            <DeleteParameters>
                <asp:Parameter Name="ScheduleID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="Month" Type="String" />
                <asp:Parameter Name="Agenda" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="Month" Type="String" />
                <asp:Parameter Name="Agenda" Type="String" />
                <asp:Parameter Name="ScheduleID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>
