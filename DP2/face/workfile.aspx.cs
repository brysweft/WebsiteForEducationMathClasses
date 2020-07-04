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
    public partial class workfile : System.Web.UI.Page
    {
      
        //Обращение к класу хранящуму пользователяскую фунцию возвращающую ID текущего пользователя
        kab kab = new kab();

        protected void Page_Load(object sender, EventArgs e)
        {
           

            // При первой загрузке страницы создается выборка кружков, в которых участвует пользователь
             if (Page.IsPostBack == false)
            {


                SqlConnection connection = new SqlConnection(SqlDataSource4.ConnectionString);

                SqlDataSource4.SelectCommand = "    SELECT        Kruzhki.Название AS Принадлежность, UsersKruzhki.UserId, UsersKruzhki.KruzhId, UsersKruzhki.Статус  " +
           " FROM            Subjects INNER JOIN  " +
           " Kruzhki ON Subjects.SubjectId = Kruzhki.Дисциплина INNER JOIN " +
           " UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId " +
           " GROUP BY Subjects.Название, Kruzhki.Название,  Kruzhki.Название, UsersKruzhki.UserId, UsersKruzhki.KruzhId, UsersKruzhki.Статус " +
           " HAVING        ((UsersKruzhki.Статус = N'принято') AND  ( UsersKruzhki.UserId LIKE  '" + kab.getUserId(connection) + "'))";


                DataSourceSelectArguments argument = new DataSourceSelectArguments();
                connection.Open();

                SqlDataSource4.Select(argument);

                connection.Close();
                DropDownList2.DataBind();


            }
        
        }


        protected void ButtonLoad_Click(object sender, EventArgs e)
        {
            Label3.Visible = false;
            Label2.Visible = false;
            HyperLink1.Visible = false;

            // Запись файла


            string name = Page.User.Identity.Name;
            string subject = "";

            SqlConnection connection3 = new SqlConnection(SqlDataSource3.ConnectionString);


            //получение названия дисциплины для создания каталога


            SqlCommand getsub = new SqlCommand(
"SELECT        Subjects.Название FROM   Kruzhki INNER JOIN  Subjects ON Kruzhki.Дисциплина = Subjects.SubjectId " +
" WHERE   (KruzhId LIKE '" + DropDownList2.SelectedValue + "');", connection3);                    

            connection3.Open();
            SqlDataReader reader2 = getsub.ExecuteReader();

            try
            {
                reader2.Read();
                 subject = reader2[0].ToString();
            }
            catch
            {


            }
            finally
            {
                reader2.Close();
                connection3.Close();
            }



            //Определение каталога в которм будет храниться файл



            string saveDir = @"uploads\Работы\";
            try
            {
                saveDir = @"uploads\Работы\" + subject + @"\" + DropDownList2.SelectedItem.Text + @"\" + name + @"\";


                string appPath = Request.PhysicalApplicationPath;

                if (FileUpload1.HasFile)
                {
                    int fileSize = FileUpload1.PostedFile.ContentLength;

                    // 8,400,000 bytes (approximately 8 MB) to be uploaded.
                    if (fileSize < 8400000)
                    {

                        string extension = System.IO.Path.GetExtension(FileUpload1.FileName);

                        // Только текстовые файлы doc и txt

                        if ((extension == ".doc") || (extension == ".txt") || (extension == ".docx") || (extension == ".pdf") || (extension == ".zip"))
                        {


                            System.IO.Directory.CreateDirectory(appPath + saveDir);

                            saveDir = saveDir + Server.HtmlEncode(FileUpload1.FileName);

                            string savePath = appPath + saveDir;

                            DropDownList2.SelectedItem.Text.Replace(@"\", "/");


                            HyperLink1.Text = "Ссылка на файл";

                            HyperLink1.NavigateUrl = "../uploads/Работы/" + subject + "/" + DropDownList2.SelectedItem.Text + "/" + name + "/" + FileUpload1.FileName;


                            //Добаление информации о файле в БД
                            Label2.Text = "";
                            Label2.Visible = false;

                            SqlConnection connection = new SqlConnection(SqlDataSource4.ConnectionString);


                            SqlCommand addSite = new SqlCommand(@"INSERT INTO Works  (Кружок, НазваниеФайла, Путь, Ссылка, ДатаЗагрузки, Владелец, Статус) VALUES (@Параметр1, @Параметр2,@Параметр3,@Параметр4,@Параметр5, @Параметр6, @Параметр7)", connection);
                            addSite.Parameters.AddWithValue("@Параметр1", DropDownList2.SelectedValue);
                            addSite.Parameters.AddWithValue("@Параметр2", FileUpload1.FileName);
                            addSite.Parameters.AddWithValue("@Параметр3", saveDir);
                            addSite.Parameters.AddWithValue("@Параметр4", "../uploads/Работы/" + subject + "/" + DropDownList2.SelectedItem.Text + "/" + name + "/" + FileUpload1.FileName);
                            addSite.Parameters.AddWithValue("@Параметр5", DateTime.Now);
                            addSite.Parameters.AddWithValue("@Параметр6", kab.getUserId(connection));
                            addSite.Parameters.AddWithValue("@Параметр7", "не проверено");
                            try
                            {
                                connection.Open();
                                addSite.ExecuteNonQuery();
                                connection.Close();

                                Label2.Text = "Запись успешно добавлена!";
                                Label2.ForeColor = Color.Black;
                                Label2.Visible = true;


                                FileUpload1.SaveAs(savePath);

                                HyperLink1.Visible = true;

                                Label3.Visible = true;

                                Label3.Text = " Файл успешно сохрнен!";

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
                            Label3.Text = "Загружайте текстовые файлы или группу файлов в .zip!";

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
    }
}