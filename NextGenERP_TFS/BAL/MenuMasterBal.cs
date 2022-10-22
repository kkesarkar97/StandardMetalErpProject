using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using Modal;
using System.Data;

namespace BAL
{
    public class MenuMasterBal
    {
        MenuMasterDal MenuDal = new MenuMasterDal();

        public int SaveMenuData(MenuMasterModel MenuModel)
        {
            return MenuDal.SaveMenuData(MenuModel);
        }

        public DataTable FillMenuItem()
        {
            return MenuDal.FillMenuItem();

        }

    }
}
