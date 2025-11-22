using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace jewellary
{
    public partial class Site_Mobile : System.Web.UI.MasterPage
    {
        SqlCommand cmd;
        SqlConnection con;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            String s = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(s);
            if (Session.Contents.Keys.Count > 0)
            {
                Welcome.Text = "welcome:" + Session["username"].ToString();
                adminlogin.Visible = false;
                home.Visible = true;
                adminlogout.Visible = true;
                viewcategory.Visible = true;
                viewfeedbcak.Visible = true;
                viewproduct.Visible = true;
                viewpurchase.Visible = true;
                viewregistration.Visible = true;
            }
            else
            {
                adminlogin.Visible = true;
                adminlogout.Visible = false;
                home.Visible = false;
                viewcategory.Visible = false;
                viewproduct.Visible = false;
                viewpurchase.Visible = false;
                viewregistration.Visible = false;
                viewfeedbcak.Visible = false;
            }

        }

        protected void adminlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("username");
            Session["username"] = "";
            Response.Redirect("home2.aspx");

        }
        protected void adminlogin_Click1(object sender, EventArgs e)
        {

        }
        protected void adminlogout_Click1(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("username");
            Session["username"] = "";
            Response.Redirect("home2.aspx");
        }
    }

}