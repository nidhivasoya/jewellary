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
    public partial class viewfeedback : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(s);

            if (Request.QueryString["f_id"] != null)
            {
                int feedback_id = Convert.ToInt16(Request.QueryString["f_id"].ToString());
                com = new SqlCommand("delete from feedback where f_id='" + feedback_id + "'", con);
                con.Open();
                int i = com.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Write("record delete");
                }
                else
                {
                    Response.Write("record not delete");
                }
                con.Close();
            }
        }
    }
}
   