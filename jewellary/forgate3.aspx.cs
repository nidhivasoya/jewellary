using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace jewellary
{
    public partial class forgate3 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand com;
        SqlDataReader dr;
        SqlDataAdapter da;
        DataSet ds;
        int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(s.ToString());
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (n_pwd.Text == c_pwd.Text)
            {
                int registration_id = Convert.ToInt16(Request.QueryString["registration_id"].ToString());
                Response.Write(registration_id);
                con.Open();
                com = new SqlCommand("update registration set registration_password='" + c_pwd.Text + "'where registration_id=" + registration_id + "", con);
                int i = com.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    Response.Redirect("forgate3.aspx");
                }
                con.Close();
            }
            else
            {
                //Label3.Visible = true;
                Label3.Text = "New Or Confirm Password Must Be Same";

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            n_pwd.Text = "";
            c_pwd.Text = "";
        }
    }
}

