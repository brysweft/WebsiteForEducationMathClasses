using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DP2.face
{
    public partial class FaceSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Page.User.Identity.Name != null) && (Page.User.Identity.Name != ""))
            {
                Menu2.Visible = true;
                Menu2.Items[0].Text = Page.User.Identity.Name;


                //Кабинет преподавателя
                if (Page.IsPostBack == false)
                {
                    if (Page.User.IsInRole("Администратор"))
                    {
                        LinkButtonKabTeach.Visible = true;

                        MenuItem item = new MenuItem();
                        item.Text = "Кабинет преподавтеля";
                        item.NavigateUrl = "~/teacher/kabteacher.aspx";
                        Menu2.Items[0].ChildItems.Add(item);
                    }
                }

                //Администрирование
                if (Page.IsPostBack == false)
                {
                    if (Page.User.IsInRole("Администратор"))
                    {
                        LinkButtonAdmin.Visible = true;

                        MenuItem item = new MenuItem();
                        item.Text = "Администрирование";
                        item.NavigateUrl = "~/direct/direct.aspx";
                        Menu2.Items[0].ChildItems.Add(item);
                    }
                }

             
            }

 
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {

        }
    }
}