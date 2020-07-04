<%@ Page Title="" Language="C#" MasterPageFile="~/face/FaceSite.Master" AutoEventWireup="true" CodeBehind="workcheck.aspx.cs" Inherits="DP2.teacher.workcheck" %>
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

        .style8
        {
            height: 42px;
        }

        .style9
        {
            height: 25px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p align="center" class="Заголовок">Проверка кружковых работ</p>
<p align="center"  >
    <table style="width: 100%;" class="Окно3">
        <tr>
            <td align="right" width="25%">
                Кружок:</td>
            <td align="left" width="25%">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" AppendDataBoundItems="True" 
                    DataTextField="Название" DataValueField="KruzhId" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>__________</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td align="right" width="25%">
                Струдент:</td>
            <td align="left" width="50%" style="width: 16%">
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource3" 
                    DataTextField="ФИО" DataValueField="UserId" 
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                    <asp:ListItem>__________</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" class="style8">
                Дата начала:</td>
            <td align="left" width="25%" class="style8">
                <asp:Label ID="LabelBegin" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td align="right" width="25%" class="style8">
                Дата регистрации&nbsp; в кружке:</td>
            <td align="left" width="25%" class="style8">
                <asp:Label ID="LabelReg" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3">
                Дата окончания:</td>
            <td align="left" width="75%" class="style3" colspan="3">
                <asp:Label ID="LabelEnd" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" class="style9">
                Показать не провереные:</td>
            <td align="left" width="75%" colspan="3" class="style9">
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" 
                    oncheckedchanged="CheckBox1_CheckedChanged" />
            </td>
        </tr>
        </table>
</p>
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" BackColor="#1F342B" BorderColor="White" 
                    BorderWidth="0px" CellPadding="4" DataKeyNames="WorkId" 
                    DataSourceID="SqlDataSource2" ForeColor="White" GridLines="Vertical" 
                    EmptyDataText="Нет работ" Visible="False" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" 
                    onrowcommand="GridView1_RowCommand" onrowediting="GridView1_RowEditing" 
                    onrowupdating="GridView1_RowUpdating" onrowdeleted="GridView1_RowDeleted" 
                    onrowupdated="GridView1_RowUpdated" onsorted="GridView1_Sorted">
                    <Columns>
                        <asp:BoundField DataField="WorkId" HeaderText="WorkId" 
                            SortExpression="WorkId" Visible="False" />
                        <asp:BoundField DataField="Владелец" HeaderText="Владелец" 
                            SortExpression="Владелец" Visible="False" ReadOnly="True" />
                        <asp:BoundField DataField="Кружок" HeaderText="Кружок" SortExpression="Кружок" 
                            Visible="False" ReadOnly="True" />
                        <asp:BoundField DataField="НазваниеФайла" HeaderText="Название файла" 
                            SortExpression="НазваниеФайла" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Путь" SortExpression="Путь" Visible="False">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Путь") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Путь") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ссылка" SortExpression="Ссылка" Visible="False">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Ссылка") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Ссылка") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ДатаЗагрузки" HeaderText="Дата загрузки" 
                            SortExpression="ДатаЗагрузки" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Статус" SortExpression="Статус">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownListS" runat="server">
                                <asp:ListItem>проверено</asp:ListItem>
                                <asp:ListItem>не засчитано</asp:ListItem>
                                </asp:DropDownList>      
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Статус") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Баллы" SortExpression="Баллы">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxB" runat="server"  TextMode="Number" Text='<%# Bind("Баллы") %>' MaxLength="6"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server"   Text='<%# Bind("Баллы") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Комментарий" SortExpression="Комментарий">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBoxK"  runat="server" Text='<%# Bind("Комментарий") %>' TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Комментарий") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" SelectText="Действие" 
                            ShowSelectButton="True" />
                        <asp:CommandField ButtonType="Button" EditText="Оценить" ShowEditButton="True" 
                            UpdateText="Ок" />
                    </Columns>
                    <EmptyDataRowStyle BorderColor="#949494" 
                        BorderStyle="Outset" BorderWidth="2px" />
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#955029" />
                    <PagerStyle ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#330000" />
                </asp:GridView>
    <p align="center">
    
                <asp:Panel ID="Panel2" runat="server" CssClass="Окно" Height="100px" 
                    Visible="False" Width="500px">
                    <br />
                    Выберите действие<br />
                    <br />
                    &nbsp;<asp:Button ID="ButtonLoad" runat="server" Text="Скачать" 
                        onclick="ButtonLoad_Click" />
                    &nbsp;&nbsp;<asp:Button ID="ButtonDell" runat="server" Text="Удалить" 
                        onclick="ButtonDell_Click" />
                    &nbsp;<asp:Button ID="ButtonCancel3" runat="server" 
                        Text="Отмена" onclick="ButtonCancel3_Click" />
                </asp:Panel>
                <asp:Panel ID="Panel1" runat="server" CssClass="Окно" Height="150px" 
                    Visible="False" Width="500px">
                    <br />
                    Вы действительно хотите удалить работу?<br /> Удаление проверенной работы 
                    приведет к потере баллов пользователя.<br />&nbsp;<br />&nbsp;<asp:Button 
                        ID="ButtonОк2" runat="server" onclick="ButtonОк2_Click" style="height: 25px" 
                        Text="Да" />
                    &nbsp;<asp:Button ID="ButtonCancel2" runat="server" Text="Нет" 
                        onclick="ButtonCancel2_Click" />
                </asp:Panel>
    
    </p>
    <p align="center">


    </p>
    <p align="center">
    
    </p>


<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    
        SelectCommand="SELECT KruzhId, Название, Дисциплина, Описание, ДатаНачала, ДатаОкончания FROM Kruzhki WHERE (ДатаОкончания &gt; GETDATE())"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    
        SelectCommand="SELECT Works.WorkId, Works.Владелец, Works.Кружок, Works.НазваниеФайла, Works.Путь, Works.Ссылка, Works.ДатаЗагрузки, Works.Статус, Works.Баллы, Works.Комментарий FROM Works INNER JOIN UsersKruzhki ON Works.Владелец = UsersKruzhki.UserId AND Works.Кружок = UsersKruzhki.KruzhId INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId"></asp:SqlDataSource>
<p align="center"  >
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT DISTINCT Users.UserId, Users.Фамилия, Users.Имя, Users.Отчество, Users.УчебноеЗаведение, Users.Группа, Users.Телефон, Users.Фамилия + N' ' + Users.Имя + N' ' + Users.Отчество AS ФИО FROM Users INNER JOIN UsersKruzhki ON Users.UserId = UsersKruzhki.UserId WHERE (UsersKruzhki.Статус = N'принято')">
    </asp:SqlDataSource>
    </p>
    <p align="center"  >&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
       

</asp:Content>
