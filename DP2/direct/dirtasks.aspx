<%@ Page  Title="" Language="C#" MasterPageFile="~/direct/Direct.Master" AutoEventWireup="true" CodeBehind="dirtasks.aspx.cs" Inherits="DP2.direct.dirtasks" %>
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
        .style11
        {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="Заголовок">
        Задачи</p>
    <p align="center"><asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Серии задач</asp:LinkButton>
&nbsp;&nbsp;<asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Список задач</asp:LinkButton> </p>

        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                Серии задач<br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataSourceID="SqlDataSource1" EmptyDataText="Нет записей для отображения." 
                    PageSize="5" DataKeyNames="TaskSeriesId" 
                    onrowdeleting="GridView1_RowDeleting" onrowupdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Принадлежность" SortExpression="Принадлежность"><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("Принадлежность") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Eval("Принадлежность") %>'></asp:Label></EditItemTemplate></asp:TemplateField>
                        <asp:TemplateField HeaderText="TaskSeriesId" SortExpression="TaskSeriesId" 
                            Visible="False"><ItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Bind("TaskSeriesId") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Eval("TaskSeriesId") %>'></asp:Label></EditItemTemplate></asp:TemplateField>
                        <asp:TemplateField HeaderText="Кружок" SortExpression="Кружок" Visible="False"><ItemTemplate><asp:Label ID="Label3" runat="server" Text='<%# Bind("Кружок") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Кружок") %>'></asp:TextBox></EditItemTemplate></asp:TemplateField>
                        <asp:TemplateField HeaderText="Номер" SortExpression="Номер"><ItemTemplate><asp:Label ID="Label4" runat="server" Text='<%# Bind("Номер") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:Label ID="Label4" runat="server" Text='<%# Bind("Номер") %>'></asp:Label></EditItemTemplate></asp:TemplateField>
                        <asp:TemplateField HeaderText="Описание" SortExpression="Описание"><ItemTemplate><asp:Label ID="Label5" runat="server" Text='<%# Bind("Описание") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="TextBox3"  runat="server" Text='<%# Bind("Описание") %>' TextMode="MultiLine"></asp:TextBox></EditItemTemplate></asp:TemplateField>
                        <asp:TemplateField HeaderText="Дата" SortExpression="Дата"><ItemTemplate><asp:Label ID="Label6" runat="server" Text='<%# Bind("Дата") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:Label ID="Label6" runat="server" Text='<%# Bind("Дата") %>'></asp:Label></EditItemTemplate></asp:TemplateField>
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
                    &nbsp;<asp:Button ID="ButtonCancel1" runat="server" onclick="ButtonCancel1_Click" 
                        Text="Нет" />
                </asp:Panel>
                <br />
            </asp:View>
            <br />
            <asp:View ID="View2" runat="server">
                Задачи<br />
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataKeyNames="TaskSeriesId,Номер" DataSourceID="SqlDataSource2" 
                    EmptyDataText="Нет записей для отображения." PageSize="5" 
                    onrowdeleting="GridView2_RowDeleting" 
                    onrowupdating="GridView2_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Номер cерии" SortExpression="НомерСерии"><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("НомерСерии") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("НомерСерии") %>'></asp:Label></EditItemTemplate></asp:TemplateField>
                        <asp:TemplateField HeaderText="TaskSeriesId" SortExpression="TaskSeriesId" 
                            Visible="False"><ItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Bind("TaskSeriesId") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Eval("TaskSeriesId") %>'></asp:Label></EditItemTemplate></asp:TemplateField>
                        <asp:TemplateField HeaderText="Номер" SortExpression="Номер"><ItemTemplate><asp:Label ID="Label3" runat="server" Text='<%# Bind("Номер") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:Label ID="Label3" runat="server" Text='<%# Eval("Номер") %>'></asp:Label></EditItemTemplate></asp:TemplateField>
                        <asp:TemplateField HeaderText="Задание" SortExpression="Задание"><ItemTemplate><asp:Label ID="Label4" runat="server" Text='<%# Bind("Задание") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Text='<%# Bind("Задание") %>'></asp:TextBox></EditItemTemplate></asp:TemplateField>
                        <asp:TemplateField HeaderText="Ответ" SortExpression="Ответ"><ItemTemplate><asp:Label ID="Label5" runat="server" Text='<%# Bind("Ответ") %>'></asp:Label></ItemTemplate><EditItemTemplate><asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Ответ") %>'></asp:TextBox></EditItemTemplate></asp:TemplateField>
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
            <asp:View ID="View3" runat="server">
                Добавить серию задач<br />
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
                            <asp:TextBox ID="TextBoxT1" runat="server" MaxLength="10" TextMode="Number" 
                                Width="50px"></asp:TextBox>
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
                Добавить задачи<br />
                <table style="width:100%;">
                    <tr>
                        <td align="right" class="style9">
                            Номер серии:</td>
                        <td align="left" class="style9">
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource4" DataTextField="Номер" 
                                DataValueField="TaskSeriesId">
                            </asp:DropDownList>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right">
                            Номер задачи:</td>
                        <td align="left">
                            <asp:TextBox ID="TextBoxR1" runat="server" MaxLength="10" TextMode="Number" 
                                Width="50px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style10">
                            Задание:</td>
                        <td align="left" class="style10">
                            <asp:TextBox ID="TextBoxR2" runat="server" TextMode="MultiLine" Width="300px" 
                                EnableTheming="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style11">
                            Ответ:</td>
                        <td align="left" class="style11">
                            <asp:TextBox ID="TextBoxR3" runat="server"></asp:TextBox>
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
    <br />
    <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">Добавить серию задач</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">Добавить задачи</asp:LinkButton>
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
        
        SelectCommand="SELECT Subjects.Название + N'.  ' + Kruzhki.Название AS Принадлежность, TaskSeries.TaskSeriesId, TaskSeries.Кружок, TaskSeries.Номер, TaskSeries.Описание, TaskSeries.Дата FROM Subjects INNER JOIN Kruzhki ON Subjects.SubjectId = Kruzhki.Дисциплина INNER JOIN TaskSeries ON Kruzhki.KruzhId = TaskSeries.Кружок">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
        SelectCommand="SELECT Tasks.TaskSeriesId, Tasks.Номер, Tasks.Задание, Tasks.Ответ, TaskSeries.Номер AS НомерСерии FROM Tasks INNER JOIN TaskSeries ON Tasks.TaskSeriesId = TaskSeries.TaskSeriesId">
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
        
        SelectCommand="SELECT Subjects.Название + N'\' + Kruzhki.Название AS Принадлежность, Kruzhki.KruzhId FROM Subjects INNER JOIN Kruzhki ON Subjects.SubjectId = Kruzhki.Дисциплина GROUP BY Subjects.Название, Kruzhki.KruzhId, Kruzhki.Название, Subjects.Название + N'\' + Kruzhki.Название"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [TaskSeries]"></asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
