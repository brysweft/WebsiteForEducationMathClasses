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
    public partial class taskfiles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack == false)
            {


                SqlConnection connection = new SqlConnection(SqlDataSource2.ConnectionString);

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



                SqlDataSource2.SelectCommand = "    SELECT        Kruzhki.Название, UsersKruzhki.UserId, UsersKruzhki.KruzhId, UsersKruzhki.Статус  " +
           " FROM            Subjects INNER JOIN  " +
           " Kruzhki ON Subjects.SubjectId = Kruzhki.Дисциплина INNER JOIN " +
           " UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId " +
           " GROUP BY Subjects.Название, Kruzhki.Название,  Kruzhki.Название, UsersKruzhki.UserId, UsersKruzhki.KruzhId, UsersKruzhki.Статус " +
           " HAVING        ((UsersKruzhki.Статус = N'принято') AND  ( UsersKruzhki.UserId LIKE  '" + user_id + "'))";





                DataSourceSelectArguments argument = new DataSourceSelectArguments();
                connection.Open();

                SqlDataSource2.Select(argument);

                connection.Close();
                DropDownList1.DataBind();
            }
        }




        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Выборка кружковых заданий


            if (DropDownList1.SelectedValue != "__________")
            {

                SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

                SqlDataSource1.SelectCommand = "  SELECT * FROM [TaskFiles] " +
                              " WHERE     ((TaskFiles.Кружок LIKE '" + DropDownList1.SelectedValue + "') " +
                           " )";

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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Скачивание файла

            Label ссылка = (Label)GridView1.SelectedRow.FindControl("Label4");

            Page.Response.Redirect(@"../" +ссылка.Text,false);

        }
    }
}