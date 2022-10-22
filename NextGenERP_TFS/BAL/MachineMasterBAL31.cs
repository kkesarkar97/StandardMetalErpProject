using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Modal;
using System.Data;

namespace BAL
{
   public class MachineMasterBAL31
    {
       MachineMasterDAL31 dal = new MachineMasterDAL31();

       public DataTable FillMachinemaster()
       {
           return dal.FillMachinemaster();
       }
       public DataTable BindMachineType()
       {
           return dal.BindMachineType();
       }
       public DataTable BindPMplan()
       {
           return dal.BindPMplan();
       }
       public int SaveMachineMaster(MachineMasterMMODAL31 model)
       {
           return dal.SaveMachineMaster(model);
       }
       public DataTable SearchMachineMaster(string MachineCode)
       {
           return dal.SearchMachineMaster(MachineCode);
       }
       public int UpdateMachineMaster(MachineMasterMMODAL31 model)
       {
           return dal.UpdateMachineMaster(model);
       }
       public DataTable GridViewBind()
       {
           return dal.GridViewBind();
       }

       public int CheckDuplicateMachineName(string MachineName, string MachineCode)
       {
           return dal.CheckDuplicateMachineName(MachineName, MachineCode);

       }
    }
}
