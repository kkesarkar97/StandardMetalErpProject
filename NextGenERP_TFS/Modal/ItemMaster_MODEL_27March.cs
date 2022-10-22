using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Modal
{

    public class ManufacturerMaster
    {
        public int ManufacturerId { get; set; }
        public string ManufacturerName { get; set; }
        public bool IsActive { get; set; }

    }

    public class ItemMaster_MODEL_27March : MasterDataFieldsModel
    {
        public string ItemCode { get; set; }
        public string ItemName { get; set; }
        //public int ManufacturerId { get; set; }
        public string Material { get; set; }
        public int ItemCategeryId { get; set; }
        public int ItemSubCatogoryId { get; set; }
        public int ColorId { get; set; }
        public int UOMId { get; set; }
        public string HSNCODE { get; set; }
        public decimal GSTRate { get; set; }
        public decimal PurchaseCost { get; set; }
        public decimal SellingPrice { get; set; }
        public int UserId { get; set; }
        public int LoginBranchId { get; set; }
        public string RawMaterial { get; set; }
          
    }

}
