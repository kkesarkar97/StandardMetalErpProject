using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DAL;
using Modal;


namespace BAL
{
    public class LoginDetails
    {
        dbLogindetails objdbLogindetails = new dbLogindetails();
        public DataTable LoginDetailsvalue(string UserName, string Password)
        {
            return objdbLogindetails.LoginDetails(UserName, Password);
        }
        public List<LoginDetailsModel> GetMenuDetail(int LoginUserId)
        {
            return objdbLogindetails.GetMenuDetail(LoginUserId);
        }
   

    
    }
}
