using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Modal
{
    public class LoginDetailsModel
    {

        public int MasterMenuId { get; set; }
        public string MenuName { get; set; }

        public bool IsMaster { get; set; }
        public int SubMasterMenuId { get; set; }
        public string SubMenuName { get; set; }
        public string MenuLink { get; set; }

        public bool AddAccess { get; set; }
        public bool UpdateAccess { get; set; }
        public bool DeleteAccess { get; set; }
        public bool SearchAccess { get; set; }



    }
}
