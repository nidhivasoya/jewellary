using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace jewellary
{
    public partial class feedback : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand com;
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string s = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
                con = new SqlConnection(s);

                // Check session
                if (Session["registration_username"] != null)
                {
                    string nm = Session["registration_username"].ToString();
                    con.Open();
                    com = new SqlCommand("SELECT registration_username FROM registration WHERE registration_username = @username", con);
                    com.Parameters.AddWithValue("@username", nm);
                    dr = com.ExecuteReader();

                    if (dr.HasRows)
                    {
                        dr.Read();
                        r_username.Text = dr["registration_username"].ToString();
                    }

                    dr.Close();
                    con.Close();
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["registration_username"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            string s = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(s);

            con.Open();
            string nm = Session["registration_username"].ToString();
            string query = "INSERT INTO feedback (registration_username, f_comment) VALUES (@username, @comment)";
            com = new SqlCommand(query, con);
            com.Parameters.AddWithValue("@username", nm);
            com.Parameters.AddWithValue("@comment", f_comment.Text);

            int i = com.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("home.aspx");
            }
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            f_comment.Text = string.Empty;
        }
    }
}