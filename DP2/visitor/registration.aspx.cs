using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.Security;

namespace DP2.visitor
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string user_name = "не найдено", user_id;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_SendingMail(object sender, MailMessageEventArgs e)
        {
            // Set MailMessage fields.
            e.Message.IsBodyHtml = false;
            e.Message.Subject = "Спасибо за регистрацию на Сайте!";
            // Replace placeholder text in message body with information 
            // provided by the user.
            e.Message.Body = e.Message.Body.Replace("<%PasswordQuestion%>", CreateUserWizard1.Question);
            e.Message.Body = e.Message.Body.Replace("<%PasswordAnswer%>", CreateUserWizard1.Answer);  
        }

        protected void CreateUserWizard1_SendMailError(object sender, SendMailErrorEventArgs e)
        {
            CreateUserWizard1.BackColor = Color.Red;
        
        }

        protected void CreateUserWizard1_CancelButtonClick(object sender, EventArgs e)
        {
            
        }

        protected void CreateUserWizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            Response.Redirect("../visitor/login.aspx");
        }

        protected void CreateUserWizard1_ContinueButtonClick(object sender, EventArgs e)
        {
            Response.Redirect("../visitor/login.aspx");
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {

            //MembershipUser mu = Membership.GetUser();
           // Label1.Text = mu.UserName;

            SqlConnection connection = new SqlConnection(SqlDataSourceUsers.ConnectionString);

            SqlConnection connectionASP = new SqlConnection(SqlDataSourceUsersASP.ConnectionString);



            TextBox userNameTextBox =  (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("UserName");
            user_name = userNameTextBox.Text;

            
                try
                {
                    //Создание запроса ID пользователя из таблицы ASPNET_USERS
                    SqlCommand getUser = new SqlCommand(
           "SELECT UserId FROM  vw_aspnet_Users WHERE   (UserName = N'" + user_name + "');", connectionASP);
                    connectionASP.Open();
                    SqlDataReader reader = getUser.ExecuteReader();

                    try
                    {
                        reader.Read();
                        user_id = reader[0].ToString();
                    }
                    catch { 
                    
                    
                    }
                    finally
                     {
                    reader.Close();
                    connectionASP.Close();
                    }


                    // Записываем SQL команду для добавления новой записи в таблицу
                    SqlCommand addSite = new SqlCommand(@"INSERT INTO Users (UserId,Фамилия,Имя,Отчество) VALUES (@UserId,@Фамилия,@Имя,@Отчество)", connection);
                    connection.Open();

                    addSite.Parameters.AddWithValue("@UserId", user_id);
                    addSite.Parameters.AddWithValue("@Фамилия", TextBox1.Text);
                    addSite.Parameters.AddWithValue("@Имя", TextBox2.Text);
                    addSite.Parameters.AddWithValue("@Отчество", TextBox3.Text);

                    addSite.ExecuteNonQuery();
                    connection.Close();
                    
                Label LabelUserMsg = (Label)CompleteWizardStep1.ContentTemplateContainer.FindControl("Label1");
                LabelUserMsg.Text = TextBox2.Text + " " + TextBox3.Text + ", Ваша  учетная  запись  созадана! Нажмите 'Продолжить' ";
               

            }
            catch
            {
                Label LabelUserMsg = (Label)CompleteWizardStep1.ContentTemplateContainer.FindControl("Label1");
                LabelUserMsg.Text = "Произошла ошибка!  \n Учетная запись не создана";
             
            }


            // Определение роли для пользователя 
                Roles.AddUserToRole(user_name, "Студент");
            
 
        }

      


    }
}