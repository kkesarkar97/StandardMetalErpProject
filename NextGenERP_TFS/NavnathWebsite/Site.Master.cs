using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace NavnathWebsite
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // string referer = Request.ServerVariables["HTTP_REFERER"];
            //if (string.IsNullOrEmpty(referer))
            //{
            //    Server.Transfer("~/Login.aspx", false);
            //}
            //if (string.IsNullOrEmpty((string)Session["UserName"]))
            //    Server.Transfer("~/Login.aspx", false);
            int LoginUserId = 0;
            if (!this.IsPostBack)
            {
                if (ddlLanguages.Items.FindByValue(CultureInfo.CurrentCulture.Name) != null)
                {
                    ddlLanguages.Items.FindByValue(CultureInfo.CurrentCulture.Name).Selected = true;
                }


                
                if (Session["Username"] != null)
                {
                    lblusername.Text = Session["Username"].ToString();
                    lbltime.Text = DateTime.Now.ToString();
                    lblbranch.Text = Session["Branch"].ToString();
                    LoginUserId= Convert.ToInt32(Session["UserId"].ToString());
                }
                else
                {
                    Response.Redirect("Default.aspx");

                }

            }      
        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../Login.aspx");
        }
    }
}
