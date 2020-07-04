<%@ Page Title="" Language="C#" MasterPageFile="~/face/FaceSite.Master" AutoEventWireup="true" CodeBehind="kab.aspx.cs" Inherits="DP2.face.kab" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">





</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p align="center">
        <asp:Label ID="Label1" runat="server" Text="Добро пожаловать в личный кабинет"></asp:Label>
    </p>
<p>
    <table style="width:100%;" border="0">
        <tr>
            <td align="center" rowspan="2" valign="middle">
            <a id="ach1ContentPlaceHolder1_Image2"  onmouseover=" MouseFocus(id)" onmouseout="  MouseLost(id)" href="kruzhki.aspx">
                <asp:Image ID="Image2" runat="server" Height="150px" 
                    ImageUrl="~/Properties/icons/птицаП.png" Width="150px" />
                    </a>
                <br __designer:mapid="d8" />
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    Text="Кружок"></asp:Label>
                <br __designer:mapid="e4" />

                <div  id="div3ContentPlaceHolder1_LinkButton7"  onmouseover=" MouseFocus(id)" onmouseout="  MouseLost(id)">
                <asp:LinkButton ID="LinkButton7" runat="server" 
                    PostBackUrl="~/face/mykruzhki.aspx">Мои кружки</asp:LinkButton>
                    </div>
                    <div  id="div3ContentPlaceHolder1_LinkButton9"  onmouseover=" MouseFocus(id)" onmouseout="  MouseLost(id)">
                <asp:LinkButton ID="LinkButton9" runat="server" 
                    PostBackUrl="~/face/kruzhki.aspx">Записаться в кружки</asp:LinkButton>
                    </div>
            </td>
            <td align="center" height="300px">
                <br __designer:mapid="e7" />
                  <a id="ach1ContentPlaceHolder1_Image6"  onmouseover=" MouseFocus(id)" onmouseout="  MouseLost(id)" href="taskfiles.aspx">
                <asp:Image ID="Image6" runat="server" Height="150px" 
                    ImageUrl="~/Properties/icons/Книги4П.png" Width="150px" />
                    </a>
                <br __designer:mapid="d7" />
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    Text="Задания"></asp:Label>
                <br __designer:mapid="d6" />

                 <div  id="div3ContentPlaceHolder1_LinkButton12"  onmouseover=" MouseFocus(id)" onmouseout="  MouseLost(id)">
                <asp:LinkButton ID="LinkButton12" runat="server" 
                    PostBackUrl="~/face/taskfiles.aspx">Кружковые задания</asp:LinkButton>
                    </div>
                 <div  id="div3ContentPlaceHolder1_LinkButton14"  onmouseover=" MouseFocus(id)" onmouseout="  MouseLost(id)">
                <asp:LinkButton ID="LinkButton14" runat="server" 
                    PostBackUrl="~/face/myworks.aspx">Мои работы</asp:LinkButton>
                    </div>
                 <div  id="div3ContentPlaceHolder1_LinkButton13"  onmouseover=" MouseFocus(id)" onmouseout="  MouseLost(id)">
                <asp:LinkButton ID="LinkButton13" runat="server" 
                    PostBackUrl="~/face/workfile.aspx">Загрузить работу</asp:LinkButton>
                    </div>
            </td>
            <td align="center">
              <a id="ach1ContentPlaceHolder1_Image3"  onmouseover=" MouseFocus(id)" onmouseout="  MouseLost(id)" href="testseries.aspx">
                <asp:Image ID="Image3" runat="server" Height="150px" 
                    ImageUrl="~/Properties/icons/КнигаП.png" Width="150px" />
                    </a>
                <br __designer:mapid="d7" />
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    Text="Тесты"></asp:Label>
               
                <div  id="div3ContentPlaceHolder1_LinkButton8"  onmouseover=" MouseFocus(id)" onmouseout="  MouseLost(id)">
                <asp:LinkButton ID="LinkButton8" runat="server" 
                    PostBackUrl="~/face/testseries.aspx">Список тестов</asp:LinkButton>
                    </div>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top" height="300px">
              <a id="ach1ContentPlaceHolder1_Image4"  onmouseover=" MouseFocus(id)" onmouseout="  MouseLost(id)" href="teoria.aspx">
                <asp:Image ID="Image4" runat="server" Height="150px" 
                    ImageUrl="~/Properties/icons/Книги2П.png" Width="150px" />
                    </a>
                <br __designer:mapid="d7" />
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    Text="Теория"></asp:Label>
                <br __designer:mapid="d6" />
                 <div  id="div3ContentPlaceHolder1_LinkButton10"  onmouseover=" MouseFocus(id)" onmouseout="  MouseLost(id)">
                <asp:LinkButton ID="LinkButton10" runat="server" 
                    PostBackUrl="~/face/teoria.aspx">Теоретичестий материал</asp:LinkButton>
                    </div>
            </td>
            <td align="center" valign="top">
              <a id="ach1ContentPlaceHolder1_Image5"  onmouseover=" MouseFocus(id)" onmouseout="  MouseLost(id)" href="taskseries.aspx">
                <asp:Image ID="Image5" runat="server" Height="150px" 
                    ImageUrl="~/Properties/icons/бонанП.png" Width="150px" />
                    </a>
                <br __designer:mapid="d7" />
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    Text="Задачи"></asp:Label>
                <br __designer:mapid="d6" />
               <div  id="div3ContentPlaceHolder1_LinkButton11"  onmouseover=" MouseFocus(id)" onmouseout="  MouseLost(id)">
                <asp:LinkButton ID="LinkButton11" runat="server" 
                    PostBackUrl="~/face/taskseries.aspx">Список задач</asp:LinkButton>
                    </div>
                </td>
        </tr>
        <tr>
            <td class="style3" width="200px">
            </td>
            <td class="style3" width="200px">
            </td>
            <td class="style3" width="200px">
                </td>
        </tr>
    </table>
</p>
<p>
</p>
<p>
</p>
                <asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    
        SelectCommand="SELECT Users.*, aspnet_Users.* FROM Users INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId">
</asp:SqlDataSource>
</asp:Content>
