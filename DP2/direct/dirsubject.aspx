<%@ Page Title="" Language="C#" MasterPageFile="~/direct/Direct.Master" AutoEventWireup="true" CodeBehind="dirsubject.aspx.cs" Inherits="DP2.direct.dirsubject" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="act" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
  .modalwind
        {
               
            color: #000080;
            width: 400;
            height: 300;

        }

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
        Дисциплины</p>
    <p>
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Список дисциплин</asp:LinkButton>
        </p>
    <p>

        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0" 
            onactiveviewchanged="MultiView1_ActiveViewChanged">
            <asp:View ID="View1" runat="server">
                Дисциплины<br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                    BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    DataKeyNames="SubjectId" DataSourceID="SqlDataSource1" 
                    EmptyDataText="Нет записей для отображения." 
                    onrowdeleting="GridView1_RowDeleting" onrowupdating="GridView1_RowUpdating" 
                    PageSize="5">
                    <Columns>
                        <asp:TemplateField HeaderText="Название" SortExpression="Название">
                            <ItemTemplate>
                                <asp:Label ID="lblTile" runat="server" Text='<%# Eval("Название") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lblTile" runat="server" Text='<%# Eval("Название") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Описание" SortExpression="Описание">
                            <ItemTemplate>
                                <asp:Label ID="lblDescr" runat="server" Text='<%# Eval("Описание") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Descript" runat="server" Text='<%#Bind("Описание") %>' 
                                    TextMode="MultiLine"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Примечание" SortExpression="Примечание">
                            <ItemTemplate>
                                <asp:Label ID="lblPoscr" runat="server" Text='<%# Eval("Примечание") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="Poscript" runat="server" Text='<%#Bind("Примечание") %>' 
                                    TextMode="MultiLine"></asp:TextBox>
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
                    <SelectedRowStyle BackColor="#BBD1FF" Font-Bold="True" ForeColor="#FFFFCC" />
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
                    последующему удалению связанных записей и загруженных&nbsp; файлов<br />
                    <br />
                    <asp:Button ID="ButtonОк1" runat="server" onclick="editBox_OK_Click" 
                        Text="Да" />
                    &nbsp;<asp:Button ID="ButtonCancel1" runat="server" onclick="editBox_Cancel_Click" 
                        Text="Нет" />
                </asp:Panel>
                <br />
            </asp:View>
            <br />
            <asp:View ID="View4" runat="server">
                Добавить дисциплину<br />
                <table style="width:100%;">
                    <tr>
                        <td align="right">
                            Название:</td>
                        <td align="left">
                            <asp:TextBox ID="TextBoxS1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Описание:</td>
                        <td align="left">
                            <asp:TextBox ID="TextBoxS2" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Примечание:</td>
                        <td align="left">
                            <asp:TextBox ID="TextBoxS3" runat="server" TextMode="MultiLine"></asp:TextBox>
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
                        <td colspan="2" align="center">
                            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <br />
        </asp:MultiView>
    </p>
    <asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">Добавить дисциплину</asp:LinkButton>
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Subjects]">
    </asp:SqlDataSource>
    <asp:Localize ID="Localize1" runat="server"></asp:Localize>
    <asp:Localize ID="Localize2" runat="server"></asp:Localize>
    </asp:Content>
