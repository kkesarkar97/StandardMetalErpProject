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
    public partial class DemoItemMaster : System.Web.UI.Page
    {
        DemoItemMasterBAL bal = new DemoItemMasterBAL();
        DemoItemMasterModel model = new DemoItemMasterModel();

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
                drpSearchItem.DataTextField = "ItemName";
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

           // result =   bal.SaveITemMaster();
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

        protected void btnUpdateItem_Click(object sender, EventArgs e)
        {

            ControlTovalue();
            model.ItemCode = drpSearchItem.SelectedValue.ToString();

            int result = bal.UpdateItemMaster(model);

            // result =   bal.SaveITemMaster();
            if (result > 0)
            {
                Response.Write("<script> alert('Record updated Successfully...') </Script>");
            }
            else
            {
                Response.Write("<script> alert('Error occured while performing the action') </Script>");
            }

        }

        protected void btnCancelItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Masters/DemoItemMaster.aspx");
        }



    }
}