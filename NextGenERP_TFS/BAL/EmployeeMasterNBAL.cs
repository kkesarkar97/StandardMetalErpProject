using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Modal;
using DAL;
using System.Data;

namespace BAL
{

    public class EmployeeMasterNBAL
    {
        EmployeeMasterNDAL dal = new EmployeeMasterNDAL();


        public DataTable radEmpSearch(EmployeeMasterNModel model)
        {
            return dal.radEmpSearch(model);
        }

       

        public DataTable BindQualificationDrpDown()
        {
            return dal.BindQualificationDrpDown();
        }

        public DataTable BindGenderDrpDown()
        {
            return dal.BindGenderDrpDown();
        }

        public DataTable BindBloodGroupDrpDown()
        {
            return dal.BindBloodGroupDrpDown();
        }

        public DataTable BindMartialStatusDrpDown()
        {
            return dal.BindMartialStatusDrpDown();
        }

        public DataTable BindDesignationDrpDown()
        {
            return dal.BindDesignationDrpDown();
        }

        public DataTable BindDepartmentDrpDown()
        {
            return dal.BindDepartmentDrpDown();
        }

        public DataTable BindCategoryDrpDown()
        {
            return dal.BindCategoryDrpDown();
        }

        public DataTable BindWeeklyOffDrpDown()
        {
            return dal.BindWeeklyOffDrpDown();
        }

        public DataTable BindContractorDrpDown()
        {
            return dal.BindContractorDrpDown();
        }

        public DataTable BindTypeOffStaff()
        {
            return dal.BindTypeOffStaff();
        }

        public DataTable BindPayType()
        {
            return dal.BindPayType();
        }

        public DataTable BindUnitDrpDown()
        {
            return dal.BindUnitDrpDown();
        }

        public DataTable BindleaveDrpDown()
        {
            return dal.BindleaveDrpDown();
        }

        public int InsertEmployeeData(EmployeeMasterNModel model)
        {
            return dal.InsertEmployeeData(model);
        }

        public int UpdateEmployeeData(EmployeeMasterNModel model)
        {
            return dal.UpdateEmployeeData(model);
        }

        public DataTable FillEmployeeDetails(EmployeeMasterNModel model)
        {
            return dal.FillEmployeeDetails(model);
        }

        public int DeleteEmployeeDetails(EmployeeMasterNModel model)
        {
            return dal.DeleteEmployeeDetails(model);
        }
    }   
}
