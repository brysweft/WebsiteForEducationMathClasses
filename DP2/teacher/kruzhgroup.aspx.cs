using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;

namespace DP2.teacher
{
    public partial class kruzhgroup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string user_id = "не найден";

            if (Page.IsPostBack == false) {


                foreach (MembershipUser user in Membership.GetAllUsers())
                {

                    SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

                  
                        SqlCommand getUser = new SqlCommand(
                   "SELECT UserId FROM  aspnet_Users WHERE   (UserName = N'" + user + "');", connection);
                        connection.Open();
                        SqlDataReader reader = getUser.ExecuteReader();

                        try
                        {
                            reader.Read();
                            user_id = reader[0].ToString();
                        }
                        catch
                        {


                        }
                        finally
                        {
                            reader.Close();
                            connection.Close();
                        }

                        try
                        {
                            SqlCommand addSite = new SqlCommand(@"INSERT INTO UsersOnline (UserId, Online) VALUES (@п1,@п2)", connection);
                            addSite.Parameters.AddWithValue("@п1", user_id);
                            addSite.Parameters.AddWithValue("@п2", user.IsOnline);
                            connection.Open();
                            addSite.ExecuteNonQuery();
                            connection.Close();
                        }
                        catch {

                            SqlConnection connection2 = new SqlConnection(SqlDataSource2.ConnectionString);

                            SqlDataSource2.UpdateCommand = @"UPDATE   UsersOnline SET " +
                 " Online = '" + user.IsOnline +
                   "'   WHERE (UserId LIKE  '" + user_id + "')";

                            connection2.Open();

                            SqlDataSource2.Update();
                            connection2.Close();
                        
                        }
                    
                }
            
            }

            // отборка записей ппри загрузке


            CheckBox1_CheckedChanged(sender, e);



        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Активация действия

            Panel1.Visible = true;
            GridView1.Enabled = false;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
                   //Выборка кружковых групп


            if (DropDownList1.SelectedValue != "__________")
            {

                SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

                //Показывать учасников кружка

                if (CheckBox1.Checked)
                {
                    SqlDataSource1.SelectCommand = "   SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, Subjects.Название AS НазваниеДисциплины, Kruzhki.Название AS НазваниеКружка, aspnet_Users.UserName, " +
                  " Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи, UsersOnline.Online  " +
                   " FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId  " +
                  " INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
                  " INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
                  " INNER JOIN UsersOnline ON aspnet_Users.UserId = UsersOnline.UserId " +
                   " INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId " +
                       " WHERE     ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') " +
                       "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "')" +
                    " AND (UsersOnline.Online = '" + CheckBox1.Checked + "') AND (UsersKruzhki.Статус = 'принято')  )";

              
                    


                }
                else
                {
                    SqlDataSource1.SelectCommand = "   SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, Subjects.Название AS НазваниеДисциплины, Kruzhki.Название AS НазваниеКружка, aspnet_Users.UserName, " +
                  " Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи, UsersOnline.Online  " +
                   " FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId  " +
                  " INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
                  " INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
                  " INNER JOIN UsersOnline ON aspnet_Users.UserId = UsersOnline.UserId " +
                    " INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId " +
                       " WHERE     ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') " +
                       "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "')   AND (UsersKruzhki.Статус = 'принято') " +
                    " )";

                }



                DataSourceSelectArguments argument = new DataSourceSelectArguments();
                connection.Open();

                SqlDataSource1.Select(argument);

                connection.Close();

                GridView1.Visible = true;
                GridView1.DataBind();


                SqlCommand getUser = new SqlCommand(
           "SELECT  ДатаНачала, ДатаОкончания FROM Kruzhki WHERE   (KruzhId LIKE '" + DropDownList1.SelectedValue + "');", connection);
                connection.Open();
                SqlDataReader reader = getUser.ExecuteReader();

                reader.Read();
                LabelBegin.Text = reader[0].ToString();
                LabelEnd.Text = reader[1].ToString();

                reader.Close();
                connection.Close();

                LabelBegin.Visible = true;
                LabelEnd.Visible = true;
            }

        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

            //Показывать онлайн учасников кружка

            if (CheckBox1.Checked)
            {
                SqlDataSource1.SelectCommand = "   SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, Subjects.Название AS НазваниеДисциплины, Kruzhki.Название AS НазваниеКружка, aspnet_Users.UserName, " +
              " Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи, UsersOnline.Online  " +
               " FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId  " +
              " INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
              " INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
              " INNER JOIN UsersOnline ON aspnet_Users.UserId = UsersOnline.UserId " +
                " INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId " +
                   " WHERE     ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') " +
                   "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "')" +
                " AND (UsersOnline.Online = '" + CheckBox1.Checked + "')  AND (UsersKruzhki.Статус = 'принято') )";
            }
                //Показать всех
            else {
                SqlDataSource1.SelectCommand = "   SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, Subjects.Название AS НазваниеДисциплины, Kruzhki.Название AS НазваниеКружка, aspnet_Users.UserName, " +
              " Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи, UsersOnline.Online  " +
               " FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId  " +
              " INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
              " INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
              " INNER JOIN UsersOnline ON aspnet_Users.UserId = UsersOnline.UserId " +
                " INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId " +
                   " WHERE     ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') " +
                   "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "')  AND (UsersKruzhki.Статус = 'принято') " +
                " )";
            
            }

            DataSourceSelectArguments argument = new DataSourceSelectArguments();
            connection.Open();

            SqlDataSource1.Select(argument);

            connection.Close();

            GridView1.DataBind();
        }

        protected void ButtonDel_Click(object sender, EventArgs e)
        {

            // Удаление пользователя из кружка
            SqlDataSource1.DeleteCommand = @"DELETE FROM UsersKruzhki WHERE ((UserId LIKE  '" + GridView1.SelectedDataKey[0] + "') AND (KruzhId LIKE  '" + GridView1.SelectedDataKey[1] + "') )";

            SqlDataSource1.Delete();

            // Удаляем папку с работами пользователя

            string saveDir2 = @"uploads\Работы\";
            string appPath = Request.PhysicalApplicationPath;



            Label логин = (Label)GridView1.SelectedRow.FindControl("Label3");
            Label кружок = (Label)GridView1.SelectedRow.FindControl("Label2");
            Label дисциплина = (Label)GridView1.SelectedRow.FindControl("Label1");

            try
            {

                Directory.Delete(appPath + saveDir2 + дисциплина.Text + @"\" + кружок.Text + @"\" + логин.Text + @"\", true);


            }
            catch
            {
                // каталог не найден
            }

            //обновление списка

            SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

            //Показывать онлайн учасников кружка

            if (CheckBox1.Checked)
            {
                SqlDataSource1.SelectCommand = "   SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, Subjects.Название AS НазваниеДисциплины, Kruzhki.Название AS НазваниеКружка, aspnet_Users.UserName, " +
              " Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи, UsersOnline.Online  " +
               " FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId  " +
              " INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
              " INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
              " INNER JOIN UsersOnline ON aspnet_Users.UserId = UsersOnline.UserId " +
                " INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId " +
                   " WHERE     ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') " +
                   "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "')" +
                " AND (UsersOnline.Online = '" + CheckBox1.Checked + "')   AND (UsersKruzhki.Статус = 'принято') )";
            }
            //Показать всех
            else
            {
                SqlDataSource1.SelectCommand = "   SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, Subjects.Название AS НазваниеДисциплины, Kruzhki.Название AS НазваниеКружка, aspnet_Users.UserName, " +
              " Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи, UsersOnline.Online  " +
               " FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId  " +
              " INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
              " INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
              " INNER JOIN UsersOnline ON aspnet_Users.UserId = UsersOnline.UserId " +
                " INNER JOIN Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId " +
                   " WHERE     ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') " +
                   "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "')  AND (UsersKruzhki.Статус = 'принято')  " +
                " )";

            }

            DataSourceSelectArguments argument = new DataSourceSelectArguments();
            connection.Open();

            SqlDataSource1.Select(argument);

            connection.Close();

            GridView1.SelectRow(-1);
            Panel1.Visible = false;
            GridView1.Enabled = true;

            GridView1.DataBind();

        }

        protected void ButtonSent_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            GridView1.Enabled = false;

        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            GridView1.Enabled = true;
            GridView1.SelectedIndex = -1;
        }

        protected void ButtonSent2_Click(object sender, EventArgs e)
        {
            //Отправка сообщения

            string userfrom = "нет", userto = "нет";

            SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

            userto = GridView1.SelectedDataKey[0].ToString();
            
            SqlCommand getUser = new SqlCommand(
"SELECT UserId FROM  aspnet_Users WHERE   (UserName = N'" + Page.User.Identity.Name + "');", connection);
            connection.Open();
            SqlDataReader reader = getUser.ExecuteReader();

            try
            {
                reader.Read();
                userfrom = reader[0].ToString();
            }
            catch
            {


            }
            finally
            {
                reader.Close();
                connection.Close();
            }


           


            try
            {
                SqlCommand addSite = new SqlCommand(@"INSERT INTO Msgs (UserFrom, UserTo, Text,  Date) VALUES (@п1,@п2,@п3, @п4)", connection);
                addSite.Parameters.AddWithValue("@п1", userfrom);
                addSite.Parameters.AddWithValue("@п2", userto);
                addSite.Parameters.AddWithValue("@п3", TextBoxMsg.Text);
                addSite.Parameters.AddWithValue("@п4", DateTime.Now);
              
                connection.Open();
                addSite.ExecuteNonQuery();
                connection.Close();

                Label7.Text = "Сообщение отправленно!";
                Label7.ForeColor = Color.Black;
                Label7.Visible = true;

                TextBoxMsg.Text = ""; 

                Panel1.Visible = false;
                Panel2.Visible = false;
                GridView1.Enabled = true;
                GridView1.SelectedIndex = -1;
            }
            catch
            {
                Label7.Text = "Произошла ошибка, убедитесь в правильности введенных данных!";
                Label7.ForeColor = Color.Red;
                Label7.Visible = true;
            }
                    
        }

        protected void ButtonCancel2_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            GridView1.Enabled = true;
            GridView1.SelectedIndex = -1;
        }


    }
}