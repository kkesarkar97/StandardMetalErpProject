using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Modal;
using BAL;
using CommonUtilities;


namespace NavnathWebsite.Purchase
{
    public partial class IndentApproval : System.Web.UI.Page
    {
        IndentApprovalModal IndentAppModal = new IndentApprovalModal();
        IndentApprovalBal IndentAppBal = new IndentApprovalBal();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFromDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
                txtToDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
                CalendarExtender3.EndDate = DateTime.Now;
                CalendarExtender1.EndDate = DateTime.Now;
                txtDate.Text = DateTime.Today.ToString("dd/MM/yyyy");
                txtTime.Text = DateTime.Now.ToLongTimeString();
                txtIndentApprovedByName.Text = Session["Username"].ToString();
                txtIndentApprovedByCode.Text=(GetLoginDetails(Session["Username"].ToString())).ToString();
               }

        }

        //To get IndentAprrovedBy id
        public int GetLoginDetails(string UserName)
        {
           return IndentAppBal.GetLoginDetails(UserName);

             
        }


        //To search th non appoved Indents
        protected void btnSearch_Click(object sender, EventArgs e)
        {

          //  IndentAppModal.FromDate = Convert.ToDateTime(txtFromDate.Text);
           // IndentAppModal.ToDate = Convert.ToDateTime( txtToDate.Text);
            DataTable dt = new DataTable();
            DataTable dt1 = new DataTable();

            dt1 = IndentAppBal.GetNonApprovedIndent(IndentAppModal);
           // dt = CreateTable(dt1.Columns.Count);

            dt = GridUtility.CreateTable(dt1.Columns.Count);

            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                dt.Rows.Add();


                dt.Rows[i]["ID1"] = dt1.Rows[i]["IndentNoAutoGen"];
                dt.Rows[i]["ID2"] = dt1.Rows[i]["ItemCode"];
                dt.Rows[i]["ID3"] = dt1.Rows[i]["ItemName"];
                dt.Rows[i]["ID4"] = dt1.Rows[i]["Purpose"];
                dt.Rows[i]["ID5"] = dt1.Rows[i]["CurrentStock"];
                dt.Rows[i]["ID6"] = dt1.Rows[i]["RequiredDate"];
                dt.Rows[i]["ID7"] = dt1.Rows[i]["ToOrderQuantity"];
                dt.Rows[i]["ID8"] = dt1.Rows[i]["ApprovedQuantity"];
                dt.Rows[i]["ID9"] = dt1.Rows[i]["RejectedQty"];
                dt.Rows[i]["ID10"] = dt1.Rows[i]["Remark"];
                dt.Rows[i]["ID11"] = dt1.Rows[i]["CreatedBy"];
                grdIndentApprovalMaster.DataSource = dt;
                grdIndentApprovalMaster.DataBind();

            }
            
        }

        //to create datatable
        



        //to get rejected quantity
        protected void txtApprovedQuantity_TextChanged(object sender, EventArgs e)
        {

            TextBox txtAccepted = (TextBox)sender;

            GridViewRow LST = (GridViewRow)((TextBox)sender).Parent.Parent;
            Label OrderQuantity = (Label)LST.FindControl("ID7");
            TextBox ApprovedQuantity = (TextBox)LST.FindControl("txtApprovedQuantity");
            Label RejQuantity = (Label)LST.FindControl("lblRejectedQuantity");

            if (!string.IsNullOrEmpty(OrderQuantity.Text) && Convert.ToDouble(ApprovedQuantity.Text) != 0)
            {
                if (Convert.ToDouble(ApprovedQuantity.Text) > Convert.ToDouble(OrderQuantity.Text))
                {
                    ApprovedQuantity.Text = string.Empty;
                    ApprovedQuantity.Focus();
                    Response.Write("<script> alert('Approved Quantity is garter than Oreder Quantity')</script>");
                }
                else
                {
                    double RejQty;
                    RejQty = Convert.ToDouble(OrderQuantity.Text) - Convert.ToDouble(ApprovedQuantity.Text);
                    RejQuantity.Text = Convert.ToString(RejQty);
                }
            }
        }


        //new 
        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("IndentApproval.aspx");

        }

        //to update the approved indent details
        protected void btnSave_Click(object sender, EventArgs e)
        {

            DataTable dt = new DataTable();
            FillListFromControl();
            
            int result = IndentAppBal.UpdateIndentDetailMaster(IndentAppModal);
            if (result > 0)
            {
                Response.Write("<script> alert('Record updated successfully...'); </script>");
            }
            else
            {
                Response.Write("<script> alert('Error while perfoeming action'); </script>");

            }
            
        }


        //to fill the data from controls to list
        protected void FillListFromControl()
        {
            DataTable dt = new DataTable();
            //dt = CreateTable();
           List<IndentApprovalModal> lst =new List<IndentApprovalModal>();

           IndentApprovalModal objmodel=new IndentApprovalModal();
           objmodel.IndentApprovedByCode = Convert.ToInt32(txtIndentApprovedByCode.Text);
           objmodel.CurrentDate = Convert.ToDateTime(txtDate.Text);
           objmodel.CurrentTime = Convert.ToDateTime(txtTime.Text);
            foreach (GridViewRow item in grdIndentApprovalMaster.Rows)
            {
                CheckBox chkApproved = item.FindControl("chkApproved") as CheckBox;
                if (chkApproved.Checked)
                {
                    Label ID1 = item.FindControl("ID1") as Label;
                    Label ID2 = item.FindControl("ID2") as Label;
                    Label ID3 = item.FindControl("ID3") as Label;
                    Label ID4 = item.FindControl("ID4") as Label;
                    Label ID5 = item.FindControl("ID5") as Label;
                    Label ID6 = item.FindControl("ID6") as Label;
                    Label ID7 = item.FindControl("ID7") as Label;
                    TextBox txtApprovedQuantity = item.FindControl("txtApprovedQuantity") as TextBox;
                    Label lblRejectedQuantity = item.FindControl("lblRejectedQuantity") as Label;
                    TextBox txtRemark = item.FindControl("txtRemark") as TextBox;
                    Label ID10 = item.FindControl("ID10") as Label;




                    objmodel.IndentNoAutoGen = ID1.Text;
                    objmodel.IsApproved = true;
                    objmodel.ItemCode = ID2.Text;
                    objmodel.ItemName = ID3.Text;
                    objmodel.Purpose = ID4.Text;
                    objmodel.CurrentStock = ID5.Text;
                    objmodel.RequiredDate = ID6.Text;
                    objmodel.ToOrderQuantity = ID7.Text;
                    objmodel.ApprovedQuantity = txtApprovedQuantity.Text;
                    objmodel.RejectedQuantity = lblRejectedQuantity.Text;
                    objmodel.Remark = txtRemark.Text;
                    objmodel.IndentCreateBy = ID10.Text;

                    lst.Add(objmodel);
                    IndentAppModal.AllData = lst;
                }
                
            }
            
        }


        //cancel
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("IndentApproval.aspx");
        }

        //if check box is selected then make text box enable/disabled
        protected void chkApproved_CheckedChanged(object sender, EventArgs e)
        {
            var isSelectAll = true;
            CheckBox ChKBox = (CheckBox)sender;
            GridViewRow LST = (GridViewRow)((CheckBox)sender).Parent.Parent;
            TextBox ApprovedQuantity = (TextBox)LST.FindControl("txtApprovedQuantity");
            TextBox Remark = (TextBox)LST.FindControl("txtRemark");


            foreach (GridViewRow Row in grdIndentApprovalMaster.Rows)
            {
                CheckBox chkcheck = (CheckBox)Row.FindControl("chkApproved");
                
                if (!chkcheck.Checked)
                {
                    isSelectAll = false;
                    break;
                }

            }
            chkApprovedIndent.Checked = isSelectAll;


            if (((CheckBox)LST.FindControl("chkApproved")).Checked)
            {
              
                ApprovedQuantity.Enabled = true;
                ApprovedQuantity.Focus();
                Remark.Enabled = true;
                Remark.Focus();
            }
            else
            {
                ApprovedQuantity.Enabled = false;
                 Remark.Enabled = false;
       
            }
        }

        protected void chkApprovedIndent_CheckedChanged(object sender, EventArgs e)
        {

            //CheckBox chkBoxChecked = (CheckBox)sender;
            //GridViewRow LST = (GridViewRow)((CheckBox)sender).Parent.Parent;
            //CheckBox chkbox = (CheckBox)LST.FindControl("chkApproved");
            if (chkApprovedIndent.Checked)
            {
                foreach (GridViewRow Row in grdIndentApprovalMaster.Rows)
                {
                    CheckBox chkcheck = (CheckBox)Row.FindControl("chkApproved");
                    chkcheck.Checked = true;
                    TextBox ApprovedQuantity = (TextBox)Row.FindControl("txtApprovedQuantity");
                    ApprovedQuantity.Enabled = true;
                    ApprovedQuantity.Focus();
                    TextBox Remark = (TextBox)Row.FindControl("txtRemark");
                    Remark.Enabled = true;
                    Remark.Focus();
                  
                }
            }
            else
            {
                foreach (GridViewRow Row in grdIndentApprovalMaster.Rows)
                {
                    CheckBox chkcheck = (CheckBox)Row.FindControl("chkApproved");
                    chkcheck.Checked = false;
                    TextBox ApprovedQuantity = (TextBox)Row.FindControl("txtApprovedQuantity");
                    ApprovedQuantity.Enabled = false;
                    TextBox Remark = (TextBox)Row.FindControl("txtRemark");
                    Remark.Enabled = false;
                   
                }
            }
        }



    }
}
    

