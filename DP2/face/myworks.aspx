<%@ Page Title="" Language="C#" MasterPageFile="~/face/FaceSite.Master" AutoEventWireup="true" CodeBehind="myworks.aspx.cs" Inherits="DP2.face.myworks" %>
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

        .style9
        {
            height: 25px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p align="center" class="Заголовок" >Мои работы</p>

    <table style="width: 100%;" class="Окно3">
        <tr>
            <td align="right" width="50%" class="style9">
                Кружок:</td>
            <td align="left" class="style9" width="50%">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" AppendDataBoundItems="True" 
                    DataTextField="Название" DataValueField="KruzhId">
                    <asp:ListItem>__________</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                Дата начала:</td>
            <td align="left">
                <asp:Label ID="LabelBegin" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                Дата окончания:</td>
            <td align="left" width="50%">
                <asp:Label ID="LabelEnd" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        </table>

                <asp:GridView ID="GridView1" runat="server" 
                    AutoGenerateColumns="False" BackColor="#1F342B" BorderColor="White" 
                    BorderWidth="0px" CellPadding="4" DataKeyNames="WorkId" 
                    DataSourceID="SqlDataSource2" ForeColor="White" GridLines="Vertical" 
                    EmptyDataText="Нет работ" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" Visible="False">
                    <Columns>
                        <asp:TemplateField HeaderText="WorkId" SortExpression="WorkId" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("WorkId") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("WorkId") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Владелец" SortExpression="Владелец" 
                            Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Владелец") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Владелец") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Кружок" SortExpression="Кружок" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Кружок") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Кружок") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Название файла" SortExpression="НазваниеФайла">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("НазваниеФайла") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("НазваниеФайла") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Путь" SortExpression="Путь" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Путь") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Путь") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ссылка" SortExpression="Ссылка" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Ссылка") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Ссылка") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Дата загрузки" SortExpression="ДатаЗагрузки">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("ДатаЗагрузки") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ДатаЗагрузки") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Статус" SortExpression="Статус">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Статус") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Статус") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Баллы" SortExpression="Баллы">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("Баллы") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Баллы") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Комментарий" SortExpression="Комментарий">
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("Комментарий") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Комментарий") %>'></asp:TextBox>
                            </EditItemTemplate>
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
     
     <p align="center" >
     
     
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:Panel ID="Panel2" runat="server" CssClass="Окно" Height="100px" 
                    Visible="False" Width="500px">
                    <br />
                    Выберите действие<br />
                    <br />
                    <asp:Button ID="ButtonLoad" runat="server" onclick="ButtonLoad_Click" 
                        Text="Скачать" />
                    &nbsp;<asp:Button ID="ButtonDell" runat="server" onclick="ButtonDell_Click" 
                        Text="Удалить" />
                    &nbsp;<asp:Button ID="ButtonCancel3" runat="server" onclick="ButtonCancel3_Click" 
                        Text="Отмена" />
                </asp:Panel>
     
     
     </p>
     
                <asp:Panel ID="Panel1" runat="server" CssClass="Окно" Height="100px" 
                    Visible="False" Width="500px">
                    <br />
                    Вы действительно хотите удалить свою работу?<br />
                    <br />
                    <asp:Button ID="ButtonОк2" runat="server" onclick="ButtonОк2_Click" Text="Да" />
                    &nbsp;<asp:Button ID="ButtonCancel2" runat="server" onclick="ButtonCancel2_Click" 
                        Text="Нет" />
                </asp:Panel>
     
     
     </p>
     
     <p align="center" >
     
     
     </p>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT * FROM [Kruzhki]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT * FROM [Works]"></asp:SqlDataSource>
<p align="center"  >&nbsp;</p>
    <p align="center" >&nbsp;</p>
    <p align="center" >&nbsp;</p>
    <p align="center" >&nbsp;</p>

</asp:Content>
