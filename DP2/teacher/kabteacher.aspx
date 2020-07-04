<%@ Page Title="" Language="C#" MasterPageFile="~/face/FaceSite.Master" AutoEventWireup="true" CodeBehind="kabteacher.aspx.cs" Inherits="DP2.face.kabteacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p align="center" > Кабинет преподавателя </p>
    <table style="width:100%;" border="0">
        <tr>
            <td align="center" rowspan="2" valign="middle" width="200">
                <asp:Image ID="Image2" runat="server" Height="150px" 
                    ImageUrl="~/Properties/icons/соваП.png" Width="150px" />
                <br __designer:mapid="d8" />
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    Text="Кружок"></asp:Label>
                <br __designer:mapid="e4" />
                <asp:LinkButton ID="LinkButton7" runat="server" 
                    PostBackUrl="~/teacher/reginkruzh.aspx">Записать в кружок</asp:LinkButton>
                <br />
                <asp:LinkButton ID="LinkButton18" runat="server" 
                    PostBackUrl="~/teacher/kruzhgroup.aspx">Кружковая группа</asp:LinkButton>
                <br />
                <asp:LinkButton ID="LinkButton13" runat="server" 
                    PostBackUrl="~/direct/dirkruzhi.aspx">Добавить кружок</asp:LinkButton>
                <br />
            </td>
            <td align="center" height="300">
                <br __designer:mapid="e7" />
                <asp:Image ID="Image6" runat="server" Height="150px" 
                    ImageUrl="~/Properties/icons/Книги4П.png" Width="150px" />
                <br __designer:mapid="d7" />
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    Text="Работы"></asp:Label>
                <br __designer:mapid="d6" />
                <asp:LinkButton ID="LinkButton12" runat="server" 
                    PostBackUrl="~/teacher/workcheck.aspx">Проверить работы</asp:LinkButton>
                <br />
                <asp:LinkButton ID="LinkButton14" runat="server" 
                    PostBackUrl="~/direct/dirkruzhi.aspx">Добавить задания</asp:LinkButton>
            </td>
            <td align="center">
                <asp:Image ID="Image3" runat="server" Height="150px" 
                    ImageUrl="~/Properties/icons/КнигаП.png" Width="150px" />
                <br __designer:mapid="d7" />
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    Text="Тесты"></asp:Label>
                <br __designer:mapid="d6" />
                <asp:LinkButton ID="LinkButton16" runat="server" 
                    PostBackUrl="~/direct/dirtests.aspx">Добавить тесты</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top" height="300px" width="200px">
                <asp:Image ID="Image4" runat="server" Height="150px" 
                    ImageUrl="~/Properties/icons/Книги2П.png" Width="150px" />
                <br __designer:mapid="d7" />
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    Text="Теория"></asp:Label>
                <br __designer:mapid="d6" />
                <asp:LinkButton ID="LinkButton15" runat="server" 
                    PostBackUrl="~/direct/teorfileload.aspx">Добавить теоретический материал</asp:LinkButton>
            </td>
            <td align="center" valign="top" width="200px">
                <asp:Image ID="Image5" runat="server" Height="150px" 
                    ImageUrl="~/Properties/icons/бонанП.png" Width="150px" />
                <br __designer:mapid="d7" />
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    Text="Задачи"></asp:Label>
                <br __designer:mapid="d6" />
                <asp:LinkButton ID="LinkButton17" runat="server" 
                    PostBackUrl="~/direct/dirtasks.aspx">Добавить задачи</asp:LinkButton>
                </td>
        </tr>
        <tr>
            <td class="style3">
            </td>
            <td class="style3">
            </td>
            <td class="style3">
                </td>
        </tr>
    </table>


</asp:Content>
