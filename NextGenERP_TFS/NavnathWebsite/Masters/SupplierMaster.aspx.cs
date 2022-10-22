using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using BAL;
using System.Data;
using NavnathWebsite.SharedClasses;


namespace NavnathWebsite.Demo
{
    public partial class SupplierMaster : System.Web.UI.Page
    {
        SupplierMasterBAL05Oct _BalSupplier = new SupplierMasterBAL05Oct();
        SupplierMasterDAL05Oct _dbSupplier = new SupplierMasterDAL05Oct();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            string referer = Request.ServerVariables["HTTP_REFERER"];

            if (!IsPostBack)
            {
                FillSupplier();
            }

        }
            public void FillSupplier()
            {
                DataTable dt = new DataTable();
                dt = _BalSupplier.FillSupplier(Convert.ToString(0));

                 drpSearchSupplier.Items.Clear();
               

                if (dt.Rows.Count > 0)
                drpSearchSupplier.DataSource = dt;
                drpSearchSupplier.DataTextField = "SuppCode";
                drpSearchSupplier.DataValueField = "SuppCode";
                drpSearchSupplier.DataBind();
               drpSearchSupplier.Items.Insert(0,"Select SuppCode");
                drpSearchSupplier.SelectedIndex=0;

                drpSupplierName.DataSource = dt;
                drpSupplierName.DataTextField = "SuppName";
                drpSupplierName.DataValueField="SuppCode";
                drpSupplierName.DataBind();
                drpSupplierName.Items.Insert(0, "Select SuppName");
                drpSupplierName.SelectedIndex = 0;
            }



        

        protected void drpSearchSupplier_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                drpSupplierName.SelectedValue= drpSearchSupplier.SelectedValue;
            }
            catch (Exception ex)
            {

            }

        }

        protected void drpSupplierName_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                drpSearchSupplier.SelectedValue = drpSupplierName.SelectedValue;
            }

            catch(Exception ex)
            {
            }
       }




        protected void ControToValue()
        {
            _dbSupplier.SuppName = Convert.ToString(txtSupplierName.Text);
            _dbSupplier.ContactPerson = Convert.ToString(txtContactPerson.Text);
            _dbSupplier.Branch = Convert.ToString(txtBranch.Text);
            _dbSupplier.Address1 = Convert.ToString(txtAddress1.Text);
            _dbSupplier.Address2 = Convert.ToString(txtAddress2.Text);
            _dbSupplier.City = Convert.ToString(txtcity.Text);
            _dbSupplier.State = Convert.ToString(txtstate.Text);
            _dbSupplier.PinCode = Convert.ToInt32(txtpincode.Text);
            _dbSupplier.Country = Convert.ToString(txtcountry.Text);
            _dbSupplier.EmailID = Convert.ToString(txtemail.Text);
            _dbSupplier.Telephone = Convert.ToInt32(txttelephone.Text);
            _dbSupplier.Mobile = Convert.ToInt32(txtmobile.Text);
            _dbSupplier.Fax = Convert.ToString(txtfax.Text);
            _dbSupplier.Website = Convert.ToString(txtwebsite.Text);
            _dbSupplier.GSTIN = Convert.ToString(txtgstin.Text);
            _dbSupplier.Remarks = Convert.ToString(txtremark.Text);
        }
    
    }
}