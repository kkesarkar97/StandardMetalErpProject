using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Modal
{
    
    public class LoginUserMasterModel
    {

        public int LoginUserId { get; set; }
        public string UserName { get; set; }

        public string Password { get; set; }
        public string RoleName { get; set; }
        public int RoleId { get; set; }
        public bool IsActive  { get; set; }
        public int EmployeeId { get; set; }
        public int BranchId { get; set; }
        public DateTime SystemEntryDate { get; set; }



    }


}
