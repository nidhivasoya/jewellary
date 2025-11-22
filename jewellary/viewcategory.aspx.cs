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
    public partial class viewcategory : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            string s = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(s);
            if (Request.QueryString["category_id"] != null)
            {
                int category_id = Convert.ToInt16(Request.QueryString["category_id"]);

                cmd = new SqlCommand("delete from category where category_id=@category_id", con);
                con.Open();
                cmd.Parameters.AddWithValue("@category_id", +category_id);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Redirect("viewcategory.aspx");
                }
                con.Close();
            }
        }

        protected void new_Click(object sender, EventArgs e)
        {
            Response.Redirect("category.aspx");
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }

}
   