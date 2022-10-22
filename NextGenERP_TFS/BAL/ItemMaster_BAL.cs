using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using System.Data;
using Modal;

namespace BAL
{
    public class ItemMaster_BAL
    {
        ItemMaster_DAL dal = new ItemMaster_DAL();

        public DataTable FillItemMaster()
        {
            return dal.FillItemMaster();
        }

        public DataTable BindItemMasterByCode(string ItemCode)
        {
            return dal.BindItemMasterByCode(ItemCode);
        }
        public int SaveItemMaster(ItemMaster_Model model)
        
        {
            return dal.SaveItemMaster(model);
        }

        public int UpdateItemMaster(ItemMaster_Model model)
        {
            return dal.UpdateItemMaster(model);
        }

    }
}
