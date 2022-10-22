using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL;
using Modal;
namespace NavnathWebsite.Masters
{
    public partial class EmployeeMasterNew : System.Web.UI.Page
    {
        EmployeeMasterNBAL bal = new EmployeeMasterNBAL();
        EmployeeMasterNModel model = new EmployeeMasterNModel();

        public int LoginUserId { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                /*CalendarExtender1.StartDate = DateTime.Now.AddYears(-100);
                CalendarExtender1.EndDate = DateTime.Now;
                CalendarExtender2.StartDate = DateTime.Now.AddYears(-50);
                CalendarExtender2.EndDate = DateTime.Now;
                */
                BindQualificationDrpDown();
                BindGenderDrpDown();
                BindBloodGroupDrpDown();
                BindMartialStatusDrpDown();
                BindDesignationDrpDown();
                BindDepartmentDrpDown();
                BindCategoryDrpDown();
                BindWeeklyOffDrpDown();
                BindContractorDrpDown();
                BindTypeOffStaff();
                BindPayType();
                BindUnitDrpDown();
                BindleaveDrpDown();
            }
        }

        public void radEmpSearch()
        {
            DataTable dt = bal.radEmpSearch(model);
            drpEmployeeSearch.Items.Clear();
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

        //Bind all dropdownlist
        /*public void BindAllEmployeeDropDownList(model)
        {
           

        }*/

        public void BindQualificationDrpDown()
        {
            DataTable dt = bal.BindQualificationDrpDown();
            drpQualification.Items.Clear();
            drpQualification.DataSource = dt;
            drpQualification.DataTextField = "QualificationName";
            drpQualification.DataValueField = "QualificationId";
            drpQualification.DataBind();
            drpQualification.Items.Insert(0, "--Select--");
            drpQualification.SelectedIndex = 0;
        }

        public void BindGenderDrpDown()
        {
            DataTable dt = bal.BindGenderDrpDown();
            drpGender.Items.Clear();
            drpGender.DataSource = dt;
            drpGender.DataTextField = "Gender";
            drpGender.DataValueField = "GID";
            drpGender.DataBind();
            drpGender.Items.Insert(0, "--Select--");
            drpGender.SelectedIndex = 0;

        }

        public void BindBloodGroupDrpDown()
        {
            DataTable dt = bal.BindBloodGroupDrpDown();
            drpBloodGroup.Items.Clear();
            drpBloodGroup.DataSource = dt;
            drpBloodGroup.DataTextField = "BloodGroup";
            drpBloodGroup.DataValueField = "BID";
            drpBloodGroup.DataBind();
            drpBloodGroup.Items.Insert(0, "--Select--");
            drpBloodGroup.SelectedIndex = 0;
        }


        public void BindMartialStatusDrpDown()
        {
            DataTable dt = bal.BindMartialStatusDrpDown();
            drpMaritalStatus.Items.Clear();
            drpMaritalStatus.DataSource = dt;
            drpMaritalStatus.DataTextField = "MaritalStatus";
            drpMaritalStatus.DataValueField = "MSID";
            drpMaritalStatus.DataBind();
            drpMaritalStatus.Items.Insert(0, "--Select--");
            drpMaritalStatus.SelectedIndex = 0;
        }

        public void BindDesignationDrpDown()
        {
            DataTable dt = bal.BindDesignationDrpDown();
            drpDesignation.Items.Clear();
            drpDesignation.DataSource = dt;
            drpDesignation.DataTextField = "DesignationName";
            drpDesignation.DataValueField = "DesignationId";
            drpDesignation.DataBind();
            drpDesignation.Items.Insert(0, "--Select--");
            drpDesignation.SelectedIndex = 0;

        }

        public void BindDepartmentDrpDown()
        {
            DataTable dt = bal.BindDepartmentDrpDown();
            drpDepartnamet.Items.Clear();
            drpDepartnamet.DataSource = dt;
            drpDepartnamet.DataTextField = "dname";
            drpDepartnamet.DataValueField = "did";
            drpDepartnamet.DataBind();
            drpDepartnamet.Items.Insert(0, "--Select--");
            drpDepartnamet.SelectedIndex = 0;

        }

        public void BindCategoryDrpDown()
        {
            DataTable dt = bal.BindCategoryDrpDown();
            drpCategory.Items.Clear();
            drpCategory.DataSource = dt;
            drpCategory.DataTextField = "CategoryName";
            drpCategory.DataValueField = "CategoryId";
            drpCategory.DataBind();
            drpCategory.Items.Insert(0, "--Select--");
            drpCategory.SelectedIndex = 0;
        }

        public void BindWeeklyOffDrpDown()
        {
            DataTable dt = bal.BindWeeklyOffDrpDown();
            drpWeeklyOff.Items.Clear();
            drpWeeklyOff.DataSource = dt;
            drpWeeklyOff.DataTextField = "WeekOff";
            drpWeeklyOff.DataValueField = "WID";
            drpWeeklyOff.DataBind();
            drpWeeklyOff.Items.Insert(0, "--Select--");
            drpWeeklyOff.SelectedIndex = 0;
        }

        public void BindContractorDrpDown()
        {
            DataTable dt = bal.BindContractorDrpDown();
            drpContractor.Items.Clear();
            drpContractor.DataSource = dt;
            drpContractor.DataTextField = "ContractorName";
            drpContractor.DataValueField = "ContractorId";
            drpContractor.DataBind();
            drpContractor.Items.Insert(0, "--Select--");
            drpContractor.SelectedIndex = 0;
        }

        public void BindTypeOffStaff()
        {
            DataTable dt = bal.BindTypeOffStaff();
            drpTypeOfStaff.Items.Clear();
            drpTypeOfStaff.DataSource = dt;
            drpTypeOfStaff.DataTextField = "TypeOfStaff";
            drpTypeOfStaff.DataValueField = "StaffId";
            drpTypeOfStaff.DataBind();
            drpTypeOfStaff.Items.Insert(0, "--Select--");
            drpTypeOfStaff.SelectedIndex = 0;
        }
        public void BindPayType()
        {
            DataTable dt = bal.BindPayType();
            drpPayType.Items.Clear();
            drpPayType.DataSource = dt;
            drpPayType.DataTextField = "PayTypeName";
            drpPayType.DataValueField = "PayTypeId";
            drpPayType.DataBind();
            drpPayType.Items.Insert(0, "--Select--");
            drpPayType.SelectedIndex = 0;
        }

        public void BindUnitDrpDown()
        {
            DataTable dt = bal.BindUnitDrpDown();
            drpUnit.Items.Clear();
            drpUnit.DataSource = dt;
            drpUnit.DataTextField = "UnitName";
            drpUnit.DataValueField = "UnitId";
            drpUnit.DataBind();
            drpUnit.Items.Insert(0, "--Select--");
            drpUnit.SelectedIndex = 0;
        }

        public void BindleaveDrpDown()
        {
            DataTable dt = bal.BindleaveDrpDown();
            drpLeaveRule.Items.Clear();
            drpLeaveRule.DataSource = dt;
            drpLeaveRule.DataTextField = "LeaveName";
            drpLeaveRule.DataValueField = "LeaveId";
            drpLeaveRule.DataBind();
            drpLeaveRule.Items.Insert(0, "--Select--");
            drpLeaveRule.SelectedIndex = 0;
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

        protected void btnNewItem_Click(object sender, EventArgs e)
        {
            Reset();
        }

        public void SetValues()
        {

            model.EmpCode = txtEmpCode.Text.ToString();
            model.FristName = txtFirstName.Text.ToString();
            model.MiddleName = txtMidName.Text.ToString();
            model.Title = txtTitle.Text.ToString();
            model.LastName = txtLastName.Text.ToString();
            model.ContactNo = txtContactNumber.Text.ToString();
            model.MobileNo = txtMobile.Text.ToString();
            model.EmailId = txtEmailID.Text.ToString();
            model.DOB = Convert.ToDateTime(txtDOB.Text.ToString());
            model.GID = Convert.ToInt32(drpGender.SelectedItem.Value);
            model.BloodGroupID = Convert.ToInt32(drpBloodGroup.SelectedItem.Value);
            model.MSID = Convert.ToInt32(drpMaritalStatus.SelectedItem.Value);
            model.CTC = Convert.ToInt32(txtCTC.Text.ToString());
            model.GrossAmount = Convert.ToInt32(txtGrossAmount.Text.ToString());
            model.TempAddress = txtTempAddress.Text.ToString();
            model.DocumentName = txtDocumentName.Text.ToString();
            model.TrainingDetails = txtTrainingDetails.Text.ToString();
            model.PanNo = txtPANNumber.Text.ToString();
            model.ESICACCNO = txtESICNumber.Text.ToString();
            if (radAutoMailNo.Checked == true)
            {
                model.AutoMail = radAutoMailNo.Text;
            }
            else
            {
                model.AutoMail = radAutoMailYes.Text;
            }
            model.LeaveId = Convert.ToInt32(drpLeaveRule.SelectedItem.Value);
            model.AttendanceID = Convert.ToInt32(txtAttendanceID.Text.ToString());
            model.EmpPhoto = "";

            model.DateofJoin = Convert.ToDateTime(txtDateOfJoin.Text.ToString());
            model.QualificationId = Convert.ToInt32(drpQualification.SelectedItem.Value);
            model.DesignationId = Convert.ToInt32(drpDesignation.SelectedItem.Value);
            model.did = Convert.ToInt32(drpDepartnamet.SelectedItem.Value);
            model.CategoryId = Convert.ToInt32(drpCategory.SelectedItem.Value);
            model.WID = Convert.ToInt32(drpWeeklyOff.SelectedItem.Value);
            model.ContractorId = Convert.ToInt32(drpContractor.SelectedItem.Value);
            model.StaffId = Convert.ToInt32(drpTypeOfStaff.SelectedItem.Value);
            model.PayTypeId = Convert.ToInt32(drpPayType.SelectedItem.Value);
            model.UnitId = Convert.ToInt32(drpUnit.SelectedItem.Value);
            model.AadharNo = Convert.ToInt32(txtAadharNumber.Text.ToString());
            model.Balance = Convert.ToInt32(txtBalance.Text.ToString());
            model.PermanentAddress = txtPerAddress.Text.ToString();
            model.Asset = txtAsset.Text.ToString();
            model.ApprasalHistory = txtApprasalHistory.Text.ToString();
            model.PFAccNo = txtPFAccount.Text.ToString();
            if (radIsLeftNo.Checked == true)
            {
                model.IsLeft = radIsLeftNo.Text;
            }
            else
            {
                model.IsLeft = radIsLeftYes.Text;
            }
            model.LeftDate = Convert.ToDateTime(txtLeftDate.Text.ToString());
            LoginUserMasterModel model1 = new LoginUserMasterModel();
            model.LoginUserId= Convert.ToInt32(Session["UserId"]);

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
            try
            {
                SetValues();
                int res = bal.InsertEmployeeData(model);
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

        public void FillEmployeeDetails()
        {
            try
            {
                model.EmpCode = drpEmployeeSearch.SelectedValue;
                DataTable dt = bal.FillEmployeeDetails(model);
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                SetValues();
                int res = bal.UpdateEmployeeData(model);
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
                Response.Write("<script language='JavaScript'>alert('" + ex.Message + "')</script>");
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //SetValues();
            model.EmpCode = (txtEmpCode.Text.ToString());
            //model.FristName = (txtFirstName.Text.ToString());
            int res = bal.DeleteEmployeeDetails(model);
            if (res == 1)
            {
                Response.Write("<script language='JavaScript'>alert('Record deleted Successfully!')</script>");
                //radEmpSearch();
                Reset();
            }
            else
            {
                Response.Write("<script language='JavaScript'>alert('Record not deleted!')</script>");
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

        protected void btnreport_Click(object sender, EventArgs e)
        {
            string EmpCode = drpEmployeeSearch.SelectedValue;

            Response.Redirect("../ReportForm/MasterReportForms.aspx?functionName=EmpDetail&EmpCode=" + EmpCode);
        }

        protected void btnUploadPhoto_Click(object sender, EventArgs e)
        {

        }
    }
}