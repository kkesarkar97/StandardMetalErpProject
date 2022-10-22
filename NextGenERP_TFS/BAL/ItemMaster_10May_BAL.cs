using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DAL;
using Modal;

namespace BAL
{
    public class ItemMaster_10May_BAL
    {
        ItemMaster_10May_DAL dal =new ItemMaster_10May_DAL();
        

        public DataTable FillItemMaster()
        {
            return dal.FillItemMaster();
        }

        public DataTable BindManufacturer()
        {
            return dal.BindManufacturer();
        }

        public DataTable BindColor()
        {
            return dal.BindColor();
        }

        public DataTable BindUOM()
        {
            return dal.BindUOM();
        }
        public DataTable FillCategory(int CategoryId)
        {
            return dal.FillCategory(CategoryId);
        }
       
        public int Save_ItemMaster_10May(ItemMaster_10May_Model model)
        {
            return dal.Save_ItemMaster_10May(model);
        }
        public DataTable Search_ItemMaster_10May(string ItemCode)
        {
            return dal.Search_ItemMaster_10May(ItemCode);
        }
        public int Update_ItemMaster_10May(ItemMaster_10May_Model model)
        {
            return dal.Update_ItemMaster_10May(model);
        }

    }
}
