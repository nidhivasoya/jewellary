using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace jewellary
{
    public partial class forgate2 : System.Web.UI.Page
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
            con = new SqlConnection(s);
            con.Open();
            if (IsPostBack == false)
            {
                com = new SqlCommand("select * from registration where registration_id=" + Convert.ToInt16(Request.QueryString["registration_id"].ToString()) + "", con);
                dr = com.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    r_sq.Text = dr["registration_securityquestion"].ToString();
                }
                else
                {
                    Response.Redirect("forgate2.aspx");
                }
            }
            con.Close();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            con.Open();
            com = new SqlCommand("select * from registration where registration_id=" + Convert.ToInt16(Request.QueryString["registration_id"].ToString()) + "", con);
            dr = com.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                int registration_id = Convert.ToInt16(Request.QueryString["registration_id"].ToString());
                if (r_answer.Text == dr["registration_answer"].ToString())
                {
                    Response.Redirect("forgate3.aspx?registration_id=" + registration_id);
                }
                else
                {
                    //lbl_msg.Visible=true;
                    Label2.Text = "Invalid Answer...";
                }
                con.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            r_sq.Text = "";
            r_answer.Text = "";
        }
    }
}