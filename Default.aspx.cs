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
   

        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connStr))
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("AssetID", typeof(string));
            dt.Columns.Add("AssetName", typeof(string));
            dt.Columns.Add("InvoiceNo", typeof(int));
            dt.Columns.Add("DistributedDate", typeof(string));
            dt.Columns.Add("Status", typeof(string));


            con.Open();
            SqlCommand cmd = new SqlCommand("spinventory", con);
            cmd.CommandType = CommandType.StoredProcedure;
           
            using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
            {
                while (rdr.Read())
                {
                    string assetId = rdr.GetString(rdr.GetOrdinal("asset_id"));
                    string type = rdr.GetString(rdr.GetOrdinal("asset_name"));
                    string Invoice_no = rdr.IsDBNull(rdr.GetOrdinal("invoice_no")) ? "" : rdr.GetInt32(rdr.GetOrdinal("invoice_no")).ToString();
                    string DOP = rdr.IsDBNull(rdr.GetOrdinal("DOP")) ? "" : rdr.GetDateTime(rdr.GetOrdinal("DOP")).ToString();
                    string status = rdr.IsDBNull(rdr.GetOrdinal("status")) ? "" : rdr.GetString(rdr.GetOrdinal("status"));

                    
                    dt.Rows.Add(assetId, type, Invoice_no, DOP,status);

                }
                rdr.Close();

                GridView2.DataSource = dt;
                GridView2.DataBind();
                con.Close();
                foreach (GridViewRow row in GridView2.Rows)
                {
                    if (row.Cells[5].Text.Trim() == "assigned")
                    {
                        row.Cells[1].FindControl("btnDeallocate").Visible = true;
                        row.Cells[1].FindControl("btnAllocate").Visible = false;
                    }
                    else
                    {
                        row.Cells[1].FindControl("btnDeallocate").Visible = false;
                        row.Cells[1].FindControl("btnAllocate").Visible = true;
                    }
                }
            }

        }
    }

    protected void Tab1_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        btnAssetIntry.CssClass = "Clicked";
        btnAssetDstbd.CssClass = "Intial";
        multiVw1.ActiveViewIndex = 1;
    }
    protected void Tab0_Click(object sender, EventArgs e)
    {
        GridView2.Visible = true;

        btnAssetDstbd.CssClass = "Clicked";
        btnAssetIntry.CssClass = "Intial";
        multiVw1.ActiveViewIndex = 0;
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();
            string query = "select * from emp_asset where emp_id like'" + txt1.Text + "%'";
            SqlCommand com = new SqlCommand(query, con);

            SqlDataReader dr;
            dr = com.ExecuteReader();

            if (txt1.Text.Trim() == string.Empty)
            {
                GridView1.Visible = false;
                Label1.Visible = true;
                Label1.Text = "enter a value!!";
                txt1.Text = "";
            }
                else if (dr.HasRows)
            {
                dr.Read();

                search_emp();
                GridView1.Visible = true;

                Txt2.Text = "";
                Label1.Visible = false;

            }
            else
            {
                GridView1.Visible = false;
                Label1.Text = "no results found!!!";
                 

            }
            
        }
    }
    private void search_emp()
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connStr))
        {

            con.Open();
            string query = "select * from emp_asset where emp_id like'" + txt1.Text + "%'";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Close();
        }
    }
    protected void btnAll_Click(object sender, EventArgs e)
    {

        //btnAll.Enabled = true;
        Label1.Visible = false;
        GridView1.Visible = true;
       
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Lbinven1.Visible = false;
        GridView2.Visible = true;
    }
    
    private void search2_inv()
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connStr))
        {

            con.Open();
            string query = "select * from inventory where asset_name like'" + Txt2.Text + "%'";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView2.DataSource = ds;
            GridView2.DataBind();
            con.Close();
        }
    }
    protected void linkbtn2_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();
            string query = "select *  from inventory where asset_name like'" + Txt2.Text + "%'";
            SqlCommand com = new SqlCommand(query, con);

            SqlDataReader dr;
            dr = com.ExecuteReader();

            if (Txt2.Text.Trim() == string.Empty)
            {
                GridView2.Visible = false;
                Lbinven1.Visible = true;
                Lbinven1.Text = "enter a value!!";
            }
            else if (dr.HasRows)
            {
                dr.Read();

                search2_inv();
                GridView2.Visible = true;

                Txt2.Text = "";
                Lbinven1.Visible = false;

            }
            else
            {
                GridView2.Visible = false;
                Lbinven1.Text = "no results found!!!";
                Lbinven1.Visible = true;

            }
        }


    }

    protected void btnInsert_Click1(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connStr))
        {

            con.Open();
            string query = "INSERT INTO emp_asset(emp_id, emp_name, asset,asset_id,dop,status) VALUES(@emp_id, @emp_name, @asset,@asset_id,@dop,@status)";
            SqlCommand com = new SqlCommand(query, con);



            com.Parameters.AddWithValue("@emp_id", Convert.ToInt32(txtInsert.Text));
            com.Parameters.AddWithValue("@emp_name", Convert.ToString(TxtInsertName.Text));
            com.Parameters.AddWithValue("@asset", hdassetname.Value);
            com.Parameters.AddWithValue("@asset_id", hdassetid.Value);
            com.Parameters.AddWithValue("@dop", Convert.ToDateTime(TxtInsertDate.Text));
            com.Parameters.AddWithValue("@status", "assigned");
            com.ExecuteNonQuery();
            GridView2.DataBind();
            con.Close();
            LbSucess.Visible = true;

        }

    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
   
    }
    
}
