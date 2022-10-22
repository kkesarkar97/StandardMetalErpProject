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
using System.Collections;
using NavnathWebsite.SharedClasses;
namespace NavnathWebsite.Masters
{
    public partial class MachineVsCheckPointMaster : System.Web.UI.Page
    {
        MachineVsCheckPointBusiness MVCBusiness = new MachineVsCheckPointBusiness();
        MachineVsCheckPointModel MVCModel = new MachineVsCheckPointModel();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["DataBind"] = null; 
                BindMachineCode();
                BindMachineName();
            }
        }

        public void GetMachineVsCheckPoint()
        {
            try
            {
                MVCModel.cid = Convert.ToInt32(drpMachineSearch.SelectedValue);

                DataTable dt = MVCBusiness.GetMachineVsCheckPoint(MVCModel);
                if (dt.Rows.Count > 0)
                {

                    drpMachineCode.SelectedValue = dt.Rows[0]["MachineCode"].ToString();
                    //drpMachineName.SelectedValue = dt.Rows[0]["MachineName"].ToString();
                    txtLocation.Text = dt.Rows[0]["Location"].ToString();
                    txtParameter.Text = dt.Rows[0]["Parameter"].ToString();
                    txtCheckPoint.Text = dt.Rows[0]["Check_Point"].ToString();
                    drpPlanType.SelectedValue = dt.Rows[0]["PlanType"].ToString();
                    //drpSchedule.SelectedValue = dt.Rows[0]["Scheduler"].ToString();
                    foreach (DataRow myRow in dt.Rows)
                    {
                        lstSchedule.Items.Add(new ListItem(myRow["Scheduler"].ToString()));
                    }
                    txtSerialNumber.Text=dt.Rows[0]["SrNo"].ToString();

                }

            }

            catch (Exception ex)
            {
                
            }

        }

        public int DuplicateEntryData()
        {
            try
            {
                MVCModel.MachineCode = drpMachineCode.SelectedValue;
                MVCModel.PlanType = drpPlanType.SelectedValue;
                MVCModel.Check_Point= txtCheckPoint.Text;
                DataTable dt = MVCBusiness.DuplicateEntryData(MVCModel);
                if (dt.Rows.Count > 0)
                {
                    lblCheckptError.Text = "Duplicate Entry Found in Database";
                    return 1;
                }
                else
                {
                   // DuplicateEntry();
                    return 0;
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script language='JavaScript'>alert('" + ex.Message + "')</script>");
            }
            return 0;
        }

        public void BindMachineName()
        {
            DataTable dt = MVCBusiness.BindMachineName(MVCModel);
            drpMachineCode.DataSource = dt;
            
            drpMachineCode.DataTextField = "MachineNo";
            drpMachineCode.DataValueField = "MachineNo";
            drpMachineCode.DataBind();
            drpMachineCode.Items.Insert(0, "Select");
            drpMachineCode.SelectedIndex = 0;


            drpMachineName.DataSource = dt;
            drpMachineName.DataTextField = "MachineName";
            drpMachineName.DataValueField = "MachineNo";
            drpMachineName.DataBind();
            drpMachineName.Items.Insert(0,"Select");
            drpMachineName.SelectedIndex = 0;
          
        }

        public void BindMachineCode()
        {
            DataTable dt = MVCBusiness.BindMachineCode(MVCModel);
            drpMachineSearch.DataSource = dt;
            drpMachineSearch.DataBind();
            drpMachineSearch.DataTextField = "MachineCode";
            drpMachineSearch.DataValueField = "cid";
            drpMachineSearch.DataBind();
            drpMachineSearch.Items.Insert(0, "Select");
            drpMachineSearch.SelectedIndex = 0;
        }


        //public void BindSchedular()
        //{
        //    ArrayList WeekDays = new ArrayList();
        //    WeekDays.Add("Monday");
        //    WeekDays.Add("Tuesday");
        //    WeekDays.Add("Wednesday");
        //    WeekDays.Add("Thursday");
        //    WeekDays.Add("Friday");
        //    WeekDays.Add("Saturday");
        //    WeekDays.Add("Sunday");


        //    ArrayList Monthly = new ArrayList();
        //    Monthly.Add("January");
        //    Monthly.Add("February");
        //    Monthly.Add("March");
        //    Monthly.Add("April");
        //    Monthly.Add("May");
        //    Monthly.Add("June");
        //    Monthly.Add("July");
        //    Monthly.Add("August");
        //    Monthly.Add("Septeber");
        //    Monthly.Add("October");
        //    Monthly.Add("November");
        //    Monthly.Add("December");

        //    drpSchedule.Items.Clear();
        //    if (drpPlanType.SelectedValue == "Weekly")
        //    {
        //        foreach (var val in WeekDays)
        //        {
        //            drpSchedule.Items.Add(val.ToString());
        //        }
        //    }
        //    else
        //         Monthly, Quaterly, Half Year, Yearly
        //        if (drpPlanType.SelectedValue == "Quaterly" || drpPlanType.SelectedValue == "Half Year" || drpPlanType.SelectedValue == "Yearly")
        //        {
        //            foreach (var val in Monthly)
        //            {
        //                drpSchedule.Items.Add(val.ToString());
        //            }
        //        }
        //        else
        //             cmbShceduler.DataSource = WeekDays;
        //            if (drpPlanType.SelectedValue == "Monthly" || drpPlanType.SelectedValue == "By Weekly" || drpPlanType.SelectedValue == "Daily")
        //            {

        //                for (int i = 1; i <= 31; i++)
        //                {
        //                    drpSchedule.Items.Add(i.ToString());
        //                }
        //            }
        //}




        public void BindSchedular()
        {
            ArrayList WeekDays = new ArrayList();
            WeekDays.Add("Monday");
            WeekDays.Add("Tuesday");
            WeekDays.Add("Wednesday");
            WeekDays.Add("Thursday");
            WeekDays.Add("Friday");
            WeekDays.Add("Saturday");
            WeekDays.Add("Sunday");


            ArrayList Monthly = new ArrayList();
            Monthly.Add("January");
            Monthly.Add("February");
            Monthly.Add("March");
            Monthly.Add("April");
            Monthly.Add("May");
            Monthly.Add("June");
            Monthly.Add("July");
            Monthly.Add("August");
            Monthly.Add("Septeber");
            Monthly.Add("October");
            Monthly.Add("November");
            Monthly.Add("December");


            drpSchedule.Items.Clear();
            if (drpPlanType.SelectedValue == "Weekly")
            {
                foreach (var val in WeekDays)
                {
                    drpSchedule.Items.Add(val.ToString());
                }
            }
            else
                // Monthly, Quaterly, Half Year, Yearly
                if (drpPlanType.SelectedValue== "Quaterly" || drpPlanType.SelectedValue == "Half Year" || drpPlanType.SelectedValue == "Yearly")
                {
                    foreach (var val in Monthly)
                    {
                        drpSchedule.Items.Add(val.ToString());
                    }
                }
                else
                    // cmbShceduler.DataSource = WeekDays;
                    if (drpPlanType.SelectedValue == "Monthly" || drpPlanType.SelectedValue == "By Weekly" || drpPlanType.SelectedValue == "Daily")
                    {

                        for (int i = 1; i <= 31; i++)
                        {
                            drpSchedule.Items.Add(i.ToString());
                        }
                    }



        }



        //ValidatePlanType()
        public bool ValidatePlanType()
        {


            if (drpPlanType.SelectedValue == "By Weekly" && lstSchedule.Items.Count <= 1)
            {
                return true;
            }
            else
                if (drpPlanType.SelectedValue== "Weekly" && lstSchedule.Items.Count <= 3)
                {
                    return true;
                }
                else
                    if (drpPlanType.SelectedValue == "Daily" && lstSchedule.Items.Count <= 29)
                    {
                        return true;
                    }
                    else
                        if (drpPlanType.SelectedValue == "Monthly" && lstSchedule.Items.Count <= 11)
                        {
                            return true;
                        }
                        else
                            if (drpPlanType.SelectedValue == "Quaterly" && lstSchedule.Items.Count <= 3)
                            {
                                return true;
                            }
                            else
                                if (drpPlanType.SelectedValue == "Half Year" && lstSchedule.Items.Count <= 1)
                                {
                                    return true;
                                }
                                else
                                    if (drpPlanType.SelectedValue == "Yearly" && lstSchedule.Items.Count <= 0)
                                    {
                                        return true;
                                    }
                                    else
                                    {
                                        return false;
                                    }
        }


        public void ResetValues()
        {
            drpMachineCode.Items.Clear();
            drpMachineName.Items.Clear();
            txtCheckPoint.Text = string.Empty;
            txtLocation.Text = string.Empty;
            txtSerialNumber.Text = string.Empty;
            txtParameter.Text = string.Empty;
            drpSchedule.Items.Clear();
            drpPlanType.Items.Clear();
            lstSchedule.Items.Clear();

        }

        public void SetValues()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)ViewState["DataBind"];

            List<MachineVsCheckPointModel> lst = new List<MachineVsCheckPointModel>();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                lst.Add(
                    new MachineVsCheckPointModel()
                    {
                        MachineCode = dt.Rows[i]["ID1"].ToString(),
                        Location = dt.Rows[i]["ID7"].ToString(),
                        Parameter = dt.Rows[i]["ID6"].ToString(),
                        Check_Point = dt.Rows[i]["ID3"].ToString(),
                        PlanType = dt.Rows[i]["ID4"].ToString(),
                        Scheduler = dt.Rows[i]["ID5"].ToString(),
                        SrNo = Convert.ToInt32(dt.Rows[i]["ID8"].ToString()),
                        CmpName = "Cmp1",
                        IPAddress = Request.UserHostAddress,
                        UserName = "Amol",
                        Password = "Amol123",
                        FinancialYear = DateTime.Now.Year
                    }
                    );
            }

            MVCModel.AllData = lst;
           
         }


        public void AllMachineVsCheckPoint()
        {

            try
            {
                SetValues();
                DataTable dt = MVCBusiness.AllMachineVsCheckPoint(MVCModel);
                grdMVCDetailis.DataSource = dt;
                Response.Write("<script language='JavaScript'>alert('Record Save')</script>");
            }
            catch(Exception ex)
            {
                Response.Write("<script language='JavaScript'>alert('" + ex.Message + "')</script>");
            }

        }

















        protected void drpMachineSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetMachineVsCheckPoint();
            //BindMachineName();
        }

        protected void btnMachineSearch_Click(object sender, EventArgs e)
        {
            GetMachineVsCheckPoint();
            //BindSchedular();
            //BindMachineName();
        }

        

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
           int res= DuplicateEntryData();
            try
            {
                if (res==0)
                {
                    BindData();
                    //ResetValues();
                }

            }

            catch (Exception ex)
            {

            }
        }


        protected void BindData()
        {
            DataTable DtToCheck = (DataTable)ViewState["DataBind"];
            DataTable dt = CreateTable();
            string listitems = "";
            //if (ddlMC.SelectedValue.Text.ToString() != "Select" && ddlMN.SelectedValue.Text.ToString() != "Select")
            //{
            //    if (CheckListCount())
            //    {
            //        if (DuplicateCheckPoint() != 1)
            //        {

                      //  foreach (var name in lstbSM.Items)
                     //   {
                     //       listitems = listitems + name.ToString() + ",";
                      //  }
                        dt.Rows.Add();
                        dt.Rows[0]["ID1"] = drpMachineCode.SelectedItem.Text;
                        dt.Rows[0]["ID2"] = drpMachineName.SelectedItem.Text;
                        dt.Rows[0]["ID3"] = txtCheckPoint.Text;
                        dt.Rows[0]["ID4"] = drpPlanType.SelectedItem.Text;
                        string strval = "";
                        foreach (var val in lstSchedule.Items)
                        {
                            strval += val + ",";
                        }
                        dt.Rows[0]["ID5"] = strval;
                        dt.Rows[0]["ID6"] = txtParameter.Text;
                        dt.Rows[0]["ID7"] = txtLocation.Text;
                        dt.Rows[0]["ID8"] = txtSerialNumber.Text;

                        if (ViewState["DataBind"] == null)
                        {
                            BindList(dt);
                         //   ResetMVCP();
                          //  rfvSelectMonth.Enabled = true;

                        }
                        else
                        {
                            dt.Merge(DtToCheck);
                            BindList(dt);
                          //  ResetMVCP();
                         //   rfvSelectMonth.Enabled = true;
                        }

                   // }
                   // else
                   // {
                       // lblChkp.Text = "check point already exist";
                    //    lblChkp.Visible = true;
                     //   txtCheckPoint.Text = string.Empty; txtCheckPoint.Focus();
                    //}

                

              //  else
               // {
                 //   lstbSM.Items.Clear();
                  //  Monthflag = 0;
                 //   ddlSM.Focus();
             //   }
           // }

        }

        protected void BindList(DataTable dt)
        {


            ViewState["DataBind"] = dt;
            
            grdMVCDetailis.DataSource = dt;
            grdMVCDetailis.DataBind();
            if (grdMVCDetailis.Rows.Count == 0)
                ViewState["DataBind"] = null;
        }

        protected DataTable CreateTable()
        {
         DataTable    dt1 = new DataTable();
            for (int i = 1; i <= 8; i++)
            {
                string ID = "ID" + i;
                dt1.Columns.Add(ID);
            }
            return dt1;
        }

        protected void drpPlanType_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSchedular();
        }

        protected void AddSchedule_Click(object sender, EventArgs e)
        {
            if (ValidatePlanType())
            {
                lstSchedule.Items.Add(drpSchedule.SelectedValue.ToString());
            }
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            ResetValues();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //AllMachineVsCheckPoint();

            try
            {
                SetValues();

                int res = MVCBusiness.InsertMachineVsCheckPoint(MVCModel);
                if (res == 1)
                {
                  
                   // BindMachineCode();

                }
                else
                {
                 
                }

            }
            catch (Exception ex)
            {
              
            }


        }

        protected void grdMVCDetailis_RowCommand(object sender, GridViewCommandEventArgs e)
        {


            try
            {
                DataTable dt=new DataTable();
                if (e.CommandName == "Remove")
                {
                    LinkButton  TempLabel = new LinkButton();
                     //  GridViewRow grid_SelectedRow = GridView1.SelectedRow;
                    int index = Convert.ToInt32(e.CommandArgument);
                    // int Index = grid_SelectedRow.RowIndex;
                    dt = (DataTable)ViewState["DataBind"];
                    dt.Rows.RemoveAt(index);
                    BindList(dt);
                }
 
                 
            }
            catch (Exception ex)
            {

            }
        }

        protected void txtCheckPoint_TextChanged(object sender, EventArgs e)
        {
            if (!DuplicateEntry())
            {
                lblCheckptError.Text = "Check point is already exist in Grid";
            }
        }

        public bool DuplicateEntry()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)ViewState["DataBind"];
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                       if (dt.Rows[i]["ID1"].ToString() == drpMachineCode.SelectedValue && dt.Rows[i]["ID4"].ToString() == drpPlanType.SelectedValue && dt.Rows[i]["ID3"].ToString() == txtCheckPoint.Text)
                            {
                                return false;
                                break;
                            }
                    }
                }
            }
            return true;
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {

            Response.Redirect(NavigateUrl.RptMsvhinrVsCheckPointForm);   
        }


        protected void BtnMachineWise_Click(object sender, EventArgs e)
        {
            if (drpMachineSearch.SelectedValue != "Select")
            {
                Response.Redirect(NavigateUrl.RptMsvhinrVsCheckPointMachineWiseForm + "&MachineCode=" + drpMachineSearch.SelectedItem.ToString());
            }
            else
            {
                Response.Write("<script> alert('Please Select Machine Code First')</script>");
            }
        }

        protected void RemoveSchedule_Click(object sender, EventArgs e)
        {
            List<ListItem> deletedItems = new List<ListItem>();
            foreach(ListItem Item in lstSchedule.Items)
            {
                if(Item.Selected)
                {
                    deletedItems.Add(Item);
                }
            }
            foreach (ListItem Item in deletedItems)
            {
                lstSchedule.Items.Remove(Item);
            }
        }

        protected void drpMachineCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                drpMachineName.SelectedValue = drpMachineCode.SelectedValue;
            }
            catch(Exception ex)
            { 
            
            }
        }

        protected void drpMachineName_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                drpMachineCode.SelectedValue = drpMachineName.SelectedValue;
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }














    }
}