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
    public partial class forgate1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand com;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(s);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            com = new SqlCommand("select * from registration where registration_username='" + r_username.Text + "'", con);
            int i;
            con.Open();
            {
                dr = com.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    i = Convert.ToInt16(dr["registration_id"].ToString());
                    Response.Redirect("~/forgate2.aspx?registration_id=" + i);

                }
                else
                {

                    Label2.Text = "Invalid Username..??";
                }
                con.Close();
            }
        }
        protected void Button2_Click1(object sender, EventArgs e)
        {

        }
    }
}