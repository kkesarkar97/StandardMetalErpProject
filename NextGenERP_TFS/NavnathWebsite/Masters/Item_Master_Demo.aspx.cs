using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL;
using System.Data;
using Modal;

namespace NavnathWebsite.Masters
{
    public partial class Item_Master_Demo : System.Web.UI.Page
    {
        ItemMaster_BAL bal = new ItemMaster_BAL();
        ItemMaster_Model model = new ItemMaster_Model();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillItemMaster();
            }

        }
        public void FillItemMaster()
        {
            DataTable dt = bal.FillItemMaster();


            drpSearchItem.Items.Clear();


            if (dt.Rows.Count > 0)
            {
                drpSearchItem.DataSource = dt;
                drpSearchItem.DataTextField = "ItemCode";
                drpSearchItem.DataValueField = "ItemCode";
                drpSearchItem.DataBind();
                drpSearchItem.Items.Insert(0, "Select");
                drpSearchItem.SelectedIndex = 0;

            }

        }

        protected void drpSearchItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindItemMasterByCode(drpSearchItem.SelectedValue);
        }
        public void BindItemMasterByCode(string ItemCode)
        {
            DataTable dt = bal.BindItemMasterByCode(ItemCode);


            drpSearchItem.Items.Clear();


            if (dt.Rows.Count > 0)
            {

                txtItemCode.Text = dt.Rows[0]["ItemCode"].ToString();
                txtItemName.Text = dt.Rows[0]["ItemName"].ToString();
                txtItemManuf.Text = dt.Rows[0]["ManufacturerName"].ToString();
                txtItemMaterial.Text = dt.Rows[0]["Material"].ToString();
            }

        }

        protected void btnSaveItem_Click(object sender, EventArgs e)
        {
            ControlTovalue();

            int result = bal.SaveItemMaster(model);
            //result = itemMngr.SaveITemMaster(_dbItem);
            if (result > 0)
            {
                Response.Write("<script> alert('Record Save Successfully...') </Script>");
            }
            else
            {
                Response.Write("<script> alert('Error occured while performing the action') </Script>");
            }

        }
        protected void ControlTovalue()
        {

            model.ItemCode = txtItemCode.Text;
            model.ItemName = txtItemName.Text;
            model.Manufacturer = txtItemManuf.Text;
            model.Material = txtItemMaterial.Text;

        }

        protected void btnItemUpdate_click(object sender, EventArgs e)
        {
            ControlTovalue();
            model.ItemCode = drpSearchItem.SelectedValue.ToString();
            int result = bal.UpdateItemMaster(model);
            //result = itemMngr.SaveITemMaster(_dbItem);
            if (result > 0)
            {
                Response.Write("<script> alert('Record Updated Successfully...') </Script>");
            }
            else
            {
                Response.Write("<script> alert('Error occured while performing the action') </Script>");
            }

        }
    }
}





         
        
     
