using System;
using System.Collections.Generic;
using System.Linq;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Modal;
using BAL;

namespace NavnathWebsite.Marketing
{
    public partial class EnquiryMaster : System.Web.UI.Page
    {
        EnquiryMasterBal enqBal = new EnquiryMasterBal();
        EnquiryMasterModel enqModel = new EnquiryMasterModel();
        IndentMasterBAL indBal = new IndentMasterBAL();
        IndentMasterModel indModel = new IndentMasterModel();


        

        protected void Page_Load(object sender, EventArgs e)
        {
            txtEnquiryDate.Text = DateTime.Now.ToString("dd-MM-yyyy hh:mm tt");
            txtQuatationDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtSampleReqDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtSampleProdDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtSampleSubDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            

            if (!IsPostBack)
            {
                BindEnquiryGrid();
                txtEnquiryNumber.Enabled = false;
                CalendarExtender1.StartDate = DateTime.Now;
                ViewState["BindData"] = new DataTable();
                //ViewState["AllData"] = new DataTable();
                BindEnquiryNumber();
                BindDeliveryType();
                BindProductCategory();
                BindMedOfEnq();
                BindUnit();
                BindAuthPerson();
                BindCustomer();
                BindItemMaster();

                if (chkIsNewCustomer.Checked || IsNewItemCode.Checked == true)
                {
                    txtCustomerName.Visible = true;
                    txtCustomerCode.Visible = true;
                    drpCustomerName.Visible = false;
                    drpCustomerCode.Visible = false;
                    cmpdrpDownCustCode.Enabled = false;
                    cmpdrpDownCustName.Enabled = false;
                    txtItemCode.Visible = true;
                    txtItemName.Visible = true;
                    drpItemCode.Visible = false;
                    drpItemName.Visible = false;
                    cmpItemNameDropDown.Enabled = false;
                    cmpItemCodeDropDown.Enabled = false;
                    
                }
                else
                {
                    txtCustomerName.Visible = false;
                    txtCustomerCode.Visible = false;
                    drpCustomerName.Visible = true;
                    drpCustomerCode.Visible = true;
                    txtItemName.Visible = false;
                    txtItemCode.Visible = false;
                    drpItemName.Visible = true;
                    drpItemCode.Visible = true;                    
                }


                
            }            
        }


        private void BindEnquiryGrid()
        {
            List<EnquiryMasterModel> lst = new List<EnquiryMasterModel>();

            lst = enqBal.GetAllEnquiryData();
            ViewState["EnquiryGridData"] = lst;

            ///


            var masterlist = lst.Select(o => new
            {
                o.EnquiryId,
                o.EnquiryNumber,
                o.EnquiryDate, 
            o.EnqRefNumber, o.IsNewCustomer, o.NewCustCode, o.NewCustName, o.Address, o.ContactPerson, 
            o.SystemEntryDate, o.Remark, o.QuotationNumber, o.QuotationDate, o.SampleStatus, o.SampleRequiredDate,
            o.SampleProductionDate, o.SampleSubmissionQuantity, o.SampeSubmissionDate, o.CustomerCode,
            o.MedOfEnqId,  o.CustomerName}).Distinct().ToList();

            

            grdMasterEntries.DataSource = masterlist;
            grdMasterEntries.DataBind();


        }

        public void BindDeliveryType()
        {
            DataTable dt = new DataTable();
            dt = enqBal.BindDeliveryType();
            drpDelivery.Items.Clear();
            drpDelivery.DataSource = dt;
            drpDelivery.DataTextField = "supptype";
            drpDelivery.DataValueField = "supptypeid";
            drpDelivery.DataBind();
            drpDelivery.Items.Insert(0, "Select");
            drpDelivery.SelectedIndex = 0;
        }

        public void BindProductCategory()
        {
            DataTable dt = new DataTable();
            dt = enqBal.BindProductCategory();
            drpProductCategory.Items.Clear();
            drpProductCategory.DataSource = dt;
            drpProductCategory.DataTextField = "CategoryName";
            drpProductCategory.DataValueField = "CategoryId";
            drpProductCategory.DataBind();
            drpProductCategory.Items.Insert(0, "Select");
            drpProductCategory.SelectedIndex = 0;
        }

        public void BindMedOfEnq()
        {
            DataTable dt = new DataTable();
            dt = enqBal.BindMedOfEnq();
            drpMedOfEnquiry.Items.Clear();
            drpMedOfEnquiry.DataSource = dt;
            drpMedOfEnquiry.DataTextField = "MedOfEnqName";
            drpMedOfEnquiry.DataValueField = "MedOfEnqID";
            drpMedOfEnquiry.DataBind();
            drpMedOfEnquiry.Items.Insert(0, "Select");
            drpMedOfEnquiry.SelectedIndex = 0;
        }

        public void BindUnit()
        {
            DataTable dt = new DataTable();
            dt = indBal.BindUnit(indModel);
            drpUnit.Items.Clear();
            drpUnit.DataSource = dt;
            drpUnit.DataTextField = "UnitName";
            drpUnit.DataValueField = "UnitId";
            drpUnit.DataBind();
            drpUnit.Items.Insert(0, "Select");
            drpUnit.SelectedIndex = 0;
        }

        public void BindAuthPerson()
        {
            DataTable dt = new DataTable();
            dt = indBal.BindEmployee(indModel);

            drpAuthPerName.Items.Clear();
            drpAuthPerName.DataSource = dt;
            drpAuthPerName.DataTextField = "EmpName";
            drpAuthPerName.DataValueField = "EmpCode";
            drpAuthPerName.DataBind();
            drpAuthPerName.Items.Insert(0, "Select");
            drpAuthPerName.SelectedIndex = 0;

            drpAuthPerCode.Items.Clear();
            drpAuthPerCode.DataSource = dt;
            drpAuthPerCode.DataTextField = "EmpCode";
            drpAuthPerCode.DataValueField = "EmpCode";
            drpAuthPerCode.DataBind();
            drpAuthPerCode.Items.Insert(0, "Select");
            drpAuthPerCode.SelectedIndex = 0;
        }

        public void BindCustomer()
        {
            DataTable dt = new DataTable();
            dt = enqBal.BindCustomer();
            drpCustomerName.Items.Clear();
            drpCustomerName.DataSource = dt;
            drpCustomerName.DataTextField = "CustName";
            drpCustomerName.DataValueField = "CustCode";
            drpCustomerName.DataBind();
            drpCustomerName.Items.Insert(0, "Select");
            drpCustomerName.SelectedIndex = 0;

            drpCustomerCode.Items.Clear();
            drpCustomerCode.DataSource = dt;
            drpCustomerCode.DataTextField = "CustCode";
            drpCustomerCode.DataValueField = "CustCode";
            drpCustomerCode.DataBind();
            drpCustomerCode.Items.Insert(0, "Select");
            drpCustomerCode.SelectedIndex = 0;
        }

        public void BindItemMaster()        
        {
            DataTable dt = new DataTable();
            dt = indBal.BindItemMaster(indModel);
            drpItemName.Items.Clear();
            drpItemName.DataSource = dt;
            drpItemName.DataTextField = "ItemDescription";
            drpItemName.DataValueField = "ItemCode";
            drpItemName.DataBind();
            drpItemName.Items.Insert(0, "Select");
            drpItemName.SelectedIndex = 0;

            drpItemCode.Items.Clear();
            drpItemCode.DataSource = dt;
            drpItemCode.DataTextField = "ItemCode";
            drpItemCode.DataValueField = "ItemCode";
            drpItemCode.DataBind();
            drpItemCode.Items.Insert(0, "Select");
            drpItemCode.SelectedIndex = 0;
        }

        public void BindEnquiryNumber()
        {
            DataTable dt = new DataTable();
            dt = enqBal.BindEnquiryNumber(enqModel);
            drpEnquiryNumber.Items.Clear();
            drpEnquiryNumber.DataSource = dt;
            drpEnquiryNumber.DataTextField = "EnquiryNumber";
            drpEnquiryNumber.DataValueField = "EnquiryId";
            drpEnquiryNumber.DataBind();
            drpEnquiryNumber.Items.Insert(0, "Select");
            drpEnquiryNumber.SelectedIndex = 0;
        }

        protected void BindCustDtls(string CustCode)
        {
            DataTable dt = new DataTable();
            dt = enqBal.BindCustDtls(CustCode);
            txtAddress.Enabled = false;
            txtContactPerson.Enabled = false;
            txtContactPerson.Text = dt.Rows[0]["ContactPerson"].ToString();
            txtAddress.Text = dt.Rows[0]["Address1"].ToString();

        }

        protected void BindItemsDataDtls(string ItemCode)
        {
            DataTable dt = new DataTable();
            dt = enqBal.BindItemsDataDtls(ItemCode);

            txtQuantity.Enabled = true;
           
            drpUnit.Enabled = false;
            //txtQuantity.Text = dt.Rows[0]["Quantity"].ToString();
            drpUnit.SelectedValue = dt.Rows[0]["UnitId"].ToString();
            
        }

     


        public void FindCurrentStock()
        {
            enqModel.ItemCode = drpItemCode.SelectedValue;
            enqModel.BranchId = Convert.ToInt32(Session["BranchId"]);
            DataTable dt = new DataTable();
            dt = indBal.FindCurrentStock(indModel);
            if (dt.Rows.Count > 0)
            {
                txtQuantity.Text = dt.Rows[0]["CurrentQty"].ToString();
            }
            else
            {
                txtQuantity.Text = "0";
            }
        }
  
        public void SetValues()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = (DataTable)ViewState["BindData"];
                DataTable dt1 = new DataTable();
               // dt1 = enqBal.GetAutoGenEnqNumber(enqModel);
                List<EnquiryMasterModel> lst = new List<EnquiryMasterModel>();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    EnquiryMasterModel model = new EnquiryMasterModel();
                  //model.EnquiryId = Convert.ToInt32(dt1.Rows[0]["EnquiryId"]) + 1;
                    model.NewItemCode = dt.Rows[i]["ID1"].ToString();
                    model.NewItemName = dt.Rows[i]["ID2"].ToString();
                    model.ItemCode = dt.Rows[i]["ID3"].ToString();
                    model.ItemName = dt.Rows[i]["ID4"].ToString();
                  //model.UnitId = Convert.ToInt32(dt.Rows[i]["ID7"]);
                    model.Quantity =Convert.ToDecimal( dt.Rows[i]["ID8"]);
                    model.IsNewItem = true ? true : false;
                   

                    lst.Add(model);
                }
                enqModel.AllData = lst;
                enqModel.IsNewCustomer = chkIsNewCustomer.Checked == true ? true : false;
                enqModel.EnquiryNumber = txtEnquiryNumber.Text;
                enqModel.EnquiryDate =  Convert.ToDateTime(txtEnquiryDate.Text);
                enqModel.EnqRefNumber = txtEnquiryRefNo.Text;
                enqModel.MedOfEnqId = Convert.ToInt32(drpMedOfEnquiry.SelectedValue);
                enqModel.NewCustName = txtCustomerName.Text;
                enqModel.NewCustCode = txtCustomerCode.Text;
                enqModel.CustomerCode = drpCustomerCode.SelectedValue;                
                enqModel.Address = txtAddress.Text;
                enqModel.ContactPerson = txtContactPerson.Text;
                enqModel.SuppTypeId = Convert.ToInt32(drpDelivery.SelectedValue);
                enqModel.CategoryId = Convert.ToInt32(drpProductCategory.SelectedValue);
                enqModel.Remark = txtRemark.Text;
                enqModel.QuotationNumber = txtQuatationNumber.Text;
                enqModel.QuotationDate = Convert.ToDateTime(txtQuatationDate.Text);
                enqModel.SampleStatus = txtSampleStatus.Text;
                enqModel.SampleRequiredDate = Convert.ToDateTime(txtSampleReqDate.Text);
                enqModel.SampleProductionDate = Convert.ToDateTime(txtSampleProdDate.Text);
                enqModel.SampleSubmissionQuantity = txtSampleSubQty.Text;
                enqModel.SampeSubmissionDate = Convert.ToDateTime(txtSampleSubDate.Text);
                enqModel.LoginUserId = Convert.ToInt32(Session["UserId"]);
                enqModel.BranchId = Convert.ToInt32(Session["BranchId"]);
                Console.WriteLine(enqModel);
            }
            catch(Exception Ex)
            { 

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            SetValues();
            string EnquiryNumber = "";
            int res = enqBal.InsertEnquiryMaster(enqModel, out EnquiryNumber);

            if (res > 0)
            {
                Response.Write("<script> alert('Record Saved Successfully...') </Script>");

                txtEnquiryNumber.Text = EnquiryNumber.ToString() ;
            }
            else
            {
                Response.Write("<script> alert('Error occured while performing the action') </Script>");
            }
        }

        protected DataTable CreateTable(int NoOfRows)
        {
            DataTable dt = new DataTable();
            for (int i = 1; i <= NoOfRows; i++)
            {
                string ID = "ID" + i;
                dt.Columns.Add(ID);
            }
            return dt;
        }

        public void BindItemsDtls(DataRow dt)
        {
            txtItemCode.Text = dt["ID1"].ToString();
            txtItemName.Text = dt["ID2"].ToString();
            drpItemCode.SelectedValue = dt["ID3"].ToString();
            drpItemName.SelectedValue = dt["ID4"].ToString();
            //drpUnit.SelectedValue = dt["ID7"].ToString();
            txtQuantity.Text = dt["ID8"].ToString();
        }

        protected void BindData()
        {
            DataTable dt = (DataTable)ViewState["BindData"];
            DataTable dt1 = CreateTable(10);
            dt1.Rows.Add();
            dt1.Rows[0]["ID1"] = txtItemCode.Text;
            dt1.Rows[0]["ID2"] = txtItemName.Text;
            dt1.Rows[0]["ID3"] = drpItemCode.SelectedValue;
            dt1.Rows[0]["ID4"] = drpItemName.SelectedValue;
            //dt1.Rows[0]["ID7"] = drpUnit.SelectedValue;
            dt1.Rows[0]["ID8"] = txtQuantity.Text;
            //dt1.Rows[0]["ID9"] = 

            foreach (GridViewRow row in grdEnquiryMaster.Rows)
            {
                CheckBox chk = row.Cells[0].Controls[0] as CheckBox;
                if (chk != null && chk.Checked)
                {
                    dt.Rows[0]["ID9"] = 1;
                }
                else
                {
                    dt.Rows[0]["ID9"] = 0;
                }
            }

            if (ViewState["BindData"] == null)
            {
                BindList(dt1);
 
            }
            else
            {
                dt1.Merge(dt);
                BindList(dt1);
            }
        }

        protected void BindList(DataTable dt)
        {
            ViewState["BindData"] = dt;
            grdEnquiryMaster.DataSource = dt;
            grdEnquiryMaster.DataBind();
            if (grdEnquiryMaster.Rows.Count == 0)
                ViewState["BindData"] = null;
        }

        protected void grdEnquiryMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                if (e.CommandName == "Remove")
                {
                    LinkButton TempLable = new LinkButton();
                    int index = Convert.ToInt32(e.CommandArgument);
                    dt = (DataTable)ViewState["BindData"];
                    dt.Rows.RemoveAt(index);
                    BindList(dt);
                }
                else if (e.CommandName == "RowEditing")
                {
                    LinkButton TempLable = new LinkButton();
                    int index = Convert.ToInt32(e.CommandArgument);
                    dt = (DataTable)ViewState["BindData"];
                    BindItemsDtls(dt.Rows[index]);
                    dt.Rows.RemoveAt(index);
                    BindList(dt);
                }
            }
            catch (Exception ex)
            {
 
            }
        }

        //public void UpdateEnquiryMaster()
        //{
        //    try
        //    {
        //        EnquiryMasterModel enqModel = new EnquiryMasterModel();
        //        List<EnquiryMasterModel> lst = new List<EnquiryMasterModel>();
        //        enqModel.EnquiryNumber = txtEnquiryNumber.Text;
        //        enqModel.EnquiryDate = Convert.ToDateTime(txtEnquiryDate.Text);
        //        enqModel.EnqRefNumber = txtEnquiryRefNo.Text;
        //        enqModel.MedOfEnqId = Convert.ToInt32(drpMedOfEnquiry.SelectedValue);
        //        enqModel.NewCustName = txtCustomerName.Text;
        //        enqModel.NewCustCode = txtCustomerCode.Text;                
        //        enqModel.Address = txtAddress.Text;
        //        enqModel.ContactPerson = txtContactPerson.Text;
        //        enqModel.SuppTypeId = Convert.ToInt32(drpDelivery.SelectedValue);
        //        enqModel.CategoryId = Convert.ToInt32(drpProductCategory.SelectedValue);
        //        enqModel.Remark = txtRemark.Text;
        //        enqModel.QuotationNumber = txtQuatationNumber.Text;
        //        enqModel.QuotationDate = Convert.ToDateTime(txtQuatationDate.Text);
        //        enqModel.SampleStatus = txtSampleStatus.Text;
        //        enqModel.SampleRequiredDate = Convert.ToDateTime(txtSampleReqDate.Text);
        //        enqModel.SampleProductionDate = Convert.ToDateTime(txtSampleProdDate.Text);
        //        enqModel.SampleSubmissionQuantity = txtSampleSubQty.Text;
        //        enqModel.SampeSubmissionDate = Convert.ToDateTime(txtSampleSubDate.Text);

        //        lst.Add(enqModel);
        //        enqModel.AllData = lst; 
        //    }
        //    catch (Exception ex)
        //    {
 
        //    }
        //}

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (grdEnquiryMaster.Rows.Count > 0)
            {
                SetValues();
                enqModel.EnquiryId = Convert.ToInt32(drpEnquiryNumber.SelectedValue);
                int res = enqBal.UpdateEnquiryMaster(enqModel);

                if (res > 0)
                {
                    Response.Write("<script> alert('Record updated Successfully...') </script>");
                }
                else
                {
                    Response.Write("<script> alert('Error occured while performing the action') </script>");
                }
            }
            else
            {
                Response.Write("<script> alert('Add button not hit') </Script>");
            }
        }

        protected void FillEnquiryNumber()
        {
            DataTable dt1 = new DataTable();
            dt1 = enqBal.FillEnquiryMaster(Convert.ToInt32(drpEnquiryNumber.SelectedValue));
            if (dt1.Rows.Count > 0)
            {
                txtEnquiryNumber.Text = dt1.Rows[0]["EnquiryNumber"].ToString();
                txtEnquiryDate.Text = dt1.Rows[0]["EnquiryDate"].ToString();
                txtEnquiryRefNo.Text = dt1.Rows[0]["EnqRefNumber"].ToString();
                drpMedOfEnquiry.SelectedValue = Convert.ToInt32(dt1.Rows[0]["MedOfEnqId"]).ToString();
                txtCustomerCode.Text = dt1.Rows[0]["NewCustCode"].ToString();
                txtCustomerName.Text = dt1.Rows[0]["NewCustName"].ToString();
                //drpCustomerCode.SelectedValue = dt1.Rows[0]["CustomerCode"].ToString();
                //drpCustomerName.SelectedValue = dt1.Rows[0]["CustomerName"].ToString();
                txtAddress.Text = dt1.Rows[0]["Address1"].ToString();
                txtContactPerson.Text = dt1.Rows[0]["ContactPerson"].ToString();
                drpDelivery.SelectedValue =Convert.ToInt32(dt1.Rows[0]["SuppTypeId"]).ToString();
                drpProductCategory.SelectedValue = Convert.ToInt32(dt1.Rows[0]["CategoryID"]).ToString();
                txtRemark.Text = dt1.Rows[0]["Remark"].ToString();
                txtQuatationNumber.Text = dt1.Rows[0]["QuotationNumber"].ToString();
                txtQuatationDate.Text = dt1.Rows[0]["QuotationDate"].ToString();
                txtSampleStatus.Text = dt1.Rows[0]["SampleStatus"].ToString();
                txtSampleReqDate.Text = dt1.Rows[0]["SampleRequiredDate"].ToString();
                txtSampleProdDate.Text = dt1.Rows[0]["SampleProductionDate"].ToString();
                txtSampleSubQty.Text = dt1.Rows[0]["SampleSubmissionQuantity"].ToString();
                txtSampleSubDate.Text = dt1.Rows[0]["SampeSubmissionDate"].ToString();

                DataTable dt = CreateTable(10);
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    dt.Rows.Add();
                    dt.Rows[i]["ID1"] = dt1.Rows[i]["NewItemCode"];
                    dt.Rows[i]["ID2"] = dt1.Rows[i]["NewItemName"];
                    dt.Rows[i]["ID3"] = dt1.Rows[i]["ItemCode"];
                    dt.Rows[i]["ID4"] = dt1.Rows[i]["ItemName"];
                    //dt.Rows[i]["ID7"] = dt1.Rows[i]["Unit"];
                    dt.Rows[i]["ID8"] = dt1.Rows[i]["Quantity"];
                }
                ViewState["BindData"] = dt;
                if (dt.Rows.Count > 0)
                {
                    grdEnquiryMaster.DataSource = dt;
                    grdEnquiryMaster.DataBind();
                }
            }
        }

        protected void grdEnquiryMaster_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillEnquiryNumber();
            btnUpdate.Enabled = true;
        }

        protected void drpEnquiryNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtEnquiryNumber.Text = string.Empty;
            txtEnquiryNumber.Enabled = false;
            btnUpdate.Enabled = true;
            btnSave.Enabled = false;
            FillEnquiryNumber();
        }

        public void ResetEnquiryMaster()
        {
            txtEnquiryNumber.Text = string.Empty;
            txtEnquiryDate.Text = string.Empty;
            txtEnquiryRefNo.Text = string.Empty;
            drpMedOfEnquiry.SelectedIndex = 0;
            txtCustomerName.Text = string.Empty;
            txtCustomerCode.Text = string.Empty;
            drpCustomerName.SelectedIndex = 0;
            txtAddress.Text = string.Empty;
            txtContactPerson.Text = string.Empty;
            drpDelivery.SelectedIndex = 0;
            drpProductCategory.SelectedIndex = 0;
            txtRemark.Text = string.Empty;
            txtQuatationNumber.Text = string.Empty;
            txtQuatationDate.Text = string.Empty;
            txtSampleStatus.Text = string.Empty;
            txtSampleReqDate.Text = string.Empty;
            txtSampleProdDate.Text = string.Empty;
            txtSampleSubDate.Text = string.Empty;
            txtSampleSubQty.Text = string.Empty;

            drpEnquiryNumber.SelectedIndex = 0;
            txtItemCode.Text = string.Empty;
            txtItemName.Text = string.Empty;
            drpItemCode.SelectedIndex = 0;
            drpItemName.SelectedIndex = 0;
            drpUnit.SelectedIndex = 0;
            txtQuantity.Text = string.Empty;
        }

        public void ResetEnquiryDetailMaster()
        {
            txtItemCode.Text = string.Empty;
            txtItemName.Text = string.Empty;
            drpItemCode.SelectedIndex = 0;
            drpItemName.SelectedIndex = 0;
            drpUnit.SelectedIndex = 0;
            txtQuantity.Text = string.Empty;
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            ResetEnquiryMaster();
            btnSave.Enabled = true;
            btnCancel.Enabled = true;
            btnNew.Enabled = true;
            btnUpdate.Enabled = false;
            btnDelete.Enabled = false;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ResetEnquiryMaster();
            btnCancel.Enabled = true;
            btnSave.Enabled = true;
            btnNew.Enabled = true;
            btnUpdate.Enabled = false;
            btnDelete.Enabled = false;
        }

        protected void chkIsNewCustomer_CheckedChanged(object sender, EventArgs e)
        {
            if (chkIsNewCustomer.Checked == true)
            {
                txtCustomerName.Visible = true;
                txtCustomerCode.Visible = true;
                drpCustomerName.Visible = false;
                drpCustomerCode.Visible = false;
                cmpdrpDownCustName.Enabled = false;
                cmpdrpDownCustCode.Enabled = false;
                txtAddress.Enabled = true;
                txtAddress.Text = string.Empty;
                txtContactPerson.Enabled = true;
                txtContactPerson.Text = string.Empty;
                drpCustomerCode.SelectedIndex = 0;
                drpCustomerName.SelectedIndex = 0;
            }
            else
            {
                txtCustomerName.Visible = false;
                txtCustomerCode.Visible = false;
                rqCustomerCode.Enabled = false;
                rqCustomerName.Enabled = false;
                txtCustomerCode.Text = string.Empty;
                txtCustomerName.Text = string.Empty;
                drpCustomerName.Visible = true;
                drpCustomerCode.Visible = true;               

            }
        }

        protected void IsNewItemCode_CheckedChanged(object sender, EventArgs e)
        {
            if (IsNewItemCode.Checked == true)
            {
                txtItemCode.Visible = true;                
                txtItemName.Visible = true;
                drpItemCode.Visible = false;
                drpItemName.Visible = false;
                drpItemCode.SelectedIndex = 0;
                drpItemName.SelectedIndex = 0;
                txtQuantity.Enabled = true;
                txtQuantity.Text = string.Empty;
                drpUnit.SelectedIndex = 0;
                drpUnit.Enabled = true;
                cmpItemCodeDropDown.Enabled = false;
                cmpItemNameDropDown.Enabled = false;

            }
            else
            {
                txtItemCode.Visible = false;
                rdqItemNameText.Enabled = false;
                rdqItemCodeText.Enabled = false;
                txtItemName.Visible = false;
                txtItemCode.Text = string.Empty;
                txtItemName.Text = string.Empty;
                drpItemCode.Visible = true;
                drpItemName.Visible = true;
                txtQuantity.Enabled = true;
                txtQuantity.Text = string.Empty;
             }
        }

        protected void drpCustomerName_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpCustomerCode.SelectedValue = drpCustomerName.SelectedValue;
            BindCustDtls(drpCustomerName.SelectedValue);
            
        }

        protected void drpCustomerCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpCustomerName.SelectedValue = drpCustomerCode.SelectedValue;
            BindCustDtls(drpCustomerCode.SelectedValue);
           
        }

        protected void drpItemName_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpItemCode.SelectedValue = drpItemName.SelectedValue;
            BindItemsDataDtls(drpItemName.SelectedValue);
        }

        protected void drpItemCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpItemName.SelectedValue = drpItemCode.SelectedValue;
            BindItemsDataDtls(drpItemCode.SelectedValue);
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            BindData();
            ResetEnquiryDetailMaster();
            txtQuantity.Text = string.Empty;
            drpItemCode.SelectedIndex = 0;
            drpItemName.SelectedIndex = 0;
            cmpdrpDownCustCode.Enabled = false;
            cmpdrpDownCustName.Enabled = false;
        }

        protected void drpAuthPerName_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpAuthPerCode.SelectedValue = drpAuthPerName.SelectedValue;
        }

        protected void drpAuthPerCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpAuthPerName.SelectedValue = drpAuthPerCode.SelectedValue;
        }

        //protected void grdMasterEntries_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    List<EnquiryMasterModel> lst = new List<EnquiryMasterModel>();
        //    if(e.CommandName=="Check")
        //    { 
        //        RadioButton selectButton = (RadioButton)sender;
        //        int index = Convert.ToInt32(e.CommandArgument);
        //        lst = (List<EnquiryMasterModel>)ViewState["EnquiryGridData"];
        //        //lst.Take(index);
        //        foreach (GridViewRow row in grdMasterEntries.Rows)
        //        {
        //            if (selectButton.Checked)
        //            {
        //                if (row.RowIndex != index)
        //                {
        //                    RadioButton rd = row.FindControl("rdbEnquiryMaster") as RadioButton;
        //                    rd.Checked = false;
        //                }
        //            }
        //        }
        //        var DetailEntries = lst.Select(o => new { o.EnqDetailId, o.IsNewItem, o.ItemCode, o.NewItemCode, o.NewItemName, o.ItemName, o.Quantity, o.UnitId, o.ItemId });

        //        grdDetailMasterEntries.DataSource = DetailEntries;
        //        grdDetailMasterEntries.DataBind();
        //    }


        //}

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
           List<EnquiryMasterModel> lst = new List<EnquiryMasterModel>();

         //   lst = enqBal.GetAllEnquiryData();
          lst = (List<EnquiryMasterModel>)ViewState["EnquiryGridData"];

          var res = (from c in lst
                    where
                    c.EnquiryNumber.Contains(txtSearch.Text) ||
                    c.CustomerName.Contains(txtSearch.Text) ||
                    c.EnquiryId.ToString().Contains(txtSearch.Text)||
                    c.EnquiryDate.ToString().Contains(txtSearch.Text) ||
                    c.EnqRefNumber.Contains(txtSearch.Text) || 
                    c.IsNewCustomer.ToString().Contains(txtSearch.Text) || 
                    c.NewItemCode.Contains(txtSearch.Text) ||
                    c.NewCustName.Contains(txtSearch.Text) ||
                    c.Address.Contains(txtSearch.Text) ||
                    c.ContactPerson.Contains(txtSearch.Text) ||
                    c.SystemEntryDate.ToString().Contains(txtSearch.Text)||
                    c.Remark.Contains(txtSearch.Text) || 
                    c.QuotationNumber.Contains(txtSearch.Text) ||
                    c.QuotationDate.ToString().Contains(txtSearch.Text) ||
                    c.SampleStatus.Contains(txtSearch.Text) ||
                    c.SampleRequiredDate.ToString().Contains(txtSearch.Text) ||
                    c.SampleProductionDate.ToString().Contains(txtSearch.Text) ||
                    c.CustomerCode.Contains(txtSearch.Text) ||
                    c.MedOfEnqId.ToString().Contains(txtSearch.Text)
                    select new { 
                        c.EnquiryNumber,
                        c.CustomerName, 
                        c.EnquiryId, 
                        c.EnquiryDate,
                        c.EnqRefNumber,
                        c.IsNewCustomer,
                        c.NewCustCode,
                        c.NewCustName,
                        c.Address,
                        c.ContactPerson,
                        c.SystemEntryDate,
                        c.Remark,
                        c.QuotationNumber,
                        c.QuotationDate,
                        c.SampleStatus,
                        c.SampleRequiredDate,
                        c.SampleProductionDate,
                        c.SampleSubmissionQuantity,
                        c.SampeSubmissionDate,
                        c.CustomerCode,
                        c.MedOfEnqId
                     

                    }).Distinct().ToList();

          grdMasterEntries.DataSource = res;
          grdMasterEntries.DataBind();
        }

        protected void rdbEnquiryMaster_OnCheckedChanged(object sender, EventArgs e)
        {
            List<EnquiryMasterModel> lst = new List<EnquiryMasterModel>();
            RadioButton selectButton = (RadioButton)sender;
            GridViewRow row = (GridViewRow)selectButton.Parent.Parent;

            int EnquiryId = Convert.ToInt32(row.Cells[1].Text);

            int index = row.RowIndex; 
            lst = (List<EnquiryMasterModel>)ViewState["EnquiryGridData"];
           
            var DetailEntries = lst.Select(o => new { o.EnqDetailId, o.EnquiryId, o.IsNewItem, o.ItemCode, o.NewItemCode, o.NewItemName, o.ItemName, o.Quantity, o.ItemId, o.SystemEntryDate }).Where(o=> o.EnquiryId==EnquiryId);

            grdDetailMasterEntries.DataSource = DetailEntries;
            grdDetailMasterEntries.DataBind();

        }
    }
}

