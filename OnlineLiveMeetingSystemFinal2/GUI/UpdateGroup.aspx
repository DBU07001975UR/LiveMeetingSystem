<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="UpdateGroup.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.ManageGroup.UpdateGroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
      <span>Welcome to Update Meeting Group page</span>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="GroupID" DataSourceID="SqlDataSource1" Height="80%"  BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="GroupID" HeaderText="GroupID" InsertVisible="False" ReadOnly="True" SortExpression="GroupID" />
                 <asp:BoundField DataField="FacultyName" HeaderText="FacultyName" InsertVisible="False" SortExpression="FacultyName" ReadOnly="True" />
                <asp:BoundField DataField="DeptName" HeaderText="DeptName" InsertVisible="False"  SortExpression="DeptName" ReadOnly="True" />
                <asp:TemplateField HeaderText="GroupName" SortExpression="GroupName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("GroupName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Group Name is Required" BackColor="#CCFFCC" ForeColor="#FF3300" ControlToValidate="TextBox1">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("GroupName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PlenaryID" SortExpression="PlenaryID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlUserID" SelectedValue='<%# Bind("PlenaryID") %>' runat="server" Height="28px" Width="220px" DataSourceID="SqlDataSource1" DataTextField="UserId" DataValueField="UserId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" SelectCommand="SELECT [UserId], [RoleId], [UserRoleId] FROM [UserRole] WHERE ([RoleId] = @RoleId)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="4" Name="RoleId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("PlenaryID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LeaderID" SortExpression="LeaderID">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlUserRole" SelectedValue='<%# Bind("LeaderID") %>' runat="server" Height="28px" Width="220px" DataSourceID="SqlDataSource2" DataTextField="UserId" DataValueField="UserId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" SelectCommand="SELECT [UserRoleId], [UserId], [RoleId] FROM [UserRole] WHERE ([RoleId] = @RoleId)">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="3" Name="RoleId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("LeaderID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ScheduleID" SortExpression="ScheduleID">
                    <EditItemTemplate>
                         <asp:DropDownList ID="ddlScheduleID" SelectedValue='<%# Bind("ScheduleID") %>'  runat="server" Height="28px" Width="220px" DataSourceID="SqlDataSource3" DataTextField="ScheduleID" DataValueField="ScheduleID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" SelectCommand="SELECT [ScheduleID] FROM [Schedule]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ScheduleID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
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
