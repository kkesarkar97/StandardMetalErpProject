using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace CommonUtilities
{
  public static  class GridUtility
    {

        //to create datatable
        public static DataTable CreateTable(int NoOfRows)
        {
            DataTable dt1 = new DataTable();
            for (int i = 1; i <= NoOfRows; i++)
            {
                string ID = "ID" + i;
                dt1.Columns.Add(ID);
            }
            return dt1;
        }
    }
}
