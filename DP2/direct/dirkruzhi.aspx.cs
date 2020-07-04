using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;

namespace DP2.direct
{
    public partial class dirkruzhi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Добаление кружка
            Label1.Text = "";
            Label1.Visible = false;

            string saveDir = @"uploads\Задания\";
            string saveDir2 = @"uploads\Работы\";
            string saveDir3 = @"uploads\Теория\";

            string appPath = Request.PhysicalApplicationPath;

            SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

           try
           {
                SqlCommand addSite = new SqlCommand(@"INSERT INTO Kruzhki (Дисциплина, Название, Описание,  ДатаНачала, ДатаОкончания) VALUES (@п1,@п2,@п3, @п4,@п5)", connection);
                addSite.Parameters.AddWithValue("@п1", DropDownList1.SelectedValue);
                addSite.Parameters.AddWithValue("@п2", TextBoxT1.Text);
                addSite.Parameters.AddWithValue("@п3", TextBoxT2.Text);
                addSite.Parameters.AddWithValue("@п4", Convert.ToDateTime(TextBoxT3.Text + " 0:00:00"));
                addSite.Parameters.AddWithValue("@п5", Convert.ToDateTime(TextBoxT4.Text + " 0:00:00"));
                connection.Open();
                addSite.ExecuteNonQuery();
                connection.Close();

                Label1.Text = "Запись успешно добавлена!";
                Label1.ForeColor = Color.Black;
                Label1.Visible = true;
           
                Directory.CreateDirectory(appPath + saveDir +  DropDownList1.SelectedItem.Text + @"\" + TextBoxT1.Text + @"\");
                Directory.CreateDirectory(appPath + saveDir2 + DropDownList1.SelectedItem.Text + @"\" + TextBoxT1.Text + @"\");
                Directory.CreateDirectory(appPath + saveDir3 + DropDownList1.SelectedItem.Text + @"\" + TextBoxT1.Text + @"\");

                //очистка
                TextBoxT1.Text = "";
                TextBoxT2.Text = "";
                TextBoxT3.Text = "";
                TextBoxT4.Text = "";
              
               
            }
           catch
           {
               Label1.Text = "Произошла ошибка, убедитесь в правильности введенных данных!";
                Label1.ForeColor = Color.Red;
                Label1.Visible = true;
          }
                    
                
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            MultiView1.ActiveViewIndex = 0;
            GridView1.DataBind();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            GridView2.DataBind();
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            DropDownList1.DataBind();
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {

            MultiView1.ActiveViewIndex = 3;
            DropDownList2.DataBind();
        }

        protected void ButtonОк1_Click(object sender, EventArgs e)
        {

            //Удаляем каталлог Кружка и находящиеся в нем файлы


            string saveDir = @"uploads\Задания\";
            string saveDir2 = @"uploads\Работы\";
            string saveDir3 = @"uploads\Теория\";

            string appPath = Request.PhysicalApplicationPath;

            Label Кружок = (Label)GridView1.SelectedRow.FindControl("Label4");
            Label Дисциплина = (Label)GridView1.SelectedRow.FindControl("Label2");

            try
            {
                Directory.Delete(appPath + saveDir + Дисциплина.Text + @"\" + Кружок.Text + @"\", true);
                Directory.Delete(appPath + saveDir2 + Дисциплина.Text + @"\" + Кружок.Text + @"\", true);
                Directory.Delete(appPath + saveDir3 + Дисциплина.Text + @"\" + Кружок.Text + @"\", true);

            }
            catch{ 
            // каталоги не найдены
            }

            SqlDataSource1.DeleteCommand = @"DELETE FROM Kruzhki WHERE (KruzhId LIKE  '" + GridView1.SelectedValue + "')";

            SqlDataSource1.Delete();

            GridView1.SelectRow(-1);

            Panel1.Visible = false;
            GridView1.Enabled = true;
        }

        protected void ButtonCancel1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;

            GridView1.SelectRow(-1);
            GridView1.Enabled = true;
        }

        protected void ButtonОк2_Click(object sender, EventArgs e)
        {
            // Удаление файла, записи в БД и физически 

            //Находим физический путь файла
            string appPath = Request.PhysicalApplicationPath;

            SqlConnection connection = new SqlConnection(SqlDataSource2.ConnectionString);

            SqlCommand getFile = new SqlCommand(
   "SELECT Путь FROM TaskFiles " +
    "WHERE (TaskFileId LIKE  '" + GridView2.SelectedValue + "');", connection);
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
            SqlDataSource2.DeleteCommand = @"DELETE FROM TaskFiles WHERE (TaskFileId LIKE  '" + GridView2.SelectedValue + "')";

            SqlDataSource2.Delete();



            GridView2.SelectRow(-1);

            Panel2.Visible = false;
            GridView2.Enabled = true;
        }

        protected void ButtonCancel2_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;
            GridView2.SelectRow(-1);
            GridView2.Enabled = true;
        }

        protected void ButtonLoad_Click(object sender, EventArgs e)
        {
            Label3.Visible = false;
            Label2.Visible = false;
            HyperLink1.Visible = false;

            // Запись файла

            //Определение каталога в которм будет храниться файл


            string saveDir = @"uploads\Задания\";
            try
            {
                saveDir = @"uploads\Задания\" + DropDownList2.SelectedItem.Text + @"\";


                string appPath = Request.PhysicalApplicationPath;

                if (FileUpload1.HasFile)
                {
                    int fileSize = FileUpload1.PostedFile.ContentLength;

                    // 8,400,000 bytes (approximately 8 MB) to be uploaded.
                    if (fileSize < 8400000)
                    {

                        string extension = System.IO.Path.GetExtension(FileUpload1.FileName);

                        // Только текстовые файлы doc и txt и zip

                        if ((extension == ".doc") || (extension == ".txt") || (extension == ".docx") || (extension == ".pdf") || (extension == ".zip"))
                        {


                            System.IO.Directory.CreateDirectory(appPath + saveDir);

                            saveDir = saveDir + Server.HtmlEncode(FileUpload1.FileName);

                            string savePath = appPath + saveDir;

                            DropDownList2.SelectedItem.Text.Replace(@"\", "/");

                            HyperLink1.Visible = true;

                            HyperLink1.Text = "Ссылка на файл";

                            HyperLink1.NavigateUrl = "../uploads/Задания/" + DropDownList2.SelectedItem.Text + "/" + FileUpload1.FileName;


                            //Добаление информации о файле в БД
                            Label2.Text = "";
                            Label2.Visible = false;

                            SqlConnection connection = new SqlConnection(SqlDataSource2.ConnectionString);


                            SqlCommand addSite = new SqlCommand(@"INSERT INTO TaskFiles  (Кружок, НазваниеФайла, Путь, Ссылка, ДатаЗагрузки) VALUES (@Параметр1, @Параметр2,@Параметр3,@Параметр4,@Параметр5)", connection);
                            addSite.Parameters.AddWithValue("@Параметр1", DropDownList2.SelectedValue);
                            addSite.Parameters.AddWithValue("@Параметр2", FileUpload1.FileName);
                            addSite.Parameters.AddWithValue("@Параметр3", saveDir);
                            addSite.Parameters.AddWithValue("@Параметр4", "../uploads/Задания/" + DropDownList2.SelectedItem.Text + "/" + FileUpload1.FileName);
                            addSite.Parameters.AddWithValue("@Параметр5", DateTime.Now);
                            try
                            {
                                connection.Open();
                                addSite.ExecuteNonQuery();
                                connection.Close();

                                Label2.Text = "Запись успешно добавлена!";
                                Label2.ForeColor = Color.Black;
                                Label2.Visible = true;


                                FileUpload1.SaveAs(savePath);

                                Label3.Visible = true;

                                Label3.Text = " Файл успешно сохрнен " + savePath;

                            }

                            catch
                            {
                                Label2.Text = "Произошла ошибка, файл не загружен!";
                                Label2.ForeColor = Color.Red;
                                Label2.Visible = true;
                            }


                        }

                        else
                        {
                            Label3.Visible = true;
                            Label3.Text = "Загружайте текстовые файлы doc и pdf и zip!";

                        }
                    }
                    else
                    {
                        Label3.Visible = true;
                        Label3.Text = "Ваш файл превышает лимит 8 Мб!";

                    }

                }
                else
                {
                    Label3.Visible = true;
                    Label3.Text = "Вы не выбрали файл!";
                }

            }
            catch
            {
                Label2.Text = "Необходимо добавить тему!";
                Label2.Visible = true;
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Удаление Кружка

            Panel1.Visible = true;


            GridView1.SelectRow(e.RowIndex);
            GridView1.Enabled = false;

            SqlDataSource1.DeleteCommand = @"DELETE FROM Kruzhki WHERE (Название =  ' ')";
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Удаление файла

            Panel2.Visible = true;


            GridView2.SelectRow(e.RowIndex);
            GridView2.Enabled = false;

            SqlDataSource2.DeleteCommand = @"DELETE FROM TaskFiles WHERE (НазваниеФайла =  ' ')";
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //обновление Кружка

            GridView1.SelectRow(e.RowIndex);

            TextBox Описание = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4");
            TextBox Начало = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5");
            TextBox Конец = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox6");

            try
            {
                SqlDataSource1.UpdateCommand = @"UPDATE    Kruzhki SET " +
                    " Описание = '" + Описание.Text +
                    "' , ДатаНачала = '" + Convert.ToDateTime(Начало.Text) +
                      "' , ДатаОкончания = '" + Convert.ToDateTime(Конец.Text) +

                      "'   WHERE (KruzhId LIKE  '" + GridView1.SelectedValue + "')";
                GridView1.SelectRow(-1);
            }
            catch
            {
                e.Cancel = true;
            }

        }
    }
}