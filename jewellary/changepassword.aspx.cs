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
    public partial class changepassword : System.Web.UI.Page
    {
        SqlConnection con;
        int i;
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(s);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string str = "select * from registration where registration_password='" + old_pwd.Text + "'";
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(str, con);
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (n_pwd.Text == c_pwd.Text)
                {
                    Session["registration_id"] = ds.Tables[0].Rows[0][0].ToString();
                    int i = Convert.ToInt32(Session["registration_id"]);
                    string s = "update registration set registration_password='" + n_pwd.Text + "'where registration_id=" + i;
                    SqlDataAdapter sda = new SqlDataAdapter(s, con);
                    DataTable sdt = new DataTable();
                    DataSet sds = new DataSet();
                    sda.Fill(sds);
                    Response.Redirect("home.aspx");
                }
                else
                {

                }
            }
            con.Close();
        }
    }
}