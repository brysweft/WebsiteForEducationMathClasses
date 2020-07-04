<%@ Page Title="" Language="C#" MasterPageFile="~/face/FaceSite.Master" AutoEventWireup="true" CodeBehind="kruzhgroup.aspx.cs" Inherits="DP2.teacher.kruzhgroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style8
        {
            height: 25px;
        }





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
    <p class="Заголовок">
        Кружковая группа</p>
    <table style="width:100%;" class="Окно3">
        <tr>
            <td align="right">
                Кружок:
            </td>
            <td align="left" width="50%">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource2" DataTextField="Название" DataValueField="KruzhId" 
                    Width="300px" AppendDataBoundItems="True" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>__________</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" class="style8">
                Дата начала:</td>
            <td align="left" width="50%" class="style8">
                <asp:Label ID="LabelBegin" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style8">
                Дата окончания:</td>
            <td align="left" width="50%" class="style8">
                <asp:Label ID="LabelEnd" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style8">
                Показать онлайн:</td>
            <td align="left" width="50%" class="style8">
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" />
            </td>
        </tr>
        </table>

          <p align="center">
                          <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" BackColor="#1F342B" BorderColor="White" 
                    BorderWidth="0px" CellPadding="4" DataKeyNames="UserId,KruzhId" 
                    DataSourceID="SqlDataSource1" ForeColor="White" GridLines="Vertical" 
                    EmptyDataText="Нет участников кружка" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" Visible="False">
                    <Columns>
                        <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" 
                            SortExpression="UserId" Visible="False" />
                        <asp:BoundField DataField="KruzhId" HeaderText="KruzhId" ReadOnly="True" 
                            SortExpression="KruzhId" Visible="False" />
                        <asp:TemplateField HeaderText="НазваниеДисциплины" 
                            SortExpression="НазваниеДисциплины" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("НазваниеДисциплины") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" 
                                    Text='<%# Bind("НазваниеДисциплины") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="НазваниеКружка" SortExpression="НазваниеКружка" 
                            Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("НазваниеКружка") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("НазваниеКружка") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Логин" SortExpression="UserName">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Фамилия" HeaderText="Фамилия" 
                            SortExpression="Фамилия" />
                        <asp:BoundField DataField="Имя" HeaderText="Имя" SortExpression="Имя" />
                        <asp:BoundField DataField="Статус" HeaderText="Статус" SortExpression="Статус" 
                            Visible="False" />
                        <asp:BoundField DataField="ДатаПодачи" HeaderText="Дата вступления" 
                            SortExpression="ДатаПодачи" />
                        <asp:CheckBoxField DataField="Online" HeaderText="Online" 
                            SortExpression="Online" />
                        <asp:CommandField ButtonType="Button" SelectText="Действие" 
                            ShowSelectButton="True" />
                    </Columns>
                    <EmptyDataRowStyle BorderColor="#949494" 
                        BorderStyle="Outset" BorderWidth="2px" />
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#955029" />
                    <PagerStyle ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#330000" />
                </asp:GridView>

       </p>

      <p align="center">
                    <asp:Panel ID="Panel1" runat="server" CssClass="Окно" Height="100px" 
                    Visible="False" Width="500px">
                    <br />
                    Выберите действие<br />&nbsp;<br />&nbsp;<asp:Button 
                        ID="ButtonSent" runat="server" 
                        Text="Написать сообщение" onclick="ButtonSent_Click" />
                    &nbsp;<asp:Button ID="ButtonDel" runat="server" 
                        Text="Удалить из кружка" onclick="ButtonDel_Click" />
                    &nbsp;&nbsp;<asp:Button ID="ButtonCancel" runat="server" 
                        Text="Отмена" onclick="ButtonCancel_Click" />
                </asp:Panel>

       </p>

    <p align="center">
                <asp:Panel ID="Panel2" runat="server" CssClass="Окно" Height="150px" 
                    Visible="False" Width="500px">
                    <br />
                    <asp:TextBox ID="TextBoxMsg" runat="server" Height="50px" TextMode="MultiLine" 
                        Width="250px"></asp:TextBox>
                    <br />
                    <br />&nbsp;&nbsp;<asp:Button 
                        ID="ButtonSent2" runat="server" 
                        Text="Отправить" onclick="ButtonSent2_Click" />
                    &nbsp;&nbsp;&nbsp;<asp:Button ID="ButtonCancel2" runat="server" 
                        Text="Отмена" onclick="ButtonCancel2_Click" />
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="Label" Visible="False"></asp:Label>
                </asp:Panel>
               &nbsp;</p>
    <p align="center"  >
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            
            
            SelectCommand="SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, Subjects.Название AS НазваниеДисциплины, Kruzhki.Название AS НазваниеКружка, aspnet_Users.UserName, Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи, UsersOnline.Online FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId INNER JOIN UsersOnline ON aspnet_Users.UserId = UsersOnline.UserId INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId">
        </asp:SqlDataSource>
    </p>
    <p align="center"  >
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT * FROM [Kruzhki]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
