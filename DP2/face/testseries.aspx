<%@ Page Title="" Language="C#" MasterPageFile="~/face/FaceSite.Master" AutoEventWireup="true" CodeBehind="testseries.aspx.cs" Inherits="DP2.face.testseries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style8
        {
            height: 25px;
        }
        .style9
        {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p align="center" class="Заголовок"  >Тесты</p>
    <asp:Panel ID="PanelM" runat="server" Height="94px" CssClass="Окно3">
        <table style="width: 100%;">
            <tr>
                <td align="right">
                    Кружок:</td>
                <td align="left" width="50%">
                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" 
                        AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Название" 
                        DataValueField="KruzhId" 
                        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>__________</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right">
                    № Теста</td>
                <td align="left" width="50%">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource3" DataTextField="Номер" 
                        DataValueField="TestSeriesId" 
                        onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" class="style9">
                </td>
                <td align="left" class="style9" width="50%">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Начать" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="PanelP" runat="server">
        <br />
        <asp:Panel ID="Panel1" runat="server" CssClass="Панель1" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP1" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P1" runat="server" GroupName="P1" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P1" runat="server" GroupName="P1" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P1" runat="server" GroupName="P1" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P1" runat="server" GroupName="P1" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP1" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" CssClass="Панель2" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP2" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P2" runat="server" GroupName="P2" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P2" runat="server" GroupName="P2" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P2" runat="server" GroupName="P2" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P2" runat="server" GroupName="P2" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP2" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel3" runat="server" CssClass="Панель1" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP3" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P3" runat="server" GroupName="P3" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P3" runat="server" GroupName="P3" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P3" runat="server" GroupName="P3" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P3" runat="server" GroupName="P3" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP3" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel4" runat="server" CssClass="Панель2" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP4" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P4" runat="server" GroupName="P4" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P4" runat="server" GroupName="P4" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P4" runat="server" GroupName="P4" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P4" runat="server" GroupName="P4" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP4" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel5" runat="server" CssClass="Панель1" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP5" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P5" runat="server" GroupName="P5" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P5" runat="server" GroupName="P5" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P5" runat="server" GroupName="P5" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P5" runat="server" GroupName="P5" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP5" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel6" runat="server" CssClass="Панель2" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP6" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P6" runat="server" GroupName="P6" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P6" runat="server" GroupName="P6" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P6" runat="server" GroupName="P6" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P6" runat="server" GroupName="P6" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP6" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel7" runat="server" CssClass="Панель1" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP7" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P7" runat="server" GroupName="P7" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P7" runat="server" GroupName="P7" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P7" runat="server" GroupName="P7" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P7" runat="server" GroupName="P7" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP7" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel8" runat="server" CssClass="Панель2" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP8" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P8" runat="server" GroupName="P8" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P8" runat="server" GroupName="P8" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P8" runat="server" GroupName="P8" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P8" runat="server" GroupName="P8" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP8" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel9" runat="server" CssClass="Панель1" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP9" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P9" runat="server" GroupName="P9" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P9" runat="server" GroupName="P9" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P9" runat="server" GroupName="P9" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P9" runat="server" GroupName="P9" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP9" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel10" runat="server" CssClass="Панель2" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP10" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P10" runat="server" GroupName="P10" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P10" runat="server" GroupName="P10" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P10" runat="server" GroupName="P10" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P10" runat="server" GroupName="P10" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP10" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel11" runat="server" CssClass="Панель1" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP11" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P11" runat="server" GroupName="P11" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P11" runat="server" GroupName="P11" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P11" runat="server" GroupName="P11" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P11" runat="server" GroupName="P11" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP11" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel12" runat="server" CssClass="Панель2" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP12" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P12" runat="server" GroupName="P12" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P12" runat="server" GroupName="P12" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P12" runat="server" GroupName="P12" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P12" runat="server" GroupName="P12" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP12" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel13" runat="server" CssClass="Панель1" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP13" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P13" runat="server" GroupName="P13" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P13" runat="server" GroupName="P13" />
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style8">
                        <asp:RadioButton ID="RadioButton2P13" runat="server" GroupName="P13" />
                    </td>
                    <td align="left" class="style8">
                        <asp:RadioButton ID="RadioButton4P13" runat="server" GroupName="P13" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP13" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel14" runat="server" CssClass="Панель2" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP14" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P14" runat="server" GroupName="P14" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P14" runat="server" GroupName="P14" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P14" runat="server" GroupName="P14" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P14" runat="server" GroupName="P14" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP14" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel15" runat="server" CssClass="Панель1" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP15" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P15" runat="server" GroupName="P15" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P15" runat="server" GroupName="P15" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P15" runat="server" GroupName="P15" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P15" runat="server" GroupName="P15" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP15" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel16" runat="server" CssClass="Панель2" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP16" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P16" runat="server" GroupName="P16" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P16" runat="server" GroupName="P16" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P16" runat="server" GroupName="P16" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P16" runat="server" GroupName="P16" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP16" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel17" runat="server" CssClass="Панель1" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP17" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P17" runat="server" GroupName="P17" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P17" runat="server" GroupName="P17" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P17" runat="server" GroupName="P17" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P17" runat="server" GroupName="P17" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP17" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel18" runat="server" CssClass="Панель2" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP18" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P18" runat="server" GroupName="P18" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P18" runat="server" GroupName="P18" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P18" runat="server" GroupName="P18" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P18" runat="server" GroupName="P18" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP18" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel19" runat="server" CssClass="Панель1" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP19" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P19" runat="server" GroupName="P19" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P19" runat="server" GroupName="P19" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P19" runat="server" GroupName="P19" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P19" runat="server" GroupName="P19" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP19" runat="server" Visible="False" />
        </asp:Panel>
        <asp:Panel ID="Panel20" runat="server" CssClass="Панель2" Visible="False">
            <table style="width:100%;">
                <tr>
                    <td align="left" colspan="2">
                        <asp:Label ID="LabelP20" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton1P20" runat="server" GroupName="P20" />
                    </td>
                    <td align="left" class="style3">
                        <asp:RadioButton ID="RadioButton3P20" runat="server" GroupName="P20" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton2P20" runat="server" GroupName="P20" />
                    </td>
                    <td align="left">
                        <asp:RadioButton ID="RadioButton4P20" runat="server" GroupName="P20" />
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenFieldP20" runat="server" Visible="False" />
        </asp:Panel>
        <br />
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Готово" />
        <br />
    </asp:Panel>
    <br />

    <asp:Label ID="LabelRez" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <br />

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Kruzhki]"></asp:SqlDataSource>
<p align="center"  >
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [TestSeries]">
    </asp:SqlDataSource>
</p>
    <p align="center"  >&nbsp;</p>


</asp:Content>
