<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="StoreFile.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.ManageFile.StoreFile" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
<div class="divSpan">
      <span>  Store File in to the Database</span>
    </div> 
    <table>
        <tr>
            <td>
<asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true"></asp:FileUpload>
            </td>
            <td>
<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" style="height: 26px" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblMessage" runat="server" Text="Label" Visible="false"></asp:Label>
            </td>
        </tr>
    </table>
        <hr />
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="File Name" />
                <asp:BoundField DataField="FileSize" HeaderText="FileSize" />
                <asp:BoundField DataField="ContentType" HeaderText="FileType" />
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
</asp:Content>
