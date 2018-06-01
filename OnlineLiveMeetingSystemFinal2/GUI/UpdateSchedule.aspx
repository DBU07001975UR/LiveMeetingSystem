<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="UpdateSchedule.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.ManageSchedule.Updatechedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
      <span>Welcome to Update Schedule Page</span>
        </div>
    <table >
        <tr>
            <td style="align-content: center">
                <div style="margin-left:auto">
                    <center> <asp:Label style="font-weight:bold" ID="labMessagesucesse" runat="server"></asp:Label></center> 
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ScheduleID" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="ScheduleID" HeaderText="ScheduleID" InsertVisible="False" ReadOnly="True" SortExpression="ScheduleID" />
                <asp:BoundField DataField="FacultyName" HeaderText="FacultyName" InsertVisible="False" SortExpression="FacultyName" ReadOnly="True" />
                <asp:BoundField DataField="DeptName" HeaderText="DeptName" InsertVisible="False"  SortExpression="DeptName" ReadOnly="True" />
                <asp:TemplateField HeaderText="StartDate" SortExpression="StartDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="Startdate" runat="server" Text='<%# Bind("StartDate") %>' TextMode="DateTimeLocal"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Start Date is Required" CssClass="failureNotification" ControlToValidate="Startdate">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EndDate" SortExpression="EndDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="Enddate" runat="server" Text='<%# Bind("EndDate") %>' TextMode="DateTimeLocal"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="End Date is Required" CssClass="failureNotification" ControlToValidate="Enddate">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("EndDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Month" SortExpression="Month">
                    <EditItemTemplate>
                        <asp:TextBox ID="month" runat="server" Text='<%# Bind("Month") %>' TextMode="Month"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Month is Required" CssClass="failureNotification" ControlToValidate="month">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Month") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Agenda" SortExpression="Agenda">
                    <EditItemTemplate>
                        <asp:TextBox ID="Agenda" runat="server" Text='<%# Bind("Agenda") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Agenda is Required" CssClass="failureNotification" ControlToValidate="Agenda">*</asp:RequiredFieldValidator>
                    
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Agenda") %>'></asp:Label>
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" SelectCommand="SELECT Schedule.ScheduleID, Schedule.StartDate, Schedule.EndDate, Schedule.Month, Schedule.Agenda, Faculty.FacultyName, Department.DeptName FROM Department INNER JOIN Faculty ON Department.DeptFacultyCode = Faculty.FacultyCode INNER JOIN Schedule ON Department.DeptCode = Schedule.DeptCode" UpdateCommand="UPDATE Schedule SET StartDate = @StartDate, EndDate = @EndDate, Month = @Month, Agenda = @Agenda WHERE (ScheduleID = @ScheduleID)">
            <UpdateParameters>
                <asp:Parameter Name="StartDate" Type="DateTime"/>
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="Month" Type="String" />
                <asp:Parameter Name="Agenda" Type="String" />
                <asp:Parameter Name="ScheduleID" Type="Int32" />
            </UpdateParameters>
                    </asp:SqlDataSource>
                                     </div>
                    </td>
            </tr>
         </table>
</asp:Content>
