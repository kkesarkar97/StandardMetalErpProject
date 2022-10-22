using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BAL;
using Modal;

namespace NavnathWebsite.Masters
{
    public partial class ItemMaster_10May : System.Web.UI.Page
    {

        ItemMaster_10May_BAL bal = new ItemMaster_10May_BAL();
        ItemMaster_10May_Model model = new ItemMaster_10May_Model();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillItemMaster();
                BindManufacturer();
                BindColor();
                BindUOM();
                FillCategory();
            }
        }
        public void FillItemMaster()
        {
            DataTable dt = new DataTable();
            dt = bal.FillItemMaster();

            drpSearchItem.Items.Clear();
            drpItemType.Items.Clear();

            if (dt.Rows.Count > 0)
            {
                drpSearchItem.DataSource = dt;
                drpSearchItem.DataTextField = "ItemCode";
                drpSearchItem.DataValueField = "ItemCode";
                drpSearchItem.DataBind();
                drpSearchItem.Items.Insert(0, "Select");
                drpSearchItem.SelectedIndex = 0;

                drpItemType.DataSource = dt;
                drpItemType.DataTextField = "ItemName";
                drpItemType.DataValueField = "ItemCode";
                drpItemType.DataBind();
                drpItemType.Items.Insert(0, "Select");
                drpItemType.SelectedIndex = 0;
            }

        }
        private void BindManufacturer()
        {
            DataTable dt = new DataTable();

            dt = bal.BindManufacturer();

            drpManufactureID.Items.Clear();

            if (dt.Rows.Count > 0)
            {
                drpManufactureID.DataSource = dt;
                drpManufactureID.DataTextField = "ManufacturerName";
                drpManufactureID.DataValueField = "ManufacturerId";
                drpManufactureID.DataBind();
                drpManufactureID.Items.Insert(0, "Select");
                drpManufactureID.SelectedIndex = 0;
            }
        }
        private void BindColor()
        {

            DataTable dt = new DataTable();

            dt = bal.BindColor();

            drpColorId.Items.Clear();

            if (dt.Rows.Count > 0)
            {
                drpColorId.DataSource = dt;
                drpColorId.DataTextField = "ColourName";
                drpColorId.DataValueField = "ColourId";
                drpColorId.DataBind();
                drpColorId.SelectedIndex = 0;
            }
        }

        private void BindUOM()
        {
            DataTable dt = new DataTable();

            dt = bal.BindUOM();

            drpUOMId.Items.Clear();

            if (dt.Rows.Count > 0)
            {
                drpUOMId.DataSource = dt;
                drpUOMId.DataTextField = "UnitName";
                drpUOMId.DataValueField = "UnitId";
                drpUOMId.DataBind();
                drpUOMId.Items.Insert(0, "Select");
                drpUOMId.SelectedIndex = 0;
            }

        }

        protected void ControlTovalue()
        {

            model.ItemName = Convert.ToString(TxtItemName.Text);
            model.ManufacturerId = Convert.ToInt32(drpManufactureID.SelectedValue);
            model.Material = Convert.ToString(txtItemMaterial.Text);
            model.UOMId = Convert.ToInt32(drpUOMId.SelectedValue);
            model.PurchaseCost = Convert.ToDecimal(txtItemPurchaseCost.Text == "" ? "0" : txtItemPurchaseCost.Text);
            model.SellingPrice = Convert.ToDecimal(txtItemSellingCost.Text == "" ? "0" : txtItemSellingCost.Text);
            //model.ItemCategeryId = Convert.ToInt32(drpItemCategory.SelectedValue);
         //   model.ItemSubCatogoryId = Convert.ToInt32(drpItemSubCategory.SelectedValue);
            model.ColorId = Convert.ToInt32(drpColorId.SelectedValue);
            model.HSNCODE = Convert.ToString(txtItemHSN.Text);
            model.GSTRate = Convert.ToDecimal(txtGSTRate.Text == "" ? "0" : txtGSTRate.Text);
            model.UserId = Convert.ToInt32(Session["UserId"].ToString());
            model.LoginBranchId = Convert.ToInt32(Session["BranchId"].ToString());

            if (chkRawMaterial.Checked)
            {
                model.RawMaterial = "1";
            }
            else
            {
                model.RawMaterial = "0";
            }
        }


        public void FillCategory()
        {
            DataTable dt = new DataTable();
            dt = bal.FillCategory(0);

            drpItemCategory.Items.Clear();
            drpItemCategory.Items.Clear();

            if (dt.Rows.Count > 0)
            {
                drpItemCategory.DataSource = dt;
                drpItemCategory.DataTextField = "CategoryName";
                drpItemCategory.DataValueField = "CategoryId";
                drpItemCategory.DataBind();
                drpItemCategory.Items.Insert(0, "Select");
                drpItemCategory.SelectedIndex = 0;
            }

        }
        public void FillSubCategory()
        {

            DataTable dt = new DataTable();
            dt = bal.FillCategory(Convert.ToInt32(drpItemCategory.SelectedValue));

            drpItemSubCategory.Items.Clear();
            drpItemSubCategory.Items.Clear();

            if (dt.Rows.Count > 0)
            {
                drpItemSubCategory.DataSource = dt;
                drpItemSubCategory.DataTextField = "SubCategoryName";
                drpItemSubCategory.DataValueField = "SubCategoryId";
                drpItemSubCategory.DataBind();
                drpItemSubCategory.Items.Insert(0, "Select");
                drpItemSubCategory.SelectedIndex = 0;
            }

        }

        

        protected void btn_Save_click(object sender, EventArgs e)
        {
            {
                try
                {
                   
            int result = 0;
                   
                    ControlTovalue();
                    result = bal.Save_ItemMaster_10May(model);
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
        protected void drpItemCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillSubCategory();
        }

        protected void btnUpdateItem_Click(object sender, EventArgs e)
        {
            {
                try
                {
                    int result = 0;
                    ControlTovalue();
                    model.ItemCode = Convert.ToString(txtItemcode.Text);
                    result = bal.Update_ItemMaster_10May(model);
                    if (result > 0)
                    {
                        Response.Write("<script> alert('Record Updated Successfully...') </Script>");
                    }
                    else
                    {
                        Response.Write("<script> alert('Error occured while performing the action') </Script>");
                    }

                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void drpSearchItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpItemType.SelectedValue = drpSearchItem.SelectedValue;
        }

        protected void drpItemType_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpSearchItem.SelectedValue = drpItemType.SelectedValue;
        }

        protected void btn_Search_click(object sender, EventArgs e)
        {
            {
                try
                {
                    DataTable dt = new DataTable();
                    dt = bal.Search_ItemMaster_10May(drpItemType.SelectedValue);
                    if (dt.Rows.Count > 0)
                    {
                        txtItemcode.Text = Convert.ToString(dt.Rows[0]["ItemCode"]);
                        TxtItemName.Text = Convert.ToString(dt.Rows[0]["ItemName"]);
                        drpItemCategory.SelectedValue = (dt.Rows[0]["CategoryId"]).ToString();
                        FillSubCategory();
                        drpItemSubCategory.SelectedValue = (dt.Rows[0]["SubCategoryId"]).ToString();
                        drpManufactureID.SelectedValue = (dt.Rows[0]["ManufacturerId"]).ToString();
                        txtItemMaterial.Text = Convert.ToString(dt.Rows[0]["Material"]);
                        drpColorId.SelectedValue = (dt.Rows[0]["ColourId"]).ToString();
                        txtItemHSN.Text = Convert.ToString(dt.Rows[0]["HSNCODE"]);
                        drpUOMId.SelectedValue = (dt.Rows[0]["UnitId"]).ToString();
                        txtGSTRate.Text = Convert.ToString(dt.Rows[0]["GSTRate"]);
                        txtItemPurchaseCost.Text = Convert.ToString(dt.Rows[0]["PurchaseCost"]);
                        txtItemSellingCost.Text = Convert.ToString(dt.Rows[0]["SellingPrice"]);
                        if (Convert.ToString(dt.Rows[0]["RawMaterial"]) == "1")
                        { chkRawMaterial.Checked = true; }
                        else
                        { chkRawMaterial.Checked = false; }
                        btnNewItem.Enabled = false;
                        btnSaveItem.Enabled = false;
                        btnUpdateItem.Enabled = true;
                        btnCancelItem.Enabled = true;
                        btnpreview.Enabled = true;
                    }
                    else
                    {
                        Response.Write("<script> alert('Record Not Found..') </Script>");
                    }

                }
                catch (Exception ex)
                {

                }
            }

        }

        protected void btnCancelItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("ItemMaster_10May.aspx?FormId=2");
        }

       
        //protected void drpItemCategory_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    FillSubCategory();
        //}

        //protected void drpItemSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    FillSubCategory();
        //}

        //protected void drpSearchItem_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    drpItemType.SelectedValue = drpSearchItem.SelectedValue;
        //}

        //protected void drpItemType_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    drpSearchItem.SelectedValue = drpItemType.SelectedValue;
        //}

        
        
    }
}




    
