<%@ Page Title="" Language="C#" MasterPageFile="~/face/FaceSite.Master" AutoEventWireup="true" CodeBehind="message.aspx.cs" Inherits="DP2.face.message" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">






    .Окно
    {
        font-family: "Times New Roman", Times, serif;
        font-size: larger;
        font-weight: bolder;
        color: #FFFFFF;
        border: 1px outset #C0C0C0;
        background-image: url('../Properties/fons/фон1.png');
        
       
    }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p align="center" class="Заголовок">
Ваши сообщения
</p>
    <p align="center">


        <table style="width: 100%;" class="Окно3">
            <tr>
                <td align="right">
                    Сообщения:</td>
                <td align="left" width="50%">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                <asp:GridView ID="GridView1" runat="server" 
                    AutoGenerateColumns="False" BorderColor="White" 
                    BorderWidth="0px" CellPadding="4" DataKeyNames="MsgId,IdTo,IdFrom" 
                    DataSourceID="SqlDataSource1" ForeColor="White" GridLines="Vertical" 
                    EmptyDataText="Нет сообщений" Visible="False" BackColor="#1F342B">
                    <Columns>
                        <asp:BoundField DataField="MsgId" HeaderText="MsgId" 
                            SortExpression="MsgId" ReadOnly="True" Visible="False" />
                        <asp:BoundField DataField="UserFrom" HeaderText="UserFrom" 
                            SortExpression="UserFrom" Visible="False" />
                        <asp:BoundField DataField="UserTo" HeaderText="UserTo" SortExpression="UserTo" 
                            Visible="False" />
                        <asp:BoundField DataField="Text" HeaderText="Текст сообщения" 
                            SortExpression="Text" />
                        <asp:BoundField DataField="Date" HeaderText="Дата" SortExpression="Date" />
                        <asp:CheckBoxField DataField="Status" HeaderText="Status" 
                            SortExpression="Status" Visible="False" />
                        <asp:BoundField DataField="IdTo" HeaderText="IdTo" ReadOnly="True" 
                            SortExpression="IdTo" Visible="False" />
                        <asp:BoundField DataField="IdFrom" HeaderText="IdFrom" ReadOnly="True" 
                            SortExpression="IdFrom" Visible="False" />
                        <asp:BoundField DataField="Отправитель" HeaderText="Отправитель" 
                            ReadOnly="True" SortExpression="Отправитель" />
                        <asp:BoundField DataField="Получатель" HeaderText="Получатель" ReadOnly="True" 
                            SortExpression="Получатель" />
                    </Columns>
                    <EmptyDataRowStyle BorderColor="#949494" 
                        BorderStyle="Outset" BorderWidth="2px" />
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#955029" />
                    <PagerStyle ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#330000" />
                    <SortedAscendingCellStyle BackColor="White" />
                    <SortedAscendingHeaderStyle BackColor="#FFFFCC" />
                </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                        Text="Показать сообщения" />
                </td>
                <td class="style3">
                    <asp:Button ID="ButtonDelAll" runat="server" onclick="ButtonDelAll_Click" 
                        Text="Удалить все" Visible="False" />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                <asp:Panel ID="Panel1" runat="server" Height="200px" Width="500px">
                    Написать администратору<br />
                    <br />
                    <asp:TextBox ID="TextBoxMsg1" runat="server" BackColor="#1A2F26" 
                        ForeColor="White" Height="50px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                    <br />
                    <br />
                    &nbsp;&nbsp;<asp:Button ID="ButtonSent1" runat="server" onclick="ButtonSent1_Click" 
                        Text="Отправить" />
                    &nbsp;&nbsp;&nbsp;<br />
                    <asp:Label ID="Label7" runat="server" Text="Label" Visible="False" 
                        Font-Bold="False" ForeColor="Black"></asp:Label>
                </asp:Panel>
                    <br />
                </td>
            </tr>
            </table>
    </p>
    <p>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT Msgs.MsgId, Msgs.UserFrom, Msgs.UserTo, Msgs.Text, Msgs.Date, Msgs.Status, Users_1.UserId AS IdTo, Users.UserId AS IdFrom, Users.Фамилия + N' ' + Users.Имя + N' ' + Users.Отчество AS Отправитель, Users_1.Фамилия + N' ' + Users_1.Имя + N' ' + Users_1.Отчество AS Получатель FROM Users INNER JOIN Msgs ON Users.UserId = Msgs.UserFrom INNER JOIN Users AS Users_1 ON Msgs.UserTo = Users_1.UserId">
        </asp:SqlDataSource>
    </p>
</asp:Content>
