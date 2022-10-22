using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Modal
{
   public class MachineMasterNModel
    {
        public int SrNo { get; set; }
        public string Cmp_Code { get; set; }
        public string Group { get; set; }
        public string CategoryCode { get; set; }
        public string MachineNo { get; set; }
        public string MachineName { get; set; }
        public string Make { get; set; }
        public string Model { get; set; }
        public string PMPlan { get; set; }
        public decimal CapacityRangeFrom { get; set; }
        public decimal CapacityRangeTo { get; set; }
        public string Remark { get; set; }
        public string Location { get; set; }
        public DateTime PurchaseDate { get; set; }
        public decimal MachineCostPerHr { get; set; }
        public decimal StdProdPerHr { get; set; }
        
    }
}
