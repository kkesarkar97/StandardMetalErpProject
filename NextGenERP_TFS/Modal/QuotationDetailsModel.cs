using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Modal
{
    public class QuotationDetailsModel
    {
        public int QuotationDetailsId { set; get; }
        public int ID { set; get; }
        public string ItemName { get; set; }
        //public string ItemCode { get; set; }
        public int ToolMouldId {set;get;}
        //public string ToolMouldName { get; set; }
        //public string ToolMouldCode { set; get; }
        public DateTime DeliveryLeadTime { get; set; }
        public decimal PackingCost { get; set; }
        public decimal DevelopmentToolCost { set; get; }
        public decimal MouldCost { set; get; }
        public int MouldCavity { set; get;}
        public decimal OtherCost { set; get; }
        public string OtherCostRemark { set; get; }
        public string Material { set; get; }
        public int UnitId { set; get; }
        public string Ecess { get; set; }
        public decimal ServiceTax { get; set; }
        public string Excise { set; get; }
        public decimal SalesTax { set; get; }
        public int PaymentTypeId { set; get; }
        public int TransportId { set; get; }
        public int FreightId { set; get; }
        public int PlanTypeId { set; get; }
        public int PackingId { get; set; }
        public int StatusId { set; get; }
        public string AgainstFormNo { set; get; }
        public string Remark { set; get; }
        public int DrawingId { set; get; }
        public string SampleRequired { set; get; }
        public int DeliveryTermId { set; get; }
        public string DocumentRequired { set; get; }
        public decimal Advance { set; get; }
        public string ItemSubject { set; get; }
        public string ItemTerms { set; get; }
        public string ToolSubject { set; get; }
        public string ToolTerms { set; get; }
 //     public int PreparedByEmpCode { set; get; }
        //public int ApprovedByEmpCode { set; get; }
        //public int ReviewedByEmpCode { set; get; }
        public int PreparedByEmpNameId { set; get; }
        public int ApprovedByEmpNameId{ set; get; }
        public int ReviewedByEmpNameId { set; get; }
        public int QuotationId { set; get; }



        

        List<QuotationDetailsModel> list1 = new List<QuotationDetailsModel>();
        
    }
}