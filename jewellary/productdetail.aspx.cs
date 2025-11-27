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
    public partial class productdetail : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection con;
        SqlDataReader dr;
        int id;
        int p_qty;

        protected void Page_Load(object sender, EventArgs e)
        {
            String str = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(str);
            if (Session["registration_username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            string msg;
            if (Request.QueryString["msg"] != null)
            {
                msg = Request.QueryString["msg"];

                if (msg == "1")
                {
                    lbl_msg.Visible = true;
                    lbl_msg.Text = "Stock not available ...";
                }
                if (msg == "2")
                {
                    lbl_msg.Visible = true;
                    lbl_msg.Text = "Out of Stock ...";
                }
                if (msg == "3")
                {
                    lbl_msg.Visible = true;
                    lbl_msg.Text = "Please Enter Quantity ...";
                }
                if (msg == "4")
                {
                    lbl_msg.Visible = true;
                    lbl_msg.Text = "Only " + Request.QueryString["qt"] + " available ...";
                }
            }
            id = Convert.ToInt16(Request.QueryString["product_id"].ToString());

            cmd = new SqlCommand("select * from product where product_id=" + id, con);
            con.Open();
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                lbl_name.Text = dr["product_name"].ToString();
                Image1.ImageUrl = dr["product_image"].ToString();
                lbl_price.Text = dr["product_price"].ToString();
                p_qty = Convert.ToInt16(dr["product_quantity"].ToString());
                lbl_quantity.Text = p_qty.ToString();
            }
            con.Close();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int r_id = Convert.ToInt16(Session["registration_id"].ToString());
            int qty = 0;

            if (string.IsNullOrEmpty(txt_quantity.Text))
            {
                Response.Redirect("productdetail.aspx?msg=3&product_id=" + id);
                return;
            }

            qty = Convert.ToInt16(txt_quantity.Text);

            if (p_qty == 0)
            {
                Response.Redirect("productdetail.aspx?msg=1&product_id=" + id);
                return;
            }

            if (p_qty < qty)
            {
                Response.Redirect("productdetail.aspx?msg=4&qt=" + p_qty + "&product_id=" + id);
                return;
            }

            int price = Convert.ToInt32(lbl_price.Text);


            cmd = new SqlCommand("SELECT * FROM addtocart WHERE product_id=@pid AND registration_id=@rid", con);
            cmd.Parameters.AddWithValue("@pid", id);
            cmd.Parameters.AddWithValue("@rid", r_id);

            con.Open();
            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                dr.Read();
                int currentQty = Convert.ToInt32(dr["a_quantity"]);
                int stockLeft = p_qty - currentQty;

                con.Close();

                if (qty <= stockLeft)
                {

                    cmd = new SqlCommand(
                        "UPDATE addtocart SET a_quantity = a_quantity + @qty WHERE product_id=@pid AND registration_id=@rid",
                        con);

                    cmd.Parameters.AddWithValue("@qty", qty);
                    cmd.Parameters.AddWithValue("@pid", id);
                    cmd.Parameters.AddWithValue("@rid", r_id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Redirect("addtocart.aspx?product_id=" + id);
                }
                else
                {
                    Response.Redirect("productdetail.aspx?msg=4&qt=" + stockLeft + "&product_id=" + id);
                }
            }
            else
            {
                con.Close();


                cmd = new SqlCommand(
                    "INSERT INTO addtocart (registration_id, product_id, a_quantity, product_price) " +
                    "VALUES (@rid, @pid, @qty, @price)", con);

                cmd.Parameters.AddWithValue("@rid", r_id);
                cmd.Parameters.AddWithValue("@pid", id);
                cmd.Parameters.AddWithValue("@qty", qty);
                cmd.Parameters.AddWithValue("@price", price);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("addtocart.aspx?product_id=" + id);
            }
        }

    }

}
