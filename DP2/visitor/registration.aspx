<%@ Page Title="" Language="C#" MasterPageFile="~/visitor/Main.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="DP2.visitor.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style4
        {
            width: 189px;
        }
        .style5
        {
            width: 245px;
        }
        .style13
    {
        width: 501px;
    }
        .style14
        {
            height: 23px;
        }
        .style15
        {
            width: 50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p align="center" class="Заголовок">Регистрация</p>
    <table style="width:100%;">
        <tr>
            <td align="center" colspan="3">
                <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
                    CreateUserButtonText="Готово" FinishPreviousButtonText="Назад" 
                    StepPreviousButtonText="Назад" 
                    CancelDestinationPageUrl="~/visitor/registration.aspx" 
                    DisplayCancelButton="True" 
                    FinishDestinationPageUrl="~/visitor/login.aspx" LoginCreatedUser="False" 
                    oncancelbuttonclick="CreateUserWizard1_CancelButtonClick" 
                    oncontinuebuttonclick="CreateUserWizard1_ContinueButtonClick" 
                    onfinishbuttonclick="CreateUserWizard1_FinishButtonClick" 
                    onsendingmail="CreateUserWizard1_SendingMail" 
                    onsendmailerror="CreateUserWizard1_SendMailError" 
                    oncreateduser="CreateUserWizard1_CreatedUser" Width="500px" 
                    StartNextButtonText="Далее" StepNextButtonText="Далее" CssClass="Окно3">
                    
                    <WizardSteps>
                   
                        <asp:WizardStep runat="server" Title="Шаг 1" StepType="Start">
                           
                            <table style="width:100%;">
                                <tr>
                                    <td colspan="2" align="center" class="style14">
                                        Введите данные</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Фамилия:</td>
                                    <td align="left" class="style15">
                                        <asp:TextBox ID="TextBox1" runat="server" CausesValidation="True" 
                                            MaxLength="20"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Имя:</td>
                                    <td align="left" class="style15">
                                        <asp:TextBox ID="TextBox2" runat="server" MaxLength="20"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Отчество:</td>
                                    <td align="left" class="style15">
                                        <asp:TextBox ID="TextBox3" runat="server" MaxLength="20"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                            ControlToValidate="TextBox1" Display="Dynamic" 
                                            ErrorMessage="Некорректный ввод фамилии" ForeColor="Red" 
                                            ValidationExpression="^[А-Я]{1,1}[а-я]{2,20}$"></asp:RegularExpressionValidator>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                            ControlToValidate="TextBox2" Display="Dynamic" 
                                            ErrorMessage="Некорректный ввод имени" ForeColor="Red" 
                                            ValidationExpression="^[А-Я]{1,1}[а-я]{2,20}$"></asp:RegularExpressionValidator>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                                            ControlToValidate="TextBox3" Display="Dynamic" 
                                            ErrorMessage="Некорректный ввод отчества" ForeColor="Red" 
                                            ValidationExpression="^[А-Я]{1,1}[а-я]{2,20}$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                            <br /> 
                        </asp:WizardStep>
                        
                        <asp:CreateUserWizardStep runat="server" Title="Шаг 2" ID="CreateUserWizardStep1">
                        
                            <ContentTemplate >
                                <table>
                                    <tr>
                                        <td align="center" colspan="2">
                                            Заполните поля</td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Логин:</asp:Label>
                                        </td>
                                        <td class="style4">
                                            <asp:TextBox ID="UserName" runat="server" MaxLength="20"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                ControlToValidate="UserName" 
                                                ErrorMessage="Поле &quot;Имя пользователя&quot; является обязательным." 
                                                ToolTip="Поле &quot;Имя пользователя&quot; является обязательным." 
                                                ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Пароль:</asp:Label>
                                        </td>
                                        <td class="style4">
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                ControlToValidate="Password" 
                                                ErrorMessage="Поле &quot;Пароль&quot; является обязательным." 
                                                ToolTip="Поле &quot;Пароль&quot; является обязательным." 
                                                ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                                AssociatedControlID="ConfirmPassword">Подтвердите пароль:</asp:Label>
                                        </td>
                                        <td width="50%">
                                            <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" 
                                                MaxLength="20"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                                ControlToValidate="ConfirmPassword" 
                                                ErrorMessage="Поле &quot;Подтвердите пароль&quot; является обязательным." 
                                                ToolTip="Поле &quot;Подтвердите пароль&quot; является обязательным." 
                                                ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Электронная почта:</asp:Label>
                                        </td>
                                        <td class="style4">
                                            <asp:TextBox ID="Email" runat="server" CausesValidation="True" MaxLength="30"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                                ControlToValidate="Email" 
                                                ErrorMessage="Поле &quot;Электронная почта&quot; является обязательным." 
                                                ToolTip="Поле &quot;Электронная почта&quot; является обязательным." 
                                                ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Защитный вопрос:</asp:Label>
                                        </td>
                                        <td style="margin-left: 80px" class="style4">
                                            <asp:TextBox ID="Question" runat="server" MaxLength="50"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                                ControlToValidate="Question" 
                                                ErrorMessage="Защитный вопрос является обязательным." 
                                                ToolTip="Защитный вопрос является обязательным." 
                                                ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Защитный ответ:</asp:Label>
                                        </td>
                                        <td class="style4">
                                            <asp:TextBox ID="Answer" runat="server" MaxLength="20"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                                ControlToValidate="Answer" ErrorMessage="Защитный ответ является обязательным." 
                                                ToolTip="Защитный ответ является обязательным." 
                                                ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                                ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                                Display="Dynamic"
                                                ErrorMessage="Значения &quot;Пароль&quot; и &quot;Подтвердите пароль&quot; должны совпадать." 
                                                ValidationGroup="CreateUserWizard1"> </asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Literal  ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                            <br />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                                ControlToValidate="Email" ErrorMessage="Неправильно введен Email" 
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:CompleteWizardStep runat="server" ID="CompleteWizardStep1">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td align="center" class="style13">
                                            Завершение</td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="style13">
                                            <asp:Label ID="Label1" runat="server"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="style13">
                                            <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                                CommandName="Continue" Text="Продолжить" ValidationGroup="CreateUserWizard1" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:CompleteWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
            </td>
            <td class="style5">
                <asp:SqlDataSource ID="SqlDataSourceUsersASP" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [vw_aspnet_Users]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="SqlDataSourceUsersRoles" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [vw_aspnet_UsersInRoles]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>

</asp:Content>
