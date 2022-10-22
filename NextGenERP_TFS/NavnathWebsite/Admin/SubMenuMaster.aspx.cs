using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using Modal;
using BAL;

namespace NavnathWebsite.Masters
{
    public partial class SubMenuMaster : System.Web.UI.Page
    {
        SubMenuBal SubBal = new SubMenuBal();
        SubMenuModel SubModel = new SubMenuModel();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                FillMenuItem();

            }


        }

        public void FillMenuItem()
        {
            DataTable dt = new DataTable();
            dt = SubBal.FillMenuItem();
            drpMenuName.Items.Clear();
            if (dt.Rows.Count > 0)
            {
                drpMenuName.DataSource = dt;
                drpMenuName.DataTextField = "MenuName";
                drpMenuName.DataValueField = "MasterMenuId";
                drpMenuName.DataBind();
                drpMenuName.Items.Insert(0, "Select");
                drpMenuName.SelectedIndex = 0;
            }

        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("SubMenuMaster.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int Raffec = 0;
            if (drpMenuName.SelectedIndex != 0)
            {
                SubModel.SubMenuName = txtSubMenuName.Text;
                SubModel.SubMenuLink = txtSubMenuLink.Text;
                SubModel.MasterMenuId = Convert.ToInt32(drpMenuName.SelectedValue);
                SubModel.IsSubMenuAcive = chkSubMenuIsActive.Checked;
                SubModel.BranchName = Session["Branch"].ToString();
                Raffec = SubBal.SaveMenuData(SubModel);
                if (Raffec > 0)
                {
                    Response.Write("<script> alert('Record Saved..') </Script>");
                    drpMenuName.SelectedIndex = 0;
                    txtSubMenuName.Text = string.Empty;
                    txtSubMenuLink.Text = string.Empty;
                    chkSubMenuIsActive.Checked = false;
                }

                else
                {
                    Response.Write("<script> alert('Record Not Saved..') </Script>");
                }
            }
            else
            {
                
                    Response.Write("<script> alert('Master Menu should be selected first..') </Script>");
                
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        
        {
            Response.Redirect("SubMenuMaster.aspx");
            drpMenuName.SelectedIndex = 0;
            txtSubMenuName.Text = string.Empty;
            txtSubMenuLink.Text = string.Empty;
            chkSubMenuIsActive.Checked = false;
        }
    }
}