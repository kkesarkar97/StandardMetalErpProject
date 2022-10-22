using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Modal;
namespace DAL
{
    public class EmployeeMasterNDAL : ConncetionClass
    {
        
        public DataTable radEmpSearch(EmployeeMasterNModel model)
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindEmpSearch";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        



        //Binding QualificationDrpDown
        public DataTable BindQualificationDrpDown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindEmpQualification";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindGenderDrpDown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindEmpGender";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindBloodGroupDrpDown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindBloodGroup";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindMartialStatusDrpDown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindMartialStatus";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindDesignationDrpDown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindDesignation";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindDepartmentDrpDown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindDepartmentDrp";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindCategoryDrpDown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindCategoryMaster";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }

        }

        public DataTable BindWeeklyOffDrpDown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindWeekOff";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }

        }

        public DataTable BindContractorDrpDown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindContractorMaster";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }

        }

        public DataTable BindTypeOffStaff()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindTypeOffStaff";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }

        }
        public DataTable BindPayType()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindPayType";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindUnitDrpDown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindUnitType";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindleaveDrpDown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindLeaveRule";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public int InsertEmployeeData(EmployeeMasterNModel model)
        {
            LoginDetailsModel loginmodel = new LoginDetailsModel();
            
            SqlTransaction trans;
            this.Initialize();
            int NoOfRowsAffected = 0;
            using (cnUniversal)
            {
                cnUniversal.Open();
                trans = cnUniversal.BeginTransaction();
                try
                {
                    cmdUniversal = new SqlCommand("InsertEmployeeData2", cnUniversal, trans);
                    cmdUniversal.CommandType = CommandType.StoredProcedure;
                    SqlCommandBuilder.DeriveParameters(cmdUniversal);
                    cmdUniversal.Parameters["@EmpCode"].Value = model.EmpCode;
                    cmdUniversal.Parameters["@Title"].Value = model.Title;
                    cmdUniversal.Parameters["@FristName"].Value = model.FristName;
                    cmdUniversal.Parameters["@MiddleName"].Value = model.MiddleName;
                    cmdUniversal.Parameters["@LastName"].Value = model.LastName;
                    cmdUniversal.Parameters["@ContactNo"].Value = model.ContactNo;
                    cmdUniversal.Parameters["@MobileNo"].Value = model.MobileNo;
                    cmdUniversal.Parameters["@EmailId"].Value = model.EmailId;
                    cmdUniversal.Parameters["@DOB"].Value = model.DOB;
                    cmdUniversal.Parameters["@GenderID"].Value = model.GID;
                    cmdUniversal.Parameters["@BloodGroupID"].Value = model.BloodGroupID;
                    cmdUniversal.Parameters["@MaritalStatusID"].Value = model.MSID;
                    cmdUniversal.Parameters["@CTC"].Value = model.CTC;
                    cmdUniversal.Parameters["@GrossAmount"].Value = model.GrossAmount;
                    cmdUniversal.Parameters["@TempAddress"].Value = model.TempAddress;
                    cmdUniversal.Parameters["@DocumentName"].Value = model.DocumentName;
                    cmdUniversal.Parameters["@TrainingDetails"].Value = model.TrainingDetails;
                    cmdUniversal.Parameters["@PanNo"].Value = model.PanNo;
                    cmdUniversal.Parameters["@ESICACCNO"].Value = model.ESICACCNO;
                    cmdUniversal.Parameters["@AutoMail"].Value = model.AutoMail;
                    cmdUniversal.Parameters["@LeaveRule"].Value = model.LeaveId;
                    cmdUniversal.Parameters["@AttendanceID"].Value = model.AttendanceID;
                    cmdUniversal.Parameters["@EmpPhoto"].Value = model.EmpPhoto;
                    cmdUniversal.Parameters["@DateofJoin"].Value = model.DateofJoin;
                    cmdUniversal.Parameters["@Qualification"].Value = model.QualificationId;
                    cmdUniversal.Parameters["@Designation"].Value = model.DesignationId;
                    cmdUniversal.Parameters["@DepartmentID"].Value = model.did;
                    cmdUniversal.Parameters["@Category"].Value = model.CategoryId;
                    cmdUniversal.Parameters["@WeekOffID"].Value = model.WID;
                    cmdUniversal.Parameters["@Contractor"].Value = model.ContractorId;
                    cmdUniversal.Parameters["@TypeofStaff"].Value = model.StaffId;
                    cmdUniversal.Parameters["@PayType"].Value = model.PayTypeId;
                    cmdUniversal.Parameters["@Unit"].Value = model.UnitId;
                    cmdUniversal.Parameters["@AadharNo"].Value = model.AadharNo;
                    cmdUniversal.Parameters["@Balance"].Value = model.Balance;
                    cmdUniversal.Parameters["@PermanentAddress"].Value = model.PermanentAddress;
                    cmdUniversal.Parameters["@Asset"].Value = model.Asset;
                    cmdUniversal.Parameters["@ApprasalHistory"].Value = model.ApprasalHistory;
                    cmdUniversal.Parameters["@PFAccNo"].Value = model.PFAccNo;
                    cmdUniversal.Parameters["@IsLeft"].Value = model.IsLeft;
                    cmdUniversal.Parameters["@LeftDate"].Value = model.LeftDate;
                    cmdUniversal.Parameters["@LoginUserId"].Value = model.LoginUserId;
                    NoOfRowsAffected =cmdUniversal.ExecuteNonQuery();
                    trans.Commit();
                    this.Close();
                    return NoOfRowsAffected;
                }
                catch (Exception ex)
                {
                    trans.Rollback();
                    cnUniversal.Close();
                    return NoOfRowsAffected = 0;
                }
            }
        }

        public int UpdateEmployeeData(EmployeeMasterNModel empModel)
        {
            SqlTransaction trans;
            this.Initialize();
            int NoOfRowsAffected = 0;
            using (cnUniversal)
            {
                cnUniversal.Open();
                trans = cnUniversal.BeginTransaction();
                try
                {
                    cmdUniversal = new SqlCommand("UpdateEmployeeData1", cnUniversal, trans);
                    cmdUniversal.CommandType = CommandType.StoredProcedure;
                    SqlCommandBuilder.DeriveParameters(cmdUniversal);
                    cmdUniversal.Parameters["@EmpCode"].Value = empModel.EmpCode;
                    cmdUniversal.Parameters["@Title"].Value = empModel.Title;
                    cmdUniversal.Parameters["@FristName"].Value = empModel.FristName;
                    cmdUniversal.Parameters["@MiddleName"].Value = empModel.MiddleName;
                    cmdUniversal.Parameters["@LastName"].Value = empModel.LastName;
                    cmdUniversal.Parameters["@ContactNo"].Value = empModel.ContactNo;
                    cmdUniversal.Parameters["@MobileNo"].Value = empModel.MobileNo;
                    cmdUniversal.Parameters["@EmailId"].Value = empModel.EmailId;
                    cmdUniversal.Parameters["@DOB"].Value = empModel.DOB;
                    cmdUniversal.Parameters["@GenderID"].Value = empModel.GID;
                    cmdUniversal.Parameters["@BloodGroupID"].Value = empModel.BloodGroupID;
                    cmdUniversal.Parameters["@MaritalStatusID"].Value = empModel.MSID;
                    cmdUniversal.Parameters["@CTC"].Value = empModel.CTC;
                    cmdUniversal.Parameters["@GrossAmount"].Value = empModel.GrossAmount;
                    cmdUniversal.Parameters["@TempAddress"].Value = empModel.TempAddress;
                    cmdUniversal.Parameters["@DocumentName"].Value = empModel.DocumentName;
                    cmdUniversal.Parameters["@TrainingDetails"].Value = empModel.TrainingDetails;
                    cmdUniversal.Parameters["@PanNo"].Value = empModel.PanNo;
                    cmdUniversal.Parameters["@ESICACCNO"].Value = empModel.ESICACCNO;
                    cmdUniversal.Parameters["@AutoMail"].Value = empModel.AutoMail;
                    cmdUniversal.Parameters["@LeaveRule"].Value = empModel.LeaveId;
                    cmdUniversal.Parameters["@AttendanceID"].Value = empModel.AttendanceID;
                    cmdUniversal.Parameters["@EmpPhoto"].Value = empModel.EmpPhoto;
                    cmdUniversal.Parameters["@DateofJoin"].Value = empModel.DateofJoin;
                    cmdUniversal.Parameters["@Qualification"].Value = empModel.QualificationId;
                    cmdUniversal.Parameters["@Designation"].Value = empModel.DesignationId;
                    cmdUniversal.Parameters["@DepartmentID"].Value = empModel.did;
                    cmdUniversal.Parameters["@Category"].Value = empModel.CategoryId;
                    cmdUniversal.Parameters["@WeekOffID"].Value = empModel.WID;
                    cmdUniversal.Parameters["@Contractor"].Value = empModel.ContractorId;
                    cmdUniversal.Parameters["@TypeofStaff"].Value = empModel.StaffId;
                    cmdUniversal.Parameters["@PayType"].Value = empModel.PayTypeId;
                    cmdUniversal.Parameters["@Unit"].Value = empModel.UnitId;
                    cmdUniversal.Parameters["@AadharNo"].Value = empModel.AadharNo;
                    cmdUniversal.Parameters["@Balance"].Value = empModel.Balance;
                    cmdUniversal.Parameters["@PermanentAddress"].Value = empModel.PermanentAddress;
                    cmdUniversal.Parameters["@Asset"].Value = empModel.Asset;
                    cmdUniversal.Parameters["@ApprasalHistory"].Value = empModel.ApprasalHistory;
                    cmdUniversal.Parameters["@PFAccNo"].Value = empModel.PFAccNo;
                    cmdUniversal.Parameters["@IsLeft"].Value = empModel.IsLeft;
                    cmdUniversal.Parameters["@LeftDate"].Value = empModel.LeftDate;
                    cmdUniversal.Parameters["@LoginUserId"].Value = empModel.LoginUserId;
                    NoOfRowsAffected = cmdUniversal.ExecuteNonQuery();
                    trans.Commit();
                    this.Close();
                    return NoOfRowsAffected;
                }
                catch (Exception ex)
                {
                    trans.Rollback();
                    cnUniversal.Close();
                    return NoOfRowsAffected = 0;
                }
            }
        }

        public DataTable FillEmployeeDetails(EmployeeMasterNModel model)
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "FillEmployeeDetails";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                cmdUniversal.Parameters.Add("@EmpCode", SqlDbType.VarChar, 100).Value = model.EmpCode;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }

        }

        public int DeleteEmployeeDetails(EmployeeMasterNModel model)
        {
            DataTable dt = new DataTable();

            this.Initialize();
            int NoOfRowsAffected = 0;
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "DeleteEmployeeDetails";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                cmdUniversal.Parameters.AddWithValue("@EmpCode", model.EmpCode);
                //cmdUniversal.Parameters.AddWithValue("@FristName", model.FristName);
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return NoOfRowsAffected = 1;
            }
        }
    }
}