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
            string unm = r_username.Text.Trim();
            string pwd = r_password.Text.Trim();

            con.Open();

            com = new SqlCommand(
                "SELECT registration_id, registration_username FROM Registration WHERE registration_username=@un AND registration_password=@pw",
                con
            );

            com.Parameters.AddWithValue("@un", unm);
            com.Parameters.AddWithValue("@pw", pwd);

            SqlDataReader dr = com.ExecuteReader();

            if (dr.HasRows)
            {
                dr.Read();


                Session["registration_id"] = dr["registration_id"];
                Session["registration_username"] = dr["registration_username"];

                con.Close();
                Response.Redirect("home.aspx");
            }
            else
            {
                con.Close();
                Label1.Text = "Incorrect Username or Password";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            r_username.Text = "";
            r_password.Text = "";
        }
    }
}