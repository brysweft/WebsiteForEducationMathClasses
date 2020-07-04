<%@ Page Title="" Language="C#" MasterPageFile="~/direct/Direct.Master" AutoEventWireup="true" CodeBehind="dirtests.aspx.cs" Inherits="DP2.direct.dirtests" %>
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

        .style10
        {
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="Заголовок">
        Тесты</p>
    <p align="center">
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Список тестов</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Тестовые вопросы</asp:LinkButton>
    </p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                Тесты<br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataSourceID="SqlDataSource1" EmptyDataText="Нет записей для отображения." 
                    PageSize="5" DataKeyNames="TestSeriesId" 
                    onrowdeleting="GridView1_RowDeleting" 
                    onrowupdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Принадлежность" SortExpression="Принадлежность">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Принадлежность") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Принадлежность") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Номер" SortExpression="Номер">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Номер") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="LabelN" runat="server" Text='<%# Bind("Номер") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Описание" SortExpression="Описание">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Описание") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2"  runat="server" Text='<%# Bind("Описание") %>' TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Дата" SortExpression="Дата">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Дата") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="LabelD" runat="server" Text='<%# Bind("Дата") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TestSeriesId" SortExpression="TestSeriesId" 
                            Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("TestSeriesId") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("TestSeriesId") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Кружок" SortExpression="Кружок" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Кружок") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Кружок") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Image" 
                            EditImageUrl="~/Properties/images/изменить.png" ShowEditButton="True" />
                        <asp:CommandField ButtonType="Image" 
                            DeleteImageUrl="~/Properties/images/удалить.png" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                <br />
                <asp:Panel ID="Panel1" runat="server" CssClass="Окно" Height="100px" 
                    Visible="False" Width="500px">
                    <br />
                    Вы действительно хотите удалить эту запись?<br />
                    <br />
                    <asp:Button ID="ButtonОк1" runat="server" onclick="ButtonОк1_Click" 
                        Text="Да" />
                    &nbsp;<asp:Button ID="ButtonCancel1" runat="server" onclick="editBox_Cancel_Click" 
                        Text="Нет" />
                </asp:Panel>
                <br />
            </asp:View>
            <br />
            <asp:View ID="View2" runat="server">
                Тестовые вопросы<br />
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataKeyNames="Номер,TestSeriesId" DataSourceID="SqlDataSource2" 
                    EmptyDataText="Нет записей для отображения." PageSize="5" 
                    onrowdeleting="GridView2_RowDeleting" onrowupdating="GridView2_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="НомерТеста" SortExpression="НомерТеста">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("НомерТеста") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="LabelTest" runat="server" Text='<%# Bind("НомерТеста") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Номер" SortExpression="Номер">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Номер") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>  
                               <asp:Label ID="LabelNomer" runat="server" Text='<%# Bind("Номер") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Задание" SortExpression="Задание">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Задание") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Text='<%# Bind("Задание") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ответ" SortExpression="Ответ">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server"  Text='<%# Bind("Ответ") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Ответ") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Вариант1" SortExpression="Вариант1">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Вариант1") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Вариант1") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Вариант2" SortExpression="Вариант2">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("Вариант2") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Вариант2") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Вариант3" SortExpression="Вариант3">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("Вариант3") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Вариант3") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Вариант4" SortExpression="Вариант4">
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("Вариант4") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Вариант4") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TestSeriesId" SortExpression="TestSeriesId" 
                            Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("TestSeriesId") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("TestSeriesId") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" ButtonType="Image" 
                            DeleteImageUrl="~/Properties/images/удалить.png" 
                            EditImageUrl="~/Properties/images/изменить.png" />
                        <asp:CommandField ShowDeleteButton="True" ButtonType="Image" 
                            DeleteImageUrl="~/Properties/images/удалить.png" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                <br />
                <asp:Panel ID="Panel2" runat="server" CssClass="Окно" Height="100px" 
                    Visible="False" Width="500px">
                    <br />
                    Вы действительно хотите удалить эту запись?<br />
                    <br />
                    <asp:Button ID="ButtonОк2" runat="server" onclick="ButtonОк2_Click" Text="Да" />
                    &nbsp;<asp:Button ID="ButtonCancel2" runat="server" onclick="ButtonCancel2_Click" 
                        Text="Нет" />
                </asp:Panel>
                <br />
            </asp:View>
            <br />
            <br />
            <asp:View ID="View3" runat="server">
                Добавить тест<br />
                <table style="width:100%;">
                    <tr>
                        <td align="right">
                            Принадлежность:</td>
                        <td align="left">
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource3" DataTextField="Принадлежность" DataValueField="KruzhId" 
                                Width="300px">
                            </asp:DropDownList>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">
                            Номер:</td>
                        <td align="left">
                            <asp:TextBox ID="TextBoxT1" runat="server" MaxLength="6" TextMode="Number" 
                                Width="50px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Описание:</td>
                        <td align="left">
                            <asp:TextBox ID="TextBoxT2" runat="server" TextMode="MultiLine" Width="300px" 
                                MaxLength="512"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                                Text="Добавить" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
                <br />
            </asp:View>
            <br />
            <asp:View ID="View4" runat="server">
                Добавить тестовые вопросы<br />
                <table style="width:100%;">
                    <tr>
                        <td align="right" class="style9">
                            Номер теста:</td>
                        <td align="left" class="style9">
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource4" DataTextField="Номер" 
                                DataValueField="TestSeriesId">
                            </asp:DropDownList>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">
                            Номер вопроса:</td>
                        <td align="left">
                            <asp:TextBox ID="TextBoxR1" runat="server" MaxLength="6" TextMode="Number" 
                                Width="50px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style10">
                            Задание:</td>
                        <td align="left" class="style10">
                            <asp:TextBox ID="TextBoxR2" runat="server" TextMode="MultiLine" Width="300px" 
                                MaxLength="512"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Ответ:</td>
                        <td align="left">
                            <asp:TextBox ID="TextBoxR3" runat="server" MaxLength="20"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Вариант 1:&nbsp;
                        </td>
                        <td align="left">
                            <asp:TextBox ID="TextBoxR4" runat="server" MaxLength="20"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Вариант 2:</td>
                        <td align="left">
                            <asp:TextBox ID="TextBoxR5" runat="server" MaxLength="20"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Вариант 3:</td>
                        <td align="left">
                            <asp:TextBox ID="TextBoxR6" runat="server" MaxLength="20"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Вариант 4:</td>
                        <td align="left">
                            <asp:TextBox ID="TextBoxR7" runat="server" MaxLength="20"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                        </td>
                        <td class="style3">
                            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                                Text="Добавить" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="style3" colspan="2">
                            <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </asp:View>
            <br />
        </asp:MultiView>
    <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Добавить тест</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">Добавить тестовые вопросы</asp:LinkButton>
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
        
        SelectCommand="SELECT TestSeries.Номер, TestSeries.Описание, TestSeries.Дата, Subjects.Название + N'.  ' + Kruzhki.Название AS Принадлежность, TestSeries.TestSeriesId, TestSeries.Кружок FROM Subjects INNER JOIN Kruzhki ON Subjects.SubjectId = Kruzhki.Дисциплина INNER JOIN TestSeries ON Kruzhki.KruzhId = TestSeries.Кружок">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT Tests.Номер, Tests.TestSeriesId, Tests.Задание, Tests.Ответ, Tests.Вариант1, Tests.Вариант2, Tests.Вариант3, Tests.Вариант4, TestSeries.Номер AS НомерТеста FROM TestSeries INNER JOIN Tests ON TestSeries.TestSeriesId = Tests.TestSeriesId">
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
        
        SelectCommand="SELECT Subjects.Название + N'.  ' + Kruzhki.Название AS Принадлежность, Kruzhki.KruzhId FROM Subjects INNER JOIN Kruzhki ON Subjects.SubjectId = Kruzhki.Дисциплина"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [TestSeries]"></asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
