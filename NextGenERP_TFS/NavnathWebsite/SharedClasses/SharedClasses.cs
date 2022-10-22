using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NavnathWebsite.SharedClasses
{
   
    public static class NavigateUrl
    {
        // MachineVsCheckPoint
        public static string RptMsvhinrVsCheckPointForm = "~/ReportForm/MasterReportForms.aspx?functionName=MachinveVsCheckPointAllData";
        public static string RptMsvhinrVsCheckPointCode = "~/ReportFiles/MachinveVsCheckPointAllDtl.rdlc";

        //RptMsvhinrVsCheckPointMachineWiseForm
        public static string RptMsvhinrVsCheckPointMachineWiseForm = "~/ReportForm/MasterReportForms.aspx?functionName=RptMsvhinrVsCheckPointMachineWise";
        public static string RptMsvhinrVsCheckPointMachineWiseCode = "~/ReportFiles/RptMsvhinrVsCheckPointMachineWise.rdlc";

        //RptMachineMaster
        public static string RptMachineMasterForm = "~/ReportForm/MasterReportForms.aspx?functionName=MachineMasterAllDtl";
        public static string RptMachineMasterCode = "~/ReportFiles/MachineMasterAllDtl.rdlc";

        //MachineMasterMachineWiseDtl
        public static string MachineMasterMachineWiseDtlForm = "~/ReportForm/MasterReportForms.aspx?functionName=MachineMasterMachineWiseDtl";
        public static string MachineMasterMachineWiseDtlCode = "~/ReportFiles/MachineMasterMachineWiseDtl.rdlc";

        // ItemMaster
        public static string RptItemMasterForm = "~/ReportForm/MasterReportForms.aspx?functionName=ItemMasterAllDtl";
        public static string RptItemMasterCode = "~/ReportFiles/ItemMasterAllDtl.rdlc";

        //ItemMasterItemWiseDtl
        public static string ItemMasterItemWiseDtlForm = "~/ReportForm/MasterReportForms.aspx?functionName=ItemMasterItemWiseDtl&ItemCode=";

        public static string ItemMasterItemWiseDtlCode = "~/ReportFiles/ItemMasterItemWiseDtl.rdlc";

        //EmployeeMasterCodeWiseDtl
        public static string EmployeeMasterCodeWiseDtlForm = "~/ReportForm/MasterReportForms.aspx?functionName=EmployeeMasterCodeWiseDtl&EmpCode=";
        public static string EmployeeMasterCodeWiseDtlCode = "~/ReportFiles/EmployeeMasterAllDtl.rdlc";

        //CustomerMasterCodeWiseDtl
        public static string CustomerMasterCodeWiseDtlForm = "~/ReportForm/MasterReportForms.aspx?functionName=CustomerMasterCodeWiseDtl&EmpCode=";
        public static string CustomerMasterCodeWiseDtlCode = "~/ReportFiles/CustomerMasterCodeWiseDtl.rdlc";


        //
        public static string EmployeeMasterAllDtlForm = "~/ReportForm/MasterReportForms.aspx?functionName=EmployeeMasterAllDtl";
        public static string EmployeeMasterAllDtlCode = "~/ReportFiles/EmployeeMasterCodeWiseDtl.rdlc";

        //SupplierPO
        public static string SupplierPOForm = "~/ReportForm/MasterReportForms.aspx?functionName=SupplierPO";
        public static string SupplierPOCode = "~/ReportFiles/RptSupplierPO.rdlc";

        //RptIndetDetailIReport.rdlc
        public static string RptIndetDetailIReportForm = "~/ReportForm/MasterReportForms.aspx?functionName=RptIndetDetailIReport";
        public static string RptIndetDetailIReportCode = "~/ReportFiles/RptIndetDetailIReport.rdlc";

    }
}