using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

namespace DP2.face
{
    public partial class settings : System.Web.UI.Page
    {
           string user_name = "не найдено";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                user_name = Page.User.Identity.Name;

                SqlConnection connection = new SqlConnection(SqlDataSourceUsers.ConnectionString);

                //Создание запроса ID пользователя из таблицы ASPNET_USERS
                SqlCommand getUser = new SqlCommand(
       "SELECT Users.* FROM  Users INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
        " WHERE   (UserName = N'" + user_name + "');", connection);
                try
                {
                    connection.Open();
                    SqlDataReader reader = getUser.ExecuteReader();

                    reader.Read();
                    TextBox1.Text = reader[1].ToString();
                    TextBox2.Text = reader[2].ToString();
                    TextBox3.Text = reader[3].ToString();
                    TextBox4.Text = reader[4].ToString();
                    TextBox5.Text = reader[5].ToString();
                    TextBox6.Text = reader[6].ToString();
                    reader.Close();
                    connection.Close();
                }
                catch { 
                
                }
            }

        }


        protected void Button1_Click(object sender, EventArgs e)
        {

             user_name =Page.User.Identity.Name;  

            SqlConnection connection = new SqlConnection(SqlDataSourceUsers.ConnectionString);

             // Записываем SQL команду для добавления новой записи в таблицу
                    SqlCommand updSite = new SqlCommand(@"UPDATE       Users "+
                         " SET     Фамилия = N'" + TextBox1.Text + "', Имя = N'" + TextBox2.Text + "', Отчество = N'" + TextBox3.Text + "', УчебноеЗаведение = N'" + TextBox4.Text + "', Группа = N'" + TextBox5.Text + "', Телефон = N'" + TextBox6.Text + "'" +
                        " FROM    Users INNER JOIN  aspnet_Users ON Users.UserId = aspnet_Users.UserId " +                       
                        " WHERE   (aspnet_Users.UserName  = N'" + user_name + "');", connection);
                    try
                    {
                        connection.Open();

                        updSite.ExecuteNonQuery();
                        connection.Close();
                        Label1.Visible = true;
                        Label1.Text = TextBox2.Text + " " + TextBox3.Text + ", Данные успешно сохранены! ";
                    }
                    catch {
                        Label1.Visible = true;
                        Label1.Text = TextBox2.Text + " " + TextBox3.Text + ", Произошла ошибка, данные не сохнанены! ";
                    }


        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            LinkButton1.BackColor = Color.White;
            LinkButton2.BackColor = Color.Yellow;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            LinkButton1.BackColor = Color.Yellow;
            LinkButton2.BackColor = Color.White;
        }

        protected void ChangePassword1_ContinueButtonClick(object sender, EventArgs e)
        {
            Response.Redirect("../face/kab.aspx");
        }
    }
}