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
    public partial class category : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["jw"].ConnectionString);
            if (!IsPostBack)
            {
                if (Request.QueryString["category_id"] != null)
                {
                    int id = Convert.ToInt16(Request.QueryString["category_id"].ToString());
                    cmd = new SqlCommand("select * from category where category_id=" + id, con);
                    con.Open();
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();
                        Txt_cnm.Text = dr["category_name"].ToString();
                    }
                    con.Close();
                }
            }
        }
        protected void add_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("insert into category(category_name)values('" + Txt_cnm.Text + "')", con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("viewcategory.aspx");
            }
        }
        protected void edit_Click(object sender, EventArgs e)
        {
            int category_id = Convert.ToInt16(Request.QueryString["category_id"].ToString());
            cmd = new SqlCommand("update category set category_name='" + Txt_cnm.Text + "' where category_id=" + category_id, con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("viewcategory.aspx");
            }
        }
        protected void reset_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewcategory.aspx");

        }
    }
}
