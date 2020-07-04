<%@ Page Title="" Language="C#" MasterPageFile="~/face/FaceSite.Master" AutoEventWireup="true" CodeBehind="taskfiles.aspx.cs" Inherits="DP2.face.taskfiles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p align="center" class="Заголовок"  >Список файлов кружковых заданий</p>
<p align="center"  >
    <table style="width: 100%;" class="Окно3">
        <tr>
            <td align="right">
                Кружок:</td>
            <td align="left" width="50%">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource2" AppendDataBoundItems="True" 
                    DataTextField="Название" DataValueField="KruzhId" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>__________</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                Дата начала:</td>
            <td align="left" width="50%">
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
</p>
                <asp:GridView ID="GridView1" runat="server" 
                    AutoGenerateColumns="False" BackColor="#1F342B" BorderColor="White" 
                    BorderWidth="0px" CellPadding="4" DataKeyNames="TaskFileId" 
                    DataSourceID="SqlDataSource1" ForeColor="White" GridLines="Vertical" 
                    EmptyDataText="Нет заданий" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" Visible="False">
                    <Columns>
                        <asp:TemplateField HeaderText="TaskFileId" SortExpression="TaskFileId" 
                            Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("TaskFileId") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("TaskFileId") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Кружок" SortExpression="Кружок" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Кружок") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Кружок") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Название файла" SortExpression="НазваниеФайла">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("НазваниеФайла") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("НазваниеФайла") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Путь" SortExpression="Путь" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Путь") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Путь") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ссылка" SortExpression="Ссылка" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Ссылка") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Ссылка") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Дата загрузки" SortExpression="ДатаЗагрузки">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("ДатаЗагрузки") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ДатаЗагрузки") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" SelectText="Скачать" 
                            ShowSelectButton="True" />
                    </Columns>
                    <EmptyDataRowStyle BorderColor="#949494" 
                        BorderStyle="Outset" BorderWidth="2px" />
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#955029" />
                    <PagerStyle ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#330000" />
                </asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [TaskFiles]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Kruzhki]"></asp:SqlDataSource>
<br />

</asp:Content>
