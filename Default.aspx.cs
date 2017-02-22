using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void Tab1_Click(object sender, EventArgs e)
    {
       // gridView1.Visible = true;
        multiView1.ActiveViewIndex = 0;
    }
    protected void Tab2_Click(object sender, EventArgs e)
    {
       //gridView2.Visible = true;
        multiView1.ActiveViewIndex = 1;
    }
    //private void PopulateAsset()
    //{
    //    string constr = ConfigurationManager.ConnectionStrings["s"].ConnectionString;
    //    string sqlStatment = "SELECT * FROM inventory";
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand(sqlStatment, con))
    //        {
    //            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
    //            {
    //                DataSet ds = new DataSet();
    //                da.Fill(ds);
    //                this.gridView1.DataSource = ds;
    //                this.gridView1.DataBind();
    //            }
    //        }
    //    }
    //}
    //protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    //{
  
    //    this.gridView1.EditIndex = e.NewEditIndex;
    //    Label lbl = (Label)gridView1.Rows[e.NewEditIndex].Cells[0].FindControl("asset_id");
    //    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    //    string sqlStatment = "SELECT * FROM inventory WHERE asset_id=@asset_id";
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand(sqlStatment, con))
    //        {
    //            cmd.Parameters.AddWithValue("@asset_id", Convert.ToInt32(lbl.Text));
    //            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
    //            {
    //                DataSet ds = new DataSet();
    //                da.Fill(ds);
    //                this.Txtinven.Text = ds.Tables[0].Rows[0]["asset_id"].ToString();
    //                this.Txtinven1.Text = ds.Tables[0].Rows[0]["asset_name"].ToString();
                    
    //            }
    //        }
    //    }
    //}
}