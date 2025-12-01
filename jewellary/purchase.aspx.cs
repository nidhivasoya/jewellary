using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

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
            k = Convert.ToInt32(Session["registration_id"]);
            DateTime time = DateTime.Now;

            // ⭐ FIXED INSERT QUERY (correct number of columns)
            cmd = new SqlCommand(
                "INSERT INTO ordermaster(registration_id,bill1_total,bill1_date,bill1_name,bill1_email,bill1_contact,bill1_city) " +
                "VALUES(@rid,@total,@date,@name,@mail,@contact,@city)", con);

            cmd.Parameters.AddWithValue("@rid", k);
            cmd.Parameters.AddWithValue("@total", Convert.ToDouble(Session["total"]));
            cmd.Parameters.AddWithValue("@date", time);
            cmd.Parameters.AddWithValue("@name", bill_name.Text);
            cmd.Parameters.AddWithValue("@mail", txt_mail.Text);
            cmd.Parameters.AddWithValue("@contact", txt_contactno.Text);
            cmd.Parameters.AddWithValue("@city", bill_city.Text);

            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();

            if (i > 0)
            {
                // ⭐ FIXED: SAFE WAY TO GET LAST INSERTED ID
                cmd1 = new SqlCommand("SELECT TOP 1 bill1_id FROM ordermaster WHERE registration_id=@rid ORDER BY bill1_id DESC", con);
                cmd1.Parameters.AddWithValue("@rid", k);

                con.Open();
                dr = cmd1.ExecuteReader();
                if (dr.Read())
                {
                    id = Convert.ToInt32(dr["bill1_id"]);
                }
                dr.Close();
                con.Close();

                // ⭐ FETCH CART ITEMS
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM addtocart WHERE registration_id=" + k, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                for (int r = 0; r < dt.Rows.Count; r++)
                {
                    int qty = Convert.ToInt32(dt.Rows[r]["a_quantity"]);
                    int pid = Convert.ToInt32(dt.Rows[r]["product_id"]);

                    // GET PRODUCT OLD QTY
                    cmd1 = new SqlCommand("SELECT product_quantity FROM product WHERE product_id=@pid", con);
                    cmd1.Parameters.AddWithValue("@pid", pid);
                    con.Open();
                    qty1 = Convert.ToInt32(cmd1.ExecuteScalar());
                    con.Close();

                    int p_quantity = qty1 - qty;

                    // UPDATE PRODUCT QTY
                    cmd2 = new SqlCommand("UPDATE product SET product_quantity=@qty WHERE product_id=@pid", con);
                    cmd2.Parameters.AddWithValue("@qty", p_quantity);
                    cmd2.Parameters.AddWithValue("@pid", pid);
                    con.Open();
                    cmd2.ExecuteNonQuery();
                    con.Close();

                    // INSERT ORDER DETAIL
                    cmd3 = new SqlCommand("INSERT INTO orderdetail(bill1_id,product_id,a_quantity) VALUES(@bid,@pid,@qty)", con);
                    cmd3.Parameters.AddWithValue("@bid", id);
                    cmd3.Parameters.AddWithValue("@pid", pid);
                    cmd3.Parameters.AddWithValue("@qty", qty);
                    con.Open();
                    cmd3.ExecuteNonQuery();
                    con.Close();
                }

             
                cmd = new SqlCommand("DELETE FROM addtocart WHERE registration_id=@rid", con);
                cmd.Parameters.AddWithValue("@rid", k);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("thankYou.aspx?registration_id=" + k);
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
