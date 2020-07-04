using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace DP2.face
{
    public partial class mykruzhki : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false) {
                //Выборка заявок

                SqlConnection connection = new SqlConnection(SqlDataSource1.ConnectionString);

                SqlDataSource1.SelectCommand = "  SELECT        Kruzhki.Название AS Кружок, Kruzhki.ДатаНачала AS Начало, Kruzhki.ДатаОкончания AS Конец, UsersKruzhki.UserId, aspnet_Users.UserName, " +
                    " UsersKruzhki.KruzhId, UsersKruzhki.Статус, UsersKruzhki.ДатаПодачи " +
                    " FROM            Kruzhki INNER JOIN " +
                     " UsersKruzhki ON Kruzhki.KruzhId = UsersKruzhki.KruzhId INNER JOIN " +
                      " Users ON UsersKruzhki.UserId = Users.UserId INNER JOIN " +
                       " aspnet_Users ON Users.UserId = aspnet_Users.UserId " +
                       " WHERE        (aspnet_Users.UserName = '" + Page.User.Identity.Name + "') ";
                DataSourceSelectArguments argument = new DataSourceSelectArguments();
                connection.Open();

                SqlDataSource1.Select(argument);

                connection.Close();

                GridView1.DataBind();
                GridView1.Visible = true;       
            }
        }

    }
}