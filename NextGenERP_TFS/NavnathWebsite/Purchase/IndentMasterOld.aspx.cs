using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BAL;
using Modal;
namespace NavnathWebsite.Purchase
{
    public partial class IndentMasterOld : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtTime.Text = DateTime.Now.ToString("hh:mm tt");
            txtIndentDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
            if (!IsPostBack)
            {
                
            }

        }
    }
}