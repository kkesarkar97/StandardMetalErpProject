using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Modal
{
    public class IndentMasterModel
    {
        public string IndentNoAutoGen { get; set; }
        public int IndentId { get; set; }
        public int IndentTypeId { get; set;}
      //  public DateTime IndentDate { get; set; }
        public string Remark { get; set; }
        public string Createdby { get; set; }
        public string ItemCode { get; set; }
        public string Branch { get; set; }
        public string ItemName { get; set; }
        public string Specification{ get; set; }
        public string DrowingNo{ get; set; }
        public int Department{ get; set; }
        public string Purpose{ get; set; }
        public string CurrentStock{ get; set; }
        public string RequirdDate{ get; set; }
        public string RequiredQuantity{ get; set; }
        public string RequiredQuentityUnit { get; set; }
        public int Rate { get; set; }
        public int IsApporved { get; set; }
        public List<IndentMasterModel> AllData { get; set; }
        public List<IndentMasterModel> AllData2 { get; set; }
        public List<IndentMasterModel> AllData3 { get; set; }
        public List<IndentMasterModel> AllData4 { get; set; }
    }
}
