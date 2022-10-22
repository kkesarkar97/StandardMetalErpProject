using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using System.Data;
using NavnathWebsite.SharedClasses;
using BAL;
using Modal;
namespace NavnathWebsite.ReportForm
{
    public partial class MasterReportForms : System.Web.UI.Page
    {
        MasterReportFormBussiness balreport = new MasterReportFormBussiness();
        MasterFormsReportModal mod = new MasterFormsReportModal();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string funcationName = Request.QueryString["functionName"];
                if (funcationName == "MachinveVsCheckPointAllData")
                {

                    //string CompCode = Session["CmpCode"].ToString();
                   // _dbMaster.Supp_Code = Request.QueryString["SuppCode"].ToString();
                   // _dbMaster.Comp_Code = CompCode;
                   // _dbMaster.flag = 2;
                   // GetFinacialYearId();
                  //  _dbMaster.FinanacialYearID = YearId;
                    DataTable dt = balreport.MachinveVsCheckPointAllData();
                   // DataTable dt1 = new DataTable();
                    //dt1 = _MasterManager.GetCompanyDtls(CompCode);
                   // ReportDataSource rds1 = new ReportDataSource("DataSetForCompanyDetails", dt1);
                    ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath(NavigateUrl.RptMsvhinrVsCheckPointCode);
                    ReportViewer1.Width = 1060;
                    ReportViewer1.Height = 700;
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(rds);
                  //  ReportViewer1.LocalReport.DataSources.Add(rds1);
                    ReportViewer1.LocalReport.Refresh();

                
                }
                else if (funcationName == "ItemMasterAllDtl")
                {
                    DataTable dt = balreport.ItemMasterAllDtl();
                    ReportDataSource rds = new ReportDataSource("DataSet1",dt);
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath(NavigateUrl.RptItemMasterCode);
                    ReportViewer1.Width = 1060;
                    ReportViewer1.Height = 700;
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(rds);
                    ReportViewer1.LocalReport.Refresh();
                }
                else if (funcationName == "ItemMasterItemWiseDtl")
                {
                    string ItemCode = Request.QueryString["ItemCode"].ToString();
                    DataTable dt = balreport.ItemMasterItemWiseDtl(ItemCode);
                    ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath(NavigateUrl.ItemMasterItemWiseDtlCode);
                    ReportViewer1.Width = 1060;
                    ReportViewer1.Height = 700;
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(rds);
                    ReportViewer1.LocalReport.Refresh();
                }
                else if (funcationName == "EmployeeMasterCodeWiseDtl")
                {
                    string EmpCode = Request.QueryString["EmpCode"].ToString();
                    DataTable dt = balreport.EmployeeMasterCodeWiseDtl(EmpCode);
                    ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath(NavigateUrl.EmployeeMasterCodeWiseDtlCode);
                    ReportViewer1.Width = 1060;
                    ReportViewer1.Height = 700;
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(rds);
                    ReportViewer1.LocalReport.Refresh();
                }
                else if (funcationName == "EmployeeMasterAllDtl")
                {
                    DataTable dt = balreport.EmployeeMasterAllDtl();
                    ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath(NavigateUrl.EmployeeMasterAllDtlCode);
                    ReportViewer1.Width = 1060;
                    ReportViewer1.Height = 700;
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(rds);
                    ReportViewer1.LocalReport.Refresh();
                }
                else if (funcationName == "SupplierPO")
                {

                    mod.SupplierPONo = Request.QueryString["SupplierPONo"].ToString();
                    DataTable dt = balreport.SupplierPO(mod);
                    ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath(NavigateUrl.SupplierPOCode);
                    ReportViewer1.Width = 1060;
                    ReportViewer1.Height = 700;
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(rds);
                    ReportViewer1.LocalReport.Refresh();
                }
                else if (funcationName == "RptIndetDetailIReport")
                {

                    mod.IndentNoAutoGen = Request.QueryString["IndentNoAutoGen"].ToString();
                    DataTable dt = balreport.RptIndetDetailIReport(mod);
                    ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath(NavigateUrl.RptIndetDetailIReportCode);
                    ReportViewer1.Width = 1060;
                    ReportViewer1.Height = 700;
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(rds);
                    ReportViewer1.LocalReport.Refresh();
                }
                else if (funcationName == "RptMsvhinrVsCheckPointMachineWise")
                {

                    mod.MachineCode = Request.QueryString["MachineCode"].ToString();
                    DataTable dt = balreport.RptMsvhinrVsCheckPointMachineWise(mod);
                    ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath(NavigateUrl.RptMsvhinrVsCheckPointMachineWiseCode);
                    ReportViewer1.Width = 1060;
                    ReportViewer1.Height = 700;
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(rds);
                    ReportViewer1.LocalReport.Refresh();
                }
                else if (funcationName == "MachineMasterAllDtl")
                {
                    DataTable dt = balreport.MachineMasterAllDtl();
                    ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath(NavigateUrl.RptMachineMasterCode);
                    ReportViewer1.Width = 1060;
                    ReportViewer1.Height = 700;
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(rds);
                    ReportViewer1.LocalReport.Refresh();
                }
                else if (funcationName == "MachineMasterMachineWiseDtl")
                {
                    int SrNo = Convert.ToInt32(Request.QueryString["SrNo"].ToString());
                    DataTable dt = balreport.MachineMasterMachineWiseDtl(SrNo);
                    ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath(NavigateUrl.MachineMasterMachineWiseDtlCode);
                    ReportViewer1.Width = 1060;
                    ReportViewer1.Height = 700;
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(rds);
                    ReportViewer1.LocalReport.Refresh();
                }
                else if (funcationName == "CustomerMasterCodeWiseDtl")
                {
                    int Id = Convert.ToInt32(Request.QueryString["Id"].ToString());
                    DataTable dt = balreport.MachineMasterMachineWiseDtl(Id);
                    ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath(NavigateUrl.MachineMasterMachineWiseDtlCode);
                    ReportViewer1.Width = 1060;
                    ReportViewer1.Height = 700;
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(rds);
                    ReportViewer1.LocalReport.Refresh();
                }

                else if (funcationName == "ItemDetail")
                {
                    string ItemCode = Request.QueryString["ItemCode"].ToString();
                    DataTable dt = balreport.GetItemDetails(ItemCode);




                    ReportDataSource rds = new ReportDataSource("DataSet1", dt);
//                    ReportViewer1.LocalReport.ReportPath = Server.MapPath(NavigateUrl.MachineMasterMachineWiseDtlCode);
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath("../ReportFIles/RPT_GetItemDetail12Aug.rdlc");

                    ReportViewer1.Width = 1060;
                    ReportViewer1.Height = 700;
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(rds);
                    ReportViewer1.LocalReport.Refresh();
                }

                else if (funcationName == "EmpDetail")
                {
                    string EmpCode = Request.QueryString["EmpCode"].ToString();
                    DataTable dt = balreport.GetEmpDetail(EmpCode);




                    ReportDataSource rds = new ReportDataSource("DataSet1", dt);
                    //                    ReportViewer1.LocalReport.ReportPath = Server.MapPath(NavigateUrl.MachineMasterMachineWiseDtlCode);
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath("../ReportFIles/RPT_GetEmployee_Details.rdlc");

                    ReportViewer1.Width = 1060;
                    ReportViewer1.Height = 700;
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(rds);
                    ReportViewer1.LocalReport.Refresh();
                }






            
            }

        }
    }
}