using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace DP2.face
{
    public partial class kab : System.Web.UI.Page
    {
        string user_name = "не найдено", user_id;


        //Пользователяская фунция возвращающая ID текущего пользователя
        public string getUserId(SqlConnection connection)
        {

            string user_id = "нет";

            SqlCommand getUser = new SqlCommand(
       "SELECT UserId FROM  aspnet_Users WHERE   (UserName = N'" + Page.User.Identity.Name + "');", connection);
            try
            {
                connection.Open();
            }
            catch { 
            }
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

                try
                {
                    connection.Close();
                }
                catch { 
                }
            }

            return user_id;

        }



        protected void Page_Load(object sender, EventArgs e)
        {

            user_name =Page.User.Identity.Name;      

             SqlConnection connection3 = new SqlConnection(SqlDataSource1.ConnectionString);
            
                    //Создание запроса ID пользователя из таблицы ASPNET_USERS
                    SqlCommand getUser = new SqlCommand(
           "SELECT Фамилия, Имя, Отчество FROM  Users INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " + 
            " WHERE   (UserName = N'" + user_name + "');", connection3);
                    connection3.Open();
                    SqlDataReader reader = getUser.ExecuteReader();

                    try
                    {
                        reader.Read();
                        Label1.Text = reader[1].ToString() + " " + reader[2].ToString() + ", добро пожаловать в личный кабинет";
                    }
                    catch { 
                    
                    
                    }
                    finally
                     {
                    reader.Close();
                    connection3.Close();
                    }


               
        }
    }
}