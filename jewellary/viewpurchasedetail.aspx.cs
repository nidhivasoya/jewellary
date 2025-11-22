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
    public partial class viewpurchasedetail : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            String str = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(str);
            if (Request.QueryString["bill1_id"] != null)
            {
                int a = Convert.ToInt16(Request.QueryString["bill1_id"].ToString());
                cmd = new SqlCommand("update ordermaster set bill1_status='" + 1 + "' where bill1_id=@bill1_id", con);
                con.Open();
                cmd.Parameters.AddWithValue("@bill1_id", a);
                int i = cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }

}
