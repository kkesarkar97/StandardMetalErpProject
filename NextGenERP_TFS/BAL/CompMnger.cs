using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using DAL;
using Modal;
namespace BAL
{
    public class CompMnger 
    {
        dbCompanyMaster CompData = new dbCompanyMaster();
        
        public DataTable FillCompanyMaster(CompanyMasterModel CompModel)
        {
            return CompData.FillCompanyMaster(CompModel);
        }

        //UpdateCompany
        public int UpdateCompany(CompanyMasterModel CompModel)
        {

            return CompData.UpdateCompany(CompModel);
        }
        //FillCustomer
        public int FillCustomer(CompanyMasterModel CompModel)
        {

            return CompData.FillCustomer(CompModel);
        }

    }
}
