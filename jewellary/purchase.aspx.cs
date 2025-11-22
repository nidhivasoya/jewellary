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
    public partial class purchase : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd, cmd1, cmd2, cmd3;
        SqlDataReader dr, dr1;
        int k, id;
        int qty1;


        protected void Page_Load(object sender, EventArgs e)
        {
            String str = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(str);
            if (Session["registration_id"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            k = Convert.ToInt16(Session["registration_id"]);
            DateTime time = DateTime.Now;
            cmd = new SqlCommand("insert into ordermaster(registration_id,bill1_total,bill1_date,bill1_status,bill1_name,bill1_email,bill1_contact,bill1_city)values('" + k + "','" + Convert.ToDouble(Session["total"]) + "','" + time + "','" + 0 + "','" + bill_name.Text + "','" + txt_mail.Text + "','" + txt_contactno.Text + "','" + bill_city.Text + "')", con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                cmd1 = new SqlCommand("select bill1_id from ordermaster where bill1_name='" + bill_name.Text + "'", con);
                dr = cmd1.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    id = Convert.ToInt16(dr["bill1_id"].ToString());
                }
                dr.Close();
                con.Close();
                con.Open();
                string str = "select * from addtocart where registration_id='" + k + "'";
                con.Close();
                SqlDataAdapter da = new SqlDataAdapter(str, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                for (int r = 0; r < dt.Rows.Count; r++)
                {
                    int qty = Convert.ToInt16(dt.Rows[r]["a_quantity"].ToString());
                    int pid = Convert.ToInt16(dt.Rows[r]["product_id"].ToString());
                    cmd1 = new SqlCommand("select * from product where product_id='" + pid + "'", con);
                    con.Open();
                    dr1 = cmd1.ExecuteReader();
                    if (dr1.HasRows)
                    {
                        dr1.Read();
                        qty1 = Convert.ToInt16(dr1["product_quantity"].ToString());
                    }
                    int p_quantity = qty1 - qty;
                    dr1.Close();
                    con.Close();
                    cmd2 = new SqlCommand("update product set product_quantity=@product_quantity where product_id=@product_id", con);
                    con.Open();
                    cmd2.Parameters.AddWithValue("@product_id", +pid);
                    cmd2.Parameters.AddWithValue("@product_quantity", p_quantity);
                    int i1 = cmd2.ExecuteNonQuery();
                    con.Close();
                    cmd3 = new SqlCommand("insert into orderdetail(bill1_id,product_id,a_quantity)values(@bill1_id,@product_id,@a_quantity)", con);
                    con.Open();
                    cmd3.Parameters.AddWithValue("@bill1_id", id);
                    cmd3.Parameters.AddWithValue("@product_id", pid);
                    cmd3.Parameters.AddWithValue("@a_quantity", +qty);
                    int i2 = cmd3.ExecuteNonQuery();
                    con.Close();


                }
                cmd = new SqlCommand("delete from addtocart where registration_id='" + k + "'", con);
                con.Open();
                cmd.Parameters.AddWithValue("@registration_id", +k);
                cmd.ExecuteNonQuery();
                int u_id = Convert.ToInt16(Session["registration_id"].ToString());
                Response.Redirect("thankYou.aspx?registration_id=" + u_id);
                con.Close();
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            txt_contactno.Text = "";
            bill_city.Text = "";
            txt_mail.Text = "";
            bill_name.Text = "";


        }
    }
}