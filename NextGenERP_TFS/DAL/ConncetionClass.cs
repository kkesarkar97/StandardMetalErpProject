using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace DAL
{
    public class ConncetionClass
    {
        internal static string conn;
        internal SqlConnection cnUniversal;
        internal SqlCommand cmdUniversal;
        internal SqlDataAdapter daUniversal;

        public string ConnectionString
        {
            set { conn = value; }
        }

        public ConncetionClass()
        {
            // windows auth
            //conn = @"Data Source=DESKTOP-ARQ3E57;Initial Catalog=StandardMetals_Com;Integrated Security=True";
            conn = @"data source=DESKTOP-SNO97CL;initial catalog=StandardMetalDB;integrated security=true";

            // Sql Server auth
            //conn = @"Data Source=LAPTOP-474BAR80;Initial Catalog=StandardMetals_Com;Integrated Security=False;uid=sa;password=aalim";
            // dev erp Server auth
            // conn = @"Data Source=208.91.198.174;Initial Catalog=aaliml4n_erp;Integrated Security=False;uid=aaliml4n_deverp;password=qb1u8K6&";

        }
        public virtual void Initialize()
        {
            try
            {
                cnUniversal = new SqlConnection(conn);
                daUniversal = new SqlDataAdapter();
                cmdUniversal = new SqlCommand();
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                cmdUniversal.Connection = cnUniversal;
            }

            catch (Exception e)
            {
                ErrorLog("dbBasis initialization", e);
            }
        }

        public virtual void Close()
        {
            if (cnUniversal.State != System.Data.ConnectionState.Closed)
                cnUniversal.Close();
        }

        protected virtual void ErrorLog(string strMessage, Exception e)
        {
            Exception oException = new Exception(e.InnerException.Message + " \n\n Details:" + strMessage);
            throw oException;
        }
    }
}
