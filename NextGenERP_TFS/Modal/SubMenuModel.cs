using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Modal
{
    public class SubMenuModel
    {
         
        public int SubMenuId { get; set; }
        public string SubMenuName { get; set; }
        public string SubMenuLink { get; set; }
        public bool IsSubMenuAcive { get; set; }
        public string BranchName { get; set; }
        public int MasterMenuId { get; set; }
    }
}
