using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL;
using Modal;
using System.Data;

namespace NavnathWebsite.Admin
{
    public partial class RoleMaster : System.Web.UI.Page
    {
        RoleMasterBAL objbal = new RoleMasterBAL();
        RoleMasterModel model = new RoleMasterModel();

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                BindGrid();
                BindRole();
            }


        }

        private void BindRole()
        {

            List<RoleMasterModel> lst = objbal.GetRoleDetail();
            drpSearchRole.Items.Clear();
            drpSearchRole.DataSource = lst;
            drpSearchRole.DataTextField = "RoleName";
            drpSearchRole.DataValueField = "RoleId";
            drpSearchRole.DataBind();
            drpSearchRole.Items.Insert(0, "Select");
            drpSearchRole.SelectedIndex = 0;
        
        }


        private void BindGrid()
        {

            List<LoginDetailsModel> lst = objbal.GetMenuDetail();
            DataTable dt1 = CreateTable(9);

            dt1.Columns["ID5"].DataType = typeof(bool);
            dt1.Columns["ID6"].DataType = typeof(bool);
            dt1.Columns["ID7"].DataType = typeof(bool);
            dt1.Columns["ID8"].DataType = typeof(bool);
            dt1.Columns["ID9"].DataType = typeof(bool);


            int cnt = 0;

            foreach (var val in lst)
            {
                dt1.Rows.Add();
                dt1.Rows[cnt]["ID1"] = val.SubMenuName;
                dt1.Rows[cnt]["ID2"] = val.SubMasterMenuId;
                dt1.Rows[cnt]["ID3"] = val.MenuName;
                dt1.Rows[cnt]["ID4"] = val.MasterMenuId;
                dt1.Rows[cnt]["ID5"] = 0;
                dt1.Rows[cnt]["ID6"] = 0;
                dt1.Rows[cnt]["ID7"] = 0;
                dt1.Rows[cnt]["ID8"] = 0;
                dt1.Rows[cnt]["ID9"] = 0;

                cnt++;

            }


            ViewState["BindGrid"] = dt1;
            grvBindRole.DataSource = dt1;
            grvBindRole.DataBind();

        }



        private DataTable CreateTable(int col)
        {
            DataTable dt = new DataTable();

            for (int i = 0; i <= col; i++)
            {
                dt.Columns.Add("ID" + i);
            }
            return dt;
        }

        private void ControlTovalue()
        {
            model.RoleName = txtRoleName.Text.ToString();
            model.IsActive = chkIsActive.Checked ? true : false;
            
            List<RoleMasterModel> lst = new List<RoleMasterModel>();

            foreach (GridViewRow gvrow in grvBindRole.Rows)
            {
                CheckBox chkRoles = (CheckBox)gvrow.FindControl("chkRoles");
                CheckBox chkAdd = (CheckBox)gvrow.FindControl("chkAdd");
                CheckBox chkUpdate = (CheckBox)gvrow.FindControl("chkUpdate");
                CheckBox chkDelete = (CheckBox)gvrow.FindControl("chkDelete");
                CheckBox chkSearch = (CheckBox)gvrow.FindControl("chkSearch");

                Label lblSubMenuName = (Label)gvrow.FindControl("ID1"); // form name
                Label lblSubMenuId = (Label)gvrow.FindControl("ID2");
                Label lblMenuId = (Label)gvrow.FindControl("ID4");

                RoleMasterModel objmodel = new RoleMasterModel();
           
                if ((chkRoles != null & chkRoles.Checked))
                {
                    objmodel.AddAccess = chkAdd.Checked ? true : false;
                    objmodel.UpdateAccess = chkUpdate.Checked ? true : false;
                    objmodel.SearchAccess = chkSearch.Checked ? true : false;
                    objmodel.DeleteAccess = chkDelete.Checked ? true : false;
                    objmodel.MasterMenuId = Convert.ToInt32(lblMenuId.Text);
                    objmodel.SubMasterMenuId = Convert.ToInt32(lblSubMenuId.Text);
                    lst.Add(objmodel);

                }
            }

            model.getAccessDtl = lst;

        
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


                    result = objbal.SaveRoleMasterMaster(model);
                    if (result > 0)
                    {
                        Response.Write("<script> alert('Record Save Successfully...') </Script>");

                        BindRole();
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

         

        protected void btnSearch_Click(object sender, EventArgs e)
        {


            List<RoleMasterModel> lst = objbal.GetMenuDetailById(Convert.ToInt32(drpSearchRole.SelectedValue));

            if (lst.Count > 0)
            {
                BindGrid();
                DataTable dt = (DataTable)ViewState["BindGrid"];

                txtRoleName.Text = lst[0].RoleName;
                chkIsActive.Checked = lst[0].IsActive;


                foreach (RoleMasterModel val in lst)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (val.SubMasterMenuId == Convert.ToInt32(dt.Rows[i]["ID2"]))
                        {
                            dt.Rows[i]["ID9"] = 1;
                            dt.Rows[i]["ID5"] = val.AddAccess;
                            dt.Rows[i]["ID6"] = val.UpdateAccess;
                            dt.Rows[i]["ID7"] = val.DeleteAccess;
                            dt.Rows[i]["ID8"] = val.SearchAccess;
                        }
                         
                    }

                }


                ViewState["BindGrid"] = dt;
                grvBindRole.DataSource = dt;
                grvBindRole.DataBind();

            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            try
            {

                if (Page.IsValid)
                {

                    int result = 0;
                    // AutoIncrement();
                    ControlTovalue();
                    model.RoleId = Convert.ToInt32(drpSearchRole.SelectedValue);


                    result = objbal.UpdateRoleMasterMaster(model);
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

    }
}