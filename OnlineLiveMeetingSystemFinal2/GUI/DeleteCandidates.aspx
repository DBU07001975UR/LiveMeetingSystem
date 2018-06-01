<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="DeleteCandidates.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.GUI.ManageVoting.DeleteCandidates" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="divSpan">
      <span>   Welcome to delete candidates from the store after votted Page.</span>
    </div> 
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Are You sure to delete ?');" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
            <asp:BoundField DataField="CandidateID" HeaderText="CandidateID" SortExpression="CandidateID" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
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
     DeleteCommand="DELETE FROM Candidates" 
    SelectCommand="SELECT [User].UserId, Candidates.CandidateID, [User].FirstName, [User].LastName, [User].Sex, Faculty.FacultyName, Department.DeptName FROM [User] INNER JOIN Candidates ON [User].UserId = Candidates.UserID INNER JOIN Department ON [User].DeptCode = Department.DeptCode AND Candidates.DeptCode = Department.DeptCode INNER JOIN Faculty ON Department.DeptFacultyCode = Faculty.FacultyCode">
</asp:SqlDataSource>
</asp:Content>


