<%@ Page Title="" Language="C#" MasterPageFile="~/direct/Direct.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="DP2.direct.users" %>
    
<%@ Import Namespace= "System.Text.RegularExpressions" %>
<%@ Import Namespace= "System.IO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script runat="server">

public string AutoPerenos(string StringToBreak)
{
if (string.IsNullOrEmpty(StringToBreak))
{
return string.Empty;
}
// после 70 символа нужен автоперенос
string pattern = @"(\S{30})(\S)";
Regex regex = new Regex(pattern, RegexOptions.IgnoreCase);
return regex.Replace(StringToBreak, "$1<br/>$2");

}
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
    <p align="center" class="Заголовок">
    Пользователи</p>


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" EmptyDataText="Нет записей для отображения."  
    AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#3366CC" 
    BorderStyle="None" BorderWidth="1px" CellPadding="4" PageSize="5" 
        DataKeyNames="UserId" onrowdeleting="GridView1_RowDeleting" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
      
        <Columns>
            <asp:TemplateField HeaderText="Логин" SortExpression="Логин">
                <ItemTemplate>
                    <asp:Label ID="LabelLogin" runat="server" Text='<%# Bind("Логин") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Логин") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Фамилия" SortExpression="Фамилия">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Фамилия") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Фамилия") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Имя" SortExpression="Имя">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Имя") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Имя") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Отчество" SortExpression="Отчество">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Отчество") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Отчество") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Учебное заведение" 
                SortExpression="УчебноеЗаведение">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("УчебноеЗаведение") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" 
                        Text='<%# Bind("УчебноеЗаведение") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Группа" SortExpression="Группа">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Группа") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Группа") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Телефон" SortExpression="Телефон">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Телефон") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Телефон") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="Email">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Дата регистрации" SortExpression="CreateDate">
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("CreateDate") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("CreateDate") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Последния активность" 
                SortExpression="LastActivityDate">
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("LastActivityDate") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" 
                        Text='<%# Bind("LastActivityDate") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UserId" SortExpression="UserId" Visible="False">
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("UserId") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="True" ButtonType="Image" 
                DeleteImageUrl="~/Properties/images/удалить.png" 
                SelectImageUrl="~/Properties/images/изменить.png" ShowSelectButton="True" />
            
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

    <p align="center"  >
         <asp:Label ID="LabelErr" runat="server" Text="Label" Visible="False"></asp:Label> </p>
    <asp:Panel ID="Panel1" runat="server" CssClass="Окно" Height="100px" 
                    Visible="False" Width="500px">
                    <br />
                    Вы действительно хотите удалить этого пользователя?<br />
                    <br />
                    <asp:Button ID="ButtonОк1" runat="server" 
                        Text="Да" onclick="ButtonОк1_Click" />
                    &nbsp;<asp:Button ID="ButtonCancel1" runat="server" 
                        Text="Нет" onclick="ButtonCancel1_Click" />      
                </asp:Panel>

    <p align="center"  >
    <asp:Button ID="ButtonAdmin" runat="server" onclick="ButtonAdmin_Click" 
    Text="Назначить роль" Visible="False" />
    </p>

    <asp:Panel ID="Panel2" runat="server" CssClass="Окно" Visible="False">
        Назначить роль выбранному пользователю<br />&nbsp;<asp:Button ID="ButtonОк2" 
            runat="server" onclick="ButtonОк2_Click" style="margin-left: 0px" 
            Text="Назначить администратором" Width="201px" />
        &nbsp;<asp:Button ID="ButtonОк3" runat="server" onclick="ButtonОк3_Click" 
            Text="Исключить из администраторов" Width="203px" />
        &nbsp;<asp:Button ID="ButtonCancel2" runat="server" onclick="ButtonCancel2_Click" 
            Text="Отмена" />
 
</asp:Panel>




    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT aspnet_Users.UserName AS Логин, Users.Фамилия, Users.Имя, Users.Отчество, Users.УчебноеЗаведение, Users.Группа, Users.Телефон, aspnet_Membership.Email, aspnet_Membership.CreateDate, aspnet_Users.LastActivityDate, Users.UserId FROM Users INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId">
    </asp:SqlDataSource>



</asp:Content>
