using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Modal;
using BAL;
using DAL;
using System.Data;




namespace NavnathWebsite.Masters
{
    public partial class MenuMaster : System.Web.UI.Page
    {
        MenuMasterBal MenuBal = new MenuMasterBal();
        MenuMasterModel MenuModel = new MenuMasterModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
               FillMenuItem();
 
            }

          

        }

        public void FillMenuItem()
        {
            DataTable dt=new DataTable();
            dt = MenuBal.FillMenuItem();
            drpSearchMenu.Items.Clear();
            if (dt.Rows.Count > 0)
            {
                drpSearchMenu.DataSource = dt;
                drpSearchMenu.DataTextField = "MenuName";
                drpSearchMenu.DataValueField = "MasterMenuId";
                drpSearchMenu.DataBind();
                drpSearchMenu.Items.Insert(0, "Select");
                drpSearchMenu.SelectedIndex = 0;
            }

        }

        protected void btnNewMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("MenuMaster.aspx");
        }

        protected void btnSaveMenu_Click(object sender, EventArgs e)
        {

            int Raffec = 0;
            MenuModel.MenuName = txtMenuName.Text;
            MenuModel.IsActive = chkIsActive.Checked;
            MenuModel.BranchName = Session["Branch"].ToString();
            Raffec = MenuBal.SaveMenuData(MenuModel);
            if (Raffec > 0)
            {
                Response.Write("<script> alert('Record Saved..') </Script>");
                drpSearchMenu.SelectedIndex = 0;
                txtMenuName.Text = string.Empty;
                chkIsActive.Checked = false;
            }

            else
            {
                Response.Write("<script> alert('Record Not Saved..') </Script>");
            }
        }

        protected void btnCancelMenu_Click(object sender, EventArgs e)
        {
                       Response.Redirect("MenuMaster.aspx");
                       drpSearchMenu.SelectedIndex = 0;
                       txtMenuName.Text = string.Empty;
                       chkIsActive.Checked = false;
        }
    }
}