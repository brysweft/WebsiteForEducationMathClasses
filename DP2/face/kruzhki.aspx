<%@ Page Title="" Language="C#" MasterPageFile="~/face/FaceSite.Master" AutoEventWireup="true" CodeBehind="kruzhki.aspx.cs" Inherits="DP2.face.kruzhki" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p align="center" class="Заголовок"  >Кружки</p>
    <p align="center"  >
        <table style="width:100%;" class="Окно3">
            <tr>
                <td align="right" width="50%">
&nbsp; Дисциплина:</td>
                <td align="left" width="50%">
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Название" 
                        DataValueField="SubjectId" Height="16px" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged" Width="200px" 
                        AppendDataBoundItems="True">
                        <asp:ListItem>__________</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" class="style3">
                    <asp:Label ID="LabelT" runat="server" Text="Текущие кружки" Visible="False"></asp:Label>
                </td>
            </tr>
            </table>
    </p>
                    <asp:GridView ID="GridView1" runat="server" 
                        AutoGenerateColumns="False" BackColor="#1F342B" BorderColor="White" 
                        BorderWidth="0px" CellPadding="4" DataKeyNames="KruzhId,Название" 
                        DataSourceID="SqlDataSource1" ForeColor="White" GridLines="Vertical" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        EmptyDataText="Пока нет кружков по данной дисциплине" Visible="False">
                        <Columns>
                            <asp:TemplateField HeaderText="KruzhId" SortExpression="KruzhId" 
                                Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("KruzhId") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("KruzhId") %>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Название" SortExpression="Название">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Название") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Название") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Дисциплина" SortExpression="Дисциплина" 
                                Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Дисциплина") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Дисциплина") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Описание" SortExpression="Описание" 
                                Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Описание") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Описание") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Начало" SortExpression="ДатаНачала">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ДатаНачала") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ДатаНачала") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Конец" SortExpression="ДатаОкончания">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ДатаОкончания") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ДатаОкончания") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" SelectText="Подать заявку" 
                                ShowSelectButton="True" />
                        </Columns>
                    <EmptyDataRowStyle BorderColor="#949494" 
                        BorderStyle="Outset" BorderWidth="2px" />
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#955029" />
                    <PagerStyle ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#330000" />
                    </asp:GridView>
                    <p align="center"  >

        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>

    </p>
    <p align="center"  >
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [Kruzhki]"></asp:SqlDataSource>
    </p>
    <p align="center"  >
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [Subjects]"></asp:SqlDataSource>
    </p>
    <p align="center"  >&nbsp;</p>


</asp:Content>
