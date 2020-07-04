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
    public partial class dirtasks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            //Удаляем Серию задач

            SqlDataSource1.DeleteCommand = @"DELETE FROM TaskSeries WHERE (TaskSeriesId LIKE  '" + GridView1.SelectedValue + "')";

            SqlDataSource1.Delete();

            GridView1.SelectRow(-1);

            Panel1.Visible = false;
            GridView1.Enabled = true;
        }


        protected void ButtonCancel2_Click(object sender, EventArgs e)
        {

            Panel2.Visible = false;

            GridView2.SelectRow(-1);
            GridView2.Enabled = true;
        }

        protected void ButtonCancel1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;

            GridView1.SelectRow(-1);
            GridView1.Enabled = true;
        }

        protected void ButtonОк2_Click(object sender, EventArgs e)
        {
            //Удаляем Задачу

            SqlDataSource2.DeleteCommand = @"DELETE FROM Tasks WHERE (Номер =  '" + GridView2.SelectedDataKey.Values[1].ToString() +
                "') AND (TaskSeriesId = '" + GridView2.SelectedDataKey.Values[0].ToString() + "')";

            SqlDataSource2.Delete();

            GridView2.SelectRow(-1);

            Panel2.Visible = false;
            GridView2.Enabled = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

            try
            {
                SqlCommand addSite = new SqlCommand(@"INSERT INTO TaskSeries (Кружок, Номер, Описание, Дата) VALUES (@П1,@П2,@П3, @П4)", connection);
                addSite.Parameters.AddWithValue("@П1", DropDownList1.SelectedValue);
                addSite.Parameters.AddWithValue("@П2", TextBoxT1.Text);
                addSite.Parameters.AddWithValue("@П3", TextBoxT2.Text);
                addSite.Parameters.AddWithValue("@П4", DateTime.Now);

                connection.Open();
                addSite.ExecuteNonQuery();
                connection.Close();

                Label1.Text = "Запись успешно добавлена!";
                Label1.ForeColor = Color.Black;
                Label1.Visible = true;

                //очистка
                TextBoxT1.Text = "";
                TextBoxT2.Text = "";

            }
            catch
            {
                Label1.Text = "Произошла ошибка, убедитесь в правильности введенных данных!";
                Label1.ForeColor = Color.Red;
                Label1.Visible = true;
            }        
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Добавление Задачи

            SqlConnection connection = new SqlConnection(SqlDataSource2.ConnectionString);

            try
            {
                SqlCommand addSite = new SqlCommand(@"INSERT INTO Tasks (TaskSeriesId, Номер, Задание, Ответ) VALUES (@П1,@П2,@П3, @П4)", connection);
                addSite.Parameters.AddWithValue("@П1", DropDownList2.SelectedValue);
                addSite.Parameters.AddWithValue("@П2", TextBoxR1.Text);
                addSite.Parameters.AddWithValue("@П3", TextBoxR2.Text);
                addSite.Parameters.AddWithValue("@П4", TextBoxR3.Text);

                connection.Open();
                addSite.ExecuteNonQuery();
                connection.Close();

                Label2.Text = "Запись успешно добавлена!";
                Label2.ForeColor = Color.Black;
                Label2.Visible = true;

                //очистка
                TextBoxR1.Text = "";
                TextBoxR2.Text = "";
                TextBoxR3.Text = "";
            }
            catch
            {
                Label2.Text = "Произошла ошибка, убедитесь в правильности введенных данных!";
                Label2.ForeColor = Color.Red;
                Label2.Visible = true;
            }
                    
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Удаление Серии задач

            Panel1.Visible = true;

            GridView1.SelectRow(e.RowIndex);
            GridView1.Enabled = false;

            SqlDataSource1.DeleteCommand = @"DELETE FROM TaskSeries WHERE (Номер =  '')";
        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Удаление Задачи

            Panel2.Visible = true;

            GridView2.SelectRow(e.RowIndex);
            GridView2.Enabled = false;

            SqlDataSource2.DeleteCommand = @"DELETE FROM Tasks WHERE (Номер =  '')";
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Обновление Серии задач

            GridView1.SelectRow(e.RowIndex);


            
            TextBox Descr = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3");


            SqlDataSource1.UpdateCommand = @"UPDATE   TaskSeries SET "  +
                " Описание = '" + Descr.Text +
                 "', Дата = '" + DateTime.Now +
                "'   WHERE (TaskSeriesId LIKE  '" + GridView1.SelectedValue + "')";

            GridView1.SelectRow(-1);
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //Обновление Задачи

            GridView2.SelectRow(e.RowIndex);

            TextBox P2 = (TextBox)GridView2.Rows[e.RowIndex].FindControl("TextBox2");
            TextBox P3 = (TextBox)GridView2.Rows[e.RowIndex].FindControl("TextBox3");
            

            SqlDataSource2.UpdateCommand = @"UPDATE   Tasks SET   " +
                " Задание = '" + P2.Text +
                 "', Ответ = '" + P3.Text +
                "'   WHERE (Номер =  '" + GridView2.SelectedDataKey.Values[1].ToString() +
                "') AND (TaskSeriesId = '" + GridView2.SelectedDataKey.Values[0].ToString() + "')";

            GridView2.SelectRow(-1);
        }
    }
}