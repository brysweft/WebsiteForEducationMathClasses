using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using AjaxControlToolkit;
using System.IO;



namespace DP2.direct
{
    public partial class dirsubject : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
   

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
           
            MultiView1.ActiveViewIndex = 0;

            // Выполнение сортировки элемента, дя обновления записей
            GridView1.DataBind();
        }




        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            //Добаление дисциплины
            Label1.Text = "";
            Label1.Visible = false;

            string saveDir = @"uploads\Теория\";
            string saveDir2 = @"uploads\Работы\";
            string saveDir3 = @"uploads\Задания\";

            string appPath = Request.PhysicalApplicationPath;

            SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

            try
            {
                SqlCommand addSite = new SqlCommand(@"INSERT INTO Subjects (Название, Описание, Примечание) VALUES (@Название,@Описание,@Примечание)", connection);
                addSite.Parameters.AddWithValue("@Название", TextBoxS1.Text);
                addSite.Parameters.AddWithValue("@Описание", TextBoxS2.Text);
                addSite.Parameters.AddWithValue("@Примечание", TextBoxS3.Text);

                connection.Open();
                addSite.ExecuteNonQuery();
                connection.Close();

                Label1.Text = "Запись успешно добавлена!";
                Label1.ForeColor = Color.Black;
                Label1.Visible = true;

                Directory.CreateDirectory(appPath + saveDir + TextBoxS1.Text + @"\");
                Directory.CreateDirectory(appPath + saveDir2 + TextBoxS1.Text + @"\");
                Directory.CreateDirectory(appPath + saveDir3 + TextBoxS1.Text + @"\");

                //очистка
                TextBoxS1.Text = "";
                TextBoxS2.Text = "";
                TextBoxS3.Text = "";
            }
            catch
            {
                Label1.Text = "Произошла ошибка, убедитесь в правильности введенных данных!";
                Label1.ForeColor = Color.Red;
                Label1.Visible = true;
            }
                    
                
     
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Удаление дисциплины
             
            Panel1.Visible = true;


          GridView1.SelectRow(e.RowIndex);
          GridView1.Enabled = false;

          SqlDataSource1.DeleteCommand = @"DELETE FROM Subjects WHERE (Название =  ' ')";
      
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //обновление дисциплины

            GridView1.SelectRow(e.RowIndex);

            TextBox Descr = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Descript");
            TextBox Poscr = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Poscript");


            SqlDataSource1.UpdateCommand = @"UPDATE    Subjects SET " +
                " Описание = '" + Descr.Text +
                "' , Примечание = '" + Poscr.Text +
                "'   WHERE (SubjectId LIKE  '"+GridView1.SelectedValue + "')";

            GridView1.SelectRow(-1);
           
        }

        protected void btnEditCustomer_Click(object sender, EventArgs e)
        {
           
        }

        protected void editBox_OK_Click(object sender, EventArgs e)
        {

            //Удаляем каталлог и находящиеся в нем файлы

            string saveDir = @"uploads\Теория\";
            string saveDir2 = @"uploads\Работы\";
            string saveDir3 = @"uploads\Задания\";

            string appPath = Request.PhysicalApplicationPath;

            Label Subject = (Label)GridView1.SelectedRow.FindControl("lblTile");

            try
            {
                Directory.Delete(appPath + saveDir + Subject.Text + @"\", true);
                Directory.Delete(appPath + saveDir2 + Subject.Text + @"\", true);
                Directory.Delete(appPath + saveDir3 + Subject.Text + @"\", true);
            }
            catch
            {
               // Каталог не найден
            }


            SqlDataSource1.DeleteCommand = @"DELETE FROM Subjects WHERE (SubjectId LIKE  '" + GridView1.SelectedValue + "')";

            SqlDataSource1.Delete();

            GridView1.SelectRow(-1);




            Panel1.Visible = false;
            GridView1.Enabled = true;
        }

        protected void editBox_Cancel_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;

            GridView1.SelectRow(-1);
            GridView1.Enabled = true;
        }



        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
        {

        }



       


    

    }
}