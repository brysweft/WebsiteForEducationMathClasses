<%@ Page Title="" Language="C#" MasterPageFile="~/visitor/Main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="DP2.Properties.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p align="center" class="Заголовок">
        Интернет кружок по математическим дисциплинам СПО</p>
<p class="ПодЗаголовок">
    О сайте</p>

<p class="Текст" dir="ltr">
    Сайт предназначен для проведния кружков по математическим дисциплинам для 
    студентов СПО.</p>
    <p class="Текст">
        Подробнее о кружках и о принципе их рботы Вы можете узнать
        <asp:LinkButton ID="LinkButton4" runat="server" 
            PostBackUrl="~/visitor/class.aspx">здесь</asp:LinkButton>
</p>
    <p class="ПодЗаголовок">
        Контакты</p>
    <p class="Текст">
        Узнать контактную информацию вы можете&nbsp;
        <asp:LinkButton ID="LinkButton5" runat="server" 
            PostBackUrl="~/visitor/kontacts.aspx">здесь</asp:LinkButton>
</p>
    <p class="ПодЗаголовок">
        Регистрация</p>
    <p class="Текст">
        Чтобы загестрироваться на сайте нажмите
        <asp:LinkButton ID="LinkButton6" runat="server" 
            PostBackUrl="~/visitor/registration.aspx">тут</asp:LinkButton>
</p>
    <p class="ПодЗаголовок">
        Обратая связь</p>
    <p class="Текст">
        Чтобы написать обращение администрации сайта нажмите
        <asp:LinkButton ID="LinkButton7" runat="server" 
            PostBackUrl="~/visitor/obrsvyaz.aspx">тут</asp:LinkButton>
</p>
<p>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
</p>
</asp:Content>
