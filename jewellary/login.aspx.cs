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
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {

            String s = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(s);


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string unm = r_username.Text;
            string pwd = r_password.Text;
            con.Open();
            com = new SqlCommand("select * from Registration where registration_username='" + r_username.Text + "'and registration_password='" + r_password.Text + "'", con);
            SqlDataReader dr;
            dr = com.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                Session["registration_username"] = unm;
                Response.Redirect("home.aspx");
            }
            else
            {
                Label1.Text = "Incorrect Username & Password";
                //Response.Redirect("login.aspx");
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            r_username.Text = "";
            r_password.Text = "";
        }
    }
}