using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL;
using Modal;
using System.Data;
using NavnathWebsite.SharedClasses;
namespace NavnathWebsite.Masters
{
    public partial class EmployeeMaster : System.Web.UI.Page
    {
       // EmployeeMasterBusiness EmployeeMasterBusiness.GetEmployeeObject() = new EmployeeMasterBusiness();
        EmployeeMasterModel empModel = new EmployeeMasterModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
             
            CalendarExtender1.StartDate = DateTime.Now.AddYears(-100);
            CalendarExtender1.EndDate = DateTime.Now;
            CalendarExtender2.StartDate = DateTime.Now.AddYears(-50);
            CalendarExtender2.EndDate = DateTime.Now;
            BindAllEmployeeDropDownList();
            }
        }


        public void radEmpSearch()
        {
            DataTable dt = EmployeeMasterBusiness.GetEmployeeObject().radEmpSearch(empModel);
            if (radNameWise.Checked)
            {
                drpEmployeeSearch.DataTextField = "FristName";
                drpEmployeeSearch.DataValueField = "EmpCode";
                drpEmployeeSearch.DataSource = dt;
                drpEmployeeSearch.DataBind();
            }
            else
            {
                drpEmployeeSearch.DataTextField = "EmpCode";
                drpEmployeeSearch.DataValueField = "EmpCode";
                drpEmployeeSearch.DataSource = dt;
                drpEmployeeSearch.DataBind();
            }
            drpEmployeeSearch.Items.Insert(0, "--Select--");
            drpEmployeeSearch.SelectedIndex = 0;
        }

        //BindAllDropdownList
        public void BindAllEmployeeDropDownList()
        {
            DataTable dt = EmployeeMasterBusiness.GetEmployeeObject().BindAllEmployeeDropDownList(empModel);
            DataTable dt1 = EmployeeMasterBusiness.GetEmployeeObject().BindBloodGroup(empModel);
            DataTable dt2 = EmployeeMasterBusiness.GetEmployeeObject().BindQualification(empModel);
            DataTable dt3 = EmployeeMasterBusiness.GetEmployeeObject().BindDesignation(empModel);
            DataTable dt4 = EmployeeMasterBusiness.GetEmployeeObject().BindDepartment(empModel);
            DataTable dt5 = EmployeeMasterBusiness.GetEmployeeObject().BindCategory(empModel);
            DataTable dt6 = EmployeeMasterBusiness.GetEmployeeObject().BindWeekOf(empModel);
            DataTable dt7 = EmployeeMasterBusiness.GetEmployeeObject().BindContractor(empModel);
            DataTable dt8 = EmployeeMasterBusiness.GetEmployeeObject().BindTypeOfStaff(empModel);
            DataTable dt9 = EmployeeMasterBusiness.GetEmployeeObject().BindPayType(empModel);
            DataTable dt10 = EmployeeMasterBusiness.GetEmployeeObject().Bindunit(empModel);
            DataTable dt11 = EmployeeMasterBusiness.GetEmployeeObject().BindMaritalStatus(empModel);
            DataTable dt12 = EmployeeMasterBusiness.GetEmployeeObject().BindLeave(empModel);

            drpGender.DataSource = dt;
            drpGender.DataTextField = "Gender";
            drpGender.DataValueField = "GID";
            drpGender.DataBind();
            drpGender.Items.Insert(0, "--Select--");
            drpGender.SelectedIndex = 0;

            drpBloodGroup.DataSource = dt1;
            drpBloodGroup.DataTextField = "BloodGroup";
            drpBloodGroup.DataValueField = "BID";
            drpBloodGroup.DataBind();
            drpBloodGroup.Items.Insert(0, "--Select--");
            drpBloodGroup.SelectedIndex = 0;

            drpQualification.DataSource = dt2;
            drpQualification.DataTextField = "QualificationName";
            drpQualification.DataValueField = "QualificationId";
            drpQualification.DataBind();
            drpQualification.Items.Insert(0, "--Select--");
            drpQualification.SelectedIndex = 0;

            drpDesignation.DataSource = dt3;
            drpDesignation.DataTextField = "DesignationName";
            drpDesignation.DataValueField = "DesignationId";
            drpDesignation.DataBind();
            drpDesignation.Items.Insert(0, "--Select--");
            drpDesignation.SelectedIndex = 0;

            drpDepartnamet.DataSource = dt4;
            drpDepartnamet.DataTextField = "dname";
            drpDepartnamet.DataValueField = "did";
            drpDepartnamet.DataBind();
            drpDepartnamet.Items.Insert(0, "--Select--");
            drpDepartnamet.SelectedIndex = 0;

            drpCategory.DataSource = dt5;
            drpCategory.DataTextField = "CategoryName";
            drpCategory.DataValueField = "CategoryId";
            drpCategory.DataBind();
            drpCategory.Items.Insert(0, "--Select--");
            drpCategory.SelectedIndex = 0;

            drpWeeklyOff.DataSource = dt6;
            drpWeeklyOff.DataTextField = "WeekOff";
            drpWeeklyOff.DataValueField = "WID";
            drpWeeklyOff.DataBind();
            drpWeeklyOff.Items.Insert(0, "--Select--");
            drpWeeklyOff.SelectedIndex = 0;

            drpContractor.DataSource = dt7;
            drpContractor.DataTextField = "ContractorName";
            drpContractor.DataValueField = "ContractorId";
            drpContractor.DataBind();
            drpContractor.Items.Insert(0, "--Select--");
            drpContractor.SelectedIndex = 0;

            drpTypeOfStaff.DataSource = dt8;
            drpTypeOfStaff.DataTextField = "TypeOfStaff";
            drpTypeOfStaff.DataValueField = "StaffId";
            drpTypeOfStaff.DataBind();
            drpTypeOfStaff.Items.Insert(0, "--Select--");
            drpTypeOfStaff.SelectedIndex = 0;

            drpPayType.DataSource = dt9;
            drpPayType.DataTextField = "PayTypeName";
            drpPayType.DataValueField = "PayTypeId";
            drpPayType.DataBind();
            drpPayType.Items.Insert(0, "--Select--");
            drpPayType.SelectedIndex = 0;

            drpUnit.DataSource = dt10;
            drpUnit.DataTextField = "UnitName";
            drpUnit.DataValueField = "UnitId";
            drpUnit.DataBind();
            drpUnit.Items.Insert(0, "--Select--");
            drpUnit.SelectedIndex = 0;

            drpMaritalStatus.DataSource = dt11;
            drpMaritalStatus.DataTextField = "MaritalStatus";
            drpMaritalStatus.DataValueField = "MSID";
            drpMaritalStatus.DataBind();
            drpMaritalStatus.Items.Insert(0, "--Select--");
            drpMaritalStatus.SelectedIndex = 0;

            drpLeaveRule.DataSource = dt12;
            drpLeaveRule.DataTextField = "LeaveName";
            drpLeaveRule.DataValueField = "LeaveId";
            drpLeaveRule.DataBind();
            drpLeaveRule.Items.Insert(0, "--Select--");
            drpLeaveRule.SelectedIndex = 0;
        }


        public void SetValues()
        {

            empModel.EmpCode = txtEmpCode.Text.ToString();
            empModel.FristName = txtFirstName.Text.ToString();
            empModel.MiddleName = txtMidName.Text.ToString();
            empModel.Title = txtTitle.Text.ToString();
            empModel.LastName = txtLastName.Text.ToString();
            empModel.ContactNo = txtContactNumber.Text.ToString();
            empModel.MobileNo = txtMobile.Text.ToString();
            empModel.EmailId = txtEmailID.Text.ToString();
            empModel.DOB = Convert.ToDateTime(txtDOB.Text.ToString());
            empModel.GID =Convert.ToInt32(drpGender.SelectedItem.Value);
            empModel.BloodGroupID = Convert.ToInt32(drpBloodGroup.SelectedItem.Value);
            empModel.MSID = Convert.ToInt32(drpMaritalStatus.SelectedItem.Value);
            empModel.CTC = Convert.ToInt32(txtCTC.Text.ToString());
            empModel.GrossAmount = Convert.ToInt32(txtGrossAmount.Text.ToString());
            empModel.TempAddress = txtTempAddress.Text.ToString();
            empModel.DocumentName = txtDocumentName.Text.ToString();
            empModel.TrainingDetails = txtTrainingDetails.Text.ToString();
            empModel.PanNo = txtPANNumber.Text.ToString();
            empModel.ESICACCNO = txtESICNumber.Text.ToString();
            if (radAutoMailNo.Checked == true)
            {
                empModel.AutoMail = radAutoMailNo.Text;
            }
            else
            {
                empModel.AutoMail = radAutoMailYes.Text;
            }
            empModel.LeaveId = Convert.ToInt32(drpLeaveRule.SelectedItem.Value);
            empModel.AttendanceID = Convert.ToInt32(txtAttendanceID.Text.ToString());
            empModel.EmpPhoto = "";

            empModel.DateofJoin = Convert.ToDateTime(txtDateOfJoin.Text.ToString());
            empModel.QualificationId = Convert.ToInt32(drpQualification.SelectedValue);
            empModel.DesignationId = Convert.ToInt32(drpDesignation.SelectedItem.Value);
            empModel.did = Convert.ToInt32(drpDepartnamet.SelectedItem.Value);
            empModel.CategoryId = Convert.ToInt32(drpCategory.SelectedItem.Value);
            empModel.WID = Convert.ToInt32(drpWeeklyOff.SelectedItem.Value);
            empModel.ContractorId = Convert.ToInt32(drpContractor.SelectedItem.Value);
            empModel.StaffId = Convert.ToInt32(drpTypeOfStaff.SelectedItem.Value);
            empModel.PayTypeId = Convert.ToInt32(drpPayType.SelectedItem.Value);
            empModel.UnitId = Convert.ToInt32(drpUnit.SelectedValue);
            empModel.AadharNo = Convert.ToInt32(txtAadharNumber.Text.ToString());
            empModel.Balance = Convert.ToInt32(txtBalance.Text.ToString());
            empModel.PermanentAddress = txtPerAddress.Text.ToString();
            empModel.Asset = txtAsset.Text.ToString();
            empModel.ApprasalHistory = txtApprasalHistory.Text.ToString();
            empModel.PFAccNo = txtPFAccount.Text.ToString();
            if (radIsLeftNo.Checked == true)
            {
                empModel.IsLeft = radIsLeftNo.Text;
            }
            else
            {
                empModel.IsLeft = radIsLeftYes.Text;
            }
            empModel.LeftDate = Convert.ToDateTime(txtLeftDate.Text.ToString());

        }

        public void Reset()
        {
            txtEmpCode.Text = string.Empty;
            txtFirstName.Text = string.Empty;
            txtMidName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtLeftDate.Text = string.Empty;
            txtTitle.Text = string.Empty;
            txtContactNumber.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtEmailID.Text = string.Empty;
            txtDOB.Text = string.Empty;
            drpGender.Items.Clear();
            drpBloodGroup.Items.Clear();
            drpMaritalStatus.Items.Clear();
            txtCTC.Text = string.Empty;
            txtGrossAmount.Text = string.Empty;
            txtTempAddress.Text = string.Empty;
            txtDocumentName.Text = string.Empty;
            txtAttendanceID.Text = string.Empty;
            txtDateOfJoin.Text = string.Empty;
            drpQualification.Items.Clear();
            drpDesignation.Items.Clear();
            drpDepartnamet.Items.Clear();
            drpCategory.Items.Clear();
            drpWeeklyOff.Items.Clear();
            drpContractor.Items.Clear();
            drpTypeOfStaff.Items.Clear();
            drpPayType.Items.Clear();
            drpUnit.Items.Clear();
            txtAadharNumber.Text = string.Empty;
            txtBalance.Text = string.Empty;
            txtPerAddress.Text = string.Empty;
            txtAsset.Text = string.Empty;
            txtTrainingDetails.Text = string.Empty;
            txtPANNumber.Text = string.Empty;
            txtESICNumber.Text = string.Empty;
            drpLeaveRule.Items.Clear();
            txtApprasalHistory.Text = string.Empty;
            txtPFAccount.Text = string.Empty;
            txtLeftDate.Text = string.Empty;
            radIsLeftNo.Checked = false;
            radIsLeftYes.Checked = true;
            radAutoMailNo.Checked = false;
            radAutoMailYes.Checked = true;
        }

        //FillEmployeeDetails()
        public void FillEmployeeDetails()
        {
            try
            {
                empModel.EmpCode = drpEmployeeSearch.SelectedValue;
                DataTable dt = EmployeeMasterBusiness.GetEmployeeObject().FillEmployeeDetails(empModel);
                if (dt.Rows.Count > 0)
                {
                    txtEmpCode.Text = dt.Rows[0]["EmpCode"].ToString();
                    txtAttendanceID.Text = dt.Rows[0]["AttendanceID"].ToString();
                    txtTitle.Text = dt.Rows[0]["Title"].ToString();
                    txtFirstName.Text = dt.Rows[0]["FristName"].ToString();
                    txtDateOfJoin.Text = dt.Rows[0]["DateofJoin"].ToString();
                    txtMidName.Text = dt.Rows[0]["MiddleName"].ToString();
                    txtLastName.Text = dt.Rows[0]["LastName"].ToString();
                    txtMobile.Text = dt.Rows[0]["MobileNo"].ToString();
                    txtContactNumber.Text = dt.Rows[0]["ContactNo"].ToString();
                    txtEmailID.Text = dt.Rows[0]["EmailId"].ToString();
                    txtDOB.Text = dt.Rows[0]["DOB"].ToString();
                    txtCTC.Text = dt.Rows[0]["CTC"].ToString();
                    txtAadharNumber.Text = dt.Rows[0]["AadharNo"].ToString();
                    txtGrossAmount.Text = dt.Rows[0]["GrossAmount"].ToString();
                    txtBalance.Text = dt.Rows[0]["Balance"].ToString();
                    txtTempAddress.Text = dt.Rows[0]["TempAddress"].ToString();
                    txtPerAddress.Text = dt.Rows[0]["PermanentAddress"].ToString();
                    txtDocumentName.Text = dt.Rows[0]["DocumentName"].ToString();
                    txtAsset.Text = dt.Rows[0]["Asset"].ToString();
                    txtApprasalHistory.Text = dt.Rows[0]["ApprasalHistory"].ToString();
                    txtTrainingDetails.Text = dt.Rows[0]["TrainingDetails"].ToString();
                    txtPFAccount.Text = dt.Rows[0]["PFAccNo"].ToString();
                    txtPANNumber.Text = dt.Rows[0]["PanNo"].ToString();
                    txtESICNumber.Text = dt.Rows[0]["ESICACCNO"].ToString();
                    txtLeftDate.Text = dt.Rows[0]["LeftDate"].ToString();
                    drpBloodGroup.SelectedValue = dt.Rows[0]["BloodGroupID"].ToString();
                    drpCategory.SelectedValue = dt.Rows[0]["CategoryId"].ToString();
                    drpContractor.SelectedValue = dt.Rows[0]["ContractorId"].ToString();
                    drpDepartnamet.SelectedValue = dt.Rows[0]["did"].ToString();
                    drpDesignation.SelectedValue = dt.Rows[0]["DesignationId"].ToString();
                    drpGender.SelectedValue = dt.Rows[0]["GID"].ToString();
                    drpLeaveRule.SelectedValue = dt.Rows[0]["LeaveId"].ToString();
                    drpMaritalStatus.SelectedValue = dt.Rows[0]["MSID"].ToString();
                    drpPayType.SelectedValue = dt.Rows[0]["PayTypeId"].ToString();
                    drpQualification.SelectedValue = dt.Rows[0]["QualificationId"].ToString();
                    drpTypeOfStaff.SelectedValue = dt.Rows[0]["StaffId"].ToString();
                    drpUnit.SelectedValue = dt.Rows[0]["UnitId"].ToString();
                    drpWeeklyOff.SelectedValue = dt.Rows[0]["WID"].ToString();
                    if (radAutoMailNo.Checked == true)
                    {
                        radAutoMailNo.Checked = true;
                    }
                    else
                    {
                        radAutoMailYes.Checked = true;

                    }
                    if (radIsLeftNo.Checked == true)
                    {
                        radIsLeftNo.Checked = true;
                    }
                    else
                    {
                        radIsLeftYes.Checked = true;
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
           

        protected void radNameWise_CheckedChanged(object sender, EventArgs e)
        {
            radEmpSearch();
        }

        protected void radCodeWise_CheckedChanged(object sender, EventArgs e)
        {
            radEmpSearch();
        }

        protected void btnEmployeeSearch_Click(object sender, EventArgs e)
        {
            FillEmployeeDetails();
        }

        protected void btnNewItem_Click(object sender, EventArgs e)
        {
            Reset();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SetValues();
                int res = EmployeeMasterBusiness.GetEmployeeObject().InsertEmployeeData(empModel);
                if (res == 1)
                {
                    Response.Write("<script language='JavaScript'>alert('Record Save Successfully!')</script>");
                }
                else
                {
                    Response.Write("<script language='JavaScript'>alert('Record Not Seved!')</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script language='JavaScript'>alert('" + ex.Message + "')</script>");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                SetValues();
                int res = EmployeeMasterBusiness.GetEmployeeObject().UpdateEmployeeData(empModel);
                if (res == 1)
                {
                    Response.Write("<script language='JavaScript'>alert('Record Updated Successfully!')</script>");
                    FillEmployeeDetails();
                }
                else
                {
                    Response.Write("<script language='JavaScript'>alert('Record Not Updated!')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language='JavaScript'>alert('"+ex.Message+"')</script>");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            SetValues();
            int res = EmployeeMasterBusiness.GetEmployeeObject().DeleteEmployeeDetails(empModel);
            if (res == 1)
            {
                Response.Write("<script language='JavaScript'>alert('Record deleted Successfully!')</script>");
                radEmpSearch();
                Reset();
            }
            else
            {
                Response.Write("<script language='JavaScript'>alert('Record not deleted!')</script>");
            }
            //Reset();

        }

        protected void btnEmployeeWise_Click(object sender, EventArgs e)
        {
            //Response.Redirect(NavigateUrl.EmployeeMasterCodeWiseDtlForm);
            if (drpEmployeeSearch.SelectedValue != "--Select--")
            {
                Response.Redirect(NavigateUrl.EmployeeMasterCodeWiseDtlForm + drpEmployeeSearch.SelectedValue);
            }
            else
            {
                Response.Write("<script> alert('Plese Select Employee code first') </Script>");
            }
        }
        
        //btnAllEmployee
        protected void btnAllEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect(NavigateUrl.EmployeeMasterAllDtlForm);
        }

        protected void btnreport_Click(object sender, EventArgs e)
        {
            string EmpCode = drpEmployeeSearch.SelectedValue;

            Response.Redirect("../ReportForm/MasterReportForms.aspx?functionName=EmpDetail&EmpCode=" + EmpCode);
        }

        protected void txtEmailID_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtAsset_TextChanged(object sender, EventArgs e)
        {

        }
    }
}