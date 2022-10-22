using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Modal;
using System.Data;
using System.Data.SqlClient;
namespace DAL
{
    public class ItemMaster_DAL : ConncetionClass
    {

        public DataTable FillItemMaster()
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
              
                cmdUniversal.CommandText = "Get_Demo_Item";  //define procedure
                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }
        public DataTable BindItemMasterByCode(string ItemCode)
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "Get_Demo_Item";
                cmdUniversal.Parameters.Add("@ItemCode", SqlDbType.VarChar).Value = ItemCode;
                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }
        public int SaveItemMaster(ItemMaster_Model model)
        {
            int nRecAffected = 0;
            try
            {
                this.Initialize();
                using (cmdUniversal)
                {
                    cnUniversal.Open();
                    cmdUniversal = new System.Data.SqlClient.SqlCommand("Save_Master", cnUniversal);
                    cmdUniversal.CommandType = CommandType.StoredProcedure;
                    SqlCommandBuilder.DeriveParameters(cmdUniversal);
                    cmdUniversal.Parameters["@ItemName"].Value = model.ItemName;
                    // cmdUniversal.Parameters["@Manufacturer"].Value=dbItem.Manufacturer;
                    cmdUniversal.Parameters["@Material"].Value = model.Material;
                    cmdUniversal.Parameters["@ItemCode"].Value = model.ItemCode;
                    nRecAffected = cmdUniversal.ExecuteNonQuery();
                    this.Close();

                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
                this.Close();
            }
            return nRecAffected;
        }

        //update
        public int UpdateItemMaster(ItemMaster_Model model)
        {
            int nRecAffected = 0;
            try
            {
                this.Initialize();
                using (cmdUniversal)
                {
                    cnUniversal.Open();
                    cmdUniversal = new System.Data.SqlClient.SqlCommand("Update_Master", cnUniversal);
                    cmdUniversal.CommandType = CommandType.StoredProcedure;
                    SqlCommandBuilder.DeriveParameters(cmdUniversal);
                    cmdUniversal.Parameters["@ItemName"].Value = model.ItemName;
                    // cmdUniversal.Parameters["@Manufacturer"].Value=dbItem.Manufacturer;
                    cmdUniversal.Parameters["@Material"].Value = model.Material;
                    cmdUniversal.Parameters["@ItemCode"].Value = model.ItemCode;
                    nRecAffected = cmdUniversal.ExecuteNonQuery();
                    this.Close();

                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
                this.Close();
            }
            return nRecAffected;
        }

    }
}

