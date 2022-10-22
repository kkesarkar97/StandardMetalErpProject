using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DAL;

namespace BAL
{
   public class ItemMasterMngr
    {
       dbItemMaster _dbItem = new dbItemMaster();

       public int SaveITemMaster(dbItemMaster itemmst)
       {
           return _dbItem.SaveItemMaster(itemmst);
       }

       public DataTable FillItem(string CmpCode, string ItemName,string ItemType,string ItemSubType)
       {
           return _dbItem.FillItem(CmpCode, ItemName, ItemType, ItemSubType);
       }


       public DataTable FillCategory(int CategoryId)
       {
           return _dbItem.FillCategory(CategoryId);
       }

       public int CheckDupItem(string ItemName, String ItemCode)
       {
           return _dbItem.CheckDupItem(ItemName, ItemCode);
       }


       public DataTable FillItemMasterdetail(string CmpCode, string ItemName, string ItemType, string ItemSubType,int flag)
       {
           return _dbItem.FillItemMasterdetail(CmpCode, ItemName, ItemType, ItemSubType, flag);
       }
       public DataTable RetriveItem(string ItemCode)
       {
           return _dbItem.RetriveItem(ItemCode);
       }

       public DataTable GetMaxItemNumber(string RawMaterial)
       {
           return _dbItem.GetMAXItemNumber(RawMaterial);
       }

        
    }
}
