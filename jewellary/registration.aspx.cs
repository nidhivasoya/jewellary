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
    public partial class registration : System.Web.UI.Page
    {
        SqlCommand com;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            string s = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(s);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            com = new SqlCommand("insert into registration(registration_username,registration_password,registration_fullname,registration_address,registration_city,registration_emailid,registration_contactno,registration_securityquestion,registration_answer)values('" + r_username.Text + "','" + r_password.Text + "','" + r_fullname.Text + "','" + r_address.Text + "','" + r_city.Text + "','" + r_emailid.Text + "','" + r_contactno.Text + "','" + r_sq.SelectedItem + "','" + r_answer.Text + "')", con);
            int i = com.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("login.aspx");
            }
            con.Close();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            r_username.Text = "";
            r_password.Text = "";
            r_fullname.Text = "";
            r_address.Text = "";
            r_city.Text = "";
            r_emailid.Text = "";
            r_contactno.Text = "";
            r_sq.Text = "";
            r_answer.Text = "";

        }
    }
}