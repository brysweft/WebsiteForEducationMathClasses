<%@ Page Title="" Language="C#" MasterPageFile="~/face/FaceSite.Master" AutoEventWireup="true" CodeBehind="taskseries.aspx.cs" Inherits="DP2.face.taskseries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style8
        {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p align="center" class="Заголовок"  >Задачи</p>
<p align="center"  >
    <table style="width: 100%;" class="Окно3">
        <tr>
            <td align="right">
                Кружок:</td>
            <td align="left" width="50%" style="width: 0%">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="Название" 
                    DataValueField="KruzhId" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                    AppendDataBoundItems="True">
                    <asp:ListItem>__________</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td align="right">
                № Серии:</td>
            <td align="left" width="50%" style="width: 25%">
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource3" DataTextField="Номер" 
                    DataValueField="TaskSeriesId" 
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged" 
                    onunload="DropDownList2_Unload" Visible="False">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Начать" />
            </td>
        </tr>
        </table>
</p>
<asp:Panel ID="PanelP" runat="server">
    <p align="center">
        &nbsp;</p>
    <asp:Panel ID="Panel1" runat="server" Visible="False" CssClass="Панель1">
        <table style="width: 100%;">
            <tr>
                <td align="left" colspan="2">
                    <asp:Label ID="LabelP1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ответ:</td>
                <td align="left" width="50%">
                    <asp:TextBox ID="TextBoxP1" runat="server" MaxLength="6" TextMode="Number" 
                        Width="50px" ValidationGroup="PanelP"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="HiddenFieldP1" runat="server" Visible="False" />
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="False" CssClass="Панель2">
        <table style="width: 100%;">
            <tr>
                <td align="left" colspan="2">
                    <asp:Label ID="LabelP2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ответ:</td>
                <td align="left" width="50%">
                    <asp:TextBox ID="TextBoxP2" runat="server" MaxLength="6" TextMode="Number" 
                        Width="50px" ValidationGroup="PanelP"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="HiddenFieldP2" runat="server" Visible="False" />
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server" Visible="False" CssClass="Панель1">
        <table style="width: 100%;">
            <tr>
                <td align="left" colspan="2" class="style8">
                    <asp:Label ID="LabelP3" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ответ:</td>
                <td align="left" width="50%">
                    <asp:TextBox ID="TextBoxP3" runat="server" MaxLength="6" TextMode="Number" 
                        Width="50px" ValidationGroup="PanelP"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="HiddenFieldP3" runat="server" Visible="False" />
    </asp:Panel>
    <asp:Panel ID="Panel4" runat="server" Visible="False" CssClass="Панель2">
        <table style="width: 100%;">
            <tr>
                <td align="left" colspan="2">
                    <asp:Label ID="LabelP4" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ответ:</td>
                <td align="left" width="50%">
                    <asp:TextBox ID="TextBoxP4" runat="server" MaxLength="6" TextMode="Number" 
                        Width="50px" ValidationGroup="PanelP"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="HiddenFieldP4" runat="server" Visible="False" />
    </asp:Panel>
    <asp:Panel ID="Panel5" runat="server" Visible="False" CssClass="Панель1">
        <table style="width: 100%;">
            <tr>
                <td align="left" colspan="2">
                    <asp:Label ID="LabelP5" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ответ:</td>
                <td align="left" width="50%">
                    <asp:TextBox ID="TextBoxP5" runat="server" MaxLength="6" TextMode="Number" 
                        Width="50px" ValidationGroup="PanelP"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="HiddenFieldP5" runat="server" Visible="False" />
    </asp:Panel>
    <asp:Panel ID="Panel6" runat="server" Visible="False" CssClass="Панель2">
        <table style="width: 100%;">
            <tr>
                <td align="left" colspan="2">
                    <asp:Label ID="LabelP6" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ответ:</td>
                <td align="left" width="50%">
                    <asp:TextBox ID="TextBoxP6" runat="server" MaxLength="6" TextMode="Number" 
                        Width="50px" ValidationGroup="PanelP"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="HiddenFieldP6" runat="server" Visible="False" />
    </asp:Panel>
    <asp:Panel ID="Panel7" runat="server" Visible="False" CssClass="Панель1">
        <table style="width: 100%;">
            <tr>
                <td align="left" colspan="2">
                    <asp:Label ID="LabelP7" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ответ:</td>
                <td align="left" width="50%">
                    <asp:TextBox ID="TextBoxP7" runat="server" MaxLength="6" TextMode="Number" 
                        Width="50px" ValidationGroup="PanelP"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="HiddenFieldP7" runat="server" Visible="False" />
    </asp:Panel>
    <asp:Panel ID="Panel8" runat="server" Visible="False" CssClass="Панель2">
        <table style="width: 100%;">
            <tr>
                <td align="left" colspan="2">
                    <asp:Label ID="LabelP8" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ответ:</td>
                <td align="left" width="50%">
                    <asp:TextBox ID="TextBoxP8" runat="server" MaxLength="6" TextMode="Number" 
                        Width="50px" ValidationGroup="PanelP"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="HiddenFieldP8" runat="server" Visible="False" />
    </asp:Panel>
    <asp:Panel ID="Panel9" runat="server" Visible="False" CssClass="Панель1">
        <table style="width: 100%;">
            <tr>
                <td align="left" class="style3" colspan="2">
                    <asp:Label ID="LabelP9" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ответ:</td>
                <td align="left" width="50%">
                    <asp:TextBox ID="TextBoxP9" runat="server" MaxLength="6" TextMode="Number" 
                        Width="50px" ValidationGroup="PanelP"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="HiddenFieldP9" runat="server" Visible="False" />
    </asp:Panel>
    <asp:Panel ID="Panel10" runat="server" Visible="False" CssClass="Панель2">
        <table style="width: 100%;">
            <tr>
                <td align="left" colspan="2">
                    <asp:Label ID="LabelP10" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Ответ:</td>
                <td align="left" width="50%">
                    <asp:TextBox ID="TextBoxP10" runat="server" MaxLength="6" TextMode="Number" 
                        Width="50px" ValidationGroup="PanelP"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="HiddenFieldP10" runat="server" Visible="False" />
    </asp:Panel>
    <br />
    <asp:Button ID="Button2" runat="server" Height="25px" onclick="Button2_Click" 
        Text="Готово" Visible="False" />
    <br />
</asp:Panel>
<asp:Label ID="LabelRez" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="TextBoxP1" Display="Dynamic" ErrorMessage="Введите число" 
        ForeColor="Red" ValidationExpression="^[0-9]{1,6}$" ValidationGroup="PanelP"></asp:RegularExpressionValidator>
<br />

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Kruzhki]"></asp:SqlDataSource>
<p align="center"  >
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [TaskSeries]">
    </asp:SqlDataSource>
</p>
<p align="center"  >&nbsp;</p>


</asp:Content>
