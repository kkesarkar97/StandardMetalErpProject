using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Modal;
using BAL;

namespace NavnathWebsite.Admin
{
    public partial class LoginUserMaster : System.Web.UI.Page
    {

        LoginUserMasterBAL objbal = new LoginUserMasterBAL();
        LoginUserMasterModel model = new LoginUserMasterModel();
        IndentMasterBAL IndentBussiness = new IndentMasterBAL();
       

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                BindRoleMaster();
                BindEmployee();
            }
        
        }

        
        private void BindRoleMaster()
        {
            DataTable dt = objbal.GetRoleDetails();
            drpRoleName.DataSource = dt;
            drpRoleName.DataTextField = "RoleName";
            drpRoleName.DataValueField = "RoleId";
            drpRoleName.DataBind();
            drpRoleName.Items.Insert(0, "Select");
            drpRoleName.SelectedIndex = 0;
        }



        public void BindEmployee()
        {
            //DataTable dt = new DataTable();
            //dt = IndentBussiness.BindEmployee();
            // drpEmployeeName.DataSource = dt;
            // drpEmployeeName.DataTextField = "EmpName";
            // drpEmployeeName.DataValueField = "ESrNo";
            // drpEmployeeName.DataBind();
            // drpEmployeeName.Items.Insert(0, "Select");
            // drpEmployeeName.SelectedIndex = 0;
             
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {

            try
            {

                if (Page.IsValid)
                {

                    int result = 0;
                    // AutoIncrement();
                    ControlTovalue();


                    result = objbal.SaveLoginUserMaster(model);
                    if (result > 0)
                    {
                        Response.Write("<script> alert('Record Save Successfully...') </Script>");
                    }
                    else
                    {
                        Response.Write("<script> alert('Error occured while performing the action') </Script>");
                    }

                }



            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('Error occured while performing the action') </Script>");
            }

        }



        protected void ControlTovalue()
        {
            // _dbItem.ItemCode = Convert.ToString(txtItemCode.Text);
               model.UserName = txtLoginUserName.Text ;

               model.Password = txtPassword.Text ;
                model.RoleId  = Convert.ToInt32(drpRoleName.SelectedValue) ;
                model.IsActive = true;
               model.EmployeeId =  Convert.ToInt32( drpEmployeeName.SelectedValue) ;
               model.BranchId  =  Convert.ToInt32(Session["BranchId"]) ;
         

          }




        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

        }
    }
}