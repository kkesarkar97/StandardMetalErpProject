using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace NavnathWebsite.Masters.JsMaster
{
    public class EmpData
    {
        public string EmpId { get; set; }
        public string EmpName { get; set; }
    }
    public partial class AjaxCallFrom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<EmpData> FillItemMaster(string name)
        {
            List<EmpData> lst = new List<EmpData>();
            lst.Add(new EmpData()
            {
                EmpId = "1",
                EmpName = "Aarti"
            });

            lst.Add(new EmpData()
            {
                EmpId = "2",
                EmpName = "omkar"
            });
            lst.Add(new EmpData()
            {
                EmpId = "3",
                EmpName = "Aditya"
            });

           
            return lst;
        }
    }
}
    
