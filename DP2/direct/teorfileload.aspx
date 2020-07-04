<%@ Page Title="" Language="C#" MasterPageFile="~/direct/Direct.Master" AutoEventWireup="true" CodeBehind="teorfileload.aspx.cs" Inherits="DP2.direct.teorfileload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
// <![CDATA[

        function Button2_onclick() {
            window.open("../uploads/", "Файлы");
        }

function Button4_onclick() {

}

// ]]>
    </script>
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

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="Заголовок">
        Теоретический материал</p>
    <p align="center">
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click1">Загруженные файлы</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Загрузить файлы</asp:LinkButton>
        <br />
    </p>
    <p>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <br />
            <asp:View ID="View1" runat="server">
                <br />
                Загруженые файлы<br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataKeyNames="TeorFileId" DataSourceID="SqlDataSource1" 
                    EmptyDataText="Нет записей для отображения." 
                    onrowdeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="TeorFileId" HeaderText="TeorFileId" 
                            SortExpression="TeorFileId" ReadOnly="True" Visible="False" />
                        <asp:BoundField DataField="НазваниеДисцилины" HeaderText="Название дисцилины" 
                            SortExpression="НазваниеДисцилины" />
                        <asp:BoundField DataField="НазваниеКружка" HeaderText="Название кружка" 
                            SortExpression="НазваниеКружка" />
                        <asp:BoundField DataField="Кружок" HeaderText="Кружок" 
                            SortExpression="Кружок" Visible="False" />
                        <asp:BoundField DataField="НазваниеФайла" HeaderText="Название файла" 
                            SortExpression="НазваниеФайла" />
                        <asp:BoundField DataField="Путь" HeaderText="Путь" SortExpression="Путь" 
                            Visible="False" />
                        <asp:BoundField DataField="Ссылка" HeaderText="Ссылка" SortExpression="Ссылка" 
                            Visible="False" />
                        <asp:BoundField DataField="ДатаЗагрузки" HeaderText="ДатаЗагрузки" 
                            SortExpression="ДатаЗагрузки" />
                        <asp:CommandField ButtonType="Image" 
                            DeleteImageUrl="~/Properties/images/удалить.png" ShowDeleteButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#BBD1FF" Font-Bold="True" ForeColor="#FFFFCC" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                <br />
                <asp:Panel ID="Panel1" runat="server" CssClass="Окно" Height="100px" 
                    Visible="False" Width="500px">
                    <br />
                    Вы действительно хотите удалить этот файл?<br />
                    <br />
                    <asp:Button ID="ButtonОк1" runat="server" onclick="ButtonОк1_Click" 
                        Text="Да" />
                    &nbsp;<asp:Button ID="ButtonCancel1" runat="server" onclick="editBox_Cancel_Click" 
                        Text="Нет" />
                </asp:Panel>
                <br />
            </asp:View>
            <br />
            <br />
            <br />
            <asp:View ID="View2" runat="server">
                <br />
                Загрузить файл<br />
                <p>
                    <table style="width:100%;">
                        <tr>
                            <td align="right">
                                Принадлежность:</td>
                            <td align="left">
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                    DataSourceID="SqlDataSource2" DataTextField="Принадлежность" DataValueField="KruzhId" 
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
                                <asp:Button ID="ButtonLoad" runat="server" onclick="Button1_Click" 
                                    Text="Загрузить" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                &nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Visible="False">HyperLink</asp:HyperLink>
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </p>
                <p>
                    &nbsp;</p>
            </asp:View>
            <br />
            <br />
        </asp:MultiView>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT TeorFiles.TeorFileId, TeorFiles.Кружок, TeorFiles.НазваниеФайла, TeorFiles.Путь, TeorFiles.Ссылка, TeorFiles.ДатаЗагрузки, Kruzhki.Название AS НазваниеКружка, Subjects.Название AS НазваниеДисцилины FROM TeorFiles INNER JOIN Kruzhki ON TeorFiles.Кружок = Kruzhki.KruzhId INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId">
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT Subjects.Название + N'\' + Kruzhki.Название AS Принадлежность, Kruzhki.KruzhId FROM Subjects INNER JOIN Kruzhki ON Subjects.SubjectId = Kruzhki.Дисциплина GROUP BY Subjects.Название, Kruzhki.Название, Kruzhki.KruzhId, Subjects.Название + N'\' + Kruzhki.Название"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
