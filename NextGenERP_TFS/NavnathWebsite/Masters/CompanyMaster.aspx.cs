using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL;
using Modal;
using System.Data;
using System.Data.SqlClient;


namespace NavnathWebsite.Demo
{
    public partial class CompanyMaster : System.Web.UI.Page
    {
        CompanyMasterModel CompModel = new CompanyMasterModel();
        CompMnger CompBAL = new CompMnger();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                FillCompanyMaster();
            }
            
        }

        // Binding Company Data on Page load

        public void FillCompanyMaster()
        {
            try
            { 
                DataTable dt = CompBAL.FillCompanyMaster(CompModel);
                if(dt.Rows.Count >0)
                {
                    txtCompanyName.Text = dt.Rows[0]["CompanyName"].ToString();
                    txtCxAddress1.Text = dt.Rows[0]["Address1"].ToString();
                    txtCxCity.Text = dt.Rows[0]["City"].ToString();
                    txtCxPinCode.Text = dt.Rows[0]["PinCode"].ToString();
                    txtCxEmail.Text = dt.Rows[0]["EmailID"].ToString();
                    txtCxMobile.Text = dt.Rows[0]["Mobile"].ToString();
                    txtCxWebsite.Text = dt.Rows[0]["Website"].ToString();
                    txtCxAddress2.Text = dt.Rows[0]["Address2"].ToString();
                    drpCxState.SelectedValue = dt.Rows[0]["State"].ToString();
                    txtCxCountry.Text = dt.Rows[0]["Country"].ToString();
                    txtCxTelephone.Text = dt.Rows[0]["Telephone"].ToString();
                    txtCxContactPerson.Text = dt.Rows[0]["ContactPerson"].ToString();
                    txtCxGSTIN.Text = dt.Rows[0]["GSTIN"].ToString();
                }

            }
            catch(Exception ex)
            {
            
            }
        }

        //SetValues()

        public void SetValues()
        {
            CompModel.CmpName = txtCompanyName.Text.ToString();
            CompModel.Address1 = txtCxAddress1.Text.ToString();
            CompModel.Address2 = txtCxAddress2.Text.ToString();
            CompModel.City = txtCxCity.Text.ToString();
            CompModel.PinCode= txtCxPinCode.Text.ToString();
            CompModel.EmailID = txtCxEmail.Text.ToString();
            CompModel.Mobile = txtCxMobile.Text.ToString();
            CompModel.Website = txtCxWebsite.Text.ToString();
            CompModel.State = drpCxState.SelectedItem.ToString();
            CompModel.Country = txtCxCountry.Text.ToString();
            CompModel.Telephone = txtCxTelephone.Text.ToString();
            CompModel.ContactPerson = txtCxContactPerson.Text.ToString();
            CompModel.GSTIN = txtCxGSTIN.Text.ToString();
        }

        //ResetValues

        public void ResetValues()
        {
            txtCompanyName.Text = string.Empty;
            txtCxAddress1.Text = string.Empty;
            txtCxAddress2.Text = string.Empty;
            txtCxCity.Text = string.Empty;
            txtCxPinCode.Text = string.Empty;
            txtCxEmail.Text = string.Empty;
            txtCxMobile.Text = string.Empty;
            txtCxWebsite.Text = string.Empty;
            drpCxState.Text= "--Select--";
            txtCxCountry.Text = string.Empty;
            txtCxTelephone.Text = string.Empty;
            txtCxContactPerson.Text = string.Empty;
            txtCxGSTIN.Text = string.Empty;
        }
        // Update Button
        protected void btnUpdateItem_Click(object sender, EventArgs e)
        {
            try
            {
               SetValues();
                
                int res = CompBAL.UpdateCompany(CompModel);
                if (res == 1)
                {
                    Response.Write("<script language='JavaScript'>alert('Record Updated')</script>");
                    FillCompanyMaster();
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
        }

        protected void btnCancelItem_Click(object sender, EventArgs e)
        {
            ResetValues();
        }

    
    }   /* End CompanyMaster*/
}       /*End NameSpace*/