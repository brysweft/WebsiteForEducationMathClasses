<%@ Page Title="" Language="C#" MasterPageFile="~/visitor/Main.Master" AutoEventWireup="true" CodeBehind="class.aspx.cs" Inherits="DP2.Properties._class" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style6
        {
            color: blue;
            text-decoration: underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p align="center" class="Заголовок"  >Кружки</p>
    <p align="center" class="ПодЗаголовок"  >О кружках</p>
    <p align="center" class="Текст"  >
        Получение знаний, удовлетворение своих 
        умственных потребностей, развитие в интересующей области знаний является важным
        формировании личности человека. 
        Образование дает людям возможность развиваться, но, к сожалению, современная 
        система образования не так совершенна, как хотелось бы.
        Многие из нас сталкивались с такой 
        проблемой, когда совершенно не понимаешь одну, а то и несколько дисциплин, но 
        проявлен интерес к другим дисциплинам. Как не крути, система образования требует 
        знания определенных основ, и приходится вникать во все дисциплины. Конечно, 
        лучше чем преподаватель ни ктоне поможет 
        вам вникнуть в дисциплину, закрепить и углубить знания. Кружковые занятия 
        являются одним из способов решения данной проблемы. Кружки позволяют ученику 
        получить практические и теоретические знания в определенной дисциплине, научится 
        решать различной сложности задачи, тем самым помогая закрепить базовые и 
        получить углубленные знания по дисциплине.
        </p>
    <p align="center" class="ПодЗаголовок"  >Принцип работы</p>
    <p align="center" class="Текст"  >Для того чтобы заниматься в кружке (кружках) 
        необходимо зарегестрироваться на сайте,
        <asp:LinkButton ID="LinkButton4" runat="server" 
            PostBackUrl="~/visitor/registration.aspx">здесь</asp:LinkButton>
    </p>
    <p align="center" class="Текст"  >После регисртрации Вы можете войти в личный 
        кабинет</p>
    <p align="center" class="Текст"  >Ниже на рисунке приведено меню личного кабинета</p>
    <p align="center"  >
        <asp:Image ID="Image1" runat="server" Height="346px" 
            ImageUrl="~/Properties/ilustration/Личный кабинет.png" Width="348px" />
    </p>
    <p class="Текст">
        Доступ к заданиям, теоретическому материалу, тестам и задачам будет закрыт для 
        Вас пока Вы не подадите заявку (заявки) в кружок (кружки) и пока преподаватель 
        (администратор) не зарегестрирует Вас</p>
    <p class="Текст">
        Для подачи заявки в кружок вользователю необходимо перейти на страницу 
        «Записаться в кружки», выбрать дисциплину и затем изсписка найти интересующий 
        кружок и нажать подать заявку. Скриншот формы подачи заявок приведен на 
        следующем рисунке</p>
    <p>
        <asp:Image ID="Image2" runat="server" Height="116px" 
            ImageUrl="~/Properties/ilustration/Кружки.gif" Width="330px" />
      </p>
    <p class="Текст" align="right">
        Узнать о предоставляемом теоретическом материале можно
        <asp:LinkButton ID="LinkButton5" runat="server" 
            PostBackUrl="~/visitor/educational.aspx">здесь</asp:LinkButton>
      </p>
    <p class="Текст" align="right">
        Ознакомиться с принципами выполнения тестов и задач можно
        <asp:LinkButton ID="LinkButton6" runat="server" 
            PostBackUrl="~/visitor/tests.aspx">здесь</asp:LinkButton>
      </p>
</asp:Content>
