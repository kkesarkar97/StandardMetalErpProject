using BAL;
using Modal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NavnathWebsite.Marketing
{
    

    public partial class QuotationMaster : System.Web.UI.Page
    {
        QuotationMasterBAL bal = new QuotationMasterBAL();
        QuotationMasterModel model = new QuotationMasterModel();
        QuotationDetailsModel dmodel = new QuotationDetailsModel();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindCustomerName();
                BindCustomerCode();
                //BindCustomer();
                BindUnitDrpDown();
                BindItemNameDrpDown();
                BindItemCodeDrpDown();
                //BindItemMaster();
                Marketing_BindEnquiryMasterNo();
                BindSymbolDrpdown();
                BindPaymentDrpdown();
                BindMarketingModeOfDrpdown();
                BindToolMasterCode();
                BindToolMasterName();
                BindStatusDrpdown();
                BindFreightMaster();
                BindValidityType();
                BindPackingType();
                BindDrawingBack();
                BindDeliveryTerm();
                BindApprovedByEmpCode();
                BindApprovedByEmpName();
                BindPreparedByEmpCode();
                BindPreparedByEmpName();
                BindReviewedByEmpCode();
                BindReviewedByEmpName();
                BindQuotationNumber();
                
                //Enquiry Section 
                txtRevisionNo.Visible = true;
                txtQuotationNumber.Visible = true;
                txtQuotationDate.Visible = true;
                drpWithEnquiry.Visible = false;

                //Customer Section
                txtCustomerName.Visible = false;
                txtCustomerCode.Visible = false;
                rqCustomerCode.Enabled = false;
                rqCustomerName.Enabled = false;
                txtCustomerCode.Text = string.Empty;
                txtCustName.Text = string.Empty;
                drpCustomerName.Visible = true;
                drpCustomerCode.Visible = true;

            }



        }
        
        public void IsCheckEnquiryDetail()
        {
            bool WithEnquiry= chkWithEnquiry.Checked == true ? true : false;

            if(WithEnquiry==true)
            {
                txtRevisionNo.Visible = true;
                txtQuotationNumber.Visible = true;
                txtQuotationDate.Visible = true;
                drpWithEnquiry.Visible = true;

            }
            else
            {
                txtRevisionNo.Visible = true;
                txtQuotationNumber.Visible = true;
                txtQuotationDate.Visible = true;
                drpWithEnquiry.Visible = false;
            }
        }


        public void IScheckCustomerDetail()
        {
            bool NewCustomer= chkNewCustomer.Checked == true ? true : false;
            if (NewCustomer == true)
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
                txtCustName.Text = string.Empty;
                drpCustomerName.Visible = true;
                drpCustomerCode.Visible = true;
            }
        }
        public void radomItemCodeName()
        {
            if (rdbtnItemWise.Checked)
            {
                BindItemNameDrpDown();
            }
            else if (rdbtnSetWise.Checked)
            {
                BindItemNameDrpDown();
            }
        }

        public void Marketing_BindEnquiryMasterNo()
        {
            DataTable dt = new DataTable();
            dt = bal.Marketing_BindEnquiryMasterNo();
            drpWithEnquiry.Items.Clear();
            drpWithEnquiry.DataSource = dt;
            drpWithEnquiry.DataTextField = "EnquiryNumber";
            drpWithEnquiry.DataValueField = "EnquiryId";
            drpWithEnquiry.DataBind();
            drpWithEnquiry.Items.Insert(0, "---Select---");
            drpWithEnquiry.SelectedIndex = 0;
        }

        public void BindItemNameDrpDown()
        {
            DataTable dt = new DataTable();
            dt = bal.BindItemNameDrpDown();
            drpItemName.Items.Clear();
            drpItemName.DataSource = dt;
            drpItemName.DataTextField = "ItemName";
            drpItemName.DataValueField = "ID";
            drpItemName.DataBind();
            drpItemName.Items.Insert(0, "---Select---");
            drpItemName.SelectedIndex = 0;

        }

        public void BindItemCodeDrpDown()
        {
            DataTable dt = new DataTable();
            dt = bal.BindItemCodeDrpDown();
            drpItemCode.Items.Clear();
            drpItemCode.DataSource = dt;
            drpItemCode.DataTextField = "ItemCode";
            drpItemCode.DataValueField = "ID";
            drpItemCode.DataBind();
            drpItemCode.Items.Insert(0, "---Select---");
            drpItemCode.SelectedIndex = 0;

        }

        public void BindItemMaster()
        {
            DataTable dt = new DataTable();
            dt = bal.BindItemMaster();
            drpItemName.Items.Clear();
            drpItemName.DataSource = dt;
            drpItemName.DataTextField = "ItemName";
            drpItemName.DataValueField = "ItemCode";
            drpItemName.DataBind();
            drpItemName.Items.Insert(0, "---Select---");
            drpItemName.SelectedIndex = 0;

            drpItemCode.Items.Clear();
            drpItemCode.DataSource = dt;
            drpItemCode.DataTextField = "ItemCode";
            drpItemCode.DataValueField = "ItemCode";
            drpItemCode.DataBind();
            drpItemCode.Items.Insert(0, "---Select---");
            drpItemCode.SelectedIndex = 0;
        }

        public void BindCustomer()
        {
            DataTable dt = new DataTable();
            dt = bal.BindCustomer();
            drpCustomerName.Items.Clear();
            drpCustomerName.DataSource = dt;
            drpCustomerName.DataTextField = "CustName";
            drpCustomerName.DataValueField = "CustCode";
            drpCustomerName.DataBind();
            drpCustomerName.Items.Insert(0, "---Select---");
            drpCustomerName.SelectedIndex = 0;

            drpCustomerCode.Items.Clear();
            drpCustomerCode.DataSource = dt;
            drpCustomerCode.DataTextField = "CustCode";
            drpCustomerCode.DataValueField = "CustCode";
            drpCustomerCode.DataBind();
            drpCustomerCode.Items.Insert(0, "---Select---");
            drpCustomerCode.SelectedIndex = 0;
        }

        public void BindCustomerName()
        {
            //BindCustomerCode();

            DataTable dt = new DataTable();
            dt = bal.BindCustomerName();
            drpCustomerName.Items.Clear();
            drpCustomerName.DataSource = dt;
            drpCustomerName.DataTextField = "CustName";
            drpCustomerName.DataValueField = "Id";
            drpCustomerName.DataBind();
            drpCustomerName.Items.Insert(0, "---Select---");
            drpCustomerName.SelectedIndex = 0;

        }

        public void BindCustomerCode()
        {
            DataTable dt = new DataTable();
            dt = bal.BindCustomerCode();
            drpCustomerCode.Items.Clear();
            drpCustomerCode.DataSource = dt;
            drpCustomerCode.DataTextField = "CustCode";
            drpCustomerCode.DataValueField = "Id";
            drpCustomerCode.DataBind();
            drpCustomerCode.Items.Insert(0, "---Select---");
            drpCustomerCode.SelectedIndex = 0;
        }

        public void BindUnitDrpDown()
        {
            DataTable dt = new DataTable();
            dt = bal.BindUnitDrpDown();
            drpUOM.Items.Clear();
            drpUOM.DataSource = dt;
            drpUOM.DataTextField = "UnitName";
            drpUOM.DataValueField = "UnitId";
            drpUOM.DataBind();
            drpUOM.Items.Insert(0, "---Select---");
            drpUOM.SelectedIndex = 0;

        }

        public void BindSymbolDrpdown()
        {
            DataTable dt = new DataTable();
            dt = bal.BindSymbolDrpdown();
            drpRate.Items.Clear();
            drpRate.DataSource = dt;
            drpRate.DataTextField = "SymbolCharacter";
            drpRate.DataValueField = "SymbolId";
            drpRate.DataBind();
            drpRate.Items.Insert(0, "---Select---");
            drpRate.SelectedIndex = 0;
        }

        public void BindStatusDrpdown()
        {
            DataTable dt = new DataTable();
            dt = bal.BindStatusDrpdown();
            drpStatus.Items.Clear();
            drpStatus.DataSource = dt;
            drpStatus.DataTextField = "Status";
            drpStatus.DataValueField = "StatusId";
            drpStatus.DataBind();
            drpStatus.Items.Insert(0, "---Select---");
            drpStatus.SelectedIndex = 0;
        }

        public void BindPaymentDrpdown()
        {
            DataTable dt = new DataTable();
            dt = bal.BindPaymentDrpdown();
            drpPayment.Items.Clear();
            drpPayment.DataSource = dt;
            drpPayment.DataTextField = "PaymentType";
            drpPayment.DataValueField = "PaymentTypeId";
            drpPayment.DataBind();
            drpPayment.Items.Insert(0,"---Select---");
            drpPayment.SelectedIndex = 0;
        }

        public void BindMarketingModeOfDrpdown()
        {
            DataTable dt = new DataTable();
            dt = bal.BindMarketingModeOfDrpdown();
            drpModeOfDispatch.Items.Clear();
            drpModeOfDispatch.DataSource = dt;
            drpModeOfDispatch.DataTextField = "ModeOfTransport";
            drpModeOfDispatch.DataValueField = "TransportId";
            drpModeOfDispatch.DataBind();
            drpModeOfDispatch.Items.Insert(0, "---Select---");
            drpModeOfDispatch.SelectedIndex = 0;
        }
        
        public void BindToolMasterCode()
        {
            DataTable dt = new DataTable();
            dt = bal.BindToolMasterCode();
            drpToolCode.Items.Clear();
            drpToolCode.DataSource = dt;
            drpToolCode.DataTextField = "ToolMouldCode";
            drpToolCode.DataValueField = "ToolMouldId";
            drpToolCode.DataBind();
            drpToolCode.Items.Insert(0, "---Select---");
            drpToolCode.SelectedIndex = 0;
        }

        public void BindToolMasterName()
        {
            DataTable dt = new DataTable();
            dt = bal.BindToolMasterName();
            drpToolName.Items.Clear();
            drpToolName.DataSource = dt;
            drpToolName.DataTextField = "ToolmouldName";
            drpToolName.DataValueField = "ToolMouldId";
            drpToolName.DataBind();
            drpToolName.Items.Insert(0, "---Select---");
            drpToolName.SelectedIndex = 0;
        }

        public void BindFreightMaster()
        {
            DataTable dt = new DataTable();
            dt = bal.BindFreightMaster();
            drpFrieght.Items.Clear();
            drpFrieght.DataSource = dt;
            drpFrieght.DataTextField = "FreightType";
            drpFrieght.DataValueField = "FreightId";
            drpFrieght.DataBind();
            drpFrieght.Items.Insert(0, "---Select---");
            drpFrieght.SelectedIndex = 0;
        }

        public void BindValidityType()
        {
            DataTable dt = new DataTable();
            dt = bal.BindValidityType();
            drpValidity.Items.Clear();
            drpValidity.DataSource = dt;
            drpValidity.DataTextField = "PlanType";
            drpValidity.DataValueField = "PlanTypeId";
            drpValidity.DataBind();
            drpValidity.Items.Insert(0, "---Select---");
            drpValidity.SelectedIndex = 0;
        }

        public void BindPackingType()
        {
            DataTable dt = new DataTable();
            dt = bal.BindPackingType();
            drpPacking.Items.Clear();
            drpPacking.DataSource = dt;
            drpPacking.DataTextField = "PackingType";
            drpPacking.DataValueField = "PackingId";
            drpPacking.DataBind();
            drpPacking.Items.Insert(0, "---Select---");
            drpPacking.SelectedIndex = 0;
        }

        public void BindDrawingBack()
        {
            DataTable dt = new DataTable();
            dt = bal.BindDrawingBack();
            drpDrawing.Items.Clear();
            drpDrawing.DataSource = dt;
            drpDrawing.DataTextField = "DrawingRefund";
            drpDrawing.DataValueField = "DrawingId";
            drpDrawing.DataBind();
            drpDrawing.Items.Insert(0, "---Select---");
            drpDrawing.SelectedIndex = 0;
        }

        public void BindDeliveryTerm()
        {
            DataTable dt = new DataTable();
            dt = bal.BindDeliveryTerm();
            drpDeliveryTerm.Items.Clear();
            drpDeliveryTerm.DataSource = dt;
            drpDeliveryTerm.DataTextField = "DeliveryTermType";
            drpDeliveryTerm.DataValueField = "DeliveryTermId";
            drpDeliveryTerm.DataBind();
            drpDeliveryTerm.Items.Insert(0, "---Select---");
            drpDeliveryTerm.SelectedIndex = 0;
        }

        public void BindApprovedByEmpCode()
        {
            DataTable dt = new DataTable();
            dt = bal.BindApprovedByEmpCode();
            drpApprovedByEmpCode.Items.Clear();
            drpApprovedByEmpCode.DataSource = dt;
            drpApprovedByEmpCode.DataTextField = "EmpCode";
            drpApprovedByEmpCode.DataValueField = "ESrNo";
            drpApprovedByEmpCode.DataBind();
            drpApprovedByEmpCode.Items.Insert(0, "---Select---");
            drpApprovedByEmpCode.SelectedIndex = 0;

        }

        public void BindApprovedByEmpName()
        {
            DataTable dt = new DataTable();
            dt = bal.BindApprovedByEmpName();
            drpApprovedByEmpName.Items.Clear();
            drpApprovedByEmpName.DataSource = dt;
            drpApprovedByEmpName.DataTextField = "FristName";
            drpApprovedByEmpName.DataValueField = "ESrNo";
            drpApprovedByEmpName.DataBind();
            drpApprovedByEmpName.Items.Insert(0, "---Select---");
            drpApprovedByEmpName.SelectedIndex = 0;

        }

        public void BindPreparedByEmpCode()
        {
            DataTable dt = new DataTable();
            dt = bal.BindApprovedByEmpCode();
            drpPreparedByEmpCode.Items.Clear();
            drpPreparedByEmpCode.DataSource = dt;
            drpPreparedByEmpCode.DataTextField = "EmpCode";
            drpPreparedByEmpCode.DataValueField = "ESrNo";
            drpPreparedByEmpCode.DataBind();
            drpPreparedByEmpCode.Items.Insert(0, "---Select---");
            drpPreparedByEmpCode.SelectedIndex = 0;
        }

        public void BindPreparedByEmpName()
        {
            DataTable dt = new DataTable();
            dt = bal.BindApprovedByEmpName();
            drpPreparedByEmpName.Items.Clear();
            drpPreparedByEmpName.DataSource = dt;
            drpPreparedByEmpName.DataTextField = "FristName";
            drpPreparedByEmpName.DataValueField = "ESrNo";
            drpPreparedByEmpName.DataBind();
            drpPreparedByEmpName.Items.Insert(0, "---Select---");
            drpPreparedByEmpName.SelectedIndex = 0;
        }

        public void BindReviewedByEmpCode()
        {
            DataTable dt = new DataTable();
            dt = bal.BindApprovedByEmpCode();
            drpReviewedByEmpCode.Items.Clear();
            drpReviewedByEmpCode.DataSource = dt;
            drpReviewedByEmpCode.DataTextField = "EmpCode";
            drpReviewedByEmpCode.DataValueField = "ESrNo";
            drpReviewedByEmpCode.DataBind();
            drpReviewedByEmpCode.Items.Insert(0, "---Select---");
            drpReviewedByEmpCode.SelectedIndex = 0;
        }

        public void BindReviewedByEmpName()
        {
            DataTable dt = new DataTable();
            dt = bal.BindApprovedByEmpName();
            drpReviewedByEmpName.Items.Clear();
            drpReviewedByEmpName.DataSource = dt;
            drpReviewedByEmpName.DataTextField = "FristName";
            drpReviewedByEmpName.DataValueField = "ESrNo";
            drpReviewedByEmpName.DataBind();
            drpReviewedByEmpName.Items.Insert(0, "---Select---");
            drpReviewedByEmpName.SelectedIndex = 0;
        }


        public void SaveQuotationData()
        {
            //model.QuotationId;
            model.WithEnquiry = chkWithEnquiry.Checked == true  ? true : false;
            if(model.WithEnquiry)
            {
                model.EnquiryId = Convert.ToInt32(drpWithEnquiry.SelectedValue);
                model.RevisionNumber = txtRevisionNo.Text;
                model.QuotationNumber = txtQuotationNumber.Text;
                model.QuotationDate = Convert.ToDateTime(txtQuotationDate.Text);
            }
            else
            {
                model.EnquiryId = 0;
                model.RevisionNumber = txtRevisionNo.Text;
                model.QuotationNumber = txtQuotationNumber.Text;
                model.QuotationDate = Convert.ToDateTime(txtQuotationDate.Text);

            }


            model.IsNewCustomer = chkNewCustomer.Checked == true ? true : false;
            if (model.IsNewCustomer)
            {
                model.NewCustomerName = txtCustomerName.Text;
                model.NewCustomerCode = txtCustomerCode.Text;
            }
            else
            {
                model.NewCustomerName = txtCustomerName.Text;
                model.NewCustomerCode = txtCustomerCode.Text;
            }
            model.CustomerId = Convert.ToInt32(drpCustomerName.SelectedValue);
            //model.CustomerName = drpCustomerName.SelectedValue;
            //model.CustomerCode = drpCustomerCode.SelectedValue; 
            model.ContactPerson = txtContactPerson.Text;
            model.Address = txtAddress.Text;
            model.Quantity = Convert.ToInt32(txtQuantity.Text);
            model.Rate = Convert.ToInt32(txtRate.Text);
            model.SymbolId = Convert.ToInt32(drpRate.SelectedValue);
            model.LoginUserId = Convert.ToInt32(Session["UserId"]);
            model.BranchId = Convert.ToInt32(Session["BranchId"]);
            model.SystemEntryDate = System.DateTime.Now;
            Console.WriteLine(model);
            SaveQuotationDetails();
            


        }

        public void SaveQuotationDetails()
        {
            dmodel.ID = Convert.ToInt32(drpItemName.SelectedValue);
            dmodel.ToolMouldId = Convert.ToInt32(drpToolName.SelectedValue);
            dmodel.DeliveryLeadTime = Convert.ToDateTime(txtDeliveryLeadTime.Text);
            dmodel.PackingCost = Convert.ToDecimal(txtPackingCost.Text);
            dmodel.DevelopmentToolCost = Convert.ToDecimal(txtDevelopmentToolCost.Text);            
            dmodel.MouldCost = Convert.ToDecimal(txtMouldCost.Text);
            dmodel.MouldCavity = Convert.ToInt32(txtMouldCavity.Text);
            dmodel.OtherCost = Convert.ToDecimal(txtOtherCost.Text);
            dmodel.OtherCostRemark = txtOtherCostRemark.Text;
            //dmodel.QuotationDetailsId;

            //dmodel.ItemCode = drpItemCode.SelectedValue.ToString();
            //dmodel.ItemName = (drpItemName.SelectedItem.Text).ToString();
            //dmodel.ToolMouldCode = drpToolCode.SelectedValue;
            
            
            
            dmodel.Material = txtMaterial.Text;
            dmodel.UnitId = Convert.ToInt32(drpUOM.SelectedValue);
            dmodel.Ecess = txtEcess.Text;
            dmodel.ServiceTax = Convert.ToDecimal(txtServiceTax.Text);
            dmodel.Excise = txtExcise.Text;
            dmodel.SalesTax = Convert.ToDecimal(txtSaleTax.Text);
            dmodel.PaymentTypeId = Convert.ToInt32(drpPayment.SelectedValue);
            dmodel.TransportId = Convert.ToInt32(drpModeOfDispatch.SelectedValue);
            dmodel.FreightId = Convert.ToInt32(drpFrieght.SelectedValue);
            dmodel.PlanTypeId = Convert.ToInt32(drpValidity.SelectedValue);
            dmodel.PackingId = Convert.ToInt32(drpPacking.SelectedValue);
            dmodel.StatusId = Convert.ToInt32(drpStatus.SelectedValue);
            dmodel.AgainstFormNo = txtAgainstFormNo.Text;
            dmodel.Remark = txtRemark.Text;
            dmodel.DrawingId = Convert.ToInt32(drpDrawing.SelectedValue);
            dmodel.SampleRequired = txtSampleRequired.Text;
            dmodel.DeliveryTermId = Convert.ToInt32(drpDeliveryTerm.SelectedValue);
            dmodel.DocumentRequired = txtDocumentRequired.Text;
            dmodel.Advance =Convert.ToDecimal(txtAdvance.Text);
            dmodel.PreparedByEmpNameId = Convert.ToInt32(drpPreparedByEmpName.SelectedValue);
            dmodel.ApprovedByEmpNameId = Convert.ToInt32(drpApprovedByEmpName.SelectedValue);
            dmodel.ReviewedByEmpNameId = Convert.ToInt32(drpReviewedByEmpName.SelectedValue);

            dmodel.ItemSubject = txtItemSubject.Text;
            dmodel.ItemTerms = txtItemTerms.Text;
            dmodel.ToolSubject = txtToolSubject.Text;
            dmodel.ToolTerms = txtToolTerms.Text;

            dmodel.QuotationId = model.QuotationId;



/*             tmodel.PreparedByEmpCode = Convert.ToInt32(drpPreparedByEmpCode.SelectedValue);
             tmodel.ApprovedByEmpCode = Convert.ToInt32(drpApprovedByEmpCode.SelectedValue);
             tmodel.ReviewedByEmpCode = Convert.ToInt32(drpReviewedByEmpCode.SelectedValue);
             tmodel.PreparedByEmpName = Convert.ToInt32(drpPreparedByEmpCode.SelectedValue);
             tmodel.ApprovedByEmpName = Convert.ToInt32(drpApprovedByEmpCode.SelectedValue);
             tmodel.ReviewedByEmpName = Convert.ToInt32(drpReviewedByEmpName.SelectedValue);
             */
            Console.WriteLine(dmodel);
        }
        

        

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SaveQuotationData();
                string QuotationNumber = "";
                int res = bal.SaveQuotationData(model,out QuotationNumber);
                int res1 = bal.SaveQuotationDetails(dmodel,model);
                //dmodel.QuotationNumber = QuotationNumber;
                //dmodel.QuotationId = model.QuotationId;
                if (res > 0 && res1 > 0)
                {
                    Lbl1.Text = "Record Saved Successfully";
                }
                else
                {
                    Lbl1.Text = "Record Not Saved Successfully";
                }
                
              }
            catch(Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        public void ResetAllData()
        {
            drpWithEnquiry.SelectedIndex = 0;
            txtRevisionNo.Text = string.Empty;
            txtQuotationNumber.Text = string.Empty;
            txtQuotationDate.Text = string.Empty;
            drpCustomerCode.SelectedIndex = 0;
            drpCustomerName.SelectedIndex = 0;
            txtCustomerName.Text = string.Empty;
            txtCustomerCode.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtContactPerson.Text = string.Empty;
            drpItemCode.SelectedIndex = 0;
            drpItemName.SelectedIndex = 0;
            drpToolCode.SelectedIndex = 0;
            drpToolName.SelectedIndex = 0;
            txtDeliveryLeadTime.Text=string.Empty;
            
            txtPackingCost.Text = string.Empty;
            txtDevelopmentToolCost.Text = string.Empty;
            txtMouldCost.Text = string.Empty;
            txtMouldCavity.Text = string.Empty;
            txtOtherCost.Text = string.Empty;
            txtOtherCostRemark.Text = string.Empty;
            txtMaterial.Text = string.Empty;
            drpUOM.SelectedIndex = 0;
            txtQuantity.Text = string.Empty;
            txtRate.Text = string.Empty;
            drpRate.SelectedIndex = 0;
            txtEcess.Text = string.Empty;
            txtServiceTax.Text = string.Empty;
            txtExcise.Text = string.Empty;
            txtServiceTax.Text = string.Empty;
            drpPayment.SelectedIndex = 0;
            drpModeOfDispatch.SelectedIndex = 0;
            drpFrieght.SelectedIndex = 0;
            drpValidity.SelectedIndex = 0;
            drpPacking.SelectedIndex = 0;
            drpStatus.SelectedIndex = 0;
            txtAgainstFormNo.Text = string.Empty;
            txtRemark.Text = string.Empty;
            drpDrawing.SelectedIndex = 0;
            txtSampleRequired.Text = string.Empty;
            drpDeliveryTerm.SelectedIndex = 0;
            txtDocumentRequired.Text = string.Empty;
            txtAdvance.Text = string.Empty;
            drpPreparedByEmpCode.SelectedIndex = 0;
            drpPreparedByEmpName.SelectedIndex = 0;
            drpApprovedByEmpCode.SelectedIndex = 0;
            drpApprovedByEmpName.SelectedIndex = 0;
            drpReviewedByEmpCode.SelectedIndex = 0;
            drpReviewedByEmpName.SelectedIndex = 0;
            txtItemSubject.Text = string.Empty;
            txtItemTerms.Text = string.Empty;
            txtToolSubject.Text = string.Empty;
            txtToolTerms.Text = string.Empty;
           
        }


        protected void btnAddRate_Click(object sender, EventArgs e)
        {
            BindQuantData();
         //   BindList();
        }

        protected void BindCustDtls(int id)
        {
            DataTable dt = new DataTable();
            dt = bal.BindCustDtls(id);
            txtAddress.Enabled = true;
            txtContactPerson.Enabled = true;
            if (dt.Rows.Count > 0)
            {
                txtContactPerson.Text = dt.Rows[0]["ContactPerson"].ToString();
                txtAddress.Text = dt.Rows[0]["Address1"].ToString();
            }
        }

 
        protected void drpCustomerName_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpCustomerCode.SelectedValue = drpCustomerName.SelectedValue;
            int id = Convert.ToInt32(drpCustomerCode.SelectedValue);
            BindCustDtls(id);
        }

        protected void rdbtnItemWise_CheckedChanged(object sender, EventArgs e)
        {
            radomItemCodeName();
        }

        protected void chkNewCustomer_CheckedChanged(object sender, EventArgs e)
        {
            IScheckCustomerDetail();
        }

        protected void drpCustomerCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpCustomerName.SelectedValue = drpCustomerCode.SelectedValue;
            int id = Convert.ToInt32(drpCustomerCode.SelectedValue);
            BindCustDtls(id);
        }

        //Bind All Data
        
        protected void btnAddQuotationDetails_Click(object sender, EventArgs e)
        {
            BindAllData();    
        }
        
        public void BindAllData()
        {
            DataTable dt = (DataTable)ViewState["Data"];
            DataTable dt1 = CreateTable(14);
            dt1.Rows.Add();
            dt1.Rows[0]["ID1"] = drpItemCode.SelectedValue;
            dt1.Rows[0]["ID2"] = drpItemName.SelectedValue;
            dt1.Rows[0]["ID3"] = txtDeliveryLeadTime.Text;
            dt1.Rows[0]["ID4"] = txtPackingCost.Text;
            dt1.Rows[0]["ID5"] = txtDevelopmentToolCost.Text;
            dt1.Rows[0]["ID6"] = txtMouldCost.Text;
            dt1.Rows[0]["ID7"] = txtMouldCavity.Text;
            dt1.Rows[0]["ID8"] = txtOtherCost.Text;
            dt1.Rows[0]["ID9"] = txtOtherCostRemark.Text;
            dt1.Rows[0]["ID10"] = txtMaterial.Text;
            dt1.Rows[0]["ID11"] = drpUOM.SelectedValue;
            dt1.Rows[0]["ID12"] = txtQuantity.Text;
            dt1.Rows[0]["ID13"] = txtRate.Text;
            dt1.Rows[0]["ID14"] = drpRate.SelectedValue;
            if (ViewState["Data"] == null)
            {
                BindAllList(dt1);
            }
            else
            {
                dt1.Merge(dt);
                BindAllList(dt1);
            }
        }

        protected void BindAllList(DataTable dt)
        {
            ViewState["Data"] = dt;
            grdSupplierPO.DataSource = dt;
            grdSupplierPO.DataBind();
            if (grdSupplierPO.Rows.Count == 0)
                ViewState["Data"] = null;
        }

        public void BindAllData(DataRow dr)
        {
            drpItemCode.SelectedValue = dr["ID1"].ToString();
            drpItemName.SelectedValue = dr["ID2"].ToString();
            txtDeliveryLeadTime.Text = dr["ID3"].ToString();
            txtPackingCost.Text = dr["ID4"].ToString();
            txtDevelopmentToolCost.Text = dr["ID5"].ToString();
            txtMouldCost.Text = dr["ID6"].ToString();
            txtMouldCavity.Text = dr["ID7"].ToString();
            txtOtherCost.Text = dr["ID8"].ToString();
            txtOtherCostRemark.Text = dr["ID9"].ToString();
            txtMaterial.Text = dr["ID10"].ToString();
            drpUOM.SelectedValue = dr["ID11"].ToString();
            txtQuantity.Text = dr["ID12"].ToString();
            txtRate.Text = dr["ID13"].ToString();
            drpRate.SelectedValue = dr["ID14"].ToString();
            
        }
        
      protected void FillQuotation()
        {
            DataTable dt = new DataTable();
           // dt = custPOBal.FillCustomerPO(Convert.ToInt32(drpCustomerPO.SelectedValue));
            if (dt.Rows.Count > 0)
            {

                DataTable dt1 = CreateTable(14);
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    dt1.Rows.Add();
                    dt1.Rows[i]["ID1"] = dt.Rows[i]["ItemName"].ToString();
                    dt1.Rows[i]["ID2"] = dt.Rows[i]["ItemCode"].ToString();
                    dt1.Rows[i]["ID3"] = dt.Rows[i]["RequiredQuantity"].ToString();
                    dt1.Rows[i]["ID4"] = dt.Rows[i]["UnitId"].ToString();
             
             
                }
             }
         }
             
             
             
             

        protected void chkWithEnquiry_CheckedChanged(object sender, EventArgs e)
        {
            bool WithEnquiry = chkWithEnquiry.Checked == true ? true : false;
            if (WithEnquiry==true)
            {
                drpWithEnquiry.Visible = true;
                txtRevisionNo.Visible = true;
                txtQuotationNumber.Visible = true;
                txtQuotationDate.Visible = true;
                
                
            }
            else
            {
                txtRevisionNo.Visible = false;
                txtQuotationNumber.Visible = false;
                txtQuotationDate.Visible = false;
                drpWithEnquiry.Visible = false;

            }
        }

        protected void BindItemDetails(int id)
        {
            {
                DataTable dt = new DataTable();
                dt = bal.BindItemDtls(id);
                drpUOM.Enabled = true;
                txtMaterial.Enabled = false;
                if (dt.Rows.Count > 0)
                {
                    drpUOM.SelectedValue = dt.Rows[0]["UnitId"].ToString();

                    txtMaterial.Text = dt.Rows[0]["Material"].ToString();
                    //drpDrawing.SelectedValue = dt.Rows[0]["DrawingNo"].ToString();
                }
            }

        }

        protected void BindQuotationNumber()
        {
            DataTable dt = new DataTable();
            dt = bal.BindQuotationNumber();
            drpQuotationNo.Items.Clear();
            drpQuotationNo.DataSource = dt;
            drpQuotationNo.DataTextField = "QuotationNumber";
            drpQuotationNo.DataValueField = "QuotationId";
            drpQuotationNo.DataBind();
            drpQuotationNo.Items.Insert(0, "---Select---");
            drpQuotationNo.SelectedIndex = 0;

        }
        protected void drpItemName_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpItemCode.SelectedValue=drpItemName.SelectedValue;
            int id = Convert.ToInt32(drpItemName.SelectedValue);
            BindItemDetails(id);
        }

        protected void drpItemCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpItemName.SelectedValue = drpItemCode.SelectedValue;
            int id = Convert.ToInt32(drpItemName.SelectedValue);
            BindItemDetails(id);
        }

        protected void BindToolDetails(int id)
        {
            DataTable dt = new DataTable();
            dt = bal.BindToolDetails(id);
            drpToolName.Enabled = true;
            drpToolCode.Enabled = true;
            txtDeliveryLeadTime.Enabled = true;
            txtDevelopmentToolCost.Enabled = true;
            txtPackingCost.Enabled = true;
            txtMouldCost.Enabled = true;
            txtOtherCost.Enabled = true;
            txtOtherCostRemark.Enabled = true;
            if(dt.Rows.Count>0)
            { drpToolName.SelectedItem.Text = dt.Rows[0]["ToolMouldname"].ToString();
              drpToolCode.SelectedItem.Text = dt.Rows[0]["ToolMouldCode"].ToString();
              txtDeliveryLeadTime.Text = (dt.Rows[0]["DeliveryLeadTime"]).ToString();
              txtDevelopmentToolCost.Text = (dt.Rows[0]["DevelopmentToolCost"].ToString());
                txtPackingCost.Text = dt.Rows[0]["PackingCost"].ToString();
                txtMouldCost.Text = dt.Rows[0]["MouldCost"].ToString();
                txtMouldCavity.Text = dt.Rows[0]["MouldCavity"].ToString();
                txtOtherCost.Text = dt.Rows[0]["OtherCost"].ToString();
                txtOtherCostRemark.Text = dt.Rows[0]["OtherCostRemark"].ToString();

            }
        }
        protected void drpToolName_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpToolCode.SelectedValue = drpToolName.SelectedValue;
            int Id = Convert.ToInt32(drpToolCode.SelectedValue);
            BindToolDetails(Id);
        }

        protected void drpToolCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpToolName.SelectedValue = drpToolCode.SelectedValue;
            int id = Convert.ToInt32(drpToolName.SelectedValue);
            BindToolDetails(id);

        }

        protected void drpPreparedByEmpCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpPreparedByEmpName.SelectedValue = drpPreparedByEmpCode.SelectedValue;
        }

        protected void drpPreparedByEmpName_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpPreparedByEmpCode.SelectedValue = drpPreparedByEmpName.SelectedValue;
        }

        protected void drpApprovedByEmpCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpApprovedByEmpName.SelectedValue = drpApprovedByEmpCode.SelectedValue;
        }

        protected void drpApprovedByEmpName_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpApprovedByEmpCode.SelectedValue = drpApprovedByEmpName.SelectedValue;
        }

        protected void drpReviewedByEmpCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpReviewedByEmpName.SelectedValue = drpReviewedByEmpCode.SelectedValue;
        }

        protected void drpReviewedByEmpName_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpReviewedByEmpCode.SelectedValue = drpReviewedByEmpName.SelectedValue;
        }

        protected void grdQuantityRate_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            if (e.CommandName == "Remove")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                dt = (DataTable)ViewState["Data"];
                dt.Rows.RemoveAt(index);
                BindList(dt);
            }

            if (e.CommandName == "RowEditing")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                dt = (DataTable)ViewState["Data"];
                BindQuantityData(dt.Rows[index]);
                dt.Rows.RemoveAt(index);
                BindList(dt);
            }
            
                
        }
        public void BindQuantityData(DataRow dr)
        {
            txtQuantity.Text = dr["ID1"].ToString();
            txtRate.Text = dr["ID2"].ToString();
            drpRate.SelectedValue = dr["ID3"].ToString();
        }

        public DataTable CreateTable(int NoOfColumns)
        {
            DataTable dt = new DataTable();
            for (int i = 1; i <= NoOfColumns; i++)
            {
                string ID = "ID" + i;
                dt.Columns.Add(ID);
            }
            return dt;
        }

        protected void BindList(DataTable dt)
        {
            ViewState["Data"] = dt;
            grdQuantityRate.DataSource = dt;
            grdQuantityRate.DataBind();
            if (grdQuantityRate.Rows.Count == 0)
                ViewState["Data"] = null;
        }
        public void BindQuantData()
        {
            DataTable dt = (DataTable)ViewState["Data"];
            DataTable dt1 = CreateTable(3);
            dt1.Rows.Add();
            dt1.Rows[0]["ID1"] = txtQuantity.Text;
            dt1.Rows[0]["ID2"] = txtRate.Text;
            dt1.Rows[0]["ID3"] = drpRate.SelectedValue;
            //dt1.Rows[0]["ID4"] = true;
            if (ViewState["Data"] == null)
            {
                BindList(dt1);
            }
            else
            {
                dt1.Merge(dt);
                BindList(dt1);
            }
        }

        

        protected void grdSupplierPO_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            DataTable dt = new DataTable();
            if (e.CommandName == "Remove")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                dt = (DataTable)ViewState["Data"];
                dt.Rows.RemoveAt(index);
                BindList(dt);
            }

            if (e.CommandName == "RowEditing")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                dt = (DataTable)ViewState["Data"];
                BindQuantityData(dt.Rows[index]);
                dt.Rows.RemoveAt(index);
                BindList(dt);
            }
        }

        public void BindEnquiryDetails(int id)
        {
            DataTable dt = new DataTable();
            dt = bal.BindEnquiryDetails(id);
            drpWithEnquiry.Enabled = true;
            txtRevisionNo.Enabled = true;
            txtQuotationNumber.Enabled = true;
            txtQuotationDate.Enabled = true;
            if(dt.Rows.Count>0)
            {   drpWithEnquiry.SelectedItem.Text = dt.Rows[0]["EnquiryNumber"].ToString();
                txtRevisionNo.Text = (dt.Rows[0]["EnqRefNumber"]).ToString();
                txtQuotationNumber.Text = (dt.Rows[0]["QuotationNumber"]).ToString();
                txtQuotationDate.Text = (dt.Rows[0]["QuotationDate"]).ToString();
            }
        }
        protected void drpWithEnquiry_SelectedIndexChanged(object sender, EventArgs e)
        {
            int EnquiryId = Convert.ToInt32(drpWithEnquiry.SelectedValue);
            BindEnquiryDetails(EnquiryId);
            
        }
        public void BindAllQuotationDetails(int QuotationId)
        {
            DataTable dt = new DataTable();
            dt=bal.BindAllQuotationDetails(QuotationId);
            drpWithEnquiry.Visible = false;
            if(dt.Rows.Count>0)
            {
                //drpQuotationNo.SelectedIndex.Text = dt.Rows[0]["QuotationNumber"].ToString();
                bool WithEnquiry = Convert.ToBoolean(dt.Rows[0]["WithEnquiry"].ToString());
                if(WithEnquiry)
                {
                    drpWithEnquiry.Visible = true;
                    drpWithEnquiry.SelectedValue = dt.Rows[0]["EnquiryId"].ToString();
                    txtRevisionNo.Text = (dt.Rows[0]["RevisionNumber"]).ToString();
                    txtQuotationNumber.Text = (dt.Rows[0]["QuotationNumber"]).ToString();
                    txtQuotationDate.Text = (dt.Rows[0]["QuotationDate"]).ToString();
                }
                else
                {
                    txtRevisionNo.Text = (dt.Rows[0]["RevisionNumber"]).ToString();
                    txtQuotationNumber.Text = (dt.Rows[0]["QuotationNumber"]).ToString();
                    txtQuotationDate.Text = (dt.Rows[0]["QuotationDate"]).ToString();
                }
                
                bool IsNewCustomer = Convert.ToBoolean(dt.Rows[0]["IsNewCustomer"].ToString());
                if(IsNewCustomer)
                {
                    txtCustomerName.Visible = true;
                    txtCustomerCode.Visible = true;
                    txtCustomerName.Text = dt.Rows[0]["NewCustomerName"].ToString();
                    txtCustomerCode.Text = dt.Rows[0]["NewCustomerCode"].ToString();
                }
                else
                {
                    drpCustomerName.SelectedValue = (dt.Rows[0]["Id"]).ToString();
                    drpCustomerCode.SelectedValue = (dt.Rows[0]["Id"]).ToString();
                    txtAddress.Text = dt.Rows[0]["Address1"].ToString();
                    txtContactPerson.Text = dt.Rows[0]["ContactPerson"].ToString();
                }

                drpItemName.SelectedValue = (dt.Rows[0]["ID"]).ToString();
                drpItemCode.SelectedValue=(dt.Rows[0]["ID"]).ToString();
                txtMaterial.Text= dt.Rows[0]["Material"].ToString();
                drpUOM.SelectedValue= (dt.Rows[0]["UnitId"]).ToString();
                drpToolName.SelectedValue= (dt.Rows[0]["ToolMouldId"]).ToString();
                drpToolCode.SelectedValue = (dt.Rows[0]["ToolMouldId"]).ToString();
                txtDeliveryLeadTime.Text = Convert.ToDateTime(dt.Rows[0]["DeliveryLeadTime"]).ToString();
                txtPackingCost.Text= (dt.Rows[0]["PackingCost"]).ToString();
                txtDevelopmentToolCost.Text= (dt.Rows[0]["DevelopmentToolCost"]).ToString();
                txtMouldCost.Text= (dt.Rows[0]["MouldCost"]).ToString();
                txtMouldCavity.Text= (dt.Rows[0]["MouldCavity"]).ToString();
                txtOtherCost.Text= (dt.Rows[0]["OtherCost"]).ToString();
                txtOtherCostRemark.Text= (dt.Rows[0]["OtherCostRemark"]).ToString();
                txtQuantity.Text= (dt.Rows[0]["Quantity"]).ToString();
                txtRate.Text= (dt.Rows[0]["Rate"]).ToString();
                drpRate.SelectedValue= (dt.Rows[0]["SymbolId"]).ToString();
                txtEcess.Text= (dt.Rows[0]["Ecess"]).ToString();
                txtExcise.Text= (dt.Rows[0]["Excise"]).ToString();
                txtServiceTax.Text= (dt.Rows[0]["ServiceTax"]).ToString();
                txtExcise.Text = dt.Rows[0]["Excise"].ToString();
                txtSaleTax.Text= (dt.Rows[0]["SaleTax"]).ToString();
                drpPayment.SelectedValue= (dt.Rows[0]["PaymentTypeId"]).ToString();
                drpModeOfDispatch.SelectedValue= (dt.Rows[0]["TransportId"]).ToString();
                drpFrieght.SelectedValue= (dt.Rows[0]["FreightId"]).ToString();
                drpValidity.SelectedValue= (dt.Rows[0]["PlanTypeId"]).ToString();
                drpPacking.SelectedValue= (dt.Rows[0]["PackingId"]).ToString();
                drpStatus.SelectedValue= (dt.Rows[0]["StatusId"]).ToString();
                txtAgainstFormNo.Text= (dt.Rows[0]["AgainstForm"]).ToString();
                txtRemark.Text= (dt.Rows[0]["Remark"]).ToString();
                drpDrawing.SelectedValue= (dt.Rows[0]["DrawingId"]).ToString();
                txtSampleRequired.Text= (dt.Rows[0]["SampleRequired"]).ToString();
                drpDeliveryTerm.Text = (dt.Rows[0]["DeliveryTermId"]).ToString();
                txtDocumentRequired.Text = (dt.Rows[0]["DocumentRequired"]).ToString();
                txtAdvance.Text= (dt.Rows[0]["Advance"]).ToString();
                drpPreparedByEmpName.SelectedValue= (dt.Rows[0]["PreparedByEmpNameId"]).ToString();
                drpPreparedByEmpCode.SelectedValue= (dt.Rows[0]["PreparedByEmpNameId"]).ToString();
                drpApprovedByEmpName.SelectedValue= (dt.Rows[0]["ApprovedByEmpNameId"]).ToString();
                drpApprovedByEmpCode.SelectedValue= (dt.Rows[0]["ApprovedByEmpNameId"]).ToString();
                drpReviewedByEmpName.SelectedValue= (dt.Rows[0]["ReviewedByEmpNameId"]).ToString();
                drpReviewedByEmpCode.SelectedValue= (dt.Rows[0]["ReviewedByEmpNameId"]).ToString();
                txtItemSubject.Text= (dt.Rows[0]["ItemSubject"]).ToString();
                txtItemTerms.Text= (dt.Rows[0]["ItemTerms"]).ToString();
                txtToolSubject.Text= (dt.Rows[0]["ToolSubject"]).ToString();
                txtToolTerms.Text= (dt.Rows[0]["ToolTerms"]).ToString();

            }
        }
        protected void drpQuotationNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            int QuotationId = Convert.ToInt32(drpQuotationNo.SelectedValue);
            BindAllQuotationDetails(QuotationId);
        }
    }
}