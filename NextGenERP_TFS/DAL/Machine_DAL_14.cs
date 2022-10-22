using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Modal;

namespace DAL
{
    public class Machine_DAL_14:ConncetionClass
    {
        public DataTable FillMachinemaster()
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "FillMachinemaster";

                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                return dt;
            }

            }
        public DataTable BindMachineType()
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "bindMachineType";

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
        public int SaveMachineMaster(Machine_Model_14 model)
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

                    cmdUniversal.Parameters["@MachineCode"].Value = model.MachineNo;
                    cmdUniversal.Parameters["@MachineName"].Value = model.MachineName;
                    cmdUniversal.Parameters["@ManualCode"].Value = model.Group;
                    cmdUniversal.Parameters["@Make"].Value = model.Make;
                    cmdUniversal.Parameters["@InternalCode"].Value = model.Cmp_Code;
                    cmdUniversal.Parameters["@MachineCostPerHr"].Value = model.MachineCostPerHr;
                    cmdUniversal.Parameters["@Capacity"].Value = model.CapacityRangeTo;
                    cmdUniversal.Parameters["@Location"].Value = model.Location;
                    cmdUniversal.Parameters["@PMPlan"].Value = model.PMPlan;
                    cmdUniversal.Parameters["@Model"].Value = model.Model;
                    cmdUniversal.Parameters["@PurchaseDate"].Value = model.PurchaseDate;
                    cmdUniversal.Parameters["@Remark"].Value = model.Remark;

                    nRecAffected = cmdUniversal.ExecuteNonQuery();
                    this.Close();


                }

            }
            catch (Exception ex)
            {

            }
            return nRecAffected;
        }
        public DataTable SearchMachineMaster(string MachineCode)
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "SearchMachines";
                cmdUniversal.Parameters.Add("@MachineCode", SqlDbType.VarChar).Value = MachineCode;
                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }
        public int UpdateMachineMaster(Machine_Model_14 model)
        {
            int nRecAffected = 0;
            try
            {
                this.Initialize();

                using (cmdUniversal)
                {
                    cnUniversal.Open();
                    cmdUniversal = new SqlCommand("UpdateMachineMaster", cnUniversal);
                    cmdUniversal.CommandType = CommandType.StoredProcedure;
                    SqlCommandBuilder.DeriveParameters(cmdUniversal);

                    cmdUniversal.Parameters["@MachineCode"].Value = model.MachineNo;
                    cmdUniversal.Parameters["@MachineName"].Value = model.MachineName;
                    cmdUniversal.Parameters["@ManualCode"].Value = model.Group;
                    cmdUniversal.Parameters["@Make"].Value = model.Make;
                    cmdUniversal.Parameters["@InternalCode"].Value = model.Cmp_Code;
                    cmdUniversal.Parameters["@MachineCostPerHr"].Value = model.MachineCostPerHr;
                    cmdUniversal.Parameters["@Capacity"].Value = model.CapacityRangeTo;
                    cmdUniversal.Parameters["@Location"].Value = model.Location;
                    cmdUniversal.Parameters["@PMPlan"].Value = model.PMPlan;
                    cmdUniversal.Parameters["@Model"].Value = model.Model;
                    cmdUniversal.Parameters["@PurchaseDate"].Value = model.PurchaseDate;
                    cmdUniversal.Parameters["@Remark"].Value = model.Remark;

                    nRecAffected = cmdUniversal.ExecuteNonQuery();
                    this.Close();

                }
            }
            catch (Exception ex)
            {

            }
            return nRecAffected;
        }

        public DataTable GridViewBind()
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "GridViewTable";

                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

         public int CheckDuplicateMachineName(string MachineName, string MachineCode)
        {
            
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.Parameters.Add("@MachineName", SqlDbType.VarChar).Value = MachineName;
                cmdUniversal.Parameters.Add("@MachineCode", SqlDbType.VarChar).Value = MachineCode;
                cmdUniversal.CommandText = "ChechDuplicateMachine";
                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                int res = dt.Rows.Count >= 1 ? 1 : 0;

            }
             return nRecAffected;

                
                
            }

        
    }
}