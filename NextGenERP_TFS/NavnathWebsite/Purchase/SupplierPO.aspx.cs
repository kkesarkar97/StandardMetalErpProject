using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Modal;
using BAL;
using NavnathWebsite.SharedClasses;
using CommonUtilities;






namespace NavnathWebsite.Purchase
{
    public partial class SupplierPO : System.Web.UI.Page
    {
        
        SupplierPOModel SPM = new SupplierPOModel();
        SupplierPOBussiness SPB = new SupplierPOBussiness();
        ItemMaster_BAL_27March itemBal = new ItemMaster_BAL_27March();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                drpApprovedIndent.Enabled = false;

                BindSupplierPO();

                BindItemMasterData(0);

              //  Purchase_BindSupplierPO_Rate();
                
                BindUnit();

                BindPaymentTpye();

                BindTransportType();

                BindTransporterType();

                BindEmployeeCode_Name();

                txtPODate.Text = DateTime.Now.ToString();
                
                BindSuppMnDetail();

                //btnUpdate.Enabled = false;

                btnPreview.Enabled = false;
                btnSendMail.Enabled = false;
                btnDelete.Enabled = false;
                btnCancel.Enabled = true;
                btnSave.Enabled = true;
                btnNew.Enabled = true;
               

            }

        }


         

        // Code to Bind Supplier PO

        public void BindSupplierPO()
        {
            DataTable dt = new DataTable();
            dt = SPB.BindSupplierPO(SPM);
           
            drpAutoSupplierPO.DataSource = dt;
            drpAutoSupplierPO.DataTextField = "SupplierPONo";
            drpAutoSupplierPO.DataValueField = "SupplierPONo";
            drpAutoSupplierPO.DataBind();
            drpAutoSupplierPO.Items.Insert(0, "Select");
            drpAutoSupplierPO.SelectedIndex = 0;
        }




        //Code to Bind ItemCode and ItemName

        public void BindItemMasterData(int IndentId)
        {
            DataTable dt = new DataTable();
            dt = SPB.BindItemMasterData(IndentId);

            drpItemName.Items.Clear();
            drpItemName.DataSource = dt;
            drpItemName.DataTextField = "ItemName";
            drpItemName.DataValueField = "ItemCode";
            drpItemName.DataBind();
            drpItemName.Items.Insert(0, "Select");
            drpItemName.SelectedIndex = 0;

            drpItemCode.Items.Clear();
            drpItemCode.DataSource = dt;
            drpItemCode.DataTextField = "ItemCode";
            drpItemCode.DataValueField = "ItemCode";
            drpItemCode.DataBind();
            drpItemCode.Items.Insert(0, "Select");
            drpItemCode.SelectedIndex = 0;
        }


      
        public void BindUnit()
        {
            DataTable dt = new DataTable();
            dt = itemBal.BindUOM();
            drpUnit.Items.Clear();

            if (dt.Rows.Count > 0)
            {
                drpUnit.DataSource = dt;
                drpUnit.DataTextField = "UnitName";
                drpUnit.DataValueField = "UnitId";
                drpUnit.DataBind();
                drpUnit.Items.Insert(0, "Select");
                drpUnit.SelectedIndex = 0;
            }

        }




        // Code to Bind Item Name and Supplier Name

        public void ItemName_SupplierName()
        {
            DataTable dt = new DataTable();
            dt = SPB.BindItemName_SupplierName(SPM);

            //drpItemName.DataSource = dt;
            //drpItemName.DataTextField = "SuppName";
            //drpItemName.DataValueField = "Description";
            //drpItemName.DataBind();
            //drpItemName.Items.Insert(0, "Select");
            //drpItemName.SelectedIndex = 0;


            drpSearchSupplier.DataSource = dt;
            drpSearchSupplier.DataTextField = "SuppName";
            drpSearchSupplier.DataValueField = "Description";
            drpSearchSupplier.DataBind();
            drpSearchSupplier.Items.Insert(0, "Select");
            drpSearchSupplier.SelectedIndex = 0;            
                        
        }
        


        // Code to bind All Auto Approved Indent

        public void BindPurchase_ApprovedIndent()
        {
            DataTable dt = new DataTable();
            dt = SPB.BindPurchase_ApprovedIndent(SPM);

            drpAutoApprovedIndent.DataSource = dt;
            drpAutoApprovedIndent.DataTextField = "IndentNoAutoGen";
            drpAutoApprovedIndent.DataValueField = "Description";
            drpAutoApprovedIndent.DataBind();
            drpAutoApprovedIndent.Items.Insert(0, "Select");
            drpAutoApprovedIndent.SelectedIndex = 0;


            drpItemName.DataSource = dt;
            drpItemName.DataTextField = "Description";
            drpItemName.DataValueField = "Description";
            drpItemName.DataBind();
            drpItemName.Items.Insert(0, "Select");
            drpItemName.SelectedIndex = 0;

            
        }

         




        //Bind Emp by Code and name

        public void BindEmployeeCode_Name()
        {

            DataTable dt = new DataTable();
            dt = SPB.BindEmployeeCode_Name(SPM);


            drpVerifyByCode.DataSource = dt;
            drpVerifyByCode.DataTextField = "EmpCode";
            drpVerifyByCode.DataValueField = "EmpName";
            drpVerifyByCode.DataBind();
            drpVerifyByCode.Items.Insert(0, "Select");
            drpVerifyByCode.SelectedIndex = 0;

            drpVerifyByName.DataSource = dt;
            drpVerifyByName.DataTextField = "EmpName";
            drpVerifyByName.DataValueField = "EmpName";
            drpVerifyByName.DataBind();
            drpVerifyByName.Items.Insert(0, "Select");
            drpVerifyByName.SelectedIndex = 0;
                        
        }


        // Code to bind Payment type

        public void BindPaymentTpye()
        {
            DataTable dt = new DataTable();

            dt = SPB.BindPaymentTpye();
            drpPayment.DataSource = dt;
            drpPayment.DataTextField = "PaymentType";
            drpPayment.DataValueField = "PaymentType";
            drpPayment.DataBind();
            drpPayment.Items.Insert(0, "Select");
            drpPayment.SelectedIndex = 0;
              
        }
            

        
        
        //Code to bind transport type

        public void BindTransportType()
        {

            DataTable dt = new DataTable();
            dt = SPB.BindTransportType();

            drpTransport.DataSource = dt;
            drpTransport.DataTextField = "TransportType";
            drpTransport.DataValueField = "TransportType";
            drpTransport.DataBind();
            drpTransport.Items.Insert(0, "Select");
            drpTransport.SelectedIndex = 0;
            
        }




        public void BindTransporterType()
        {

            DataTable dt = new DataTable();
            dt = SPB.BindTransporterType();

            drpTransporter.DataSource = dt;
            drpTransporter.DataTextField = "TransporterType";
            drpTransporter.DataValueField = "TransporterType";
            drpTransporter.DataBind();
            drpTransporter.Items.Insert(0, "Select");
            drpTransporter.SelectedIndex = 0;
            
        }

        // Code to Bind ItemName and Approved Indent

        public void BindApprovedIndent()
        {

            DataTable dt = new DataTable();
            dt = SPB.BindApprovedIndent_ItemDetails();

            drpApprovedIndent.DataSource = dt;
            drpApprovedIndent.DataTextField = "IndentNoAutoGen";
            drpApprovedIndent.DataValueField = "IndentId";
            drpApprovedIndent.DataBind();
            drpApprovedIndent.Items.Insert(0, "Select");
            drpApprovedIndent.SelectedIndex = 0;

        }




        //Code to radio btn supplier search
        //GetSupplierItemWise
        public void GetSupplierItemWise(string ItemCode )
        {

            DataTable dt = new DataTable();
            dt = SPB.GetSupplierItemWise(ItemCode);
            drpSearchSupplier.Items.Clear();
            if (radNameWise.Checked)
            {

                drpSearchSupplier.DataTextField = "SuppName";
                drpSearchSupplier.DataValueField = "SuppCode";
                drpSearchSupplier.DataSource = dt;
                drpSearchSupplier.DataBind();
               
            }
                 
            else
            {

                drpSearchSupplier.DataTextField = "SuppCode";
                drpSearchSupplier.DataValueField = "SuppCode";
                drpSearchSupplier.DataSource = dt;
                drpSearchSupplier.DataBind();
              
            }


            drpSearchSupplier.Items.Insert(0, "Select");
            drpSearchSupplier.SelectedIndex = 0;



        }


         

        protected DataTable CreateTable(int NoOfRows)
        {
            DataTable dt1 = new DataTable();
            for (int i = 1; i <= NoOfRows; i++)
            {
                string ID = "ID" + i;
                dt1.Columns.Add(ID);
            }
            return dt1;
        }


        protected void drpAutoSupplierPO_SelectedIndexChanged(object sender, EventArgs e)
        {

           
        }




        protected void drpItemName_SelectedIndexChanged(object sender, EventArgs e)
        {

           drpItemCode.SelectedValue =  drpItemName.SelectedValue;

           GetSupplierItemWise(drpItemName.SelectedValue);

           GetUnitRateByItem(drpItemName.SelectedValue);

           GetQuantityByIndentItem(drpItemName.SelectedValue, Convert.ToInt32(drpApprovedIndent.SelectedValue));

        }

       
        
        
        private void GetUnitRateByItem(string ItemCode)
        {

          DataTable dt = SPB.GetUnitRateByItem(ItemCode);

          drpUnit.SelectedValue = Convert.ToString( dt.Rows[0][0]);
          txtRate.Text = Convert.ToString(dt.Rows[0][1]);
       
        }

        

        
        private void GetQuantityByIndentItem(string ItemCode,int IndentId)
        {

            DataTable dt = SPB.GetQuantityByIndentItem(ItemCode,IndentId);
            txtQuantity.Text = Convert.ToString(dt.Rows[0][0]);
        }

       
        
        
        
        protected void drpItemCode_SelectedIndexChanged(object sender, EventArgs e)
        {

            drpItemName.SelectedValue = drpItemCode.SelectedValue;
            GetSupplierItemWise(drpItemCode.SelectedValue);
            GetUnitRateByItem(drpItemCode.SelectedValue);
            GetQuantityByIndentItem(drpItemCode.SelectedValue, Convert.ToInt32(drpApprovedIndent.SelectedValue));
               
        }


          
     
        
        protected void drpAutoApprovedIndent_SelectedIndexChanged(object sender, EventArgs e)
        {

            drpItemCode.SelectedValue = drpAutoApprovedIndent.SelectedValue;

        }

        
        
        
        protected void drpApprovedIndent_SelectedIndexChanged(object sender, EventArgs e)
        {

             BindItemMasterData(Convert.ToInt32(drpApprovedIndent.SelectedValue));
            drpItemName.Enabled = true;
            drpItemCode.Enabled = true;
        }




        protected void drpVerifyByCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            drpVerifyByName.SelectedValue = drpVerifyByCode.SelectedValue;
           
         }

        
        
        
        
        protected void drpVerifyByName_SelectedIndexChanged(object sender, EventArgs e)
        {
            //drpVerifyByCode.SelectedValue = drpVerifyByName.SelectedValue;
                       
        }





        protected void drpPayment_SelectedIndexChanged(object sender, EventArgs e)
        {



        }
    

        
        
        protected void btnAddItem_Click(object sender, EventArgs e)
        {

            try
            {
                BindData();

            }

            catch (Exception ex)
            {

            }


        }



        protected void BindList(DataTable dt)
        {

            ViewState["DataBind"] = dt;

            grdSupplierPO.DataSource = dt;
            grdSupplierPO.DataBind();

            if (grdSupplierPO.Rows.Count == 0)
                ViewState["DataBind"] = null;


        }



        public void BindSupplierPO(DataRow dt)
        {

            drpItemCode.SelectedItem.Text = dt["ID1"].ToString();
            drpItemName.SelectedValue = dt["ID2"].ToString();
            drpApprovedIndent.SelectedItem.Text = dt["ID3"].ToString();
            
            drpUnit.SelectedValue = dt["ID4"].ToString();
            txtQuantity.Text = dt["ID5"].ToString();
            txtRate.Text = dt["ID6"].ToString();
            
            txtExcise.Text = dt["ID7"].ToString();
            txtVAT.Text = dt["ID8"].ToString();
            txtDiscount.Text = dt["ID9"].ToString();

            txtScedule1.Text = dt["ID10"].ToString();
            txtSchedule2.Text = dt["ID11"].ToString();

        }








        protected void BindData()
        {
            DataTable dtCheck = (DataTable)ViewState["DataBind"];

            DataTable dt =  GridUtility.CreateTable(12);

            string listitems = "";
            // SelectedValue will give you the value stored for current selected item in your dropdown and SelectedItem.
            dt.Rows.Add();
            dt.Rows[0]["ID1"] = drpItemCode.SelectedItem;
            dt.Rows[0]["ID2"] = drpItemName.SelectedValue;
            dt.Rows[0]["ID3"] = drpApprovedIndent.SelectedItem;
            dt.Rows[0]["ID4"] = drpUnit.SelectedItem;

            dt.Rows[0]["ID5"] = txtQuantity.Text;
            dt.Rows[0]["ID6"] = txtRate.Text;
            dt.Rows[0]["ID7"] = txtExcise.Text;
            dt.Rows[0]["ID8"] = txtVAT.Text;
            dt.Rows[0]["ID9"] = txtDiscount.Text;
            dt.Rows[0]["ID10"] =txtScedule1.Text;
            dt.Rows[0]["ID11"] = txtSchedule2.Text;


            foreach (GridViewRow row in grdSupplierPO.Rows)
            {
                CheckBox chk = row.Cells[0].Controls[0] as CheckBox;
                if (chk != null && chk.Checked)
                {
                    dt.Rows[0]["ID12"] = 1;
                }
                else
                {
                    dt.Rows[0]["ID12"] = 0;
                }
            }


            if (ViewState["DataBind"] == null)
            {
                BindList(dt);

            }
            else
            {
                dt.Merge(dtCheck);
                BindList(dt);
            }


     }





        protected void grdSupplierPO_RowCommand(object sender, GridViewCommandEventArgs e)
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
                    BindSupplierPO(dt.Rows[index]);
                    dt.Rows.RemoveAt(index);
                    BindList(dt);
                }


            }
            catch (Exception ex)
            {

            }

        }






        protected void btnSave_Click(object sender, EventArgs e)
        {

            SetValues();
            string SupplierPONo="";
            int Result = SPB.Purchase_InsertSupplierPODtl_ItemDetails(SPM, out SupplierPONo);


            if (Result > 0)
            {
                Response.Write("<script> alert('Record Save Successfully...') </Script>");
            }
            else
            {
                Response.Write("<script> alert('Error occured while performing the action') </Script>");
            }



        }
        


        public void SetValues()
        {
            try
            {

                DataTable dt = new DataTable();
                dt = (DataTable)ViewState["DataBind"];
                DataTable dt1 = new DataTable();

                List<SupplierPOModel> lst = new List<SupplierPOModel>();

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    SupplierPOModel spom = new SupplierPOModel();

                    spom.ItemCode = dt.Rows[i]["ID1"].ToString();
                    spom.ItemName = dt.Rows[i]["ID2"].ToString();

                    spom.ApprovedIndent = dt.Rows[i]["ID3"].ToString();

                    spom.Unit = dt.Rows[i]["ID4"].ToString();
                    spom.Quantity = Convert.ToDecimal(dt.Rows[i]["ID5"].ToString());
                    spom.Rate = Convert.ToDecimal(dt.Rows[i]["ID6"].ToString());
                    spom.Excise = Convert.ToInt32(dt.Rows[i]["ID7"].ToString());

                    spom.VAT = Convert.ToDouble(dt.Rows[i]["ID8"].ToString());
                    spom.Discount = Convert.ToInt32(dt.Rows[i]["ID9"].ToString());
                    spom.ScheduleDate1 = Convert.ToDateTime(dt.Rows[i]["ID10"].ToString());
                    //spom.ScheduleDate2 = Convert.ToDateTime(dt.Rows[i]["ID11"].ToString());

                    lst.Add(spom);

                }


                SPM.AllData = lst;


                SPM.Remark = txtRemark.Text;
                SPM.IndentId = Convert.ToInt32(drpApprovedIndent.SelectedValue);
                SPM.SupplierPoDate = Convert.ToDateTime(txtPODate.Text.ToString());
                SPM.TotalAmount = Convert.ToDecimal(txtTotalAmount.Text.ToString());
                SPM.LoginUserId = Convert.ToInt32(Session["UserId"]);
                SPM.BranchId = Convert.ToInt32(Session["BranchId"]);
                SPM.EmpCode = drpVerifyByCode.SelectedItem.ToString();
                SPM.SuppCode = txtSupplierCode.Text;
                SPM.PaymentType = drpPayment.SelectedItem.ToString();
                SPM.TransportType = drpTransport.SelectedItem.ToString();
                SPM.TransporterType = drpTransporter.SelectedItem.ToString();
               
                SPM.Pack = Convert.ToInt32(txtPacking.Text.ToString());
                SPM.Heights = Convert.ToInt32(txtHeighgt.Text.ToString());
               // SPM.Amounts = Convert.ToDecimal(txtTotalAmount.Text.ToString());
                SPM.Warrenty = Convert.ToInt32(txtWarrenty.Text.ToString());
                SPM.ServiceTax = Convert.ToInt32(txtServiceTax.Text.ToString());
                SPM.OtherCharges = Convert.ToDecimal(txtOtherCharges.Text.ToString());
                SPM.NetTotal = Convert.ToDecimal(txtNetTotal.Text.ToString());


                //SPM.POScheduleDate = Convert.ToDateTime(Convert.ToDateTime(txtSchedule1.Text.ToString());



            }


            catch (Exception ex)
            {


            }


        }

       
        
        
        protected void chkWithIndent_CheckedChanged(object sender, EventArgs e)
        {
            if (chkWithIndent.Checked == true)
            {
                drpApprovedIndent.Enabled = true;
                drpItemName.Enabled = false;
                drpItemCode.Enabled = false;
                txtRate.Text = string.Empty;
                txtQuantity.Text = string.Empty;
                drpUnit.SelectedIndex = 0;
                BindApprovedIndent();
            }
            else
            {
                drpApprovedIndent.Enabled = false;
                drpApprovedIndent.SelectedIndex = 0;
                drpItemName.Enabled = true;
                drpItemCode.Enabled = true;

                txtRate.Text = string.Empty;
                txtQuantity.Text = string.Empty;
                drpUnit.SelectedIndex = 0;
                BindItemMasterData(0);
            
            }
        }




        
        private void BindSuppMnDetail()
        {
            List<SupplierPOModel> lst = new List<SupplierPOModel>();

          
            lst = SPB.GetSuppPOMasternMDetails();
            ViewState["GridSuppMDtl"] = lst;

            var result = lst.Select(p => new

            {
                p.SupplierPoId,
                p.SupplierPONo,
                p.SuppName,
                p.PaymentType,
                p.Packing,
                p.Height,
                p.TransportType,
                p.TotalAmount,
                p.Name,
                p.Warrenty,
                p.ServiceTax,
                p.OtherCharges,
                p.NetTotal,
                p.Remark,
                p.TransporterType,
                p.UserName,
                p.BranchName,
                p.SupplierPoDate,

                p.SupplierPoDtlId,                
                p.ItemId,
                p.ItemCode,
                p.ItemName,
                p.PoRate,
                p.PoQuantity,
                p.Excise,
                p.Discount,
                p.PoScheduleDate


            }).Distinct().ToList();


            gvSuppPOMaster.DataSource = result;
            gvSuppPOMaster.DataBind();

        }




        protected void txtMasterSerach_TextChanged(object Sender, EventArgs e)
        {
            List<SupplierPOModel> lst1 = new List<SupplierPOModel>();
            
            lst1 = (List<SupplierPOModel>)ViewState["GridSuppMDtl"];

            var res = (from r in lst1
                       where

                       r.SupplierPoId.ToString().Contains(txtMasterSerach.Text)
                    || r.SupplierPONo.Contains(txtMasterSerach.Text)
                    || r.SuppName.Contains(txtMasterSerach.Text)
                    || r.PaymentType.Contains(txtMasterSerach.Text)
                    || r.Packing.ToString().Contains(txtMasterSerach.Text)
                    || r.Height.ToString().Contains(txtMasterSerach.Text)
                    || r.TransportType.Contains(txtMasterSerach.Text)
                    || r.TotalAmount.ToString().Contains(txtMasterSerach.Text)
                    || r.Name.Contains(txtMasterSerach.Text)
                    || r.Warrenty.ToString().Contains(txtMasterSerach.Text)
                    || r.ServiceTax.ToString().Contains(txtMasterSerach.Text)
                    || r.OtherCharges.ToString().Contains(txtMasterSerach.Text)
                    || r.NetTotal.ToString().Contains(txtMasterSerach.Text)
                    || r.Remark.Contains(txtMasterSerach.Text)
                    || r.TransporterType.Contains(txtMasterSerach.Text)
                    || r.UserName.Contains(txtMasterSerach.Text)
                    || r.BranchName.Contains(txtMasterSerach.Text)
                    || r.SupplierPoDate.ToString().Contains(txtMasterSerach.Text)


                    select new {

                        r.SupplierPoId,
                        r.SupplierPONo,
                        r.SuppName,
                        r.PaymentType,
                        r.Packing,
                        r.Height,
                        r.TransportType,
                        r.TotalAmount,
                        r.Name,
                        r.Warrenty,
                        r.ServiceTax,
                        r.OtherCharges,
                        r.NetTotal,
                        r.Remark,
                        r.TransporterType,
                        r.UserName,
                        r.BranchName,
                        r.SupplierPoDate

                    }).Distinct().ToList();

            gvSuppPOMaster.DataSource = res;
            gvSuppPOMaster.DataBind();


        }



        protected void rbIdSuppPO_OnCheckedChanged(object sender, EventArgs e)
        {
            try
            {

                List<SupplierPOModel> lst2 = new List<SupplierPOModel>();
                RadioButton SelectButton = (RadioButton)sender;

                GridViewRow row = (GridViewRow)SelectButton.Parent.Parent;

                int SupplierPoId = Convert.ToInt32(row.Cells[1].Text);

                int index = row.RowIndex;

                lst2 = (List<SupplierPOModel>)ViewState["GridSuppMDtl"];

                var Dtlentry = lst2.Select(c => new {c.SupplierPoDtlId, c.SupplierPoId, c.ItemId, c.ItemName, c.ItemCode, c.PoRate, c.PoQuantity, c.Excise, c.Discount, c.PoScheduleDate }).Where(c => c.SupplierPoId == SupplierPoId);

                gvSuppPODtlMaster.DataSource = Dtlentry;
                gvSuppPODtlMaster.DataBind();
            }

            catch (Exception ex)
            { 


            }

        }



        
            
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int result = 0;
               
                ControlToValue();
                SPM.SupplierPONo = txtPONo.Text.ToString();
                result = SPB.UpdateSupplierPOMaster(SPM);

                if (result > 0)
                {
                    Response.Write("<script> alert('Record Updated Successfully...') </Script>");

                }

                else
                {
                    Response.Write("<script> alert('Error occured while performing the action') </Script>");
                }

            }
            
           catch (Exception ex)
           {

           }

        }




        protected void ControlToValue()
        {
            //SupplierPOModel SPM = new SupplierPOModel();

            SPM.SupplierPONo = txtPONo.Text.ToString();
           //spm.IndentId = Convert.ToInt32(drpApprovedIndent.SelectedValue);

            SPM.TotalAmount = Convert.ToDecimal(txtTotalAmount.Text.ToString());
            SPM.Remark = txtRemark.Text.ToString();
            
            //spm.LoginUserId = Convert.ToInt32(Session["UserId"]);
            //spm.BranchId = Convert.ToInt32(Session["BranchId"]);
            
            //spm.VerifiedById = Convert.ToInt32(drpVerifyByCode.SelectedItem.ToString());
            //spm.SupplierId = Convert.ToInt32(txtSupplierCode.Text);

            SPM.PaymentTypeId = Convert.ToInt32(drpPayment.SelectedValue.ToString());
            SPM.TransportTypeId = Convert.ToInt32(drpTransport.SelectedItem.ToString());

            SPM.TransporterTypeId = Convert.ToInt32(drpTransport.SelectedItem.ToString());
            SPM.Packing = Convert.ToInt32(txtPacking.Text.ToString());

            SPM.Height = Convert.ToInt32(txtHeighgt.Text.ToString());
            SPM.Warrenty = Convert.ToInt32(txtWarrenty.Text.ToString());

            SPM.ServiceTax = Convert.ToInt32(txtServiceTax.Text.ToString());
            SPM.OtherCharges = Convert.ToDecimal(txtOtherCharges.Text.ToString());
            SPM.NetTotal = Convert.ToDecimal(txtNetTotal.Text.ToString());

             
        }



        public void ResetForm()
        {
            drpSearchSupplier.SelectedIndex = 0;
            txtPONo.Text = String.Empty;
            txtSupplierCode.Text = String.Empty;
            txtSupplierName.Text = String.Empty;
            txtQuotationNo.Text = String.Empty;

            drpItemName.SelectedIndex = 0;
            drpItemCode.SelectedIndex = 0;
            drpUnit.SelectedIndex = 0;
            txtQuantity.Text = String.Empty;
            txtRate.Text = String.Empty;
            txtExcise.Text = String.Empty;
            txtVAT.Text = String.Empty;
            txtDiscount.Text = String.Empty;

            drpPayment.SelectedIndex = 0;
            txtPacking.Text = String.Empty;
            txtHeighgt.Text = String.Empty;
            drpTransport.SelectedIndex = 0;
            txtTotalAmount.Text = String.Empty;
            drpTransporter.SelectedIndex = 0;
            txtWarrenty.Text = String.Empty;
            txtServiceTax.Text = String.Empty;
            txtOtherCharges.Text = String.Empty;
            txtNetTotal.Text = String.Empty;
            drpVerifyByCode.SelectedIndex = 0;
            drpVerifyByName.SelectedIndex = 0;
            txtRemark.Text = String.Empty;


        }




        protected void btnCancel_Click(object sender, EventArgs e)
        {

            ResetForm();
            
            btnUpdate.Enabled = false;
            btnDelete.Enabled = false;
            btnNew.Enabled = false;
            btnCancel.Enabled = true;
            btnSave.Enabled = true;

        }




        protected void btnNew_Click(object sender, EventArgs e)
        {
            ResetForm();
           
            btnUpdate.Enabled = false;
            btnDelete.Enabled = false;
            btnCancel.Enabled = true;
            btnSave.Enabled = true;
            btnNew.Enabled = true;
        }




        

    }
}