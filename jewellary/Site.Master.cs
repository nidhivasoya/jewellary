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
    public partial class SiteMaster : MasterPage
    {
        SqlConnection con;
        SqlDataReader dr;
        SqlCommand com;

        protected void Page_Load(object sender, EventArgs e)
        {

            string s = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(s);
            if (Session.Contents.Keys.Count > 0)
            {
                userlogin.Visible = false;
                userlogout.Visible = true;
                changepassword.Visible = true;
                feedback.Visible = true;
                product.Visible = true;
                addtocart.Visible = true;
            }
            else
            {
                userlogin.Visible = true;
                userlogout.Visible = false;
                changepassword.Visible = false;
                feedback.Visible = false;
                product.Visible = false;
                addtocart.Visible = false;
            }
        }
        protected void userlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("registration_username");
            Session["registration_username"] = "";
            Response.Redirect("home.aspx");
        }
        protected void userlogin_Click(object sender, EventArgs e)
        {

        }
    }
}
