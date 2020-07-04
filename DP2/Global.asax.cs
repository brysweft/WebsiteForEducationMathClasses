using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace DP2
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            // Код, который работает при запуске приложения
            Application["OnlineUsers"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            // Код, выполняемый начатии новой сессии
            Application.Lock();
            Application["OnlineUsers"] = (int)Application["OnlineUsers"] + 1;
            Application.UnLock();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            // Код, который работает при завершении сеанса. 
    // Примечание: Мероприятие Session_End поднимается только тогда, когда SessionState 
    // Режим установлен в InProc в файле Web.config. 
    // Если режим сессия установлен в StateServer или SQLServer, 
    // Событие не возникает.
            Application.Lock();
            Application["OnlineUsers"] = (int)Application["OnlineUsers"] - 1;
            Application.UnLock();



       
 
        }

        protected void Application_End(object sender, EventArgs e)
        {


        }
    }
}