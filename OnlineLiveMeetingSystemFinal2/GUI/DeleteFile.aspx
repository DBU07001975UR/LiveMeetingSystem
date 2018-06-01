<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="DeleteFile.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.ManageFile.DeleteFile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="divSpan">
      <span>Delete File Page</span>
    </div> <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Are You sure to delete ?');" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="ContentType" HeaderText="ContentType" SortExpression="ContentType" />
            <asp:BoundField DataField="FileSize" HeaderText="FileSize" SortExpression="FileSize" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" DeleteCommand="DELETE FROM [tbl_Files] WHERE [id] = @id" InsertCommand="INSERT INTO [tbl_Files] ([UserId], [Name], [ContentType], [Data], [FileSize]) VALUES (@UserId, @Name, @ContentType, @Data, @FileSize)" SelectCommand="SELECT * FROM [tbl_Files]" UpdateCommand="UPDATE [tbl_Files] SET [UserId] = @UserId, [Name] = @Name, [ContentType] = @ContentType, [Data] = @Data, [FileSize] = @FileSize WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserId" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ContentType" Type="String" />
                <asp:Parameter Name="Data" Type="Object" />
                <asp:Parameter Name="FileSize" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserId" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="ContentType" Type="String" />
                <asp:Parameter Name="Data" Type="Object" />
                <asp:Parameter Name="FileSize" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</asp:Content>
