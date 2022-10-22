using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Modal
{
    [Serializable]
    public class QuotationMasterModel
    {
        //Quotation Details
        public int QuotationId { set; get; }
        public bool WithEnquiry { get; set; }
        public int EnquiryId { set; get; }
        public string RevisionNumber { set; get; }
        public string QuotationNumber { get; set; }
        public DateTime QuotationDate { get; set; }
        public bool IsNewCustomer { set; get; }
        public int CustomerId { set; get; }
        //public string CustomerCode { set; get; }
        //public string CustomerName { set; get; }
        public string NewCustomerCode { set; get; }
        public string NewCustomerName { set; get; }
        public string ContactPerson { get; set; }
        public string Address { get; set; }
        public int Quantity { get; set; }
        public int Rate { get; set; }
        public int SymbolId { get; set; }
        public int LoginUserId { get; set; }
        public int BranchId { get; set; }
        public DateTime SystemEntryDate { set; get; }

        public List<QuotationMasterModel> AllData { get; set; }
        
        
    }
}
