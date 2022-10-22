using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;
using Modal;
using BAL;

namespace NavnathWebsite.Demo
{
    public partial class Default : System.Web.UI.Page
    {
        DefaultBussiness DB = new DefaultBussiness();
        DefaultModal DM = new DefaultModal();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             //   BindChartCust();
              //  BindChartSupp();
             //   BindChartItem();
            }
        }

        public void BindChartCust()
        {
            DataTable dt = DB.BindChartCust(DM);
            grdItemVsCustCount.DataSource = dt;
            grdItemVsCustCount.DataBind();
            if (dt.Rows.Count > 0)
            {
                lblCustwiseItem.Text = dt.Rows[0]["TotalCount"].ToString();
            }
            
            grdItemVsCustCount.FooterRow.Cells[0].Text = "Total";
            grdItemVsCustCount.FooterRow.Cells[0].Font.Bold = true;
            grdItemVsCustCount.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Left;

            grdItemVsCustCount.FooterRow.Cells[1].Text = dt.AsEnumerable().Select(x => x.Field<int>("No_Of_Items")).Sum().ToString();
            grdItemVsCustCount.FooterRow.Cells[1].Font.Bold = true;
            grdItemVsCustCount.FooterRow.Cells[1].HorizontalAlign = HorizontalAlign.Left;

        }



        public void BindChartSupp()
        {
            DataTable dt = DB.BindChartSupp(DM);
            grdItemVsSuppCount.DataSource = dt;
            grdItemVsSuppCount.DataBind();
            if (dt.Rows.Count > 0)
            {
                lblSuppWiseItem.Text = dt.Rows[0]["TotalCount"].ToString();
            }
            grdItemVsSuppCount.FooterRow.Cells[0].Text = "Total";
            grdItemVsSuppCount.FooterRow.Cells[0].Font.Bold = true;
            grdItemVsSuppCount.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Left;

            grdItemVsSuppCount.FooterRow.Cells[1].Text = dt.AsEnumerable().Select(x => x.Field<int>("No_Of_Items")).Sum().ToString();
            grdItemVsSuppCount.FooterRow.Cells[1].Font.Bold = true;
            grdItemVsSuppCount.FooterRow.Cells[1].HorizontalAlign = HorizontalAlign.Left;
        }



        public void BindChartItem()
        {
            DataTable dt = DB.BindChartItem(DM);
            
            //grdTotalItemCount.DataSource = dt;
            //grdTotalItemCount.DataBind();
        }






    }
}