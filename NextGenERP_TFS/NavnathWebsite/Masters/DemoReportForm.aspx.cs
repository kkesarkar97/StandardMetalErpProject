using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Microsoft.Reporting.WebForms;

namespace NavnathWebsite.Masters
{
    public partial class DemoReportForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string con = @"Data Source=SA-TECH;Initial Catalog=StandardMetals;Integrated Security=True";
                SqlConnection Conn = new SqlConnection(con);
                SqlCommand cmd = new SqlCommand("FillItemMaster", Conn);
                cmd.CommandType = CommandType.StoredProcedure;
                Conn.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                Conn.Close();
                if (dt.Rows.Count > 0)
                {
                    ddlItemCode.DataSource = dt;
                    ddlItemCode.DataTextField = "ItemName";
                    ddlItemCode.DataValueField = "ItemCode";
                    ddlItemCode.DataBind();
                    ddlItemCode.Items.Insert(0, "Select");
                    ddlItemCode.SelectedIndex = 0;
                }
            }
        }

        protected void btnShowReport_Click(object sender, EventArgs e)
        {
            string con = @"Data Source=SA-TECH;Initial Catalog=StandardMetals;Integrated Security=True";
            SqlConnection Conn = new SqlConnection(con);
            SqlCommand cmd = new SqlCommand("RptItemWiseDetail", Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (ddlItemCode.SelectedValue != "Select")
            {
                cmd.Parameters.AddWithValue("@ItemCode", ddlItemCode.SelectedValue);
            }
            else
            {
                cmd.Parameters.AddWithValue("@ItemCode", "0");
            }
            Conn.Open();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataTable dt = new DataTable();
            da.Fill(dt);
            Conn.Close();

            ReportDataSource rds = new ReportDataSource("DataSet1", dt);
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/ReportFiles/RptItemWiseReportDemo.rdlc");
            ReportViewer1.Width = 1060;
            ReportViewer1.Height = 700;
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.Refresh();



        }



    }
}