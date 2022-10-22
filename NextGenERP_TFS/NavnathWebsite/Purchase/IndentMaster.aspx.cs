using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BAL;
using Modal;
using CommonUtilities;

namespace NavnathWebsite.Purchase
{
    public partial class IndentMaster : System.Web.UI.Page
    {
        IndentMasterBAL IndentBussiness = new IndentMasterBAL();
        IndentMasterModel IndentModel = new IndentMasterModel();
        DataTable DtToCheck = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtTime.Text = DateTime.Now.ToString("hh:mm tt");
            txtIndentDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
            txtRequirdDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
            if (!IsPostBack)
            {
                DtToCheck = null;
                CalendarExtender2.StartDate = DateTime.Now;



                ViewState["DataBind"] = new DataTable();
                GetMaxIndentNumber();
                BindDepartment();
                BindEmployee();
                BindIndentNumber();
                BindItemMaster();
                BindUnit();
                BindIndentType();

                btnUpdate.Enabled = false;
                btnDelete.Enabled = false;
                btnCancel.Enabled = true;
                btnSave.Enabled = true;
                btnNew.Enabled = true;
                txtSpecification.Enabled = false;
                txtDrowingNo.Enabled = false;
                txtRequiredQuantity.Enabled = false;
            }
        }

        public void GetMaxIndentNumber()
        {
            DataTable dttl = new DataTable();
            dttl = IndentBussiness.GetMaxIndentNumber(IndentModel);
            string raw = "0";
            string IndentNoAutoGen = string.Empty;
            long maxno = 0;
            if (dttl.Rows.Count > 0 && dttl.Rows[0].IsNull("IndentNoAutoGen") == false)
            {
                IndentNoAutoGen = Convert.ToString(dttl.Rows[0]["IndentNoAutoGen2"]);
                maxno = Convert.ToInt64(IndentNoAutoGen);
                maxno = maxno + 1;
                IndentNoAutoGen = Convert.ToString(maxno);
                IndentNoAutoGen = IndentNoAutoGen.PadLeft(4, '0');

                IndentNoAutoGen = "PMRSMP" + IndentNoAutoGen;

            }
            txtIndentNumber.Text = Convert.ToString(IndentNoAutoGen);

        }

        public void BindIndentNumber()
        {
            DataTable dt = new DataTable();
            dt = IndentBussiness.BindIndentNumber(IndentModel);
            drpIndentNumber.Items.Clear();
            drpIndentNumber.DataSource = dt;
            drpIndentNumber.DataTextField = "IndentNoAutoGen";
            drpIndentNumber.DataValueField = "IndentId";
            drpIndentNumber.DataBind();
            drpIndentNumber.Items.Insert(0, "Select");
            drpIndentNumber.SelectedIndex = 0;
        }


        public void BindItemMaster()
        {
            DataTable dt = new DataTable();
            dt = IndentBussiness.BindItemMaster(IndentModel);
            drpItemName.DataSource = dt;
            drpItemName.DataTextField = "ItemDescription";
            drpItemName.DataValueField = "ItemCode";
            drpItemName.DataBind();
            drpItemName.Items.Insert(0, "Select");
            drpItemName.SelectedIndex = 0;

            drpItemCode.DataSource = dt;
            drpItemCode.DataTextField = "ItemCode";
            drpItemCode.DataValueField = "ItemCode";
            drpItemCode.DataBind();
            drpItemCode.Items.Insert(0, "Select");
            drpItemCode.SelectedIndex = 0;
        }

        public void BindDepartment()
        {
            DataTable dt = new DataTable();
            dt = IndentBussiness.BindDepartment(IndentModel);
            drpDepartment1.DataSource = dt;
            drpDepartment1.DataTextField = "dname";
            drpDepartment1.DataValueField = "did";
            drpDepartment1.DataBind();
            drpDepartment1.Items.Insert(0, "Select");
            drpDepartment1.SelectedIndex = 0;
        }

        public void BindUnit()
        {
            DataTable dt = new DataTable();
            dt = IndentBussiness.BindUnit(IndentModel);
            drpRequiredQuentityUnit.DataSource = dt;
            drpRequiredQuentityUnit.DataTextField = "UnitName";
            drpRequiredQuentityUnit.DataValueField = "UnitId";
            drpRequiredQuentityUnit.DataBind();
            drpRequiredQuentityUnit.Items.Insert(0, "Select");
            drpRequiredQuentityUnit.SelectedIndex = 0;
        }
        //BindEmployee
        public void BindEmployee()
        {
            DataTable dt = new DataTable();
            dt = IndentBussiness.BindEmployee(IndentModel);
            drpPrepairedByName.DataSource = dt;
            drpPrepairedByName.DataTextField = "EmpName";
            drpPrepairedByName.DataValueField = "EmpCode";
            drpPrepairedByName.DataBind();
            drpPrepairedByName.Items.Insert(0, "Select");
            drpPrepairedByName.SelectedValue = Session["EmpCode"].ToString();
            drpPrepairedByName.Enabled = false;

            drpPrepairedByCode.DataSource = dt;
            drpPrepairedByCode.DataTextField = "EmpCode";
            drpPrepairedByCode.DataValueField = "EmpCode";
            drpPrepairedByCode.DataBind();
            drpPrepairedByCode.Items.Insert(0, "Select");
            drpPrepairedByCode.SelectedValue = Session["EmpCode"].ToString();
            drpPrepairedByCode.Enabled = false;

        }

        public void FindCurrentStock()
        {
            IndentModel.ItemCode = drpItemCode.SelectedValue;
            IndentModel.Branch = Session["Branch"].ToString();
            DataTable dt = new DataTable();
            dt = IndentBussiness.FindCurrentStock(IndentModel);
            if (dt.Rows.Count > 0)
            {
                lblCurrentStock.Text = dt.Rows[0]["CurrentQty"].ToString();
            }
            else
            {
                lblCurrentStock.Text = "0";
            }
        }

        public void BindIndentType()
        {
            DataTable dt = new DataTable();
            dt = IndentBussiness.BindIndentType(IndentModel);
            drpIndetType.DataSource = dt;
            drpIndetType.DataTextField = "IndentType";
            drpIndetType.DataValueField = "IndentTypeId";
            drpIndetType.DataBind();
            drpIndetType.Items.Insert(0, "Select");
            drpIndetType.SelectedIndex = 0;
        }

        protected void drpItemName_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                txtSpecification.Enabled = true;
                txtDrowingNo.Enabled = true;
                txtRequiredQuantity.Enabled = true;
                drpItemCode.SelectedValue = drpItemName.SelectedValue;
                if (drpItemCode.SelectedValue != "Select")
                {
                    FindCurrentStock();
                    BindGridIndentDetails(drpItemName.SelectedValue);
                }          

            }
             
            catch (Exception ex)
            {

            }
        }

        protected void drpItemCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
              
                drpItemName.SelectedValue = drpItemCode.SelectedValue;
                if (drpItemCode.SelectedValue != "Select")
                {
                    FindCurrentStock();
                    BindGridIndentDetails(drpItemCode.SelectedValue);
                }
            }
            catch (Exception ex)
            {

            }

        }

        protected void drpPrepairedByCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                drpPrepairedByName.SelectedValue = drpPrepairedByCode.SelectedValue;
               }
            catch (Exception ex)
            {

            }

        }

        protected void drpPrepairedByName_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                drpPrepairedByCode.SelectedValue = drpPrepairedByName.SelectedValue;
            }
            catch (Exception ex)
            {

            }

        }

        private bool CheckDuplicateInGrid()
        {
            bool IsDuplicate = false;

            DataTable dt = (DataTable)ViewState["DataBind"];

            if (dt.Rows.Count == 0)
            {
                return false;
            }

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["ID1"].ToString() == drpItemCode.SelectedValue)
                {

                    return true;
                }
            }
            return IsDuplicate;
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            try
            {
                if (!CheckDuplicateInGrid())
                {
                    BindData();
                    ResetIndentDetails();
                
                }
                else { 
                
                }
                
                
            }
            catch (Exception ex)
            {

            }

        }

        protected void BindData()
        {
              DtToCheck = (DataTable)ViewState["DataBind"];
            

            DataTable dt = GridUtility.CreateTable(12);


            string listitems = "";
            dt.Rows.Add();
            dt.Rows[0]["ID1"] = drpItemCode.SelectedValue;
            dt.Rows[0]["ID2"] = drpItemName.SelectedItem;
            dt.Rows[0]["ID3"] = txtSpecification.Text;
            dt.Rows[0]["ID4"] = txtDrowingNo.Text;
       
            dt.Rows[0]["ID5"] = drpDepartment1.SelectedItem.Text;
            dt.Rows[0]["ID6"] = txtPurpose1.Text;
            dt.Rows[0]["ID7"] = lblCurrentStock.Text;
            dt.Rows[0]["ID8"] = txtRequirdDate.Text;
            dt.Rows[0]["ID9"] = txtRequiredQuantity.Text;
            dt.Rows[0]["ID10"] = drpRequiredQuentityUnit.SelectedItem;
            dt.Rows[0]["ID12"] = drpDepartment1.SelectedValue;

            


            foreach (GridViewRow row in grdIndentMaster.Rows)
            {
                CheckBox chk = row.Cells[0].Controls[0] as CheckBox;
                if (chk != null && chk.Checked)
                {
                    dt.Rows[0]["ID11"] = 1;
                }
                else {
                    dt.Rows[0]["ID11"] = 0;
                }
            }

            if (ViewState["DataBind"] == null)
            {
                BindList(dt);

            }
            else
            {
                dt.Merge(DtToCheck);
                BindList(dt);
            }
        }

      

        protected void BindList(DataTable dt)
        {
            ViewState["DataBind"] = dt;

            grdIndentMaster.DataSource = dt;
            grdIndentMaster.DataBind();
            if (grdIndentMaster.Rows.Count == 0)
                ViewState["DataBind"] = null;
        }

        public void BindIndent(DataRow dt)
        {

            drpItemCode.SelectedValue = dt["ID1"].ToString();
            drpItemName.SelectedValue = dt["ID1"].ToString();
           txtSpecification.Text = dt["ID3"].ToString();
            txtDrowingNo.Text = dt["ID4"].ToString();
            drpDepartment1.SelectedValue = dt["ID12"].ToString();
            txtPurpose1.Text = dt["ID6"].ToString();
            lblCurrentStock.Text = dt["ID7"].ToString();
            txtRequirdDate.Text = dt["ID8"].ToString();
            txtRequiredQuantity.Text = dt["ID9"].ToString();
            drpRequiredQuentityUnit.SelectedItem.Text = dt["ID10"].ToString();
            //txtIndentNumber.Text = dt["ID11"].ToString();
            //drpIndetType.SelectedIndex = Convert.ToInt32(dt["ID12"]);
            //txtIndentDate.Text = dt["ID13"].ToString();
            //txtTime.Text = dt["ID14"].ToString();
        }

        protected void grdIndentMaster_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                
                if (e.CommandName == "Remove")
                {
                    LinkButton TempLabel = new LinkButton();
                    int index = Convert.ToInt32(e.CommandArgument);
                    dt = (DataTable)ViewState["DataBind"];
                    dt.Rows.RemoveAt(index);
                    BindList(dt);
                }
                else if (e.CommandName == "RowEditing")
                {
                    LinkButton TempLabel = new LinkButton();
                    int index = Convert.ToInt32(e.CommandArgument);
                    dt = (DataTable)ViewState["DataBind"];
                    BindIndent(dt.Rows[index]);
                    dt.Rows.RemoveAt(index);
                    BindList(dt);
                }


            }
            catch (Exception ex)
            {

            }
        }

        public void ResetForm()
        {
            drpIndentNumber.SelectedIndex = 0;
            drpIndetType.SelectedIndex = 0;
            drpItemCode.SelectedIndex = 0;
            drpItemName.SelectedIndex = 0;
            txtSpecification.Text = String.Empty;
            txtDrowingNo.Text = String.Empty;
            drpDepartment1.SelectedIndex = 0;
            txtPurpose1.Text = String.Empty;
            lblCurrentStock.Text = "0";
            txtRequirdDate.Text = String.Empty;
            txtRequiredQuantity.Text = String.Empty;
            drpRequiredQuentityUnit.SelectedIndex = 0;
            txtRemark.Text = String.Empty;
            drpPrepairedByCode.SelectedIndex = 0;
            drpPrepairedByName.SelectedIndex = 0;
            grdIndentMaster.DataSource = null;
            grdIndentMaster.DataBind();
        }

        public void ResetIndentDetails()
        {
            drpItemCode.SelectedIndex = 0;
            drpItemName.SelectedIndex = 0;
            txtSpecification.Text = String.Empty;
            txtDrowingNo.Text = String.Empty;
            drpDepartment1.SelectedIndex = 0;
            txtPurpose1.Text = String.Empty;
            lblCurrentStock.Text = "0";
            txtRequirdDate.Text = String.Empty;
            txtRequiredQuantity.Text = String.Empty;
            drpRequiredQuentityUnit.SelectedIndex = 0;
            txtRemark.Text = String.Empty;
            
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            ResetForm();
            //GetMaxIndentNumber();
            btnUpdate.Enabled = false;
            btnDelete.Enabled = false;
            btnCancel.Enabled = true;
            btnSave.Enabled = true;
            btnNew.Enabled = true;
            DtToCheck = null;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ResetForm();
            GetMaxIndentNumber();
            btnUpdate.Enabled = false;
            btnDelete.Enabled = false;
            btnCancel.Enabled = true;
            btnSave.Enabled = true;
            btnNew.Enabled = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
          {
           
            SetValues();
            
            
            int res = IndentBussiness.InsertIndentMaster(IndentModel);
            

            if (res > 0)
            {
                Response.Write("<script> alert('Record Save Successfully...') </Script>"); 
                BindIndentNumber();
            }
            else
            {
                Response.Write("<script> alert('Error occured while performing the action') </Script>");
            }
        }

        public void SetValues()
        {
            try {
                DataTable dt = new DataTable();
                dt = (DataTable)ViewState["DataBind"];
                DataTable dttl = new DataTable();
                dttl = IndentBussiness.GetMaxIndentNumber(IndentModel);
                List<IndentMasterModel> lst = new List<IndentMasterModel>();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    IndentMasterModel ind = new IndentMasterModel();

                     ind.IndentId = Convert.ToInt32(dttl.Rows[0]["IndentId"])+1;
                            ind.ItemCode = dt.Rows[i]["ID1"].ToString();
                            ind.ItemName = dt.Rows[i]["ID2"].ToString();
                            ind.Specification = dt.Rows[i]["ID3"].ToString();
                            ind.DrowingNo = dt.Rows[i]["ID4"].ToString();
                            ind.Department = Convert.ToInt32(dt.Rows[i]["ID12"]);
                            ind.Purpose = dt.Rows[i]["ID6"].ToString();
                            ind.CurrentStock = dt.Rows[i]["ID7"].ToString();
                            ind.RequirdDate = dt.Rows[i]["ID8"].ToString();
                            ind.RequiredQuantity = dt.Rows[i]["ID9"].ToString();
                            ind.RequiredQuentityUnit = dt.Rows[i]["ID10"].ToString();
                         //   ind.IsApporved = Convert.ToInt32(dt.Rows[i]["ID11"]);

                            lst.Add(ind);
                }
                IndentModel.AllData = lst;

                
                IndentModel.IndentNoAutoGen = txtIndentNumber.Text;
                IndentModel.IndentTypeId =Convert.ToInt32( drpIndetType.SelectedValue);
                //   ind2.IndentDate =  Convert.ToDateTime(txtIndentDate.ToString());
                IndentModel.Remark = txtRemark.Text;
                IndentModel.Createdby = drpPrepairedByName.SelectedValue;
                
            }
            catch(Exception ex)
            {
            
            } 
        }
      

        protected void FillIndentNumber()
        {
            DataTable dt2 = new DataTable();
            dt2 = IndentBussiness.FillIndentMaster(Convert.ToInt32(drpIndentNumber.SelectedValue));

            if (dt2.Rows.Count > 0)
            {
                drpIndetType.SelectedValue = (Convert.ToInt32(dt2.Rows[0]["IndentTypeId"]).ToString());
                txtIndentNumber.Text = dt2.Rows[0]["IndentNoAutoGen"].ToString();
                txtTime.Text = (DateTime.Now).ToString();
                txtRemark.Text = dt2.Rows[0]["IndentRemark"].ToString();
                drpPrepairedByCode.SelectedValue = dt2.Rows[0]["CreatedBy"].ToString();
                drpPrepairedByName.SelectedValue = dt2.Rows[0]["CreatedBy"].ToString();


                //txtIndentDate.Text = 
                DataTable dt = GridUtility.CreateTable(12);




                for (int i = 0; i < dt2.Rows.Count; i++)
                { 
                    dt.Rows.Add();
                dt.Rows[i]["ID1"] = dt2.Rows[i]["ItemCode"];
                dt.Rows[i]["ID2"] = dt2.Rows[i]["Description"];
                dt.Rows[i]["ID3"] = dt2.Rows[i]["Specification"];
                dt.Rows[i]["ID4"] = dt2.Rows[i]["DrawingNo"];
                dt.Rows[i]["ID5"] = dt2.Rows[i]["dname"];
                dt.Rows[i]["ID6"] = dt2.Rows[i]["Purpose"];
                dt.Rows[i]["ID7"] = dt2.Rows[i]["CurrentStock"];
                dt.Rows[i]["ID8"] = dt2.Rows[i]["RequiredDate"];
                dt.Rows[i]["ID9"] = dt2.Rows[i]["ToOrderQuantity"];
                dt.Rows[i]["ID10"] = dt2.Rows[i]["ToOrderUnit"];
                dt.Rows[i]["ID12"] = dt2.Rows[i]["DepartmentId"];
                }
                ViewState["DataBind"] = dt;
                if (dt.Rows.Count > 0)
                {

                    grdIndentMaster.DataSource = dt;
                    grdIndentMaster.DataBind();
                    // drpItemName.SelectedItem.Text = Convert.ToString(dt.Rows[0]["Description"]);
                    // drpItemCode.SelectedItem.Text= Convert.ToString(dt.Rows[0]["ItemCode"]);
                    // txtSpecification.Text = Convert.ToString(dt.Rows[0]["Specification"]);
                    // txtDrowingNo.Text = Convert.ToString(dt.Rows[0]["DrawingNo"]);
                    // drpDepartment1.SelectedItem.Text = Convert.ToString(dt.Rows[0]["dname"]);
                    // txtPurpose1.Text = Convert.ToString(dt.Rows[0]["Purpose"]);

                    //lblCurrentStock.Text= Convert.ToString(dt.Rows[0]["CurrentStock"]);
                    //txtRequirdDate.Text = Convert.ToString(dt.Rows[0]["RequiredDate"]);
                    //txtRequiredQuantity.Text = Convert.ToString(dt.Rows[0]["ToOrderQuantity"]);
                    //drpRequiredQuentityUnit.SelectedItem.Text= Convert.ToString(dt.Rows[0]["ToOrderUnit"]);

                }
            
            }
             
            
        }

        protected void BindGridIndentDetails(string ItemCode)
        {
            DataTable dt2 = new DataTable();
            dt2 = IndentBussiness.BindGridIndentDetails(ItemCode);

            if (dt2.Rows.Count > 0)
            {
                txtDrowingNo.Enabled = false;
                txtSpecification.Enabled = false;
                drpRequiredQuentityUnit.Enabled = false;
                drpRequiredQuentityUnit.SelectedValue = dt2.Rows[0]["UnitId"].ToString();
                txtSpecification.Text = dt2.Rows[0]["Specification"].ToString();
                txtDrowingNo.Text = dt2.Rows[0]["DrawingNo"].ToString();
              

            }
        }

        public void UpdateIndentMaster()
        {
            try
            {

                IndentMasterModel ind4 = new IndentMasterModel();
                ind4.IndentId = Convert.ToInt32(drpIndentNumber.SelectedValue);
                //ind4.IndentNoAutoGen = drpIndentNumber.SelectedItem.Text;
                ind4.IndentTypeId = Convert.ToInt32(drpIndetType.SelectedValue);
                //   ind2.IndentDate =  Convert.ToDateTime(txtIndentDate.ToString());
                ind4.Remark = txtRemark.Text;
                ind4.Createdby = drpPrepairedByName.SelectedValue;
                List<IndentMasterModel> lst4 = new List<IndentMasterModel>();
                lst4.Add(ind4);
                IndentModel.AllData4 = lst4;
            }
            catch (Exception ex)
            {

            }
        }

        public void UpdateIndentDetailMaster()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = (DataTable)ViewState["DataBind"];
                List<IndentMasterModel> lst3 = new List<IndentMasterModel>();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    IndentMasterModel ind3 = new IndentMasterModel();
                    ind3.IndentId = Convert.ToInt32(drpIndentNumber.SelectedValue);
                    ind3.ItemCode = dt.Rows[i]["ID1"].ToString();
                    ind3.ItemName = dt.Rows[i]["ID2"].ToString();
                    ind3.Specification = dt.Rows[i]["ID3"].ToString();
                    ind3.DrowingNo = dt.Rows[i]["ID4"].ToString();
                    ind3.Department = Convert.ToInt32(dt.Rows[i]["ID5"]);
                    ind3.Purpose = dt.Rows[i]["ID6"].ToString();
                    ind3.CurrentStock = dt.Rows[i]["ID7"].ToString();
                    ind3.RequirdDate = dt.Rows[i]["ID8"].ToString();
                    ind3.RequiredQuantity = dt.Rows[i]["ID9"].ToString();
                    ind3.RequiredQuentityUnit = dt.Rows[i]["ID10"].ToString();
                    //   ind.IsApporved = Convert.ToInt32(dt.Rows[i]["ID11"]);

                    lst3.Add(ind3);
                }
                IndentModel.AllData3 = lst3;
            }
            catch (Exception ex)
            {

            }
        }

        protected void drpIndentNumber_SelectedIndexChanged1(object sender, EventArgs e)
        {
            txtIndentNumber.Text = string.Empty;
            txtIndentNumber.Enabled = false;
            btnUpdate.Enabled = true;
            btnSave.Enabled = false;
            FillIndentNumber();
        }

        protected void btnUpdate_Click1(object sender, EventArgs e)
        {
            if (grdIndentMaster.Rows.Count > 0)
            {
                //UpdateIndentMaster();
                //UpdateIndentDetailMaster();
                SetValues();
                IndentModel.IndentId =Convert.ToInt32(drpIndentNumber.SelectedValue);
                
                int ress2 = IndentBussiness.UpdateIndentMaster(IndentModel);
                 
                if (ress2 > 0)
                {
                    Response.Write("<script> alert('Record Updated Successfully...') </Script>");
                }
                else
                {
                    Response.Write("<script> alert('Error occured while performing the action') </Script>");
                }
            }
            else
            {
                Response.Write("<script> alert('Add button not hit') </Script>");
            }
        }

        protected void grdIndentMaster_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillIndentNumber();
            btnUpdate.Enabled = true;
        }

        
       
    }
}