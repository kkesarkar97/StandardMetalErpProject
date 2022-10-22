using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BAL;
using DAL;
using System.Data;
using Modal;
namespace NavnathWebsite
{
    public partial class Login : System.Web.UI.Page
    {
        LoginDetails objdbLogin = new LoginDetails();
        DataTable dt = new DataTable();

        int LoginUserId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie cook2 = Request.Cookies["Userdetail"];
                if (cook2 != null)
                {
                    string username = cook2["username"].ToString();
                    LoginUserId = Convert.ToInt32(cook2["LoginUserId"]);

                    List<LoginDetailsModel> MenuSubMenu = objdbLogin.GetMenuDetail(LoginUserId);
                    Session["MenuSubMenu"] = MenuSubMenu;

                    Response.Redirect("Masters/Default.aspx"); 
                }
            }

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            
            try
            {
                dt = objdbLogin.LoginDetailsvalue(txtusername.Text, txtpassword.Text);
                if (dt.Rows.Count > 0)
                {
                    string username = dt.Rows[0]["UserName"].ToString();
                      LoginUserId = Convert.ToInt32(dt.Rows[0]["LoginUserId"].ToString());

                    string Password = dt.Rows[0]["Password"].ToString();
                    string Branch = dt.Rows[0]["BranchName"].ToString();
                    string EmpCode = dt.Rows[0]["EmpCode"].ToString();
                    int BranchId = Convert.ToInt32(dt.Rows[0]["BranchId"].ToString());

                    if (txtusername.Text.Equals(username) && txtpassword.Text.Equals(Password))
                    {
                        Session["Username"] = username;
                        Session["Branch"] = Branch;
                        Session["BranchId"] = BranchId;
                        Session["EmpCode"] = EmpCode;
                        Session["UserId"] = LoginUserId;// dt.Rows[0]["LoginUserId"].ToString();

                        List<LoginDetailsModel> MenuSubMenu = objdbLogin.GetMenuDetail(LoginUserId);
                        Session["MenuSubMenu"] = MenuSubMenu;
                                              
                        if (CheckBox1.Checked)
                        {
                            HttpCookie cookie = new HttpCookie("Userdetail");
                            cookie["username"] = username;
                            cookie["LoginUserId"] = LoginUserId.ToString();

                            cookie.Expires.AddHours(9);
                            Response.Cookies.Add(cookie);
                            // Response.Cookies["username"].Value = username;
                        }
                        Response.Redirect("Masters/Default.aspx"); 
                }                                        
                    else
                    {
                        Response.Write("<script>alert('Please enter correct UserName and Password')</script>");

                    }
                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);

            }
        }

        protected void txtusername_TextChanged(object sender, EventArgs e)
        {

        }
    }
}