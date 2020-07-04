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
    public partial class workcheck : System.Web.UI.Page
    {
        //Обращение к класу хранящуму пользователяскую фунцию возвращающую ID текущего пользователя
        face.kab kab = new face.kab();

        protected void Page_Load(object sender, EventArgs e)
        {
            Button1_Click(sender, e);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Выборка кружковых работ пользователей

            if(DropDownList1.Text=="__________"){
            LabelBegin.Visible =false;
           LabelEnd.Visible = false;
           LabelReg.Visible = false;
           GridView1.Visible = false;
            
            }

                // обновляем список пользвателей

                SqlConnection connection3 = new SqlConnection(SqlDataSource3.ConnectionString);


                SqlDataSource3.SelectCommand = "   SELECT DISTINCT Users.UserId, Users.Фамилия, Users.Имя, Users.Отчество, Users.УчебноеЗаведение,  " +
              " Users.Группа, Users.Телефон, Users.Фамилия + N' ' + Users.Имя + N' ' + Users.Отчество AS ФИО " +
             " FROM Users INNER JOIN UsersKruzhki ON Users.UserId = UsersKruzhki.UserId " +
          "  WHERE (UsersKruzhki.Статус = N'принято') AND (UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "')";


                DataSourceSelectArguments argument3 = new DataSourceSelectArguments();
                connection3.Open();

                SqlDataSource3.Select(argument3);

                DropDownList2.DataBind();
                connection3.Close();

              


                SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

                SqlCommand getUser = new SqlCommand(
           "SELECT  ДатаНачала, ДатаОкончания FROM Kruzhki WHERE   (KruzhId LIKE '" + DropDownList1.SelectedValue + "');", connection);
                connection.Open();
                SqlDataReader reader = getUser.ExecuteReader();

                reader.Read();
                if (reader.HasRows)
                {
                    LabelBegin.Text = reader[0].ToString();
                    LabelEnd.Text = reader[1].ToString();
                    LabelBegin.Visible = true;
                    LabelEnd.Visible = true;
                }
                reader.Close();
                connection.Close();

             

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
              if (DropDownList1.SelectedValue != "__________"){

            SqlConnection connection = new SqlConnection(SqlDataSource3.ConnectionString);

            SqlCommand getUser = new SqlCommand(
       "SELECT  UsersKruzhki.ДатаПодачи FROM  UsersKruzhki  WHERE   ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') AND (UsersKruzhki.UserId LIKE '" + DropDownList2.SelectedValue + "'));", connection);
            connection.Open();
            SqlDataReader reader = getUser.ExecuteReader();

            reader.Read();
            LabelReg.Text = reader[0].ToString();
    
            reader.Close();
            connection.Close();

            LabelReg.Visible = true;
        }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue != "__________")
            {
                if (DropDownList2.SelectedValue != "")
                {
                   

                    SqlConnection connection3 = new SqlConnection(SqlDataSource3.ConnectionString);

                    SqlCommand getUser = new SqlCommand(
               "SELECT  UsersKruzhki.ДатаПодачи FROM  UsersKruzhki  WHERE   ((UsersKruzhki.KruzhId LIKE '" + DropDownList1.SelectedValue + "') AND (UsersKruzhki.UserId LIKE '" + DropDownList2.SelectedValue + "'));", connection3);
                    connection3.Open();
                    SqlDataReader reader = getUser.ExecuteReader();

                    reader.Read();
                    LabelReg.Text = reader[0].ToString();

                    reader.Close();
                    connection3.Close();

                    LabelReg.Visible = true;



                    // Делаем выборку кружковых работ по двум параметрам


                    SqlConnection connection = new SqlConnection(SqlDataSource2.ConnectionString);

                    // выбираем не провереные работы
                    if (CheckBox1.Checked)
                    {
                        SqlDataSource2.SelectCommand = "   SELECT *  " +
    "  FROM Works INNER JOIN UsersKruzhki ON Works.Владелец = UsersKruzhki.UserId AND Works.Кружок = UsersKruzhki.KruzhId INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
" WHERE     (( Works.Кружок LIKE  '" + DropDownList1.SelectedValue + "') " +
" AND ( Works.Владелец LIKE  '" + DropDownList2.SelectedValue + "') AND ( Works.Статус = 'не проверено') )";

                    }
                    else {
                        SqlDataSource2.SelectCommand = "   SELECT *  " +
        "  FROM Works INNER JOIN UsersKruzhki ON Works.Владелец = UsersKruzhki.UserId AND Works.Кружок = UsersKruzhki.KruzhId INNER JOIN Users ON UsersKruzhki.UserId = Users.UserId " +
 " WHERE     (( Works.Кружок LIKE  '" + DropDownList1.SelectedValue + "') " +
" AND ( Works.Владелец LIKE  '" + DropDownList2.SelectedValue + "') AND ( (Works.Статус = 'проверено') OR (Works.Статус = 'не засчитано')) )";
                    }
                    DataSourceSelectArguments argument = new DataSourceSelectArguments();
                    connection.Open();

                    SqlDataSource2.Select(argument);

                    connection.Close();

                    GridView1.Visible = true;
                    GridView1.DataBind();
                }


            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Активация действия

            Panel2.Visible = true;
           GridView1.Enabled = false;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Button1_Click(sender, e);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            // обновляем список
            //Button1_Click(sender, e);
        }

        protected void ButtonCancel3_Click(object sender, EventArgs e)
        {

        
            Panel2.Visible = false;
            GridView1.Enabled = true;
        }

        protected void ButtonLoad_Click(object sender, EventArgs e)
        {

            // Скачивание файла

            Label ссылка = (Label)GridView1.SelectedRow.FindControl("Label2");

            Page.Response.Redirect(ссылка.Text, false);
        }

        protected void ButtonDell_Click(object sender, EventArgs e)
        {


            Panel1.Visible = true;
            Panel2.Visible = false;

            GridView1.Enabled = false;
        }

        protected void ButtonCancel2_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = false;
            GridView1.Enabled = true;
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


            }
            finally
            {
                reader.Close();
                connection.Close();
            }

            // Удаление записи из БД
            SqlDataSource2.DeleteCommand = @"DELETE FROM Works WHERE (WorkId LIKE  '" + GridView1.SelectedValue + "')";

            SqlDataSource2.Delete();

            Panel1.Visible = false;
            Panel2.Visible = false;
            GridView1.Enabled = true;


            //обновляем список
            Button1_Click(sender, e);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           // определение команды обновления оценки работы
            GridView1.SelectRow(e.RowIndex);
            Panel2.Visible = false;
            GridView1.Enabled = true;
            
            DropDownList статус = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownListS");
            TextBox баллы = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBoxB");
            TextBox комментарий = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBoxK");
         
            
            //

            SqlDataSource2.UpdateCommand = @"UPDATE Works SET  " +
                "  Статус = '"+ статус.Text+"', " +
                    "  Баллы  = '" + баллы.Text + "', " +
                          "  Комментарий  =  '" + комментарий.Text + "'  " +
                  "   WHERE  (WorkId LIKE  '" + GridView1.SelectedValue + "')";


        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            Button1_Click(sender, e);
        }

        protected void GridView1_Sorted(object sender, EventArgs e)
        {
            Button1_Click(sender, e);
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            Button1_Click(sender, e);
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            Button1_Click(sender, e);
        }


    }
}