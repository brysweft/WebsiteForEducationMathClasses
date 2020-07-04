<%@ Page Title="" Language="C#" MasterPageFile="~/direct/Direct.Master" AutoEventWireup="true" CodeBehind="dirkruzhi.aspx.cs" Inherits="DP2.direct.dirkruzhi" %>
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
    <p class="Заголовок">
        Кружки</p>
    <p align="center">
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Список кружков</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Кружковые задания</asp:LinkButton>
        </p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                Кружки<br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataSourceID="SqlDataSource1" EmptyDataText="Нет записей для отображения." 
                    PageSize="5" DataKeyNames="KruzhId" onrowdeleting="GridView1_RowDeleting" 
                    onrowupdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="KruzhId" SortExpression="KruzhId" 
                            Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("KruzhId") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("KruzhId") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="НазваниеДисциплины" 
                            SortExpression="НазваниеДисциплины">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("НазваниеДисциплины") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("НазваниеДисциплины") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Дисциплина" SortExpression="Дисциплина" 
                            Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Дисциплина") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Дисциплина") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Название" SortExpression="Название">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Название") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate> 
                              <asp:Label ID="Label4" runat="server" Text='<%# Bind("Название") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Описание" SortExpression="Описание">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Описание") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" TextMode="MultiLine" runat="server" Text='<%# Bind("Описание") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ДатаНачала" SortExpression="ДатаНачала">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server"  Text='<%# Bind("ДатаНачала") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5"  TextMode="Date"  runat="server" Text='<%# Bind("ДатаНачала") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ДатаОкончания" SortExpression="ДатаОкончания">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("ДатаОкончания") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" TextMode="Date" runat="server" Text='<%# Bind("ДатаОкончания") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" ButtonType="Image" 
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
                <asp:Panel ID="Panel1" runat="server" CssClass="Окно" Height="150px" 
                    Visible="False" Width="500px">
                    <br />
                    Вы действительно хотите удалить эту запись?<br /> Удаление записи приведет к 
                    удалению соответвущего каталога и находящихся в нем файлов<br />&nbsp;<br /><asp:Button 
                        ID="ButtonОк1" runat="server" onclick="ButtonОк1_Click" Text="Да" />
                    &nbsp;<asp:Button ID="ButtonCancel1" runat="server" onclick="ButtonCancel1_Click" 
                        Text="Нет" />
                </asp:Panel>
                <br />
            </asp:View>
            <br />
            <asp:View ID="View2" runat="server">
                Куржковые задания<br />
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataKeyNames="TaskFileId" DataSourceID="SqlDataSource2" 
                    EmptyDataText="Нет записей для отображения." PageSize="5" 
                    onrowdeleting="GridView2_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="НазваниеКружка" SortExpression="НазваниеКружка">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("НазваниеКружка") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("НазваниеКружка") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TaskFileId" SortExpression="TaskFileId" 
                            Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("TaskFileId") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("TaskFileId") %>'></asp:Label>
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
                        <asp:TemplateField HeaderText="НазваниеФайла" SortExpression="НазваниеФайла">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("НазваниеФайла") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("НазваниеФайла") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Путь" SortExpression="Путь">
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
                        <asp:TemplateField HeaderText="ДатаЗагрузки" SortExpression="ДатаЗагрузки">
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("ДатаЗагрузки") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ДатаЗагрузки") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
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
                    Вы действительно хотите удалить этот файл?<br />
                    <br />
                    <asp:Button ID="ButtonОк2" runat="server" onclick="ButtonОк2_Click" Text="Да" />
                    &nbsp;<asp:Button ID="ButtonCancel2" runat="server" onclick="ButtonCancel2_Click" 
                        Text="Нет" />
                </asp:Panel>
                <br />
            </asp:View>
            <br />
            <asp:View ID="View3" runat="server">
                Добавить кружок<br />
                <table style="width:100%;">
                    <tr>
                        <td align="right">
                            Дисциплина:</td>
                        <td align="left">
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource3" DataTextField="Название" DataValueField="SubjectId" 
                                Width="300px">
                            </asp:DropDownList>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">
                            Название:</td>
                        <td align="left">
                            <asp:TextBox ID="TextBoxT1" runat="server" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Описание:</td>
                        <td align="left">
                            <asp:TextBox ID="TextBoxT2" runat="server" TextMode="MultiLine" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style9">
                            Дата начала:</td>
                        <td align="left" class="style9">
                            <asp:TextBox ID="TextBoxT3" runat="server"  Width="300px" TextMode="Date"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Дата окончания:</td>
                        <td align="left">
                            <asp:TextBox ID="TextBoxT4" runat="server"  Width="300px" TextMode="Date"></asp:TextBox>
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
            </asp:View>
            <br />
            <asp:View ID="View4" runat="server">
                Загрузить кружковые&nbsp; задания<br />
                <table style="width:100%;">
                    <tr>
                        <td align="right">
                            Принадлежность:</td>
                        <td align="left">
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource4" DataTextField="Принадлежность" DataValueField="KruzhId" 
                                Width="600px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Файл:</td>
                        <td align="left">
                            <asp:FileUpload ID="FileUpload1" runat="server" Width="500px" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Button ID="ButtonLoad" runat="server" onclick="ButtonLoad_Click" 
                                Text="Загрузить" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="style3" colspan="2">
                            &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Visible="False">HyperLink</asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2">
                            <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </asp:View>
            <br />
        </asp:MultiView>
    <br />
    <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Добавить кружок</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">Загрузить кружковые задания</asp:LinkButton>
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
    SelectCommand="SELECT Kruzhki.*, Subjects.Название AS НазваниеДисциплины FROM Kruzhki INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
    SelectCommand="SELECT TaskFiles.*, Kruzhki.Название AS НазваниеКружка FROM TaskFiles INNER JOIN Kruzhki ON TaskFiles.Кружок = Kruzhki.KruzhId">
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
        SelectCommand="SELECT * FROM [Subjects]"></asp:SqlDataSource>
    <p>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            
            SelectCommand="SELECT Kruzhki.KruzhId, Kruzhki.Дисциплина, Subjects.Название + N'\' + Kruzhki.Название AS Принадлежность FROM Subjects INNER JOIN Kruzhki ON Subjects.SubjectId = Kruzhki.Дисциплина GROUP BY Subjects.Название, Kruzhki.KruzhId, Kruzhki.Название, Kruzhki.Дисциплина, Subjects.Название + N'\' + Kruzhki.Название"></asp:SqlDataSource>
    </p>
    <br />
    <br />
    <br />
    </asp:Content>
