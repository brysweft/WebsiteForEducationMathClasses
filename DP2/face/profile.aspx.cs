using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.Security;


namespace DP2.face
{
    public partial class profile : System.Web.UI.Page
    {
        kab kab = new kab();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Page.IsPostBack == false){

                SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);
              //Получаем баллы в кружке
              SqlCommand getUser = new SqlCommand(@"
            SELECT        Владелец, COUNT(WorkId) AS КР, SUM(Баллы) AS ОКБК
            FROM            Works
            WHERE        (Статус = N'проверено')AND (Владелец LIKE '" + kab.getUserId(connection) + @"' )
            GROUP BY Владелец   
                ", connection);

                SqlDataSource1.SelectCommand = @" SELECT aspnet_Users.UserName, Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество AS ФИО, Subjects.Название AS НазваниеДисциплины, " +
                    "  Kruzhki.Название AS НазваниеКружка, SUM(Works.Баллы) AS КБК, COUNT(Works.WorkId) AS КР " +
                      "  FROM Users INNER JOIN UsersKruzhki ON Users.UserId = UsersKruzhki.UserId  " +
                        " INNER JOIN Kruzhki ON UsersKruzhki.KruzhId = Kruzhki.KruzhId   " +
                          "  INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId  " +
                            "  INNER JOIN Works ON UsersKruzhki.UserId = Works.Владелец AND UsersKruzhki.KruzhId = Works.Кружок " +
                              "  INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId  " +
                                "  WHERE ((Works.Статус = N'проверено') AND ( aspnet_Users.UserName = '" + Page.User.Identity.Name +"' )) " +
                 @"    GROUP BY aspnet_Users.UserName, Users.Фамилия, Users.Имя, Users.Отчество, 
                Works.Владелец, Works.Кружок, Kruzhki.Название, Kruzhki.Дисциплина, Subjects.Название, 
                Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество ";


                SqlCommand getFIO = new SqlCommand(@"SELECT Фамилия + ' ' + Имя + ' ' + Отчество AS FIO FROM Users Where (UserId LIKE  '" + kab.getUserId(connection) + "') ", connection);

                connection.Open();

                SqlDataReader reader2 = getFIO.ExecuteReader();
                if (reader2.HasRows)
                {
                    reader2.Read();

                    Label1.Text = reader2[0].ToString();
                    reader2.Close();
                }
                connection.Close();
                 
                DataSourceSelectArguments arg = new DataSourceSelectArguments();
                connection.Open();
                SqlDataSource1.Select(arg);

                SqlDataReader reader = getUser.ExecuteReader();
                if (reader.HasRows){
                reader.Read();

                LabelKR.Text = reader[1].ToString();
                LabelOKBK.Text = reader[2].ToString();
                reader.Close();
                }
                 connection.Close();
                 GridView1.DataBind();
                


            

                  
            
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            ImageButton2.BackColor = Color.Aqua;
            ImageButton1.BackColor = Color.White;
            ImageButton3.BackColor = Color.White;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            ImageButton2.BackColor = Color.White;
            ImageButton1.BackColor = Color.Aqua;
            ImageButton3.BackColor = Color.White;

            SqlConnection connection = new SqlConnection(SqlDataSource2.ConnectionString);
            //Получаем тестовые  баллы 
            SqlCommand getUser = new SqlCommand(@"
            SELECT        Владелец, COUNT(TestRezId) AS КТ, SUM(Баллы) AS OКБT
            FROM            TestRez
            WHERE         (Владелец LIKE '" + kab.getUserId(connection) + @"' )
            GROUP BY Владелец   
                ", connection);

            SqlDataSource2.SelectCommand = @" 
            SELECT aspnet_Users.UserName, Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество AS ФИО, Subjects.Название AS НазваниеДисциплины,
            Kruzhki.Название AS НазваниеКружка, COUNT(TestRez.TestRezId) AS КТ, SUM(TestRez.Баллы) AS ОКБТ 
            FROM Users INNER JOIN UsersKruzhki ON Users.UserId = UsersKruzhki.UserId 
            INNER JOIN Kruzhki ON UsersKruzhki.KruzhId = Kruzhki.KruzhId 
            INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId 
            INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId 
            INNER JOIN TestRez ON UsersKruzhki.UserId = TestRez.Владелец AND UsersKruzhki.KruzhId = TestRez.Кружок 
             WHERE  ( aspnet_Users.UserName = '" + Page.User.Identity.Name + "' ) " +
           @" GROUP BY aspnet_Users.UserName, Users.Фамилия, Users.Имя, Users.Отчество, Kruzhki.Название, Kruzhki.Дисциплина, Subjects.Название, 
            Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество, TestRez.Владелец, TestRez.Кружок ";



            DataSourceSelectArguments arg = new DataSourceSelectArguments();
            connection.Open();
            SqlDataSource2.Select(arg);

            SqlDataReader reader = getUser.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();

                LabelKT.Text = reader[1].ToString();
                LabelOKBT.Text = reader[2].ToString();
                reader.Close();
            }
            connection.Close();
            GridView2.DataBind();


        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            ImageButton2.BackColor = Color.White;
            ImageButton1.BackColor = Color.White;
            ImageButton3.BackColor = Color.Aqua;

            SqlConnection connection = new SqlConnection(SqlDataSource3.ConnectionString);
            //Получаем   баллы за решение задач
            SqlCommand getUser = new SqlCommand(@"
            SELECT        Владелец, COUNT(TaskRezId) AS КТ, SUM(Баллы) AS OКБT
            FROM            TaskRez
            WHERE         (Владелец LIKE '" + kab.getUserId(connection) + @"' )
            GROUP BY Владелец   
                ", connection);

            SqlDataSource3.SelectCommand = @" 
            SELECT        aspnet_Users.UserName, Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество AS ФИО, Subjects.Название AS НазваниеДисциплины, 
                         Kruzhki.Название AS НазваниеКружка, SUM(TaskRez.Баллы) AS ОКБС, COUNT(TaskRez.TaskRezId) AS КС
                        FROM            Users INNER JOIN
                         UsersKruzhki ON Users.UserId = UsersKruzhki.UserId INNER JOIN
                         Kruzhki ON UsersKruzhki.KruzhId = Kruzhki.KruzhId INNER JOIN
                         aspnet_Users ON Users.UserId = aspnet_Users.UserId INNER JOIN
                         Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId INNER JOIN
                         TaskRez ON UsersKruzhki.UserId = TaskRez.Владелец AND UsersKruzhki.KruzhId = TaskRez.Кружок
             WHERE  ( aspnet_Users.UserName = '" + Page.User.Identity.Name + "' ) " +
           @" GROUP BY aspnet_Users.UserName, Users.Фамилия, Users.Имя, Users.Отчество, Kruzhki.Название, Kruzhki.Дисциплина, Subjects.Название, 
                         Users.Фамилия + N'  ' + Users.Имя + N'  ' + Users.Отчество, TaskRez.Владелец, TaskRez.Кружок ";

                     
            DataSourceSelectArguments arg = new DataSourceSelectArguments();
            connection.Open();
            SqlDataSource3.Select(arg);

            SqlDataReader reader = getUser.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();

                LabelKS.Text = reader[1].ToString();
                LabelOKBS.Text = reader[2].ToString();
                reader.Close();
            }
            connection.Close();
            GridView3.DataBind();



        }

  

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            GridView2.Visible = true;
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            GridView3.Visible = true;
        }
    }
}