
<%@ Page Title="" Language="C#" MasterPageFile="~/visitor/Main.Master" AutoEventWireup="true"  CodeBehind="login.aspx.cs" Inherits="DP2.visitor.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        
        .Changed
        {
            background-color: #FFDE9B;
            color: #000080;
        }
        .Corect
        {
            background-color: #00FF00;
            color: #003366;
            width : 120px;
            font-weight:bold;
        }
        
    </style>

    <script src="JScriptFun.js" type="text/javascript">
    </script>

      <script language="javascript" type="text/javascript" >

          function TextChange() {
              // Меняет стиль техтоввого поля взависимости от значения
              document.getElementById("ContentPlaceHolder1_LoginId_Proverka").style.cssText = "background-color: #FFDE9B; color: #000080; width : 120px; font-weight:bold;  ";
              if (document.getElementById("ContentPlaceHolder1_LoginId_Proverka").value == document.getElementById("ContentPlaceHolder1_HiddenField1").value) {
                  document.getElementById("ContentPlaceHolder1_LoginId_Proverka").style.cssText = "background-color: #00FF00; color: #003366;  width : 120px; font-weight:bold;  ";
              }           
          }

    </script>


  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<p class="Заголовок" >Вход</p>

    <table style="width: 100%;">
    <tr>
        <td align="center">
            

              <asp:Login ID="LoginId" runat="server"
                VisibleWhenLoggedIn="False"  onloggedin="LoginId_LoggedIn" 
                onload="LoginId_Load" onloginerror="LoginId_LoginError" Height="190px" 
                    DestinationPageUrl="~/face/kab.aspx" onloggingin="LoginId_LoggingIn" 
                  CssClass="Окно3" >
                
                 <LayoutTemplate>
                     <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                         <tr>
                             <td>
                                 <table cellpadding="0" style="height:190px;">
                                     <tr>
                                         <td align="center" colspan="2">
                                             Выполнить вход</td>
                                     </tr>
                                     <tr>
                                         <td align="right">
                                             <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Логин:</asp:Label>
                                         </td>
                                         <td>
                                             <asp:TextBox ID="UserName" runat="server" Font-Bold="True" Width="120px"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                 ControlToValidate="UserName" 
                                                 ErrorMessage="Поле &quot;Имя пользователя&quot; является обязательным." 
                                                 ToolTip="Поле &quot;Имя пользователя&quot; является обязательным." 
                                                 ValidationGroup="ctl05$LoginId">*</asp:RequiredFieldValidator>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td align="right">
                                             <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Пароль:</asp:Label>
                                         </td>
                                         <td>
                                             <asp:TextBox ID="Password" runat="server" TextMode="Password" Font-Bold="True" 
                                                 Width="120px"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                 ControlToValidate="Password" 
                                                 ErrorMessage="Поле &quot;Пароль&quot; является обязательным." 
                                                 ToolTip="Поле &quot;Пароль&quot; является обязательным." 
                                                 ValidationGroup="ctl05$LoginId">*</asp:RequiredFieldValidator>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td align="right">
                                            <asp:Label ID="ProverkaLabel" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                                         </td>
                                         <td>
                                            <asp:TextBox  ID="Proverka" runat="server"  onkeyup="TextChange()"   ontextchanged="Proverka_TextChanged" 
                                               Font-Bold="True" Width="120px"></asp:TextBox>
                                            
                                         </td>
                                     </tr>
                                     <tr>
                                         <td colspan="2" align="right">
                                             <asp:CheckBox ID="RememberMe" runat="server" Text="Запомнить учетные данные." />
                                         </td>
                                     </tr>
                                                                          <tr>
                                         <td colspan="2" align="right">
                                           
                                             <asp:LinkButton ID="LinkButtonP" runat="server" ForeColor="Black" 
                                                 Visible="False" PostBackUrl="~/visitor/recoverypassword.aspx">Забыли пароль?</asp:LinkButton>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td align="center" colspan="2" style="color:Red;">
                                             <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                         </td>
                                     </tr>
                                     <tr>
                                         <td align="right" colspan="2">
                                             <asp:Button ID="LoginButton" runat="server" CommandName="Login" 
                                                 Text="Выполнить вход" ValidationGroup="ctl05$LoginId" />
                                             <br />
                                         </td>
                                     </tr>
                                 </table>
                             </td>
                         </tr>
                     </table>
                 </LayoutTemplate>
            
            </asp:Login  >
            
              <p>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <span id="Text_span" ></span></p>
        </td>
    </tr>
    </table>
</asp:Content>
