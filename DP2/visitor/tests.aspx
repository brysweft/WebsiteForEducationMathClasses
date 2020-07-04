<%@ Page Title="" Language="C#" MasterPageFile="~/visitor/Main.Master" AutoEventWireup="true" CodeBehind="tests.aspx.cs" Inherits="DP2.Properties.tests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="Заголовок">
        Тесты и серии задач</p>
    <p class="ПодЗаголовок">
        Описание</p>
    <p class="Текст">
        На сайте выкладываются тесты и серии задач. К каждому кружку относится 
        определенное количество тестов и серий задач соответствующая дисциплине и теме 
        (темам) кружка</p>
    <p class="Текст">
        На выполнение одного теста или&nbsp; серии задач дается 3 попытки. Записываются 
        последнии результаты выполнения тестов, например, если Вы выполнили тест с 
        первой попытки на 10 баллов, а со второй на 7, то Вам засчитается 7 баллов</p>
    <p class="Текст">
        Чтобы приступить к выполнению тестов или задач необходимло прейти на 
        соответствющие страницы, выбрать кружок и нажать &quot;Начать&quot;, см рисунок ниже</p>
    <p>
        <asp:Image ID="Image1" runat="server" Height="331px" 
            ImageUrl="~/Properties/ilustration/тесты.gif" style="margin-top: 0px" 
            Width="444px" />
    </p>
    <p class="Текст">
        Чтобы проверить выполненный тест необходимо нажать кнопку &quot;Готово&quot;.</p>
    <p class="Текст">
        Выполнение тестов и серий задач, какже как и выполнение кружковых заданий 
        отражается в вашей личной статистике, и в общем рейтинге участников кружков.</p>
</asp:Content>
