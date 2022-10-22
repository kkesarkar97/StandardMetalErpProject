using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BAL;
using Modal;


namespace NavnathWebsite.Masters
{
    public partial class Machine_Master_14 : System.Web.UI.Page
    {
        Machine_BAL_14cs bal = new Machine_BAL_14cs();
        Machine_Model_14 model = new Machine_Model_14();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                FillMachinemaster();
                BindMachineType();
                BindPMpland();
                GridMachine();

            }

        }

        public void GetMachineDetailsWisely()
        {


        }

        public void FillMachinemaster()
        {
            DataTable dt = new DataTable();
            dt = bal.FillMachinemaster();

            drpMachineCode.Items.Clear();
            drpMachineName.Items.Clear();

            if (dt.Rows.Count > 0)
            {
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
                drpMachineName.Items.Insert(0, "Select");
                drpMachineName.SelectedIndex = 0;

            }

        }

        private void BindMachineType()
        {
            DataTable dt = new DataTable();
            dt = bal.BindMachineType();

            drpMachineType.Items.Clear();

            if (dt.Rows.Count > 0)
            {
                drpMachineType.DataSource = dt;
                drpMachineType.DataTextField = "MachineTypeName";
                drpMachineType.DataValueField = "MachineTypeName";
                drpMachineType.DataBind();
                drpMachineType.Items.Insert(0, "Select");
                drpMachineType.SelectedIndex = 0;
            }
        }

        private void BindPMpland()
        {
            DataTable dt = new DataTable();
            dt = bal.BindPMplan();

            drpPMplan.Items.Clear();

            if (dt.Rows.Count > 0)
            {

                drpPMplan.DataSource = dt;
                drpPMplan.DataTextField = "PMPlanName";
                drpPMplan.DataValueField = "PMPlanName";
                drpPMplan.DataBind();
                drpPMplan.Items.Insert(0, "Select");
                drpPMplan.SelectedIndex = 0;
            }

        }


        protected void ControValues()
        {
            model.MachineNo = Convert.ToString(txtItemManuf.Text);
            model.MachineName = Convert.ToString(txtItemMaterial.Text);
            model.Group = Convert.ToString(TextBox1.Text);
            model.Make = Convert.ToString(TextBox3.Text);
            model.Cmp_Code = Convert.ToString(TextBox4.Text);
            model.MachineCostPerHr = Convert.ToDecimal(TextBox6.Text);
            model.CapacityRangeTo = Convert.ToInt32(TextBox7.Text);
            model.Location = Convert.ToString(TextBox9.Text);
            model.PMPlan = Convert.ToString(drpPMplan.SelectedValue);
            model.Model = Convert.ToString(TextBox11.Text);
            model.PurchaseDate = Convert.ToDateTime(TextBox5.Text);
            model.Remark = Convert.ToString(TextBox10.Text);

        }

        protected void btnSaveItem_Click(object sender, EventArgs e)
        {
            
            if(Page.IsValid)
            {
                try
                {
                    int result = 0;
                    //AutoIncrement();
                    ControValues();
                    result = bal.SaveMachineMaster(model);
                    if (result > 0)
                    {
                        Response.Write("<script> alert('Record Save Successfully...') </Script>");
                    }
                    else
                    {
                        Response.Write("<script> alert('Error occured while performing the action') </Script>");
                    }

                }
                catch (Exception ex)
                {
                    Response.Write("<script> alert('Error occured while performing the action') </Script>");
                }
            }

         }

        protected void drpMachineName_SelectedIndexChanged(object sender, EventArgs e)
        {
             drpMachineCode.SelectedValue = drpMachineName.SelectedValue;
        }

        protected void drpMachineCode_SelectedIndexChanged(object sender, EventArgs e)
        {
         drpMachineName.SelectedValue = drpMachineCode.SelectedValue;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            {
                try
                {
                    DataTable dt = new DataTable();
                    dt = bal.SearchMachineMaster(drpMachineCode.SelectedValue);

                    if(dt.Rows.Count>0)
                    {

                        txtItemManuf.Text=Convert.ToString((dt.Rows[0]["MachineNo"]));
                        txtItemMaterial.Text=Convert.ToString((dt.Rows[0]["MachineName"]));
                        TextBox1.Text=Convert.ToString((dt.Rows[0]["Group"]));
                        TextBox3.Text=Convert.ToString((dt.Rows[0]["Make"]));
                        TextBox4.Text=Convert.ToString((dt.Rows[0]["Cmp_Code"]));
                        TextBox6.Text=Convert.ToString((dt.Rows[0]["MachineCostPerHr"]));
                        TextBox7.Text=Convert.ToString((dt.Rows[0]["CapacityRangeTo"]));
                        TextBox9.Text=Convert.ToString((dt.Rows[0]["Location"]));
                        //drpPMplan.SelectedValue=Convert.ToString((dt.Rows[0]["PMPlan"]));
                        TextBox11.Text=Convert.ToString((dt.Rows[0]["Model"]));
                        TextBox5.Text=Convert.ToString((dt.Rows[0]["PurchaseDate"]));
                        TextBox10.Text=Convert.ToString((dt.Rows[0]["Remark"]));

                    }
                    else
                    {
                        Response.Write("<script> alert('Record Not Found..') </Script>");
                    }

                }
                catch (Exception ex)
                {

                }

             }
          }

        protected void btnUpdateItem_Click(object sender, EventArgs e)
        {
            {
                try
                {
                    int result = 0;
                    ControValues();
                    model.MachineNo = Convert.ToString(txtItemManuf.Text);
                    result = bal.UpdateMachineMaster(model);
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


        }

        protected void btnCancelItem_Click(object sender, EventArgs e)
        {
              Response.Redirect("../Masters/Machine_Master_14.aspx");
        }
         public void GridMachine()
        {
            DataTable dt = new DataTable();
            dt = bal.GridViewBind();

            grdMachineMaster.DataSource = dt;
            grdMachineMaster.DataBind();
            
           
        }
        
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int res = bal.CheckDuplicateMachineName(txtItemMaterial.Text, txtItemManuf.Text);
           
            if (res == 1)
            {
                args.IsValid = false;
                Response.Write("<script> alert('Machine Name Already Exixst.......!') </Script>");

            }
            else
            {
                args.IsValid = true;
            }

        }}

    }

