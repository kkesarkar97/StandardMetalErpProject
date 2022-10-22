using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Modal;
using System.Data;
using DAL;

namespace BAL
{
  public  class RoleMasterBAL
    {

        RoleMasterDAL objdal = new RoleMasterDAL();

        public List<LoginDetailsModel> GetMenuDetail()
        {
            return objdal.GetMenuDetail();
        }

        public List<RoleMasterModel> GetRoleDetail()
        {
            return objdal.GetRoleDetail();
        }
        public List<RoleMasterModel> GetMenuDetailById(int RoleId)
        {
            return objdal.GetMenuDetailById(RoleId);
        }

        public int SaveRoleMasterMaster(RoleMasterModel model)
        {
            return objdal.SaveRoleMasterMaster(model);
        }
        public int UpdateRoleMasterMaster(RoleMasterModel model)
        {
            return objdal.UpdateRoleMasterMaster(model);
        }

    }
}
