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
using NavnathWebsite.SharedClasses;


namespace NavnathWebsite.Demo
{
    public partial class CustomerMaster : System.Web.UI.Page
    {
        CustomerMasterModel CustModel = new CustomerMasterModel();
        CustomerMasterMngr CustBAL = new CustomerMasterMngr();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCustomer();
            }
            CustModel.CustCode = drpCustSearch.SelectedValue;
            btnValidate();
        }
        public void ResetValues()
        {
            txtCustCode.Text = string.Empty;
            txtContPerson.Text = string.Empty;
            txtCustName.Text = string.Empty;
            txtBranch.Text = string.Empty;
            txtAddress1.Text = string.Empty;
            txtAddress2.Text = string.Empty;
            txtCity.Text = string.Empty;
            drpState.Items.Clear();
            txtPinCode.Text = string.Empty;
            txtContPerson.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtTelephone.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtFax.Text = string.Empty;
            txtWebSite.Text = string.Empty;
            txtGSTIN.Text = string.Empty;
            txtRemark.Text = string.Empty;
            txtCountry.Text = string.Empty;
        }

        //BindCustomer
        public void     BindCustomer()
        {
            DataTable dt = CustBAL.BindCustomer(CustModel);
            drpCustSearch.DataSource = dt;
            drpCustSearch.DataBind();
            drpCustSearch.DataTextField = "CustName";
            drpCustSearch.DataValueField = "CustCode";
            drpCustSearch.DataBind();
        }

        //FillCustomer
        public void FillCustomer()
        {
            //CustModel.CustCode = drpCustSearch.SelectedValue;
            try
            {
                DataTable dt = CustBAL.FillCustomer(CustModel);
                if (dt.Rows.Count > 0)
                {
                    txtCustCode.Text = dt.Rows[0]["CustCode"].ToString();
                    txtCustName.Text = dt.Rows[0]["CustName"].ToString();
                    txtAddress1.Text = dt.Rows[0]["Address1"].ToString();
                    txtCity.Text = dt.Rows[0]["City"].ToString();
                    txtPinCode.Text = dt.Rows[0]["PinCode"].ToString();
                    txtEmail.Text = dt.Rows[0]["EmailID"].ToString();
                    txtMobile.Text = dt.Rows[0]["Mobile"].ToString();
                    txtWebSite.Text = dt.Rows[0]["Website"].ToString();
                    txtAddress2.Text = dt.Rows[0]["Address2"].ToString();
                    drpState.SelectedValue = dt.Rows[0]["State"].ToString();
                    txtCountry.Text = dt.Rows[0]["Country"].ToString();
                    txtTelephone.Text = dt.Rows[0]["Telephone"].ToString();
                    txtContPerson.Text = dt.Rows[0]["ContactPerson"].ToString();
                    txtGSTIN.Text = dt.Rows[0]["GSTIN"].ToString();
                    txtBranch.Text = dt.Rows[0]["LoginBranch"].ToString();
                    txtRemark.Text = dt.Rows[0]["Remarks"].ToString();
                    txtFax.Text = dt.Rows[0]["Fax"].ToString();
                }
            }
            catch (Exception ex)
            {
            }
        }
        //SetValues
        public void SetValues()
        {

            CustModel.CustCode = txtCustCode.Text.ToString();
            CustModel.CustName = txtCustName.Text.ToString();
            CustModel.Address1 = txtAddress1.Text.ToString();
            CustModel.Address2 = txtAddress2.Text.ToString();
            CustModel.City = txtCity.Text.ToString();
            CustModel.PinCode = txtPinCode.Text.ToString();
            CustModel.EmailID = txtEmail.Text.ToString();
            CustModel.Mobile = txtMobile.Text.ToString();
            CustModel.Website = txtWebSite.Text.ToString();
            CustModel.State = drpCustSearch.SelectedItem.ToString();
            CustModel.Country = txtCountry.Text.ToString();
            CustModel.Telephone = txtTelephone.Text.ToString();
            CustModel.ContactPerson = txtContPerson.Text.ToString();
            CustModel.GSTIN = txtGSTIN.Text.ToString();
            CustModel.Branch = txtBranch.Text.ToString();
            CustModel.Remarks= txtRemark.Text.ToString();
            CustModel.Fax = txtFax.Text.ToString();
        }

        public void btnValidate()
        {
            if (!IsPostBack)
            {
                btnUpdate.Enabled = false;
                btnCancel.Enabled = true;
                btnSave.Enabled = true;
                btnNewItem.Enabled = false;
                //btnPreview.Enabled = false;
                txtCustCode.Enabled = true;
            }
        }

        /*----- Button Working -----*/

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerMaster.aspx");   
            ResetValues();
            //btnPreview.Enabled = false;
            btnUpdate.Enabled = false;
            btnNewItem.Enabled = true;
            btnSave.Enabled = true;
            txtCustCode.Enabled = true;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                SetValues();

                int res = CustBAL.UpdateCustomer(CustModel);
                if (res == 1)
                {
                    Response.Write("<script language='JavaScript'>alert('Record Updated')</script>");
                    FillCustomer();
                }
                else
                {
                    Response.Write("<script language='JavaScript'>alert('Record Not Update')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language='JavaScript'>alert('" + ex.Message + "')</script>");
            }
            btnNewItem.Enabled = false;
            btnSave.Enabled = false;
            btnUpdate.Enabled = true;
            btnCancel.Enabled = true;
            //btnPreview.Enabled = true;
        }

        protected void btnCustSearch_Click(object sender, EventArgs e)
        {
            FillCustomer();
            btnNewItem.Enabled = false;
            btnSave.Enabled = false;
            btnUpdate.Enabled = true;
            btnCancel.Enabled = true;
            //btnPreview.Enabled = true;
            txtCustCode.Enabled = false;
        }

        protected void btnNewItem_Click(object sender, EventArgs e)
        {
            ResetValues();
            txtCustCode.Enabled = true;
            btnUpdate.Enabled = false;
            //btnPreview.Enabled = false;
            txtCustCode.Enabled = true;
            btnNewItem.Enabled = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SetValues();
                int res = CustBAL.InsertCustomerMaster(CustModel);
                if (res == 1)
                {
                    Response.Write("<script language='JavaScript'>alert('Record Save')</script>");
                    BindCustomer();
                }
                else
                {
                    Response.Write("<script language='JavaScript'>alert('Record Not Save')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language='JavaScript'>alert('" + ex.Message + "')</script>");
            }
            btnNewItem.Enabled = false;
            btnUpdate.Enabled = true;
            btnCancel.Enabled = true;
            //btnPreview.Enabled = true;
        }

        protected void btnCustWise_Click(object sender, EventArgs e)
        {
            if (drpCustSearch.SelectedValue != "--Select--")
            {
                Response.Redirect(NavigateUrl.CustomerMasterCodeWiseDtlForm + drpCustSearch.SelectedValue);
            }
            else
            {
                Response.Write("<script> alert('Plese Select Customer Code first') </Script>");
            }
        }

        }
    }
//}