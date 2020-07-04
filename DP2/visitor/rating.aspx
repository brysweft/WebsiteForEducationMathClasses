<%@ Page Title="" Language="C#" MasterPageFile="~/visitor/Main.Master" AutoEventWireup="true" CodeBehind="rating.aspx.cs" Inherits="DP2.visitor.rating" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<p align="center" class="Заголовок">Рейтинг пользователей</p>
    <p align="center">
        <table align="center" class="Окно3" style="width:100%;">
            <tr>
                <td align="center" width="34%">
                    По кружковым заданиям</td>
                <td align="center">
                    По тестам</td>
                <td align="center">
                    По задачам</td>
            </tr>
            <tr>
                <td align="center">
                    <asp:ImageButton ID="ImageButton2" runat="server" BackColor="Aqua" 
                        BorderStyle="Outset" BorderWidth="5px" Height="50px" 
                        ImageUrl="~/Properties/icons/птицаП.png" onclick="ImageButton2_Click" 
                        Width="80px" />
                    </td>
                <td align="center">
                    <asp:ImageButton ID="ImageButton1" runat="server" BackColor="White" 
                        BorderStyle="Outset" BorderWidth="5px" Height="50px" 
                        ImageUrl="~/Properties/icons/сова2П.png" onclick="ImageButton1_Click" 
                        Width="80px" />
                    </td>
                <td align="center">
                    <asp:ImageButton ID="ImageButton3" runat="server" BackColor="White" 
                        BorderStyle="Outset" BorderWidth="5px" Height="50px" 
                        ImageUrl="~/Properties/icons/сова3П.png" onclick="ImageButton3_Click" 
                        Width="80px" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
            <div align="center" class="Панель2"  >
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="SqlDataSource1" Height="183px" 
                    AllowSorting="True" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="Логин" 
                            SortExpression="UserName" />
                        <asp:BoundField DataField="ФИО" HeaderText="ФИО" ReadOnly="True" 
                            SortExpression="ФИО" />
                        <asp:BoundField DataField="ОКБК" HeaderText="Общее количество баллов" 
                            ReadOnly="True" SortExpression="ОКБК" />
                        <asp:BoundField DataField="КР" HeaderText="Общее количество работ" 
                            ReadOnly="True" SortExpression="КР" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                </div>
            </asp:View>
            <br />
            <asp:View ID="View2" runat="server">
            <div align="center" class="Панель2"  >
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="SqlDataSource2" AllowSorting="True" 
                    ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Логин" HeaderText="Логин" SortExpression="Логин" />
                        <asp:BoundField DataField="ФИО" HeaderText="ФИО" ReadOnly="True" 
                            SortExpression="ФИО" />
                        <asp:BoundField DataField="ОКБТ" HeaderText="Общее количество баллов" 
                            ReadOnly="True" SortExpression="ОКБТ" />
                        <asp:BoundField DataField="КТ" HeaderText="Общее количество выполненных тестов" 
                            ReadOnly="True" SortExpression="КТ" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                </div>
            </asp:View>
            <asp:View ID="View4" runat="server">
            <div align="center" class="Панель2"  >  <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" DataSourceID="SqlDataSource3" AllowSorting="True" 
                    ForeColor="#333333" GridLines="None" Height="290px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="Логин" 
                            SortExpression="UserName" />
                        <asp:BoundField DataField="ФИО" HeaderText="ФИО" ReadOnly="True" 
                            SortExpression="ФИО" />
                        <asp:BoundField DataField="ОКБС" HeaderText="Общее количество баллов" 
                            ReadOnly="True" SortExpression="ОКБС" />
                        <asp:BoundField DataField="КС" 
                            HeaderText="Общее количество выполненных серий задач" ReadOnly="True" 
                            SortExpression="КС" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>&nbsp;</div>
            </asp:View>
            <br />
        </asp:MultiView>
                </td>
            </tr>
            <tr>
                <td colspan="3">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
                        SelectCommand="SELECT aspnet_Users.UserName, Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество AS ФИО, SUM(Works.Баллы) AS ОКБК, COUNT(Works.WorkId) AS КР FROM Users INNER JOIN UsersKruzhki ON Users.UserId = UsersKruzhki.UserId INNER JOIN Kruzhki ON UsersKruzhki.KruzhId = Kruzhki.KruzhId INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId INNER JOIN Works ON UsersKruzhki.UserId = Works.Владелец AND UsersKruzhki.KruzhId = Works.Кружок INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId WHERE (Works.Статус = N'проверено') GROUP BY aspnet_Users.UserName, Users.Фамилия, Users.Имя, Users.Отчество, Works.Владелец, Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество ORDER BY ОКБК DESC">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
                        SelectCommand="SELECT aspnet_Users.UserName AS Логин, Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество AS ФИО, SUM(TestRez.Баллы) AS ОКБТ, COUNT(TestRez.TestRezId) AS КТ FROM Users INNER JOIN UsersKruzhki ON Users.UserId = UsersKruzhki.UserId INNER JOIN Kruzhki ON UsersKruzhki.KruzhId = Kruzhki.KruzhId INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId INNER JOIN TestRez ON UsersKruzhki.UserId = TestRez.Владелец AND UsersKruzhki.KruzhId = TestRez.Кружок GROUP BY aspnet_Users.UserName, Users.Фамилия, Users.Имя, Users.Отчество, Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество, TestRez.Владелец ORDER BY ОКБТ DESC">
        </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
                        SelectCommand="SELECT aspnet_Users.UserName, Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество AS ФИО, SUM(TaskRez.Баллы) AS ОКБС, COUNT(TaskRez.TaskRezId) AS КС FROM Users INNER JOIN UsersKruzhki ON Users.UserId = UsersKruzhki.UserId INNER JOIN Kruzhki ON UsersKruzhki.KruzhId = Kruzhki.KruzhId INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId INNER JOIN TaskRez ON UsersKruzhki.UserId = TaskRez.Владелец AND UsersKruzhki.KruzhId = TaskRez.Кружок GROUP BY aspnet_Users.UserName, Users.Фамилия, Users.Имя, Users.Отчество, Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество, TaskRez.Владелец ORDER BY ОКБС DESC">
    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </p>

</asp:Content>
