using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using BAL;
using Modal;
using NavnathWebsite.SharedClasses;

namespace NavnathWebsite.Masters
{
    public partial class IndentMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindIndentNumber();
            }

        }

        IndentMasterBAL IndentBAL = new IndentMasterBAL();
        IndentMasterModel IndentModal = new IndentMasterModel();

        protected void btnAllIndent_Click(object sender, EventArgs e)
        {
            Response.Redirect(NavigateUrl.RptIndetDetailIReportForm+"0");
        }

        public void BindIndentNumber()
        {
            DataTable dt = IndentBAL.BindIndentNumber(IndentModal);
            drpIndentNumber.DataSource = dt;
            drpIndentNumber.DataBind();
            drpIndentNumber.DataTextField = "IndentNoAutoGen";
            drpIndentNumber.DataValueField = "IndentId";
            drpIndentNumber.DataBind();
        }



    }
}