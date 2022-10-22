using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using DAL;
using Modal;
namespace BAL
{
   public class MachineMasterNBAL
    {
        MachineMasterNDAL dal = new MachineMasterNDAL();
        public DataTable BindMachineCode(MachineMasterNModel mmodel)
        {
            return dal.BindMachineCode(mmodel);

        }
        public DataTable FillMachinemaster(MachineMasterNModel mmodel)
        {
            return dal.FillMachinemaster(mmodel);
        }
        public DataTable BindPMplan()
        {
            return dal.BindPMplan();
        }

        public DataTable BindDrpMachinType()
        {
            return dal.BindDrpMachinType();
        }
        public int SaveMachineMaster(MachineMasterNModel mmodel)
        {
            return dal.SaveMachineMaster(mmodel);
        }
    }
}
