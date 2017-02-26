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
            dt.Columns.Add("dop", typeof(string));
            dt.Columns.Add("invoice", typeof(int));


            con.Open();
            SqlCommand cmd = new SqlCommand("spSelect", con);
            cmd.CommandType = CommandType.StoredProcedure;
            using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection))
            {
                while (rdr.Read())
                {
                    string assetId = rdr.GetString(rdr.GetOrdinal("asset_id"));
                    string type = rdr.GetString(rdr.GetOrdinal("type"));
                    string DOP = rdr.IsDBNull(rdr.GetOrdinal("dop")) ? "" : rdr.GetDateTime(rdr.GetOrdinal("dop")).ToString();
                    string Invoice_ID = rdr.IsDBNull(rdr.GetOrdinal("invoice")) ? "" : rdr.GetInt32(rdr.GetOrdinal("invoice")).ToString();
                    dt.Rows.Add(assetId, type, DOP, Invoice_ID);
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
       // gridView2.Visible = true;
        multiView1.ActiveViewIndex = 1;
    }

    protected void btnDist_Click(object sender, EventArgs e)
    {
        gridView1.Visible = true;
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


            if (dr.HasRows)
            {
                dr.Read();

                inven_search();
                gridView2.Visible = true;

                Txtinven.Text = "";
                
            }
            else
            {
                gridView2.Visible = false;
                Lbinven1.Visible = true;

            }
        }
    }
    
    }