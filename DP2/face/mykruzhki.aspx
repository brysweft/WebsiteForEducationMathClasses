<%@ Page Title="" Language="C#" MasterPageFile="~/face/FaceSite.Master" AutoEventWireup="true" CodeBehind="mykruzhki.aspx.cs" Inherits="DP2.face.mykruzhki" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p align="center" class="Заголовок"  >Ваши кружки</p>
                <asp:GridView ID="GridView1" runat="server" 
                    AutoGenerateColumns="False" BackColor="#1F342B" BorderColor="White" 
                    BorderWidth="0px" CellPadding="4" DataKeyNames="UserId,KruzhId" 
                    DataSourceID="SqlDataSource1" ForeColor="White" GridLines="Vertical" 
                    EmptyDataText="У Вас нет поданных заявок." Visible="False">
                    <Columns>
                        <asp:TemplateField HeaderText="Кружок" SortExpression="Кружок">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Кружок") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Кружок") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Начало" SortExpression="Начало">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Начало") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Начало") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Конец" SortExpression="Конец">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Конец") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Конец") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UserId" SortExpression="UserId" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("UserId") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="UserName" SortExpression="UserName" 
                            Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="KruzhId" SortExpression="KruzhId" 
                            Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("KruzhId") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("KruzhId") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Статус" SortExpression="Статус">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Статус") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Статус") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Дата вступления" SortExpression="ДатаПодачи">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("ДатаПодачи") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ДатаПодачи") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataRowStyle BorderColor="#949494" 
                        BorderStyle="Outset" BorderWidth="2px" />
                    <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#955029" />
                    <PagerStyle ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#330000" />
                </asp:GridView>
    <p align="center"  >&nbsp;</p>
    <p align="center"  >
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT Kruzhki.Название AS Кружок, Kruzhki.ДатаНачала AS Начало, Kruzhki.ДатаОкончания AS Конец, UsersKruzhki.UserId, aspnet_Users.UserName, UsersKruzhki.KruzhId, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId WHERE (aspnet_Users.UserName = ' ')">
        </asp:SqlDataSource>
    </p>
    <p align="center"  >
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT KruzhId, Название, Дисциплина, Описание, ДатаНачала, ДатаОкончания FROM Kruzhki WHERE (NOT (KruzhId IN (SELECT KruzhId FROM UsersKruzhki WHERE (UserId = '66a89230-f951-41ef-8a76-68aefd500716'))))"></asp:SqlDataSource>
    </p>
    <p align="center"  >&nbsp;</p>
</asp:Content>
