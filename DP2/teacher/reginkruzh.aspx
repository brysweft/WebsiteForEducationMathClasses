<%@ Page Title="" Language="C#" MasterPageFile="~/face/FaceSite.Master" AutoEventWireup="true" CodeBehind="reginkruzh.aspx.cs" Inherits="DP2.teacher.reginkruzh" %>
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
            height: 25px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<p align="center" class="Заголовок">Записать в кружок</p>
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
                Показывать обработанные заявки:</td>
            <td align="left" width="50%" class="style8">
                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" 
                    oncheckedchanged="CheckBox1_CheckedChanged" />
            </td>
        </tr>
        </table>
    <p align="center"  >
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" BackColor="#1F342B" BorderColor="White" 
                    BorderWidth="0px" CellPadding="4" DataKeyNames="UserId,KruzhId" 
                    DataSourceID="SqlDataSource1" ForeColor="White" GridLines="Vertical" 
                    EmptyDataText="Нет заявок в этот кружок" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" Visible="False">
                    <Columns>
                        <asp:TemplateField HeaderText="UserId" SortExpression="UserId" Visible="False">
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("UserId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="KruzhId" SortExpression="KruzhId" 
                            Visible="False">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("KruzhId") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("KruzhId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Логин" SortExpression="UserName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Фамилия" SortExpression="Фамилия">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Фамилия") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Фамилия") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Имя" SortExpression="Имя">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Имя") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Имя") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Статус" SortExpression="Статус">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Статус") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Статус") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Дата вступления" SortExpression="ДатаПодачи">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ДатаПодачи") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ДатаПодачи") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
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
    <p align="center"  >
                    <asp:Panel ID="Panel1" runat="server" CssClass="Окно" Height="100px" 
                    Visible="False" Width="500px">
                    <br />
                    Выберите действие для обработки заявки<br />&nbsp;<br />&nbsp;<asp:Button 
                        ID="ButtonОк" runat="server" onclick="ButtonОк_Click" 
                        Text="Записать" />
                    &nbsp;<asp:Button ID="ButtonNo" runat="server" onclick="ButtonNo_Click" 
                        Text="Отклонить" />
                    &nbsp;&nbsp;<asp:Button ID="ButtonCancel" runat="server" onclick="ButtonCancel_Click" 
                        Text="Отмена" />
                </asp:Panel>
    
    </p>
    <p align="center"  >
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, aspnet_Users.UserName, Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId">
        </asp:SqlDataSource>
    </p>
    <p align="center"  >
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT * FROM [Kruzhki]"></asp:SqlDataSource>
    </p>
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
</asp:Content>
