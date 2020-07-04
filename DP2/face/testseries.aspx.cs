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
    public partial class testseries : System.Web.UI.Page
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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LabelRez.Visible = false;
            PanelP.Visible = false;

            if (DropDownList1.SelectedValue != "__________")
            {
                // обновляем список пользвателей

                SqlConnection connection3 = new SqlConnection(SqlDataSource3.ConnectionString);


                SqlDataSource3.SelectCommand = "  SELECT * FROM TestSeries " +
          "  WHERE (Кружок LIKE '" + DropDownList1.SelectedValue + "')";


                DataSourceSelectArguments argument3 = new DataSourceSelectArguments();
                connection3.Open();
                SqlDataSource3.Select(argument3);
                DropDownList2.DataBind();
                connection3.Close();
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            LabelRez.Visible = false;
            PanelP.Visible = false;
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

                    SqlCommand getUser = new SqlCommand(@"SELECT Номер, Задание, Ответ, Вариант1, Вариант2, Вариант3, Вариант4 FROM Tests  " + 
                   " Where ( TestSeriesId Like '" + DropDownList2.SelectedValue + "' ) ", connection);
                    connection.Open();
                    SqlDataReader reader = getUser.ExecuteReader();

                    // Делаем вопросы невидимыми
                    for (int j = 1; j <= 20; j++)
                    {
                        Panel panel = (Panel)PanelP.FindControl("Panel" + j);
                        Label label = (Label)PanelP.FindControl("LabelP" + j); 
                        HiddenField field = (HiddenField)PanelP.FindControl("HiddenFieldP" + j);

                        panel.Visible = false;

                        label.Text = "";
                        field.Value = "";


                        //находим выбранный радиобаттон
                        for (int k = 1; k <= 4; k++)
                        {
                            RadioButton rb = (RadioButton)PanelP.FindControl("RadioButton" + k + "P" + j);

                            if (rb.Checked)
                            {
                                rb.Checked = false;
                            }
                        }


                    }

                    int i = 0;
                    while (reader.Read())
                    {
                        i++;
                        Panel panel = (Panel)PanelP.FindControl("Panel" + i);
                        Label label = (Label)PanelP.FindControl("LabelP" + i);         
                        HiddenField field = (HiddenField)PanelP.FindControl("HiddenFieldP" + i);
                        RadioButton rb1 = (RadioButton)PanelP.FindControl("RadioButton1P" + i);
                        RadioButton rb2 = (RadioButton)PanelP.FindControl("RadioButton2P" + i);
                        RadioButton rb3 = (RadioButton)PanelP.FindControl("RadioButton3P" + i);
                        RadioButton rb4 = (RadioButton)PanelP.FindControl("RadioButton4P" + i);
                        panel.Visible = true;
                        panel.Enabled = true;
                        label.Text = reader[0].ToString() + ". " + reader[1].ToString();
                        field.Value = reader[2].ToString();
                        rb1.Text = reader[3].ToString();
                        rb2.Text = reader[4].ToString();
                        rb3.Text = reader[5].ToString();
                        rb4.Text = reader[6].ToString();
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


                    for (int i = 1; i <= 20; i++)
                    {
                        Panel panel = (Panel)PanelP.FindControl("Panel" + i);
                        Label label = (Label)PanelP.FindControl("LabelP" + i);
                        HiddenField field = (HiddenField)PanelP.FindControl("HiddenFieldP" + i);
         

                        if (panel.Visible == true)
                        {
                            panel.Enabled = false;
                            // количество вопросов
                            n = n + 1;

                            //находим выбранный радиобаттон
                            for (int j = 1; j <= 4; j++)
                            {
                                RadioButton rb = (RadioButton)PanelP.FindControl("RadioButton" +j+ "P" + i);

                                if (rb.Checked)
                                {
                                    // проверяем верный ли ответ
                                    if (rb.Text == field.Value)
                                    {

                                        ball = ball + 1;
                                    }
                                }
                            }
                        }
                    }


                    // расчет балов



                    SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

                    SqlCommand addSite = new SqlCommand(@"INSERT INTO TestRez (Владелец, Кружок, НомерТеста, Попытка, Баллы, Дата) VALUES (@П1,@П2,@П3,@П4,@П5,@П6)", connection);
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

                        SqlCommand getSite = new SqlCommand(@"SELECT Попытка FROM TestRez " +
                            "Where ((Владелец LIKE '" + kab.getUserId(connection) + "') AND (НомерТеста = " + DropDownList2.SelectedItem.Text + ") )", connection);
                        connection.Open();
                        SqlDataReader reader = getSite.ExecuteReader();
                        reader.Read();

                        p = Convert.ToInt16(reader[0].ToString()) + 1;

                        if (p <= 3)
                        {
                            reader.Close();

                            // обновляем запись

                            SqlCommand updSite = new SqlCommand(@"UPDATE TestRez SET " +
                                "  Попытка = " + p + " , " +
                                "  Баллы = " + ball + "  ,  " +
                                "  Дата = '" + DateTime.Now + "' " +
                                " Where ((Владелец LIKE '" + kab.getUserId(connection) + "') AND (НомерТеста = " + DropDownList2.SelectedItem.Text + ") )", connection);
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

                  
                }
            }
        }
    }
}