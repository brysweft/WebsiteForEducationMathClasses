using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;

namespace DP2.direct
{
    public partial class users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false){

                if (Roles.IsUserInRole(User.Identity.Name, "Суперадминистратор"))
                    ButtonAdmin.Visible = true;
            }

          
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Удаление пользователя

            Panel1.Visible = true;

            GridView1.SelectRow(e.RowIndex);
            GridView1.Enabled = false;

            SqlDataSource1.DeleteCommand = @"DELETE FROM Users WHERE (Фамилия =  ' ')";
        }

        protected void ButtonОк1_Click(object sender, EventArgs e)
        {
            bool a = false, b;
            // Удаление пользователя

            //Удаление работ



            Label username = (Label)GridView1.SelectedRow.FindControl("LabelLogin");

            foreach (string admins in Roles.GetUsersInRole("Администратор"))
            {

                if (admins == username.Text)
                {
                    a = true;
                }

            }

            if (a == false)
            {

                SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);


                SqlCommand getUser = new SqlCommand(
               @"SELECT     Users.UserId, UsersKruzhki.Статус FROM  Users INNER JOIN " +
               "  UsersKruzhki ON Users.UserId = UsersKruzhki.UserId  " +
               " WHERE  ((Users.UserId LIKE '" + GridView1.SelectedValue + "') AND  (UsersKruzhki.Статус = N'принято'));", connection);
                connection.Open();
                SqlDataReader reader = getUser.ExecuteReader();

                reader.Read();

                b = reader.HasRows;

                reader.Close();
                connection.Close();



                if (b == true)
                {
                    LabelErr.Visible = true;
                    LabelErr.Text = "Не рекомендуется удалять пользователя участвующем в кружке. Удаление отменено!";

                }
                else
                {

                    SqlDataSource1.DeleteCommand = @"DELETE FROM aspnet_Users WHERE (UserId LIKE  '" + GridView1.SelectedValue + "')";

                    SqlDataSource1.Delete();

                    GridView1.SelectRow(-1);
                    LabelErr.Visible = true;
                    LabelErr.Text = "Пользователь удален!";
                }
            }
            else
            {
                LabelErr.Visible = true;
                LabelErr.Text = "Нельзя удалить администратора. Удаление отменено!";
            
            }
            Panel1.Visible = false;
            GridView1.Enabled = true;
        }

        protected void ButtonCancel1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;

            GridView1.SelectRow(-1);
            GridView1.Enabled = true;
        }

        protected void ButtonAdmin_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex != -1)
            {
                Panel2.Visible = true;
            }
            else {
                LabelErr.Visible = true;
                LabelErr.Text = "Выберите пользователя!";
            }
        }

        protected void ButtonОк2_Click(object sender, EventArgs e)
        {
            Label userlogin = (Label)GridView1.SelectedRow.FindControl("LabelLogin");
            try
            {
                Roles.AddUserToRole(userlogin.Text, "Администратор");
                Roles.RemoveUserFromRole(userlogin.Text, "Студент");
                LabelErr.Visible = true;
                LabelErr.Text = " Пользователю с логином " + userlogin.Text + " назначена роль администратора!";
            }
            catch {
                LabelErr.Visible = true;
                LabelErr.Text = " Пользователь с логином " + userlogin.Text + " уже администратор!";
            
            }

            Panel2.Visible = false;

        }

        protected void ButtonCancel2_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;
        }

        protected void ButtonОк3_Click(object sender, EventArgs e)
        {
            Label userlogin = (Label)GridView1.SelectedRow.FindControl("LabelLogin");
       if ((userlogin.Text == User.Identity.Name)&&( Roles.IsUserInRole("Суперадминистратор"))){
           LabelErr.Visible = true;
           LabelErr.Text = " Нельзя иключить из администроров суперадминистратора";
       }
       else{
           try
           {
               Roles.RemoveUserFromRole(userlogin.Text, "Администратор");
  
                   Roles.AddUserToRole(userlogin.Text, "Студент");
               
               LabelErr.Visible = true;
               LabelErr.Text = " Пользователь с логином " + userlogin.Text + " исключен из  администраторов!";
           }
           catch {
               LabelErr.Visible = true;
               LabelErr.Text = " Пользователь с логином " + userlogin.Text + "  не является администратором!";
           }
       }
       Panel2.Visible = false; 
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LabelErr.Visible = false;
                    }


    }
}