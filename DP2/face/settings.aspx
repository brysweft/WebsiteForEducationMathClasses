<%@ Page Title="" Language="C#" MasterPageFile="~/face/FaceSite.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="DP2.face.settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .style4
    {
        height: 25px;
    }
        .style5
        {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2"  ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p align="center"> 
        <asp:LinkButton ID="LinkButton1" runat="server" BackColor="#FFFF99" 
            BorderColor="#CCCCCC" BorderStyle="Outset" BorderWidth="2px" Font-Bold="False" 
            Font-Underline="False" ForeColor="Black" onclick="LinkButton1_Click">Измненить данные</asp:LinkButton>
        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="Outset" BorderWidth="2px" Font-Bold="False" 
            Font-Underline="False" ForeColor="Black" onclick="LinkButton2_Click">Изменить пароль</asp:LinkButton> </p>
<p align="center">

                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1"  runat="server">
                        <table style="width:100%;" class="Окно3">
        <tr>
            <td align="center" colspan="2">
                <p align="center" class="Заголовок">
                    Изменить информацию
                </p>
            </td>
        </tr>
                            <tr>
                                <td align="right">
                                    Фамилия:</td>
                                <td align="left">
                                    <asp:TextBox ID="TextBox1" runat="server" CausesValidation="True" 
                                        MaxLength="20"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Некорректный ввод" 
                                        ForeColor="Red" ValidationExpression="^[А-Я]{1,1}[а-я]{2,20}$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
        <tr>
            <td class="style3" align="right">
                Имя:</td>
            <td class="style3" align="left">
                <asp:TextBox ID="TextBox2" runat="server" CausesValidation="True" 
                    MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox2" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" 
                    ValidationExpression="^[А-Я]{1,1}[а-я]{2,20}$" ForeColor="Red" 
                    ControlToValidate="TextBox2" ErrorMessage="Некорректный ввод" 
                    Display="Dynamic" ID="RegularExpressionValidator2"></asp:RegularExpressionValidator>

            </td>
        </tr>
        <tr>
            <td align="right" class="style5">
                Отчество:</td>
            <td align="left" class="style5">
                <asp:TextBox ID="TextBox3" runat="server" CausesValidation="True" 
                    MaxLength="20"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox3" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" 
                    ValidationExpression="^[А-Я]{1,1}[а-я]{2,20}$" ForeColor="Red" 
                    ControlToValidate="TextBox3" ErrorMessage="Некорректный ввод" 
                    Display="Dynamic" ID="RegularExpressionValidator3"></asp:RegularExpressionValidator>

            </td>
        </tr>
        <tr>
            <td align="right">
                Учебное заведение:</td>
            <td align="left">
                <asp:TextBox ID="TextBox4" runat="server" CausesValidation="True" 
                    MaxLength="40" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4" align="right">
                Группа:</td>
            <td class="style4" align="left">
                <asp:TextBox ID="TextBox5" runat="server" CausesValidation="True" MaxLength="8"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                Телефон:</td>
            <td align="left">
                <asp:TextBox ID="TextBox6" runat="server" CausesValidation="True" 
                    MaxLength="20"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Сохранить" />
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2" align="center">
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>

                <br />
            </td>
        </tr>
    </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                       <Table align="center">
                        <tr>
                                 <td colspan="2">
                            <asp:ChangePassword ID="ChangePassword1" runat="server" 
                                         oncontinuebuttonclick="ChangePassword1_ContinueButtonClick" 
                                         CssClass="Окно3">
                                <ChangePasswordTemplate>
                                    <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                        <tr>
                                            <td>
                                                <table cellpadding="0">
                                                    <tr>
                                                        <td align="center" colspan="2" class="Заголовок">
                                                            Смените пароль</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Label ID="CurrentPasswordLabel" runat="server" 
                                                                AssociatedControlID="CurrentPassword">Пароль:</asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="CurrentPassword" runat="server" MaxLength="20" 
                                                                TextMode="Password"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" 
                                                                ControlToValidate="CurrentPassword" 
                                                                ErrorMessage="Поле &quot;Пароль&quot; является обязательным." 
                                                                ToolTip="Поле &quot;Пароль&quot; является обязательным." 
                                                                ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Label ID="NewPasswordLabel" runat="server" 
                                                                AssociatedControlID="NewPassword">Новый пароль:</asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="NewPassword" runat="server" MaxLength="20" TextMode="Password"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" 
                                                                ControlToValidate="NewPassword" 
                                                                ErrorMessage="Поле &quot;Новый пароль&quot; является обязательным." 
                                                                ToolTip="Поле &quot;Новый пароль&quot; является обязательным." 
                                                                ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Label ID="ConfirmNewPasswordLabel" runat="server" 
                                                                AssociatedControlID="ConfirmNewPassword">Подтвердите новый пароль:</asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="ConfirmNewPassword" runat="server" MaxLength="20" 
                                                                TextMode="Password"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" 
                                                                ControlToValidate="ConfirmNewPassword" 
                                                                ErrorMessage="Поле &quot;Подтвердите новый пароль&quot; обязательно." 
                                                                ToolTip="Поле &quot;Подтвердите новый пароль&quot; обязательно." 
                                                                ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                                                ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                                                                Display="Dynamic" 
                                                                ErrorMessage="Значение &quot;Подтвердите новый пароль&quot; должно совпадать со значением &quot;Новый пароль&quot;." 
                                                                ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2" style="color:Red;">
                                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Button ID="ChangePasswordPushButton" runat="server" 
                                                                CommandName="ChangePassword" Text="Смена пароля" 
                                                                ValidationGroup="ChangePassword1" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" 
                                                                CommandName="Cancel" Text="Отмена" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </ChangePasswordTemplate>
                            </asp:ChangePassword>
                            </td>
                         </tr>
                        </Table>
                  </asp:View>
                    

                </asp:MultiView>
    </p>
    </asp:Content>

