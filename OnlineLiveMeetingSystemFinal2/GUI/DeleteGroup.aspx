<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="DeleteGroup.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.ManageGroup.DeleteGroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div class="divSpan">
      <span>Welcome to Delete Meeting Group page</span>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="GroupID" DataSourceID="SqlDataSource1" Height="80%" BackColor="White" BorderColor="#003366" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Are You sure to delete ?');" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="GroupID" HeaderText="GroupID" InsertVisible="False" ReadOnly="True" SortExpression="GroupID" />
                <asp:BoundField DataField="GroupName" HeaderText="GroupName" SortExpression="GroupName" />
                <asp:BoundField DataField="PlenaryID" HeaderText="PlenaryID" SortExpression="PlenaryID" />
                <asp:BoundField DataField="LeaderID" HeaderText="LeaderID" SortExpression="LeaderID" />
                <asp:BoundField DataField="ScheduleID" HeaderText="ScheduleID" SortExpression="ScheduleID" />
                <asp:BoundField DataField="FacultyName" HeaderText="FacultyName" SortExpression="FacultyName" />
                <asp:BoundField DataField="DeptName" HeaderText="DeptName" SortExpression="DeptName" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="#669999" BorderColor="Black" BorderWidth="1px" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" 
            DeleteCommand="DELETE FROM [MeetingGroup] WHERE [GroupID] = @GroupID" 
            InsertCommand="INSERT INTO [MeetingGroup] ([GroupName], [PlenaryID], [LeaderID], [ScheduleID]) VALUES (@GroupName, @PlenaryID, @LeaderID, @ScheduleID)" 
            SelectCommand="SELECT MeetingGroup.GroupID, MeetingGroup.GroupName, MeetingGroup.PlenaryID, MeetingGroup.LeaderID, MeetingGroup.ScheduleID, Faculty.FacultyName, Department.DeptName FROM Faculty INNER JOIN Department ON Faculty.FacultyCode = Department.DeptFacultyCode INNER JOIN MeetingGroup ON Department.DeptCode = MeetingGroup.DeptCode" 
            UpdateCommand="UPDATE [MeetingGroup] SET [GroupName] = @GroupName, [PlenaryID] = @PlenaryID, [LeaderID] = @LeaderID, [ScheduleID] = @ScheduleID WHERE [GroupID] = @GroupID">
            <DeleteParameters>
                <asp:Parameter Name="GroupID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="GroupName" Type="String" />
                <asp:Parameter Name="PlenaryID" Type="String" />
                <asp:Parameter Name="LeaderID" Type="String" />
                <asp:Parameter Name="ScheduleID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="GroupName" Type="String" />
                <asp:Parameter Name="PlenaryID" Type="String" />
                <asp:Parameter Name="LeaderID" Type="String" />
                <asp:Parameter Name="ScheduleID" Type="Int32" />
                <asp:Parameter Name="GroupID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>
