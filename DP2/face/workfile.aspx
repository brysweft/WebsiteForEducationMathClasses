<%@ Page Title="" Language="C#" MasterPageFile="~/face/FaceSite.Master" AutoEventWireup="true" CodeBehind="workfile.aspx.cs" Inherits="DP2.face.workfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<p align="center" class="Заголовок">Загрузить кружковую работу</p>
    <asp:Panel ID="Panel1" runat="server" CssClass="Окно3">
        <table style="width:100%;">
            <tr>
                <td align="right">
                    Кружок:</td>
                <td align="left">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource4" DataTextField="Принадлежность" 
                        DataValueField="KruzhId" Width="600px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Файл:</td>
                <td align="left">
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="500px" />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="ButtonLoad" runat="server" onclick="ButtonLoad_Click" 
                        Text="Загрузить" />
                </td>
            </tr>
            <tr>
                <td align="center" class="style3" colspan="2">
                    &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Visible="False">HyperLink</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
                <br __designer:mapid="3c0" />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
        SelectCommand="SELECT * FROM [Kruzhki]"></asp:SqlDataSource>
    <p>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            
            SelectCommand="SELECT        Subjects.Название + N'\' + Kruzhki.Название AS Принадлежность, UsersKruzhki.UserId, UsersKruzhki.KruzhId, UsersKruzhki.Статус
FROM            Subjects INNER JOIN
                         Kruzhki ON Subjects.SubjectId = Kruzhki.Дисциплина INNER JOIN
                         UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId
GROUP BY Subjects.Название, Kruzhki.Название, Subjects.Название + N'\' + Kruzhki.Название, UsersKruzhki.UserId, UsersKruzhki.KruzhId, UsersKruzhki.Статус
HAVING        (UsersKruzhki.Статус = N'принято')"></asp:SqlDataSource>
    </p>
    <p align="center">&nbsp;</p>
</asp:Content>
