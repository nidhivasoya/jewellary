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
    public partial class addtocart : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["registration_id"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            String str = ConfigurationManager.ConnectionStrings["jw"].ConnectionString;
            con = new SqlConnection(str);


            if (Request.QueryString["addtocart_id"] != null)
            {
                int a = Convert.ToInt32(Request.QueryString["addtocart_id"]);

                cmd = new SqlCommand("delete from addtocart where addtocart_id=@id", con);
                cmd.Parameters.AddWithValue("@id", a);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Response.Redirect("addtocart.aspx");
            }
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            TableCell tc = new TableCell();
            if (e.Row.RowIndex == -1)
            {
                tc.Text = "total";
                tc.Style.Add(HtmlTextWriterStyle.FontWeight, "bold");
            }
            e.Row.Cells.Add(tc);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int total = 0;
            if (e.Row.RowIndex != -1)
            {
                string a = e.Row.Cells[0].Text;
                string b = e.Row.Cells[1].Text;
                double c = double.Parse(a) * double.Parse(b);
                e.Row.Cells[e.Row.Cells.Count - 1].Text = c.ToString();
            }
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                total = total + int.Parse(GridView1.Rows[i].Cells[4].Text);
            }
            Session["total"] = total;
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label1.Text = total.ToString();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            if (GridView1.Rows.Count > 0)
            {
                Response.Redirect("purchase.aspx");
            }
            else
            {
                Label2.Text = "Your cart is empty.please add product to ckeckout.";
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("product.aspx");
        }
    }
}