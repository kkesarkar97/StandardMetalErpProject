using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Modal;
namespace DAL
{
    public class MachineMasterNDAL : ConncetionClass
    {
        public DataTable BindMachineCode(MachineMasterNModel mmodel)
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindMachineName";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable FillMachinemaster(MachineMasterNModel mmodel)
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "FillMachineMaster";

                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }
        public DataTable BindPMplan()
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindPmPlan";

                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }
        public DataTable BindDrpMachinType()
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindMachineType";

                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }
        public int SaveMachineMaster(MachineMasterNModel mmodel)
        {
            int nRecAffected = 0;
            try
            {
                this.Initialize();

                using (cmdUniversal)
                {
                    cnUniversal.Open();
                    cmdUniversal = new SqlCommand("SaveMachineMaster", cnUniversal);
                    cmdUniversal.CommandType = CommandType.StoredProcedure;
                    SqlCommandBuilder.DeriveParameters(cmdUniversal);

                    cmdUniversal.Parameters["@MachineCode"].Value = mmodel.MachineNo;
                    cmdUniversal.Parameters["@MachineName"].Value = mmodel.MachineName;
                    cmdUniversal.Parameters["@ManualCode"].Value = mmodel.Group;
                    cmdUniversal.Parameters["@Make"].Value = mmodel.Make;
                    cmdUniversal.Parameters["@Cmp_Code"].Value = mmodel.Cmp_Code;
                    cmdUniversal.Parameters["@MachineCostPerHr"].Value = mmodel.MachineCostPerHr;
                    cmdUniversal.Parameters["@Capacity"].Value = mmodel.CapacityRangeTo;
                    cmdUniversal.Parameters["@Location"].Value = mmodel.Location;
                    cmdUniversal.Parameters["@PMPlan"].Value = mmodel.PMPlan;
                    cmdUniversal.Parameters["@Model"].Value = mmodel.Model;
                    cmdUniversal.Parameters["@PurchaseDate"].Value = mmodel.PurchaseDate;
                    cmdUniversal.Parameters["@Remark"].Value = mmodel.Remark;

                    nRecAffected = cmdUniversal.ExecuteNonQuery();
                    this.Close();


                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            return nRecAffected;
        }

    }

}
