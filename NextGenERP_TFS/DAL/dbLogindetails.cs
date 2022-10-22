using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Modal;
namespace DAL
{
    public class dbLogindetails:ConncetionClass
    {
        DataTable dt;
        public DataTable LoginDetails(string username,string password)
        {
            this.Initialize();
            int nRecAffected = 0;
            dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "GetLoginDetails";
                cmdUniversal.Parameters.Add("@UserName", SqlDbType.VarChar).Value = username;
                cmdUniversal.Parameters.Add("@password", SqlDbType.VarChar).Value = password;
                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }


        public List<LoginDetailsModel> GetMenuDetail(int LoginUserId)
        {
            this.Initialize();
            int nRecAffected = 0;
            dt = new DataTable();
            List<LoginDetailsModel> lst = new List<LoginDetailsModel>();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "Admin_GetUserAccessDetail";
                cmdUniversal.Parameters.Add("@LoginUserId", SqlDbType.VarChar).Value = LoginUserId;
                  this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();

                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        lst.Add(new LoginDetailsModel()
                        {
                            MasterMenuId = Convert.ToInt32( dt.Rows[i]["MasterMenuId"]),
                            MenuName = dt.Rows[i]["MenuName"].ToString(),
                            IsMaster = Convert.ToBoolean(dt.Rows[i]["IsMaster"]),
                            SubMasterMenuId = Convert.ToInt32(dt.Rows[i]["SubMasterMenuId"]),
                            SubMenuName = dt.Rows[i]["SubMenuName"].ToString(),
                            MenuLink = dt.Rows[i]["MenuLink"].ToString(),
                            AddAccess = Convert.ToBoolean(dt.Rows[i]["AddAccess"]),
                            UpdateAccess = Convert.ToBoolean(dt.Rows[i]["UpdateAccess"]),
                            DeleteAccess = Convert.ToBoolean(dt.Rows[i]["DeleteAccess"]),
                            SearchAccess = Convert.ToBoolean(dt.Rows[i]["SearchAccess"]),
                       });
                    }
                    }

                return lst;
            }
        }

    }
}
