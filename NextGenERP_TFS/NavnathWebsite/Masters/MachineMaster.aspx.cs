using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modal;
using BAL;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using NavnathWebsite.SharedClasses;

namespace NavnathWebsite.Masters
{
    public partial class MachineMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMachineCode();
            }

        }

        MachineMasterModal MMModal = new MachineMasterModal();
        MachineMasterBAL MMBusiness = new MachineMasterBAL();

        public void BindMachineCode()
        {
            DataTable dt = MMBusiness.BindMachineCode(MMModal);
            drpMachineSearch.DataSource = dt;
            drpMachineSearch.DataBind();
            drpMachineSearch.DataTextField = "MachineName";
            drpMachineSearch.DataValueField = "MachineNo";
            drpMachineSearch.DataBind();
            drpMachineSearch.Items.Insert(0, "Select");
            drpMachineSearch.SelectedIndex = 0;
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            Response.Redirect(NavigateUrl.RptMachineMasterForm);
        }

        protected void BtnMachineWise_Click(object sender, EventArgs e)
        {
            if (drpMachineSearch.SelectedValue != "Select")
            {
                Response.Redirect(NavigateUrl.MachineMasterMachineWiseDtlForm+"&SrNo="+drpMachineSearch.SelectedIndex);
            }
            else
            {
                Response.Write("<script> alert('Plese Select Machine first') </Script>");                
            }
        }





    }
}