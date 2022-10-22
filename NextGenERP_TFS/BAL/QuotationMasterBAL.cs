using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Modal;
using DAL;
using System.Data;

namespace BAL
{
    
   public class QuotationMasterBAL
    {
        QuotationMasterDAL dal = new QuotationMasterDAL();
        /*public List<QuotationMasterModel> GetAllQuotationMasterData()
        {
            return dal.GetAllQuotationMasterData();
        }*/

        public DataTable BindCustomer()
        {
            return dal.BindCustomer();
        }

        public DataTable BindItemMaster()
        {
            return dal.BindItemMaster();
        }
        public DataTable BindCustomerName()
        {
            return dal.BindCustomerName();
        }

        public DataTable BindCustomerCode()
        {
            return dal.BindCustomerCode();
        }
        public DataTable BindUnitDrpDown()
        {
            return dal.BindUnitDrpDown(); 
        }

        public DataTable BindPaymentDrpdown()
        {
            return dal.BindPaymentDrpdown();
        }

        public DataTable BindDrawingBack()
        {
            return dal.BindDrawingBack();
        }

        public DataTable BindDeliveryTerm()
        {
            return dal.BindDeliveryTerm();
        }
        public int SaveQuotationData(QuotationMasterModel model,out string QuotationNumber)
        {
            return dal.SaveQuotationData(model,out QuotationNumber);
        }
        public int SaveQuotationDetails(QuotationDetailsModel dmodel, QuotationMasterModel model)
        {
            return dal.SaveQuotationDetails(dmodel,model);
        }

        public DataTable BindItemCodeDrpDown()
        {
            return dal.BindItemCodeDrpDown();
        }

        public DataTable BindItemNameDrpDown()
        {
            return dal.BindItemNameDrpDown();
        }
        public DataTable Marketing_BindEnquiryMasterNo()
        {
            return dal.Marketing_BindEnquiryMasterNo();
        }

        public DataTable BindSymbolDrpdown()
        {
            return dal.BindSymbolDrpdown();
        }

        public DataTable BindToolMasterCode()
        {
            return dal.BindToolMasterCode();
        }

        public DataTable BindToolMasterName()
        {
            return dal.BindToolMasterName();
        }
        public DataTable BindMarketingModeOfDrpdown()
        {
            return dal.BindMarketingModeOfDrpdown();   
        }

        /*public void DisplayQuantityList()
        {
            return dal.DisplayQuantityList();
        }*/

        public DataTable BindStatusDrpdown()
        {
            return dal.BindStatusDrpdown();
        }
        public DataTable BindCustDtls(int Id)
        {
            return dal.BindCustDtls(Id);
        }
        public DataTable BindToolDetails(int id)
        {
            return dal.BindToolDetails(id);
        }
        public DataTable BindQuotationNumber()
        {
            return dal.BindQuotationNumber();
        }
        public DataTable BindItemDtls(int id)
        {
            return dal.BindItemDtls(id);
        }
        public DataTable BindEnquiryDetails(int id)
        {
            return dal.BindEnquiryDetails(id);
        }
        public DataTable BindFreightMaster()
        {
            return dal.BindFreightMaster();
        }

        public DataTable BindValidityType()
        {
            return dal.BindValidityType();
        }
        public DataTable BindPackingType()
        {
            return dal.BindPackingType();
        }
        
        public DataTable BindApprovedByEmpCode()
        {
            return dal.BindApprovedByEmpCode();
        }
        public DataTable BindApprovedByEmpName()
        {
            return dal.BindApprovedByEmpName();
        }

        public DataTable BindAllQuotationDetails(int QuotationId)
        {
            return dal.BindAllQuotationDetails(QuotationId);
        }

    }
}
