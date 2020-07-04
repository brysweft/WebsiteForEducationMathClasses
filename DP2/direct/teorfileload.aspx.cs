using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Drawing;

namespace DP2.direct
{
    public partial class teorfileload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Visible = false;
            Label2.Visible = false;
            HyperLink1.Visible = false;

            // Запись файла

            //Определение каталога в которм будет храниться файл


            string saveDir = @"uploads\Теория\";
            
            try
            {

                saveDir = @"uploads\Теория\" + DropDownList1.SelectedItem.Text + @"\";

            
            string appPath = Request.PhysicalApplicationPath;

            if (FileUpload1.HasFile)
            {
                int fileSize = FileUpload1.PostedFile.ContentLength;

                // 8,400,000 bytes (approximately 8 MB) to be uploaded.
                if (fileSize < 8400000)
                {

                    string extension = System.IO.Path.GetExtension(FileUpload1.FileName);

                    // Только текстовые файлы doc и txt и  zip

                    if ((extension == ".doc") || (extension == ".txt") || (extension == ".docx") || (extension == ".pdf") || (extension == ".zip"))
                    {


                        System.IO.Directory.CreateDirectory(appPath + saveDir);


                        saveDir = saveDir + Server.HtmlEncode(FileUpload1.FileName);

                        string savePath = appPath + saveDir;


                        DropDownList1.SelectedItem.Text.Replace(@"\", "/");

                        HyperLink1.Visible = true;

                        HyperLink1.Text = "Ссылка на файл";

                        HyperLink1.NavigateUrl = "../uploads/Теория/" + DropDownList1.SelectedItem.Text + "/" + FileUpload1.FileName;


                        //Добаление информации о файле в БД
                        Label2.Text = "";
                        Label2.Visible = false;

                        SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);


                        SqlCommand addSite = new SqlCommand(@"INSERT INTO TeorFiles  (Кружок, НазваниеФайла, Путь, Ссылка, ДатаЗагрузки) VALUES (@Параметр1, @Параметр2,@Параметр3,@Параметр4,@Параметр5)", connection);
                        addSite.Parameters.AddWithValue("@Параметр1", DropDownList1.SelectedValue);
                        addSite.Parameters.AddWithValue("@Параметр2", FileUpload1.FileName);
                        addSite.Parameters.AddWithValue("@Параметр3", saveDir);
                        addSite.Parameters.AddWithValue("@Параметр4", "../uploads/Теория/" + DropDownList1.SelectedItem.Text + "/" + FileUpload1.FileName);
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

                            Label1.Visible = true;

                            Label1.Text = " Файл успешно сохрнен " + savePath;

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
                        Label1.Visible = true;
                        Label1.Text = "Загружайте текстовые файлы или в сжатой папке zip!";

                    }
                }
                else
                {
                    Label1.Visible = true;
                    Label1.Text = "Ваш файл превышает лимит 8 Мб!";

                }

            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "Вы не выбрали файл!";
            }

            }
            catch
            {
                Label2.Text = "Необходимо добавить тему!";
                Label2.Visible = true;
            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }


    

        protected void ButtonОк1_Click(object sender, EventArgs e)
        {
            // Удаление файла, записи в БД и физически 

          //Находим физический путь файла

            string appPath = Request.PhysicalApplicationPath;

            SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

            SqlCommand getFile = new SqlCommand(
   "SELECT Путь FROM TeorFiles " +
    "WHERE (TeorFileId LIKE  '" + GridView1.SelectedValue + "');", connection);
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
            SqlDataSource1.DeleteCommand = @"DELETE FROM TeorFiles WHERE (TeorFileId LIKE  '" + GridView1.SelectedValue + "')";

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



        protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            // Удаление файла

            Panel1.Visible = true;


            GridView1.SelectRow(e.RowIndex);
            GridView1.Enabled = false;

            SqlDataSource1.DeleteCommand = @"DELETE FROM TeorFiles WHERE (НазваниеФайла =  ' ')";
          
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            GridView1.DataBind();
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            DropDownList1.DataBind();
        }

    }
}