using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web.Security;

namespace DP2.face
{
    public partial class message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false) { 

            if(Page.User.IsInRole("Администратор")){

                Panel1.Visible = false;
                ButtonDelAll.Visible = true;
            }
           
            
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

            string user_id = "нет";

            SqlCommand getUser = new SqlCommand(
       "SELECT UserId FROM  aspnet_Users WHERE   (UserName = N'" + Page.User.Identity.Name + "');", connection);
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



            //Показывать все сообщения

                SqlDataSource1.SelectCommand = "   SELECT Msgs.MsgId, Msgs.UserFrom, Msgs.UserTo, Msgs.Text, Msgs.Date, Msgs.Status, Users_1.UserId AS IdTo,  " +
              "  Users.UserId AS IdFrom, Users.Фамилия + N' ' + Users.Имя + N' ' + Users.Отчество AS Отправитель,   " +
               " Users_1.Фамилия + N' ' + Users_1.Имя + N' ' + Users_1.Отчество AS Получатель   " +
              "  FROM Users INNER JOIN Msgs ON Users.UserId = Msgs.UserFrom  " +
              "  INNER JOIN Users AS Users_1 ON Msgs.UserTo = Users_1.UserId " +
                   " WHERE     ((Msgs.UserTo LIKE '" + user_id + "') " +
                   "  OR (Msgs.UserFrom  LIKE '" + user_id + "')" +
                "  )";


            DataSourceSelectArguments argument = new DataSourceSelectArguments();
            connection.Open();

            SqlDataSource1.Select(argument);

            connection.Close();

            GridView1.DataBind();
            GridView1.Visible = true;
        }

 

        protected void ButtonSent1_Click(object sender, EventArgs e)
        {
            //Отправка сообщения

            string userfrom = "нет", userto = "нет";

            SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

            foreach (string user in Roles.GetUsersInRole("Администратор"))
            {

            

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

                SqlCommand getUser1 = new SqlCommand(
"SELECT UserId FROM  aspnet_Users WHERE   (UserName = N'" + user + "');", connection);
                connection.Open();
                SqlDataReader reader1 = getUser1.ExecuteReader();

                try
                {
                    reader1.Read();
                    userto = reader1[0].ToString();
                }
                catch
                {


                }
                finally
                {
                    reader1.Close();
                    connection.Close();
                }




                try
                {

                    SqlCommand addSite = new SqlCommand(@"INSERT INTO Msgs (UserFrom, UserTo, Text,  Date) VALUES (@п1,@п2,@п3, @п4)", connection);
                    addSite.Parameters.AddWithValue("@п1", userfrom);
                    addSite.Parameters.AddWithValue("@п2", userto);
                    addSite.Parameters.AddWithValue("@п3", TextBoxMsg1.Text);
                    addSite.Parameters.AddWithValue("@п4", DateTime.Now);

                    connection.Open();
                    addSite.ExecuteNonQuery();
                    connection.Close();

                    Label7.Text = "Сообщение отправленно!";
                    Label7.ForeColor = Color.Black;
                    Label7.Visible = true;

                    TextBoxMsg1.Text = "";

                    GridView1.Enabled = true;
                    GridView1.SelectedIndex = -1;

                    Button1_Click(sender, e);
                }
                catch
                {

                    Label7.Text = "Произошла ошибка, убедитесь в правильности введенных данных!";
                    Label7.ForeColor = Color.Red;
                    Label7.Visible = true;
                }
               
            }
                    
        }

        protected void ButtonDelAll_Click(object sender, EventArgs e)
        {
            SqlDataSource1.DeleteCommand = @"DELETE FROM Msgs";

            SqlDataSource1.Delete();
        }


    }
}