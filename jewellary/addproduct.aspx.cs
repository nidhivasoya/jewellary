using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace jewellary
{
    public partial class addproduct : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        String img;
        public int cid;
        protected void Page_Load(object sender, EventArgs e)
        {
            String str = ConfigurationManager.ConnectionStrings["dryfruit"].ConnectionString;
            con = new SqlConnection(str);
            if (IsPostBack == false)
            {
                cmd = new SqlCommand("select * from category", con);
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        category.Items.Add(dr["category_name"].ToString());
                    }
                }
                con.Close();
                if (Request.QueryString["product_id"] != null)
                {
                    cmd = new SqlCommand("select * from product where product_id=@product_id", con);
                    con.Open();
                    cmd.Parameters.AddWithValue("@product_id", Convert.ToInt16(Request.QueryString["product_id"].ToString()));
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();
                        txt_name.Text = dr["product_name"].ToString();
                        Image1.ImageUrl = dr["product_image"].ToString();
                        txt_price.Text = dr["product_price"].ToString();
                        txt_quantity.Text = dr["product_quantity"].ToString();
                        TextBox1.Text = dr["product_description"].ToString();
                    }
                    con.Close();
                }
            }
        }
        protected void btn_edit_Click(object sender, EventArgs e)
        {
            if (FileUpload1.FileName == "")
            {
                img = Image1.ImageUrl.ToString();
            }
            else
            {
                FileUpload1.SaveAs(MapPath("~/image/" + FileUpload1.FileName));
                img = "~/image/" + FileUpload1.FileName;
            }
            cmd = new SqlCommand("update product set product_name=@product_name,product_image=@product_image,product_price=@product_price,product_quantity=@product_quantity,product_description=@product_description where product_id=@product_id", con);
            con.Open();
            cmd.Parameters.AddWithValue("@product_id", Convert.ToInt16(Request.QueryString["product_id"].ToString()));
            cmd.Parameters.AddWithValue("@product_name", txt_name.Text);
            cmd.Parameters.AddWithValue("@product_price", txt_price.Text);
            cmd.Parameters.AddWithValue("@product_image", img);
            cmd.Parameters.AddWithValue("@product_quantity", txt_quantity.Text);
            cmd.Parameters.AddWithValue("@product_description", TextBox1.Text);

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("viewproduct.aspx");
            }
            con.Close();
        }
        protected void btn_add_Click(object sender, EventArgs e)
        {
            string s1 = "select * from product where product_image='" + Image1.ImageUrl + "'";
            SqlDataAdapter da = new SqlDataAdapter(s1, con);
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lbl_msg1.Text = "Product Already Existing..";
            }
            else
            {
                cmd = new SqlCommand("select * from category where category_name=@category_name", con);
                con.Open();
                cmd.Parameters.AddWithValue("category_name", category.SelectedItem.Text.ToString());
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    cid = Convert.ToInt16(dr["category_id"].ToString());
                }
                con.Close();
                if (FileUpload1.HasFile)
                {
                    FileUpload1.SaveAs(MapPath("~/image/" + FileUpload1.FileName));
                    img = "~/image/" + FileUpload1.FileName;
                }
                else
                {
                    Response.Write("not insert");
                }
                img = "~/image/" + FileUpload1.FileName;
                cmd = new SqlCommand("insert into product(category_id,product_name,product_image,product_price,product_quantity,product_description)values(@category_id,@product_name,@product_image,@product_price,@product_quantity,@product_description)", con);
                cmd.Parameters.AddWithValue("@category_id", cid);
                cmd.Parameters.AddWithValue("@product_name", txt_name.Text);
                cmd.Parameters.AddWithValue("@product_image", img);
                cmd.Parameters.AddWithValue("@product_price", txt_price.Text);
                cmd.Parameters.AddWithValue("@product_quantity", txt_quantity.Text);
                cmd.Parameters.AddWithValue("@product_description", TextBox1.Text);

                con.Open();
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Redirect("viewproduct.aspx");
                }
                con.Close();
            }
        }
    }
}