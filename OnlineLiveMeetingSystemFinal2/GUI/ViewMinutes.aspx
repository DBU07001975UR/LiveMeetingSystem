<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Site.Master" AutoEventWireup="true" CodeBehind="ViewMinutes.aspx.cs" Inherits="OnlineLiveMeetingSystemFinal2.Report.ViewMinutes" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #TextArea1 {
            width: 1137px;
            height: 451px;
        }
        #Minutes {
            height: 479px;
            width: 1135px;
        }
        #txtMinutes {
            width: 1143px;
        }
        #minutess {
            width: 1139px;
        }
    .auto-style1 {
        width: 100%;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="divSpan">
      <span>Welcome to View  Minutes Page.</span>
        </div>
    <table border="1" style="background-color:white; color:#05011b; font-family:Arial;">
        <tr>
            <td> 
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" Height="100%" DataKeyNames="UserId">
                    <Columns>
                        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" ReadOnly="True" />
                        <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                        <asp:BoundField DataField="FacultyName" HeaderText="FacultyName" SortExpression="FacultyName" />
                        <asp:BoundField DataField="DeptName" HeaderText="DeptName" SortExpression="DeptName" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                        <asp:TemplateField HeaderText="Minutes" SortExpression="Minutes">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" TextMode="MultiLine" Width="450px" Height="250px" runat="server" Text='<%# Bind("Minutes") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Minutes") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBLMS %>" SelectCommand="SELECT [UserId], [FirstName], [LastName], [FacultyName], [DeptName], [Date], [Minutes] FROM [vw_Minutes]"></asp:SqlDataSource>
                &nbsp;</td>
            
        </tr>
    </table>
</asp:Content>
