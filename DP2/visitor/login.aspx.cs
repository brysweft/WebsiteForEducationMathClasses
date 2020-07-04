using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Web.Script;



namespace DP2.visitor
{
    public partial class login : System.Web.UI.Page
    {
        int rez, pr = 77; bool loaded = true;

        HttpCookie MyCookie = new HttpCookie("ValidateRezult");

        protected void LoginId_LoggedIn(object sender, EventArgs e)
        {
            Page Kab = new Page();
            Kab = Page;
   // Перенаплавление пользователя в Личный кабинет, после удачного входа
           Response.Redirect("../face/kab.aspx");
     


       }

       


        protected void LoginId_Load(object sender, EventArgs e)
        {


            }

        protected void LoginButton_Click(object sender, EventArgs e)
        {

            
        }

        protected void LoginId_LoginError(object sender, EventArgs e)
        {
            LoginId.FindControl("LinkButtonP").Visible = true;
        }

     

        protected void LoginId_LoggingIn(object sender, LoginCancelEventArgs e)
        {
            // Ищем TextBox по ID и передаем его ссылку
            TextBox Proverka = new TextBox();

            foreach (Control c in LoginId.Controls)
            {
                foreach (Control childc in c.Controls)
                {
                    if (childc.ID == "Proverka")
                    {
                        
                        Proverka = (TextBox)childc;
                    }
                }
            }
            
            //Код проверяет правильный ли ввел пользователь ответ на пример
            try
            {
               

                if (HiddenField1.Value != Proverka.Text)
                {
                    //Ответ не правельный, отмена входа
                    e.Cancel = true;
                    Proverka.BorderColor = Color.Red;
                }
                else
                {
                    Proverka.BorderColor = Color.Green;
                    LoginId.InstructionText = String.Empty;
                    
                }
            }
            catch{
            e.Cancel = true;
            }
       
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            // IsPostBack прверяет загружалась ли страница в первый раз
            // Код выполняется один раз, когда страница загрузится в первый раз
            if (!Page.IsPostBack)
             {
            int z, b, x, y;

            Random random = new Random();
            x = random.Next(100);
            y = random.Next(100);
            z = random.Next(2);


            if (z == 0)
            {
                rez = x + y;
            }
            else
            {
                if (x < y)
                {
                    b = x;
                    x = y;
                    y = b;
                }
                rez = x - y;
                
            }

           

            switch (z)
            {
                case 0:
                    foreach (Control c in LoginId.Controls)
                    {
                        foreach (Control childc in c.Controls)
                        {
                            if (childc.ID == "ProverkaLabel")
                            {
                                ((Label)childc).Text = x.ToString() + " + " + y.ToString() + " = ";
                            }
                        }
                    }
                     break;
                case 1:
                     foreach (Control c in LoginId.Controls)
                     {
                         foreach (Control childc in c.Controls)
                         {
                             if (childc.ID == "ProverkaLabel")
                             {
                                 ((Label)childc).Text = x.ToString() + " - " + y.ToString() + " = ";
                             }
                         }
                     }
                     break;
            }

            HiddenField1.Value = rez.ToString();
                
       

               }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Обращение к дочерним элементам управления Login
            
            LoginId.Controls[0].Controls[17].Visible = false;

           



        }

        protected void Proverka_TextChanged(object sender, EventArgs e)
        {
        
          }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            // Ищем TextBox по ID и передаем его ссылку
            TextBox Proverka = new TextBox();

            foreach (Control c in LoginId.Controls)
            {
                foreach (Control childc in c.Controls)
                {
                    if (childc.ID == "Proverka")
                    {

                        Proverka = (TextBox)childc;
                    }
                }
            }
            

        }

        protected void LinkButtonP_Click(object sender, EventArgs e)
        {
            Response.Redirect("../visitor/recoverypassword.aspx");
        }

      






        }


      
        }


    



       
   
