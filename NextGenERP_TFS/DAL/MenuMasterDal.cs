using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Modal;
using System.Data.SqlClient;
using System.Data;


namespace DAL
{
   public class MenuMasterDal:ConncetionClass
    {
       public int SaveMenuData(MenuMasterModel MenuModel)
       {
           
            this.Initialize();
            int nRecAffected = 0;
            using (cmdUniversal)
            {
                cnUniversal.Open();
                cmdUniversal = new SqlCommand("SaveMasterMenu", cnUniversal);
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                SqlCommandBuilder.DeriveParameters(cmdUniversal);
                cmdUniversal.Parameters["@MenuName"].Value = MenuModel.MenuName;
                cmdUniversal.Parameters["@IsActive"].Value = MenuModel.IsActive;
                cmdUniversal.Parameters["@BranchName"].Value = MenuModel.BranchName;
                nRecAffected = cmdUniversal.ExecuteNonQuery();
                this.Close();
                return nRecAffected;
            }

            
       }

       public DataTable FillMenuItem()
       {
           DataTable dt = new DataTable();

           this.Initialize();
           int nRecAffected = 0;
           using (cmdUniversal)
           {
               try
               {
                   cnUniversal.Open();
                   cmdUniversal.CommandText = "BindMenuMaster";
                   this.daUniversal.SelectCommand = cmdUniversal;
                  // this.cnUniversal.Open();
                   nRecAffected = this.daUniversal.Fill(dt);
                   this.Close();
               }
               catch (Exception ex)
               {
               }
                return dt;
           }

       }

    }
}
