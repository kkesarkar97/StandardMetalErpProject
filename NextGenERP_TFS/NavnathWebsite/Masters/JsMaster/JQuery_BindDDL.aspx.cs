using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JQueryAjaxCall
{
    public partial class JQuery_BindDDL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<string> FillItemMaster(string name)
        {
             
             
            List<string> lst = null;
             
            return lst;
        }

    }
}