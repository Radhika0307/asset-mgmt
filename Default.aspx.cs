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
            dt.Columns.Add("asset_id", typeof(string));
            dt.Columns.Add("type", typeof(string));
            dt.Columns.Add("DOP", typeof(string));
            dt.Columns.Add("invoice_id", typeof(int));


            con.Open();
            SqlCommand cmd = new SqlCommand("spSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@asset_id", " ");
            cmd.Parameters.AddWithValue("@type", " ");
            cmd.Parameters.AddWithValue("@dop", " ");
            cmd.Parameters.AddWithValue("@invoice_id", "0 ");
            using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
            {
                while (rdr.Read())
                {
                    string assetId = rdr.GetString(rdr.GetOrdinal("asset_id"));
                    string type = rdr.GetString(rdr.GetOrdinal("type"));
                    string DOP = rdr.IsDBNull(rdr.GetOrdinal("DOP")) ? "" : rdr.GetDateTime(rdr.GetOrdinal("DOP")).ToString();
                    string Invoice_ID = rdr.IsDBNull(rdr.GetOrdinal("Invoice_ID")) ? "" : rdr.GetInt32(rdr.GetOrdinal("Invoice_ID")).ToString();
                    dt.Rows.Add( assetId,type, DOP,Invoice_ID);
                }
                rdr.Close();

                gridView2.DataSource = dt;
                gridView2.DataBind();
                con.Close();
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
        gridView1.Visible = true;
    }
    //protected void TxtDstn1_Click(object sender, EventArgs e)
    //{
    //    gridView2.Visible = true;
    //}
    
}