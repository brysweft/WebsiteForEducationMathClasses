<%@ Page Title="" Language="C#" MasterPageFile="~/face/FaceSite.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="DP2.face.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style8
        {
            height: 54px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel2" runat="server" CssClass="Панель2">
        <table style="width:100%;">
            <tr>
                <td align="right">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center" class="style8">
                    <asp:ImageButton ID="ImageButton2" runat="server" BackColor="Aqua" 
                        BorderStyle="Outset" BorderWidth="5px" Height="50px" 
                        ImageUrl="~/Properties/icons/птицаП.png" onclick="ImageButton2_Click" 
                        Width="80px" />
                    <asp:ImageButton ID="ImageButton1" runat="server" BackColor="White" 
                        BorderStyle="Outset" BorderWidth="5px" Height="50px" 
                        ImageUrl="~/Properties/icons/сова2П.png" onclick="ImageButton1_Click" 
                        Width="80px" />
                    <asp:ImageButton ID="ImageButton3" runat="server" BackColor="White" 
                        BorderStyle="Outset" BorderWidth="5px" Height="50px" 
                        ImageUrl="~/Properties/icons/сова3П.png" onclick="ImageButton3_Click" 
                        Width="80px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <asp:Panel ID="Panel1" runat="server" CssClass="Панель1">
                    <br />
                    <br />
                    <table style="width:100%;">
                        <tr>
                            <td align="center" width="50%">
                                Общее количество выполненных кружковых работ (ОКР)</td>
                            <td align="center">
                                Общее количество баллов в кружках (ОКБК)</td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="LabelKR" runat="server" Text="нет данных"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="LabelOKBK" runat="server" Text="нет данных"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <asp:LinkButton ID="LinkButton8" runat="server" Font-Bold="False" 
                        ForeColor="#003366" onclick="LinkButton8_Click">Показать подробно</asp:LinkButton>
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="3" DataSourceID="SqlDataSource1" Visible="False">
                        <Columns>
                            <asp:BoundField DataField="UserName" HeaderText="Логин" 
                                SortExpression="UserName" Visible="False" />
                            <asp:BoundField DataField="ФИО" HeaderText="ФИО" SortExpression="ФИО" 
                                Visible="False" />
                            <asp:BoundField DataField="НазваниеДисциплины" HeaderText="Дисциплина" 
                                SortExpression="НазваниеДисциплины" />
                            <asp:BoundField DataField="НазваниеКружка" HeaderText="Кружок" 
                                SortExpression="НазваниеКружка" />
                            <asp:BoundField DataField="КБК" HeaderText="КБК" SortExpression="ОКБК" />
                            <asp:BoundField DataField="КР" HeaderText="КР" SortExpression="КР" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                    <br />
                </asp:Panel>
                <br />
            </asp:View>
            <br />
            <asp:View ID="View2" runat="server">
                <asp:Panel ID="Panel3" runat="server" CssClass="Панель1">
                    <br />
                    <br />
                    <table style="width:100%;">
                        <tr>
                            <td align="center" width="50%">
                                Общее количество выполненных тестов (ОКТ)</td>
                            <td align="center">
                                Общее количество баллов в тестах (ОКБТ)</td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="LabelKT" runat="server" Text="нет данных"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="LabelOKBT" runat="server" Text="нет данных"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <asp:LinkButton ID="LinkButton9" runat="server" Font-Bold="False" 
                        ForeColor="#005383" onclick="LinkButton9_Click">Показать подробно</asp:LinkButton>
                    <br />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="3" DataSourceID="SqlDataSource2" Visible="False">
                        <Columns>
                            <asp:BoundField DataField="UserName" HeaderText="Логин" 
                                SortExpression="UserName" Visible="False" />
                            <asp:BoundField DataField="ФИО" HeaderText="ФИО" ReadOnly="True" 
                                SortExpression="ФИО" Visible="False" />
                            <asp:BoundField DataField="НазваниеДисциплины" HeaderText="Дисциплина" 
                                SortExpression="НазваниеДисциплины" />
                            <asp:BoundField DataField="НазваниеКружка" HeaderText="Кружок" 
                                SortExpression="НазваниеКружка" />
                            <asp:BoundField DataField="КТ" HeaderText="КТ" ReadOnly="True" 
                                SortExpression="КТ" />
                            <asp:BoundField DataField="ОКБТ" HeaderText="КБТ" ReadOnly="True" 
                                SortExpression="ОКБТ" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                    <br />
                </asp:Panel>
                <br />
            </asp:View>
            <asp:View ID="View3" runat="server">
                <asp:Panel ID="Panel4" runat="server" CssClass="Панель1">
                    <br />
                    <br />
                    <table style="width:100%;">
                        <tr>
                            <td align="center" width="50%">
                                Общее количество выполненных серий задач (ОКС)</td>
                            <td align="center">
                                Общее количество баллов заработанных на сериях задач (ОКБС)</td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="LabelKS" runat="server" Text="Нет данных"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:Label ID="LabelOKBS" runat="server" Text="Нет данных"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:LinkButton ID="LinkButton10" runat="server" Font-Bold="False" 
                        ForeColor="#005383" onclick="LinkButton10_Click">Показать подробно</asp:LinkButton>
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="3" DataSourceID="SqlDataSource3" Visible="False">
                        <Columns>
                            <asp:BoundField DataField="UserName" HeaderText="Логин" 
                                SortExpression="UserName" Visible="False" />
                            <asp:BoundField DataField="ФИО" HeaderText="ФИО" ReadOnly="True" 
                                SortExpression="ФИО" Visible="False" />
                            <asp:BoundField DataField="НазваниеДисциплины" HeaderText="Дисциплина" 
                                SortExpression="НазваниеДисциплины" />
                            <asp:BoundField DataField="НазваниеКружка" HeaderText="Кружок" 
                                SortExpression="НазваниеКружка" />
                            <asp:BoundField DataField="КС" HeaderText="КС" ReadOnly="True" 
                                SortExpression="КС" />
                            <asp:BoundField DataField="ОКБС" HeaderText="КБС" ReadOnly="True" 
                                SortExpression="ОКБС" />
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                    <br />
                </asp:Panel>
                <br />
            </asp:View>
            <br />
            <br />
        </asp:MultiView>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT aspnet_Users.UserName, Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество AS ФИО, Subjects.Название AS НазваниеДисциплины, Kruzhki.Название AS НазваниеКружка, SUM(Works.Баллы) AS ОКБК, COUNT(Works.WorkId) AS КР FROM Users INNER JOIN UsersKruzhki ON Users.UserId = UsersKruzhki.UserId INNER JOIN Kruzhki ON UsersKruzhki.KruzhId = Kruzhki.KruzhId INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId INNER JOIN Works ON UsersKruzhki.UserId = Works.Владелец AND UsersKruzhki.KruzhId = Works.Кружок INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId WHERE (Works.Статус = N'проверено') GROUP BY aspnet_Users.UserName, Users.Фамилия, Users.Имя, Users.Отчество, Works.Владелец, Works.Кружок, Kruzhki.Название, Kruzhki.Дисциплина, Subjects.Название, Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT aspnet_Users.UserName, Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество AS ФИО, Subjects.Название AS НазваниеДисциплины, Kruzhki.Название AS НазваниеКружка, COUNT(TestRez.TestRezId) AS КТ, SUM(TestRez.Баллы) AS ОКБТ FROM Users INNER JOIN UsersKruzhki ON Users.UserId = UsersKruzhki.UserId INNER JOIN Kruzhki ON UsersKruzhki.KruzhId = Kruzhki.KruzhId INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId INNER JOIN TestRez ON UsersKruzhki.UserId = TestRez.Владелец AND UsersKruzhki.KruzhId = TestRez.Кружок GROUP BY aspnet_Users.UserName, Users.Фамилия, Users.Имя, Users.Отчество, Kruzhki.Название, Kruzhki.Дисциплина, Subjects.Название, Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество, TestRez.Владелец, TestRez.Кружок">
        </asp:SqlDataSource>
    </p>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT aspnet_Users.UserName, Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество AS ФИО, Subjects.Название AS НазваниеДисциплины, Kruzhki.Название AS НазваниеКружка, SUM(TaskRez.Баллы) AS ОКБС, COUNT(TaskRez.TaskRezId) AS КС FROM Users INNER JOIN UsersKruzhki ON Users.UserId = UsersKruzhki.UserId INNER JOIN Kruzhki ON UsersKruzhki.KruzhId = Kruzhki.KruzhId INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId INNER JOIN TaskRez ON UsersKruzhki.UserId = TaskRez.Владелец AND UsersKruzhki.KruzhId = TaskRez.Кружок GROUP BY aspnet_Users.UserName, Users.Фамилия, Users.Имя, Users.Отчество, Kruzhki.Название, Kruzhki.Дисциплина, Subjects.Название, Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество, TaskRez.Владелец, TaskRez.Кружок">
    </asp:SqlDataSource>
    <p>
        &nbsp;</p>
</asp:Content>
