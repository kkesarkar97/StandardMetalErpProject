using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL;
using Modal;
namespace NavnathWebsite.Masters
{
    public partial class MachineMasterNew : System.Web.UI.Page
    {
        MachineMasterNModel mmodel = new MachineMasterNModel();
        MachineMasterNBAL bal = new MachineMasterNBAL();

    protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMachineCode();
                FillMachinemaster();
                BindPMplan();
            //    BindMachinType();
            }
        }
        public void BindMachineCode()
        {
            DataTable dt = new DataTable();
            dt= bal.BindMachineCode(mmodel);
            drpMachineSearch.Items.Clear();
            drpMachineSearch.DataSource = dt;
            drpMachineSearch.DataBind();
            drpMachineSearch.DataTextField = "MachineName";
            drpMachineSearch.DataValueField = "MachineNo";
            drpMachineSearch.DataBind();
            drpMachineSearch.Items.Insert(0, "Select");
            drpMachineSearch.SelectedIndex = 0;
        }

        public void FillMachinemaster()
        {
            DataTable dt = new DataTable();
            dt = bal.FillMachinemaster(mmodel);

            drpMachineCode.Items.Clear();
            drpMachineName.Items.Clear();

            if (dt.Rows.Count > 0)
            {
                drpMachineCode.DataSource = dt;
                drpMachineCode.DataTextField = "MachineNo";
                drpMachineCode.DataValueField = "MachineNo";
                drpMachineCode.DataBind();
                drpMachineCode.Items.Insert(0, "Select");
                drpMachineCode.SelectedIndex = 0;
            
                drpMachineName.DataSource = dt;
                drpMachineName.DataTextField = "MachineName";
                drpMachineName.DataValueField = "MachineNo";
                drpMachineName.DataBind();
                drpMachineName.Items.Insert(0, "Select");
                drpMachineName.SelectedIndex = 0;

            }

        }


        public void BindMachinType()
        {
            DataTable dt = new DataTable();
            dt = bal.BindMachineCode(mmodel);
            drpMachineType.Items.Clear();
            drpMachineType.DataSource = dt;
            drpMachineType.DataBind();
            drpMachineType.DataTextField = "McChar";
            drpMachineType.DataValueField = "McChar";
            drpMachineType.DataBind();
            drpMachineType.Items.Insert(0, "Select");
            drpMachineType.SelectedIndex = 0;
        }
        private void BindPMplan()
        {
            DataTable dt = new DataTable();
            dt = bal.BindPMplan();

            drpPMplan.Items.Clear();

            if (dt.Rows.Count > 0)
            {

                drpPMplan.DataSource = dt;
                drpPMplan.DataTextField = "PMPlan";
                drpPMplan.DataValueField = "PMPlan";
                drpPMplan.DataBind();
                drpPMplan.Items.Insert(0, "Select");
                drpPMplan.SelectedIndex = 0;
            }

        }

        protected void btnCancelItem_Click(object sender, EventArgs e)
        {

        }

        protected void TextBox7_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ControValues()
        {
            mmodel.MachineNo = Convert.ToString(txtboxMachineCode.Text);
            mmodel.MachineName = Convert.ToString(txtboxMachineName.Text);
            mmodel.Group = Convert.ToString(txtboxGroup.Text);
            mmodel.Make = Convert.ToString(txtboxMake.Text);
            mmodel.Cmp_Code = Convert.ToString(txtboxCmp_Code.Text);
            mmodel.MachineCostPerHr = Convert.ToDecimal(txtboxMachineOCost.Text);
            mmodel.CapacityRangeTo =Convert.ToDecimal(txtboxCapactity.Text);
            mmodel.Location = Convert.ToString(txtboxLocation.Text);
            mmodel.PMPlan = Convert.ToString(drpPMplan.SelectedValue);
            mmodel.Model = Convert.ToString(txtboxModel.Text);
            mmodel.PurchaseDate = Convert.ToDateTime(txtboxPurchaseDate.Text);
            mmodel.Remark = Convert.ToString(txtboxRemark.Text);

        }

        protected void btnSaveItem_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    int result = 0;
                    //AutoIncrement();
                    ControValues();
                    result = bal.SaveMachineMaster(mmodel);
                    if (result > 0)
                    {
                        Response.Write("<script> alert('Record Save Successfully...') </Script>");
                    }
                    else
                    {
                        Response.Write("<script> alert('Error occured while performing the action') </Script>");
                    }

                }
                catch (Exception ex)
                {
                    Response.Write("<script> alert('Error occured while performing the action') </Script>");
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}