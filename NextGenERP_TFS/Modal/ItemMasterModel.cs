using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Modal
{

    [Serializable]
    public class ItemMasterModel
    {
        public string ItemCode { get; set; }
        public string ItemName { get; set; }
        public string Manufacturer { get; set; }
        public string Material { get; set; }
        public string ItemType { get; set; }
        public string ItemSubType { get; set; }
        public string Color { get; set; }
        public string UOM { get; set; }
        public string HSNCODE { get; set; }
        public decimal GSTRate { get; set; }
        public decimal PurchaseCost { get; set; }
        public decimal SellingPrice { get; set; }
        public string Username { get; set; }
        public string LoginBranch { get; set; }
        public string RawMaterial { get; set; }
    }
}
