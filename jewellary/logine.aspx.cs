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
    public partial class logine : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            string s = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(s);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("select * from logine where username='" + TextBox1.Text + "' AND password='" + TextBox2.Text + "'", con);
            //cmd = new SqlCommand("insert into login(username,password) values ('" + TextBox1.Text+ "','" + TextBox2.Text + "')",con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                Session["username"] = dr["username"].ToString();

                if ((TextBox1.Text == "nidhi" & TextBox2.Text == "331") || (TextBox1.Text == "banshi" & TextBox2.Text == "123"))
                {
                    Response.Redirect("home2.aspx");
                    Label3.Text = "welcome:" + Session["username"].ToString() + "";
                }
            }
            else
            {
                Label1.Text = "Incorrect Username & Password";
                Response.Redirect("logine.aspx");
            }
        }
    }
}