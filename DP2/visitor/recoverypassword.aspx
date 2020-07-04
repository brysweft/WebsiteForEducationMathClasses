<%@ Page Title="" Language="C#" MasterPageFile="~/visitor/Main.Master" AutoEventWireup="true" CodeBehind="recoverypassword.aspx.cs" Inherits="DP2.visitor.recoverypassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <table style="width: 100%;">
    <tr>
        <td align="center">
           

                <table style="width: 100%;">
                    <tr>
                        <td align="center">
                            <asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
                                <UserNameTemplate>
                                    <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                                        <tr>
                                            <td>
                                                <table cellpadding="0">
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            Забыли пароль?</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
                                                            Чтобы получить пароль, введите свой логин</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Логин:</asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                                ControlToValidate="UserName" 
                                                                ErrorMessage="Поле &quot;Имя пользователя&quot; является обязательным." 
                                                                ToolTip="Поле &quot;Имя пользователя&quot; является обязательным." 
                                                                ValidationGroup="PasswordRecovery1">*</asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2" style="color:Red;">
                                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" colspan="2">
                                                            <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" 
                                                                Text="Передать на рассмотрение" ValidationGroup="PasswordRecovery1" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </UserNameTemplate>
                            </asp:PasswordRecovery>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            </td>
                    </tr>
                    </table>
              
        </td>
    </tr>
    </table>
    </p>
    <p>
    </p>
</asp:Content>
