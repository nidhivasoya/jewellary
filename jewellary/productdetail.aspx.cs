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
            if (txt_quantity.Text != null)
            {
                qty = Convert.ToInt16(txt_quantity.Text);
            }
            if (txt_quantity.Text == null || qty == 0)
            {
                Response.Redirect("productdetail.aspx?msg=3&product_id=" + id);
            }
            if (p_qty == 0)
            {
                Response.Redirect("productdetail.aspx?msg=1&product_id=" + id);
            }
            else if (p_qty >= qty)
            {
                cmd = new SqlCommand("select * from addtocart where product_id=" + id + " and registration_id=" + r_id, con);
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        int stock = 0;
                        stock = p_qty - Convert.ToInt16(dr["a_quantity"].ToString());
                        if (qty <= stock)
                        {
                            cmd = new SqlCommand("update addtocart set a_quantity=" + (Convert.ToInt16(dr["a_quantity"].ToString()) + qty) + " where product_id=" + id, con);
                            con.Close();
                            con.Open();
                            int i = cmd.ExecuteNonQuery();
                            if (i > 0)
                            {
                                Response.Redirect("addtocart.aspx?product_id=" + id);
                            }
                            else
                            {
                                if (stock == 0)
                                {
                                    Response.Redirect("productdetail.aspx?msg=1&product_id=" + id);
                                }
                                else
                                {
                                    Response.Redirect("productdetail.aspx?msg=2&product_id=" + id);
                                }
                            }
                            con.Close();
                            con.Open();
                        }
                        else
                        {
                            if (stock == 0)
                            {
                                Response.Redirect("productdetail.aspx?msg=1&product_id=" + id);
                            }
                            else
                            {
                                Response.Redirect("productdetail.aspx?msg=4&qt=" + stock + "&product_id=" + id);
                            }
                        }
                    }
                }
                else
                {
                    con.Close();
                    cmd = new SqlCommand("insert into addtocart(registration_id,product_id,a_quantity)values(" + r_id + "," + id + "," + txt_quantity.Text + ")", con);
                    con.Open();
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("addtocart.aspx?product_id=" + id);
                    }
                    con.Close();
                }
            }
            else
            {
                Response.Redirect("productdetail.aspx?msg=4&qt=" + p_qty + "&product_id=" + id);
            }
        }
    }
}

