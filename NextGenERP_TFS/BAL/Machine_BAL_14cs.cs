using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DAL;
using Modal;

namespace BAL
{
    public class Machine_BAL_14cs
    {

       Machine_DAL_14 dal = new Machine_DAL_14();

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
       public int SaveMachineMaster(Machine_Model_14 model)
       {
           return dal.SaveMachineMaster(model);
       }
       public DataTable SearchMachineMaster(string MachineCode)
       {
           return dal.SearchMachineMaster(MachineCode);
       }
       public int UpdateMachineMaster(Machine_Model_14  model)
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

