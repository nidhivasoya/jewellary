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
    public partial class product : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            String str = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(str);
            if (IsPostBack == false)
            {
                int id = 0;
                category_name.Items.Insert(id, new ListItem("--select--", "0"));
                cmd = new SqlCommand("select * from category", con);
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        id++;
                        category_name.Items.Insert(id, new ListItem(dr["category_name"].ToString(), dr["category_id"].ToString()));
                    }
                }
                con.Close();
            }
            if (category_name.SelectedValue.ToString() == "0")
            {
                ds_product.SelectCommand = "select * from product";
            }
        }
    }
}
