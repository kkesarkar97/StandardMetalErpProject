using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL;
using BAL;
using NavnathWebsite.SharedClasses;
using Modal;

namespace NavnathWebsite

{
    public partial class ItemMaster19Sept : System.Web.UI.Page
    {
        ItemMaster19SeptDAL _dbItem = new ItemMaster19SeptDAL();
        ItemMaster19SeptBAL itemMngr = new ItemMaster19SeptBAL();
        TaxInvoiceMnger _TaxInvoiceManager = new TaxInvoiceMnger();
        protected void Page_Load(object sender, EventArgs e)
        {
              string referer = Request.ServerVariables["HTTP_REFERER"];
            //if (string.IsNullOrEmpty(referer))
            //{
            //    Server.Transfer("~/Login.aspx", false);
            //}
            //if (string.IsNullOrEmpty((string)Session["UserName"]))
            //    Server.Transfer("~/Login.aspx", false);
            if (!IsPostBack)
            {
              //  if (Session["UserName"] == null)
               // {
                //    Response.Redirect("Login.aspx");
               // }
             //   else
               // {
                
                    FillCategory();
                    FillItemMaster();
                    FillManufacturer();
                    FillColour();
                    FillUOM();
                    //FillUserName();
                    //FillBranchName();

                //FillItemGroup("", "", "", "", 0);
                    //FillItemMasterDetails("", "", "", "", 0,1);
                    btnUpdateItem.Enabled = false;
                    btnCancelItem.Enabled = false;
                    btnpreview.Enabled = false;
                   // AutoIncrement();
               // }
            }
        }
        public void FillItemMaster()
        {
            DataTable dt = new DataTable();
            List<ItemMasterModel> lst = new List<ItemMasterModel>();
            lst = _TaxInvoiceManager.FillItemMaster();

            drpSearchItem.Items.Clear();
            drpItemType.Items.Clear();

            if (lst.Count > 0)
            {
                drpSearchItem.DataSource = lst;
                drpSearchItem.DataTextField = "ItemCode";
                drpSearchItem.DataValueField = "ItemCode";
                drpSearchItem.DataBind();
                drpSearchItem.Items.Insert(0, "Select");
                drpSearchItem.SelectedIndex = 0;

                drpItemType.DataSource = lst;
                drpItemType.DataTextField = "ItemName";
                drpItemType.DataValueField = "ItemCode";
                drpItemType.DataBind();
                drpItemType.Items.Insert(0, "Select");
                drpItemType.SelectedIndex = 0;
            }
        }

        public void FillCategory()
        {
            DataTable dt = new DataTable();
            dt = itemMngr.FillCategory(0);

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
            dt = itemMngr.FillCategory( Convert.ToInt32(drpItemCategory.SelectedValue));

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

        public void FillManufacturer()
        {
            DataTable dt = new DataTable();
            dt = itemMngr.FillManufacturer();
            drpManufacturer.Items.Clear();

            if (dt.Rows.Count > 0)
            {
                drpManufacturer.DataSource = dt;
                drpManufacturer.DataTextField = "ManufacturerName";
                drpManufacturer.DataValueField = "ManufacturerId";
                drpManufacturer.DataBind();
                drpManufacturer.Items.Insert(0,"Select Manufacturer");
                drpManufacturer.SelectedIndex = 0;
            }
        }

        public void FillColour()
        {
            DataTable dt = new DataTable();
            dt = itemMngr.FillColour();
            drpColour.Items.Clear();

            if (dt.Rows.Count > 0)
            {
                drpColour.DataSource = dt;
                drpColour.DataTextField = "ColourName";
                drpColour.DataValueField = "ColourId";
                drpColour.DataBind();
                drpColour.Items.Insert(0, "Select Colour");
                drpColour.SelectedIndex = 0;
            }
        }

        public void FillUOM()
        {
            DataTable dt = new DataTable();
            dt = itemMngr.FillUOM();
            drpUOM.Items.Clear();

            if (dt.Rows.Count > 0)
            {
                drpUOM.DataSource = dt;
                drpUOM.DataTextField = "UnitName";
                drpUOM.DataValueField = "UnitId";
                drpUOM.DataBind();
                drpUOM.Items.Insert(0, "Select UOM");
                drpUOM.SelectedIndex = 0;
            }
        }

  
        protected void drpSearchItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //FillItemMasterDetails("", Convert.ToString(drpSearchItem.SelectedValue), "", "", 1,2);
                // FillItemGroup("", Convert.ToString(drpSearchItem.SelectedValue), "", "", 1);

                //drpItemName.SelectedValue = drpItemCode.SelectedValue;
                //FillItemGroup("", Convert.ToString(drpItemName.SelectedValue), "", "", 1);

                drpItemType.SelectedValue = drpSearchItem.SelectedValue;
                // FillItemGroup("", Convert.ToString(drpItemType.SelectedValue), "", "", 1);
            }
            catch (Exception ex)
            {

            }
        }

        protected void drpItemType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                drpSearchItem.SelectedValue = drpItemType.SelectedValue;
                //FillItemGroup("", Convert.ToString(drpSearchItem.SelectedValue), "", "", 1);
                // FillItemGroup("", Convert.ToString(drpSearchItem.SelectedValue), Convert.ToString(drpItemType.SelectedValue), "", 2);
                //FillItemMasterDetails("", Convert.ToString(drpSearchItem.SelectedValue), Convert.ToString(drpItemType.SelectedValue), "", 2,2);
            }
            catch (Exception ex)
            {

            }
        }

        protected void drpItemSubType_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = itemMngr.FillItem(string.Empty, Convert.ToString(drpSearchItem.SelectedValue), Convert.ToString(drpItemType.SelectedValue), Convert.ToString(drpItemSubType.SelectedValue));

                if (dt.Rows.Count > 0)
                {
                    txtItemCode.Text = Convert.ToString(dt.Rows[0]["ItemCode"]);
                    txtItemName.Text = Convert.ToString(dt.Rows[0]["ItemName"]);
                    txtItemType.Text = Convert.ToString(dt.Rows[0]["ItemType"]);
                    txtItemSubType.Text = Convert.ToString(dt.Rows[0]["ItemSubType"]);
                    txtItemManuf.Text = Convert.ToString(dt.Rows[0]["Manufacturer"]);
                    txtItemMaterial.Text = Convert.ToString(dt.Rows[0]["Material"]);
                    txtItemColor.Text = Convert.ToString(dt.Rows[0]["Color"]);
                    txtItemHSN.Text = Convert.ToString(dt.Rows[0]["HSNCODE"]);
                    txtItemUOM.Text = Convert.ToString(dt.Rows[0]["UOM"]);
                    txtGSTRate.Text = Convert.ToString(dt.Rows[0]["GSTRATE"]);
                    txtItemPurchaseCost.Text = Convert.ToString(dt.Rows[0]["PurchaseCost"]);
                    txtItemSellingCost.Text = Convert.ToString(dt.Rows[0]["SellingPrice"]);
                    if (Convert.ToString(dt.Rows[0]["RawMaterial"]) == "1")
                    { chkRawMaterial.Checked = true; }
                    else
                    { chkRawMaterial.Checked = false; }
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

        protected void ControlTovalue()
        {
           // _dbItem.ItemCode = Convert.ToString(txtItemCode.Text);
            _dbItem.ItemName = Convert.ToString(txtItemName.Text);
            _dbItem.Manufacturer = Convert.ToString(drpManufacturer.SelectedValue);
            _dbItem.Material = Convert.ToString(txtItemMaterial.Text);
            _dbItem.UOM = Convert.ToString(drpUOM.SelectedValue);
            _dbItem.PurchaseCost = Convert.ToDecimal(txtItemPurchaseCost.Text == "" ? "0" : txtItemPurchaseCost.Text);
            _dbItem.SellingPrice = Convert.ToDecimal(txtItemSellingCost.Text == "" ? "0" : txtItemSellingCost.Text);
            _dbItem.ItemType = Convert.ToString(txtItemType.Text);
            _dbItem.ItemSubType = Convert.ToString(txtItemSubType.Text);
            _dbItem.Color = Convert.ToString(drpColour.SelectedValue);
            _dbItem.HSNCODE = Convert.ToString(txtItemHSN.Text);
            _dbItem.GSTRate = Convert.ToDecimal(txtGSTRate.Text);
            _dbItem.SubCategoryid = Convert.ToInt32(drpItemSubCategory.SelectedValue);
            _dbItem.Username = Session["Username"].ToString();
            _dbItem.LoginBranch = Session["Branch"].ToString();
            if (chkRawMaterial.Checked)
            {
                _dbItem.RawMaterial = "1";
            }
            else
            {
                _dbItem.RawMaterial = "0";
            }
            _dbItem.Categoryid = Convert.ToInt32(drpItemCategory.SelectedValue);
            _dbItem.SubCategoryid = Convert.ToInt32(drpItemSubCategory.SelectedValue);
        }

        protected void AutoIncrement()
        {
            try
            {
                DataTable dttl = new DataTable();
                string raw = "0";
                if (chkRawMaterial.Checked)
                {
                    raw = "1";
                }
                else
                {
                    raw = "0";
                }
                dttl = itemMngr.GetMaxItemNumber(raw);
                string ItemCode = string.Empty;

                long maxno = 0;
                if (dttl.Rows.Count > 0 && dttl.Rows[0].IsNull("ItemCode") == false)
                {
                    ItemCode = Convert.ToString(dttl.Rows[0]["ItemCode2"]);
                    maxno = Convert.ToInt64(ItemCode);
                    maxno = maxno + 1;
                    ItemCode = Convert.ToString(maxno);
                    ItemCode = ItemCode.PadLeft(4, '0');

                    if (raw == "0")
                    {
                        ItemCode = "SM" + ItemCode;
                    }
                    else
                    {
                        ItemCode = "SMRW" + ItemCode;
                    }

                }
                else
                {
                    if (raw == "0")
                    {
                        ItemCode = "SM" + "0001";
                    }
                    else
                    {
                        ItemCode = "SMRW" + "001";
                    }
                }

                txtItemCode.Text = Convert.ToString(ItemCode);
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message.ToString() + "') </Script>");
            }
        }

        protected void btnSaveItem_Click(object sender, EventArgs e)
        {
            try
            {
                int result = 0;
               // AutoIncrement();
                ControlTovalue();
                result = itemMngr.SaveITemMaster(_dbItem);
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

        protected void FillItemMasterDetails(string cmpcode, string itemName, string itemType, string itemSubType, int Searchflag, int Flag)
        {
            DataTable dttl = new DataTable();
            dttl = itemMngr.FillItemMasterdetail(cmpcode, itemName, itemType, itemSubType, Flag);


            if (dttl.Rows.Count > 0)
            {
                if (Searchflag == 0)
                {
                    drpSearchItem.Items.Clear();

                    drpSearchItem.DataSource = dttl;
                    drpSearchItem.DataTextField = "ItemName";
                    drpSearchItem.DataValueField = "ItemName";
                    drpSearchItem.DataBind();
                    drpSearchItem.Items.Insert(0, "Select");
                    drpSearchItem.SelectedIndex = 0;

                }
                else if (Searchflag == 1)
                {
                    drpItemType.DataSource = dttl;
                    drpItemType.DataTextField = "ItemType";
                    drpItemType.DataValueField = "ItemType";
                    drpItemType.DataBind();
                    drpItemType.Items.Insert(0, "Select");
                    drpItemType.SelectedIndex = 0;
                }
                else if (Searchflag == 2)
                {
                    drpItemSubType.DataSource = dttl;
                    drpItemSubType.DataTextField = "ItemSubType";
                    drpItemSubType.DataValueField = "ItemSubType";
                    drpItemSubType.DataBind();
                    drpItemSubType.Items.Insert(0, "Select");
                    drpItemSubType.SelectedIndex = 0;
                }
            }

        }

        public void FillItemGroup(string cmpcode, string itemName, string itemType, string itemSubType, int Flag)
        {
            DataTable dt = new DataTable();
            dt = itemMngr.FillItem(cmpcode, itemName, itemType, itemSubType);
            if (dt.Rows.Count > 0)
            {
                if (Flag == 0)
                {
                    drpSearchItem.DataSource = dt;
                    drpSearchItem.DataTextField = "ItemName";
                    drpSearchItem.DataValueField = "ItemCode";
                    drpSearchItem.DataBind();
                    drpSearchItem.Items.Insert(0, "Select");
                    drpSearchItem.SelectedIndex = 0;
                }
                else if (Flag == 1)
                {
                    drpItemType.DataSource = dt;
                    drpItemType.DataTextField = "ItemType";
                    drpItemType.DataValueField = "ItemType";
                    drpItemType.DataBind();
                    drpItemType.Items.Insert(0, "Select");
                    drpItemType.SelectedIndex = 0;
                }
                else if (Flag == 2)
                {
                    drpItemSubType.DataSource = dt;
                    drpItemSubType.DataTextField = "ItemSubType";
                    drpItemSubType.DataValueField = "ItemSubType";
                    drpItemSubType.DataBind();
                    drpItemSubType.Items.Insert(0, "Select");
                    drpItemSubType.SelectedIndex = 0;
                }

            }
            else
            {
                Response.Write("<script> alert('Error occured while performing the action.') </Script>");
            }
        }
        protected void btnUpdateItem_Click(object sender, EventArgs e)
        {
            try
            {
                int result = 0;
                ControlTovalue();
                _dbItem.ItemCode = Convert.ToString(txtItemCode.Text);
                result = itemMngr.SaveITemMaster(_dbItem);
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
        protected void btnNewItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("ItemMaster.aspx");
        }
        protected void btnCancelItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("ItemMaster.aspx");
        }
        protected void btnpreview_Click(object sender, EventArgs e)
        {

        }
        //btnItemWise_Click
        protected void btnItemWise_Click(object sender, EventArgs e)
        {

            //SearchItemCode = drpSearchItem.SelectedValue.ToString();
            if (drpSearchItem.SelectedValue != "Select")
            {
                Response.Redirect(NavigateUrl.ItemMasterItemWiseDtlForm + drpSearchItem.SelectedValue);
            }
            else
            {
                Response.Write("<script> alert('Plese Select Item code first') </Script>");
            }


        }

        //btnAllItem_Click
        protected void btnAllItem_Click(object sender, EventArgs e)
        {
            Response.Redirect(NavigateUrl.RptItemMasterForm);
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = itemMngr.RetriveItem(drpItemType.SelectedValue);
                if (dt.Rows.Count > 0)
                {
                    txtItemCode.Text = Convert.ToString(dt.Rows[0]["ItemCode"]);
                    txtItemName.Text = Convert.ToString(dt.Rows[0]["ItemName"]);
                    txtItemType.Text = Convert.ToString(dt.Rows[0]["ItemType"]);
                    txtItemSubType.Text = Convert.ToString(dt.Rows[0]["ItemSubType"]);
                    txtItemManuf.Text = Convert.ToString(dt.Rows[0]["Manufacturer"]);
                    txtItemMaterial.Text = Convert.ToString(dt.Rows[0]["Material"]);
                    txtItemColor.Text = Convert.ToString(dt.Rows[0]["Color"]);
                    txtItemHSN.Text = Convert.ToString(dt.Rows[0]["HSNCODE"]);
                    txtItemUOM.Text = Convert.ToString(dt.Rows[0]["UOM"]);
                    txtGSTRate.Text = Convert.ToString(dt.Rows[0]["GSTRATE"]);
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

        protected void chkRawMaterial_CheckedChanged(object sender, EventArgs e)
        {
            AutoIncrement();
        }

        protected void drpItemCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillSubCategory();
        }
    }

        }
 