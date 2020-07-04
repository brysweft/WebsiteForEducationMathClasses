using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;

namespace DP2.face
{
    public partial class kruzhki : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            //Выборка кружков

            string user_id = "не найдено";

            if (DropDownList1.SelectedValue != "__________")
            {





                SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

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

                SqlDataSource1.SelectCommand = "SELECT        Kruzhki.*  FROM     Kruzhki" +
                    " WHERE   " +
                    " ( NOT (KruzhId IN  (SELECT     KruzhId " +
                    "  FROM            UsersKruzhki " +
                    " WHERE        (UserId LIKE '" + user_id + "'))) AND " +
                    "  (Kruzhki.Дисциплина LIKE '" + DropDownList1.SelectedValue + "') " +
                    "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "')  )";




                DataSourceSelectArguments argument = new DataSourceSelectArguments();
                connection.Open();

                SqlDataSource1.Select(argument);

                connection.Close();

                LabelT.Visible = true;
                GridView1.Visible = true;
                GridView1.DataBind();
            }
            else {
                LabelT.Visible = false;
                GridView1.Visible = false;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Регистрация в кружке
            Label1.Text = "";
            Label1.Visible = false;
            string user_id="не найдено";
            

            SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

            try
            {

                SqlCommand getUser = new SqlCommand(
           "SELECT UserId FROM  aspnet_Users WHERE   (UserName = N'" + Page.User.Identity.Name + "');", connection);
                    connection.Open();
                    SqlDataReader reader = getUser.ExecuteReader();

                    try
                    {
                        reader.Read();
                        user_id = reader[0].ToString();
                    }
                    catch { 
                    
                    
                    }
                    finally
                     {
                    reader.Close();
                    connection.Close();
                    }


                SqlCommand addSite = new SqlCommand(@"INSERT INTO UsersKruzhki (UserId, KruzhId, Статус,  ДатаПодачи) VALUES (@п1,@п2,@п3, @п4)", connection);
                addSite.Parameters.AddWithValue("@п1", user_id);
                addSite.Parameters.AddWithValue("@п2", GridView1.SelectedValue);
                addSite.Parameters.AddWithValue("@п3", "рассмотрение");
                addSite.Parameters.AddWithValue("@п4", DateTime.Now);
               
                connection.Open();
                addSite.ExecuteNonQuery();
                connection.Close();

                Label1.Text = "Заявка на регистрацию в кружке '" + GridView1.SelectedDataKey.Values[1] + "' передана на рассмотрение!";
                Label1.ForeColor = Color.Black;
                Label1.Visible = true;

               

           }
           catch
            {
                Label1.Text = "Вы уже подали заявку на регистрацию в кружке '" + GridView1.SelectedDataKey.Values[1] + "'";
                Label1.ForeColor = Color.Red;
                Label1.Visible = true;
            }

            // Обновляем список

            SqlDataSource1.SelectCommand = "SELECT        Kruzhki.*  FROM     Kruzhki" +
                " WHERE   " +
                " ( NOT (KruzhId IN  (SELECT     KruzhId " +
                "  FROM            UsersKruzhki " +
                " WHERE        (UserId LIKE '" + user_id + "'))) AND " +
                "  (Kruzhki.Дисциплина LIKE '" + DropDownList1.SelectedValue + "') "+
                "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "') )";

            DataSourceSelectArguments argument = new DataSourceSelectArguments();
            connection.Open();

            SqlDataSource1.Select(argument);

            connection.Close();
            GridView1.DataBind();


            GridView1.SelectedIndex = -1;
        }
    }
}