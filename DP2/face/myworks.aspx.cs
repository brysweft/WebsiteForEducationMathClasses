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
    public partial class myworks : System.Web.UI.Page
    {


        //Обращение к класу хранящуму пользователяскую фунцию возвращающую ID текущего пользователя
        kab kab = new kab();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {


                SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);


                SqlDataSource1.SelectCommand = "    SELECT Kruzhki.Название, UsersKruzhki.KruzhId,  " +
           " UsersKruzhki.UserId, Kruzhki.Описание, Kruzhki.Дисциплина FROM  " +
           " Kruzhki " +
           " INNER JOIN UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId " +
             " WHERE     (( UsersKruzhki.UserId LIKE  '" + kab.getUserId(connection) + "') " +
          "  AND  UsersKruzhki.Статус = 'принято')";

                DataSourceSelectArguments argument = new DataSourceSelectArguments();
                connection.Open();

                SqlDataSource1.Select(argument);

                connection.Close();
                DropDownList1.DataBind();

            }

            // обновляем список
            DropDownList1_SelectedIndexChanged(sender, e);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Выборка кружковых работ пользователя


            if (DropDownList1.SelectedValue != "__________")
            {

                SqlConnection connection = new SqlConnection(SqlDataSource2.ConnectionString);




                SqlDataSource2.SelectCommand = "   SELECT * FROM [Works] " +
           
             " WHERE     (( Works.Кружок LIKE  '" + DropDownList1.SelectedValue + "') " +
          " AND ( Works.Владелец LIKE  '" + kab.getUserId(connection) + "') )";



                DataSourceSelectArguments argument = new DataSourceSelectArguments();
                connection.Open();

                SqlDataSource2.Select(argument);

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


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void ButtonОк2_Click(object sender, EventArgs e)
        {
            // Удаление файла, записи в БД и физически 

            //Находим физический путь файла
            string appPath = Request.PhysicalApplicationPath;

            SqlConnection connection = new SqlConnection(SqlDataSource2.ConnectionString);

            SqlCommand getFile = new SqlCommand(
   "SELECT Путь FROM Works " +
    "WHERE (WorkId LIKE  '" + GridView1.SelectedValue + "');", connection);
            connection.Open();

            SqlDataReader reader = getFile.ExecuteReader();
            try
            {
                reader.Read();
                File.Delete(appPath + reader[0].ToString());
            }
            catch
            {
                //путь не найден

            }
            finally
            {
                reader.Close();
                connection.Close();
            }



            // Удаление записи из БД
            SqlDataSource2.DeleteCommand = @"DELETE FROM Works WHERE (WorkId LIKE  '" + GridView1.SelectedValue + "')";

            SqlDataSource2.Delete();

            GridView1.SelectedIndex= -1;
            Panel1.Visible = false;
            Panel2.Visible = false;
            GridView1.Enabled = true;
            DropDownList1.SelectedIndex = 0;
        }

        protected void ButtonCancel2_Click(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = -1;
            Panel1.Visible = false;
            Panel2.Visible = false;
            GridView1.Enabled = true;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {


            Label1.Visible = false;
            Panel2.Visible = true;
            GridView1.Enabled = false;


        }

        protected void ButtonCancel3_Click(object sender, EventArgs e)
        {
            GridView1.SelectRow(-1);
            Panel2.Visible = false;
           
            GridView1.Enabled = true;
        }

        protected void ButtonDell_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;

            GridView1.Enabled = false;

            // Определяем статус работы пользователя
              string status = Request.PhysicalApplicationPath;

            SqlConnection connection = new SqlConnection(SqlDataSource2.ConnectionString);

            SqlCommand getFile = new SqlCommand(
   "SELECT Статус FROM Works " +
    "WHERE (WorkId LIKE  '" + GridView1.SelectedValue + "');", connection);
            connection.Open();

            SqlDataReader reader = getFile.ExecuteReader();
            try
            {
                reader.Read();
               status =  reader[0].ToString();


            }
            catch
            {


            }
            finally
            {
                reader.Close();
                connection.Close();
            }



            if ((status == "не проверено") || (status == "не засчитано"))
            {
                Panel1.Visible = true;
               

            }
            if (status == "проверено")
            {

                Label1.Text = "Удаление засчитанной работы не целесообразно, т.к. это приведет к потере балов, начисленных за эту работу. Удаляйте не провреные  или не засчитаные работы, чтобы загрузить переделанный вариант работы";
                Label1.Visible = true;
                GridView1.Enabled = true;
            
            }


        }

        protected void ButtonLoad_Click(object sender, EventArgs e)
        {
           
      
            // Скачивание файла

            Label ссылка = (Label)GridView1.SelectedRow.FindControl("Label6");

            Page.Response.Redirect(ссылка.Text, false);
          

        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

       
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
        }



    }
}