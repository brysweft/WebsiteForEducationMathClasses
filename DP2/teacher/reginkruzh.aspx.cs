using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;

namespace DP2.teacher
{
    public partial class reginkruzh : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Активация действия

            Panel1.Visible = true;
             GridView1.Enabled = false;

        }

        protected void ButtonОк_Click(object sender, EventArgs e)
        {

            // Принятие в кружок


                SqlDataSource1.UpdateCommand = @"UPDATE    UsersKruzhki SET " +
                    " Статус = 'принято' " +
                      "   WHERE ((KruzhId LIKE  '" + GridView1.SelectedDataKey[1] + "') AND (UserId LIKE  '" + GridView1.SelectedDataKey[0] + "'))";
                GridView1.SelectRow(-1);

                SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

                connection.Open();

                SqlDataSource1.Update();

                connection.Close();


            GridView1.SelectRow(-1);

            Panel1.Visible = false;
            GridView1.Enabled = true;


            //Обновление списка

            //Показывать обработанные заявки
            if (CheckBox1.Checked)
            {

                SqlDataSource1.SelectCommand = "  SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, aspnet_Users.UserName, " +
              " Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи " +
               "    FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId " +
              " INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
              " INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
                   " WHERE     ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') " +
                   "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "')  )";

            }
            else
            {
                SqlDataSource1.SelectCommand = "  SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, aspnet_Users.UserName, " +
               " Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи " +
                "    FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId " +
               " INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
               " INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
                    " WHERE     ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') " +
                    "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "')" +
                    " AND (UsersKruzhki.Статус='рассмотрение') )";
            }
            DataSourceSelectArguments argument = new DataSourceSelectArguments();
            connection.Open();

            SqlDataSource1.Select(argument);

            connection.Close();

            GridView1.Visible = true;
            GridView1.DataBind();




        }

        protected void ButtonNo_Click(object sender, EventArgs e)
        {
            // Запрет в кружок


            SqlDataSource1.UpdateCommand = @"UPDATE    UsersKruzhki SET " +
                " Статус = 'отклонено' " +
                  "   WHERE ((KruzhId LIKE  '" + GridView1.SelectedDataKey[1] + "') AND (UserId LIKE  '" + GridView1.SelectedDataKey[0] + "'))";
            GridView1.SelectRow(-1);

            SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

            connection.Open();

            SqlDataSource1.Update();

            connection.Close();


            GridView1.SelectRow(-1);

            Panel1.Visible = false;
            GridView1.Enabled = true;


            //Обновление списка

            //Показывать обработанные заявки
            if (CheckBox1.Checked)
            {

                SqlDataSource1.SelectCommand = "  SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, aspnet_Users.UserName, " +
              " Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи " +
               "    FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId " +
              " INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
              " INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
                   " WHERE     ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') " +
                   "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "')  )";

            }
            else
            {
                SqlDataSource1.SelectCommand = "  SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, aspnet_Users.UserName, " +
               " Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи " +
                "    FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId " +
               " INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
               " INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
                    " WHERE     ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') " +
                    "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "')" +
                    " AND (UsersKruzhki.Статус='рассмотрение') )";
            }
            DataSourceSelectArguments argument = new DataSourceSelectArguments();
            connection.Open();

            SqlDataSource1.Select(argument);

            connection.Close();

            GridView1.Visible = true;
            GridView1.DataBind();

        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            GridView1.SelectRow(-1);
            Panel1.Visible = false;
            GridView1.Enabled = true;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
                        //Выборка заявок


            if (DropDownList1.SelectedValue != "__________")
            {

                SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

                //Показывать обработанные заявки
                if (CheckBox1.Checked)
                {

                    SqlDataSource1.SelectCommand = "  SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, aspnet_Users.UserName, " +
                  " Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи " +
                   "    FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId " +
                  " INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
                  " INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
                       " WHERE     ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') " +
                       "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "')  )";

                }
                else
                {
                    SqlDataSource1.SelectCommand = "  SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, aspnet_Users.UserName, " +
                   " Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи " +
                    "    FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId " +
                   " INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
                   " INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
                        " WHERE     ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') " +
                        "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "')" +
                        " AND (UsersKruzhki.Статус='рассмотрение') )";
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
            if (DropDownList1.SelectedValue != "__________")
            {

                SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

                //Показывать обработанные заявки
                if (CheckBox1.Checked)
                {

                    SqlDataSource1.SelectCommand = "  SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, aspnet_Users.UserName, " +
                  " Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи " +
                   "    FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId " +
                  " INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
                  " INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
                       " WHERE     ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') " +
                       "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "')  )";

                }
                else
                {
                    SqlDataSource1.SelectCommand = "  SELECT UsersKruzhki.UserId, UsersKruzhki.KruzhId, aspnet_Users.UserName, " +
                   " Users.Фамилия, Users.Имя, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи " +
                    "    FROM Kruzhki INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId " +
                   " INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
                   " INNER JOIN aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
                        " WHERE     ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') " +
                        "  AND (Kruzhki.ДатаОкончания > '" + DateTime.Now + "')" +
                        " AND (UsersKruzhki.Статус='рассмотрение') )";
                }
                DataSourceSelectArguments argument = new DataSourceSelectArguments();
                connection.Open();

                SqlDataSource1.Select(argument);

                connection.Close();

                GridView1.DataBind();


            }
        }


    }
}