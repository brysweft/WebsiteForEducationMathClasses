using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.Security;

namespace DP2.face
{
    public partial class taskseries : System.Web.UI.Page
    {
        face.kab kab = new face.kab();

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
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

            LabelRez.Visible = false;
            PanelP.Visible = false;
            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LabelRez.Visible = false;
            PanelP.Visible = false;
            DropDownList2.Visible = true;

           
                // обновляем список пользвателей

                SqlConnection connection3 = new SqlConnection(SqlDataSource3.ConnectionString);


                SqlDataSource3.SelectCommand = "  SELECT * FROM [TaskSeries] " +   
          "  WHERE (Кружок LIKE '" + DropDownList1.SelectedValue + "')";


                DataSourceSelectArguments argument3 = new DataSourceSelectArguments();
                connection3.Open();
                SqlDataSource3.Select(argument3);
                DropDownList2.DataBind();
                connection3.Close();

        }


        protected void DropDownList2_Unload(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Text != "__________")
            {
                if (DropDownList2.SelectedItem != null)
                {

                    LabelRez.Visible = false;
                    PanelP.Enabled = true;
                    Button2.Visible = true;
                    PanelP.Visible = true;

                    SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);



                    string tempname = "Task_" + DropDownList2.SelectedItem.Text + "_" + Page.User.Identity.Name;

                    // в регистр вседения о создаваемой временной таблице таблице

                    SqlCommand addrow = new SqlCommand(@"INSERT INTO TempTables (Name, UserName) VALUES (@Название, @Пользователь)", connection);
                    addrow.Parameters.AddWithValue("@Название", tempname);
                    addrow.Parameters.AddWithValue("@Пользователь", Page.User.Identity.Name);

                    try
                    {
                        connection.Open();
                        addrow.ExecuteNonQuery();
                        connection.Close();


                        // Создаем временную таблицу
                        SqlCommand addSite = new SqlCommand(@"SELECT * INTO " + tempname + "  FROM Tasks  Where(TaskSeriesId Like '" + DropDownList2.SelectedValue + "' )", connection);
                        connection.Open();

                        addSite.ExecuteNonQuery();


                    }
                    catch
                    {
                        // Таблица уже существует

                    }
                    finally
                    {
                        connection.Close();
                    }


                    SqlCommand getUser = new SqlCommand(
                   "SELECT Номер, Задание, Ответ, ОтветПользователя, Статус FROM  " + tempname +
                   "  ", connection);
                    connection.Open();
                    SqlDataReader reader = getUser.ExecuteReader();

                    // Делаем вопросы невидимыми
                    for (int j = 1; j <= 10; j++)
                    {
                        Panel panel = (Panel)PanelP.FindControl("Panel" + j);
                        Label label = (Label)PanelP.FindControl("LabelP" + j);
                        TextBox text = (TextBox)PanelP.FindControl("TextBoxP" + j);
                        HiddenField field = (HiddenField)PanelP.FindControl("HiddenFieldP" + j);

                        panel.Visible = false;

                        label.Text = "";
                        text.Text = "";
                        field.Value = "";
                    }

                    int i = 0;
                    while (reader.Read())
                    {
                        i++;
                        Panel panel = (Panel)PanelP.FindControl("Panel" + i);
                        Label label = (Label)PanelP.FindControl("LabelP" + i);
                        TextBox text = (TextBox)PanelP.FindControl("TextBoxP" + i);
                        HiddenField field = (HiddenField)PanelP.FindControl("HiddenFieldP" + i);
                        panel.Visible = true;
                        panel.Enabled = true;
                        label.Text = reader[0].ToString() + ". " + reader[1].ToString();
                        field.Value = reader[2].ToString();

                    }
                    reader.Close();
                    connection.Close();
                }
            }

           
   }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Text != "__________")
            {
                if (DropDownList2.SelectedItem != null)
                {

                    int ball = 0, p = 1, n = 0;

                    PanelP.Enabled = false;
                    Button2.Visible = false;


                    for (int j = 1; j <= 10; j++)
                    {
                        Panel panel = (Panel)PanelP.FindControl("Panel" + j);
                        TextBox text = (TextBox)PanelP.FindControl("TextBoxP" + j);
                        HiddenField field = (HiddenField)PanelP.FindControl("HiddenFieldP" + j);

                        if (panel.Visible == true)
                        {
                            panel.Enabled = false;
                            // количество вопросов
                            n = n + 1;


                            // проверяем верный ли ответ
                            if (text.Text == field.Value)
                            {
                                ball = ball + 1;
                            }
                        }
                    }


                    // расчет балов



                    SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

                    SqlCommand addSite = new SqlCommand(@"INSERT INTO TaskRez (Владелец, Кружок, НомерСерии, Попытка, Баллы, Дата) VALUES (@П1,@П2,@П3,@П4,@П5,@П6)", connection);
                    addSite.Parameters.AddWithValue("@П1", kab.getUserId(connection));
                    addSite.Parameters.AddWithValue("@П2", DropDownList1.SelectedValue);
                    addSite.Parameters.AddWithValue("@П3", DropDownList2.SelectedItem.Text);
                    addSite.Parameters.AddWithValue("@П4", p);
                    addSite.Parameters.AddWithValue("@П5", ball);
                    addSite.Parameters.AddWithValue("@П6", DateTime.Now);

                    connection.Open();

                    try
                    {
                        addSite.ExecuteNonQuery();

                        LabelRez.Visible = true;
                        LabelRez.Text = "Вы заработали " + ball + " баллов из " + n + ". Использованно попыток " + p + " из 3х!";
                    }
                    catch
                    {
                        // Это не первая попытка

                        SqlCommand getSite = new SqlCommand(@"SELECT Попытка FROM TaskRez " +
                            "Where ((Владелец LIKE '" + kab.getUserId(connection) + "') AND (НомерСерии = " + DropDownList2.SelectedItem.Text + ") )", connection);
                        connection.Open();
                        SqlDataReader reader = getSite.ExecuteReader();
                        reader.Read();

                        p = Convert.ToInt16(reader[0].ToString()) + 1;

                        if (p <= 3)
                        {
                            reader.Close();

                            // обновляем запись

                            SqlCommand updSite = new SqlCommand(@"UPDATE TaskRez SET " +
                                "  Попытка = " + p + " , " +
                                "  Баллы = " + ball + "  ,  " +
                                "  Дата = '" + DateTime.Now + "' " +
                                "Where ((Владелец LIKE '" + kab.getUserId(connection) + "') AND (НомерСерии = " + DropDownList2.SelectedItem.Text + ") )", connection);
                            connection.Open();
                            updSite.ExecuteNonQuery();

                            LabelRez.Visible = true;
                            LabelRez.Text = "Вы заработали " + ball + " баллов из " + n + ". Использованно попыток " + p + " из 3х!";
                        }
                        else
                        {
                            LabelRez.Visible = true;
                            LabelRez.Text = "Вы заработали " + ball + " баллов из " + n + ". " + "Вы использовали все 3 попытки, , баллы не зачисленны!";

                        }

                    }
                    finally
                    {

                        connection.Close();
                    }



                    // Удаляем временные таблицы    
                    SqlConnection connection2 = new SqlConnection(SqlDataSource1.ConnectionString);

                    //Создание запроса ID пользователя из таблицы ASPNET_USERS
                    SqlCommand getUser = new SqlCommand(
                     "SELECT Name FROM  TempTables" +
                     " WHERE   (UserName = N'" + User.Identity.Name + "');", connection2);
                    connection2.Open();
                    SqlDataReader reader2 = getUser.ExecuteReader();

                    ListItemCollection collection = new ListItemCollection();

                    while (reader2.Read())
                    {

                        collection.Add(reader2[0].ToString());


                    }
                    reader2.Close();

                    foreach (ListItem tempname in collection)
                    {
                        SqlCommand delSite = new SqlCommand(@"DROP TABLE " + tempname + "  ", connection2);
                        delSite.ExecuteNonQuery();
                    }

                    // Удаляем записи из регистра
                    SqlCommand delrow = new SqlCommand(@"DELETE FROM TempTables WHERE(UserName = N'" + User.Identity.Name + "');", connection2);
                    delrow.ExecuteNonQuery();

                    connection2.Close();
                }
            }

        }


    }
}