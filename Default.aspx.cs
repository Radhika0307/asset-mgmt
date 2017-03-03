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
        string click;
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connStr))
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("asset_id", typeof(string));
            dt.Columns.Add("type", typeof(string));
            dt.Columns.Add("DOP", typeof(string));
            dt.Columns.Add("invoice_id", typeof(int));
            dt.Columns.Add("status", typeof(string));

            //dt.Columns.Add("button", typeof(string));

            con.Open();
            SqlCommand cmd = new SqlCommand("spSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            
            
            using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
            {
                while (rdr.Read())
                {

                    string assetId = rdr.GetString(rdr.GetOrdinal("asset_id"));
                    string type = rdr.GetString(rdr.GetOrdinal("type"));
                    string DOP = rdr.IsDBNull(rdr.GetOrdinal("DOP")) ? "" : rdr.GetDateTime(rdr.GetOrdinal("DOP")).ToString();
                    string Invoice_ID = rdr.IsDBNull(rdr.GetOrdinal("Invoice_ID")) ? "" : rdr.GetInt32(rdr.GetOrdinal("Invoice_ID")).ToString();
                    string status =rdr.IsDBNull(rdr.GetOrdinal("status"))?"": rdr.GetString(rdr.GetOrdinal("status"));
                  
                    if(status=="A")
                    {
                        click = "dellocate";

                    }
                    else
                    {
                        click = "allocate";
                    }
                    dt.Rows.Add(assetId, type, DOP, Invoice_ID, status);
                    

                }
                rdr.Close();

                gridView2.DataSource = dt;
                gridView2.DataBind();
                con.Close();
                foreach(GridViewRow row in gridView2.Rows)
                {
                    if(row.Cells[5].Text.Trim()=="A")
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
        multiView1.ActiveViewIndex = 0;
    }
    protected void Tab2_Click(object sender, EventArgs e)
    {
        multiView1.ActiveViewIndex = 1;
    }
    protected void TxtDstn_Click(object sender, EventArgs e)
    {
        
        if (txtDist.Text.Trim()==string.Empty)
        {
            LbDstn.Visible = true;
            LbDstn.Text="enter a value!!!";
           
            
        }
        else
        {
            LbDstn.Visible = false;
            gridView1.Visible = true;
        }
                
    }
   
    private void inven_search()
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connStr))
        {
            
            con.Open();
            string query = "select * from inventory where type like'" + Txtinven.Text + "%'";

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            gridView2.DataSource=ds;
            gridView2.DataBind();
            con.Close();
        }
    }
    protected void btnInven_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();
            string query = "select *  from inventory where type like'" + Txtinven.Text + "%'";
            SqlCommand com = new SqlCommand(query, con);

            SqlDataReader dr;
            dr = com.ExecuteReader();

            if (Txtinven.Text.Trim() == string.Empty)
            {
                Lbinven1.Visible = true;
                Lbinven1.Text = "enter a value!!!";

            }
            else  if (dr.HasRows)
            {
                dr.Read();

                inven_search();
                gridView2.Visible = true;

                Txtinven.Text = "";
                Lbinven1.Visible = false;

            }
            else
            {
                gridView2.Visible = false;
                Lbinven1.Text = "no results found";

            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton1.Enabled = true;
        LbDstn.Visible = false;
        gridView1.Visible = true;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Lbinven1.Visible = false;
        gridView2.Visible = true;
    }
    //protected void bind()
    //{
    //    string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(connStr))
    //    {

    //        con.Open();
    //        string query ="select status from inventory JOIN employee ON[inventory].asset_id=[employee].asset_id ";

    //        SqlDataAdapter da = new SqlDataAdapter(query, con);
    //        DataSet ds = new DataSet();
    //        da.Fill(ds);
    //        gridView2.DataSource = ds;
    //        gridView2.DataBind();
    //        con.Close();
    //    }
    //}

    //protected void gridView2_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(connStr))
    //    {
    //        con.Open();
    //        string query = "select status from inventory JOIN employee ON[inventory].asset_id=[employee].asset_id";
    //        SqlCommand com = new SqlCommand(query, con);
    //        query = com.ExecuteReader().ToString();
           
          
    //    }
    //}
  
   
}