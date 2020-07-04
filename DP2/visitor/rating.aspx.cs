using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;


namespace DP2.visitor
{
    public partial class rating : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            ImageButton2.BackColor = Color.Aqua;
            ImageButton1.BackColor = Color.White;
            ImageButton3.BackColor = Color.White;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            ImageButton2.BackColor = Color.White;
            ImageButton1.BackColor = Color.Aqua;
            ImageButton3.BackColor = Color.White;
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
            ImageButton2.BackColor = Color.White;
            ImageButton1.BackColor = Color.White;
            ImageButton3.BackColor = Color.Aqua;
        }
    }
}