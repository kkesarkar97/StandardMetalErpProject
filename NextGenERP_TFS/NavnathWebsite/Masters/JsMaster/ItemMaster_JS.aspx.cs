using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;
using Modal;
using BAL;
using DAL;
using System.Data;

namespace NavnathWebsite.Masters.JsMaster
{
    public partial class ItemMaster_JS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string referer=Request.ServerVariables["HTTP_REFERER"];
        }
        dbItemMaster ItemData = new dbItemMaster();
        ItemMasterMngr itemBAL = new ItemMasterMngr();
        TaxInvoiceMnger _TaxInvoiceManager = new TaxInvoiceMnger();



        [WebMethod]
        public static List<ItemMasterModel> FillItemMaster(string name)
        {
            /*
            ArrayList lst = new ArrayList();
            lst.Add("AA");
            lst.Add(10);
            lst.Add('A');
            string str1 = lst[0].ToString();
            foreach(object obj in lst)
            {
                string str = (string)obj;
            }
            */

           // List<NameCode> ItemDtl = new List<NameCode>();
            TaxInvoiceMnger _TaxInvoiceManager1 = new TaxInvoiceMnger();
            DataTable dt = new DataTable();
            List<ItemMasterModel> lst = null;
            lst = _TaxInvoiceManager1.FillItemMaster();

            //if (lst != null)
            //{
            //    if (lst.Count > 0)
            //    {
            //        foreach (DataRow dr in dt.Rows)
            //        {
            //            ItemDtl.Add(new NameCode()
            //            {
            //                Code = dr["ItemCode"].ToString(),
            //                Name = dr["ItemName"].ToString()
            //            });
            //        }
            //    }
            //}
            return lst;
        }

        // Static Method : SearchItemMaster 
        [WebMethod]
        public static ItemMasterModel SearchItemMaster(string ItemCode)
        {
            ItemMasterModel ItemModel = new ItemMasterModel();
            DataTable dt = new DataTable();
            ItemMasterMngr ItemBal = new ItemMasterMngr();
            dt = ItemBal.RetriveItem(ItemCode);
            if (dt.Rows.Count > 0)
            {
                ItemModel.ItemCode = dt.Rows[0]["ItemCode"].ToString();
                ItemModel.ItemName = dt.Rows[0]["ItemName"].ToString();
               // ItemModel.Manufacturer = dt.Rows[0]["Manufacturer"].ToString();
                ItemModel.Material = dt.Rows[0]["RawMaterial"].ToString();
                ItemModel.ItemType = dt.Rows[0]["ItemType"].ToString();
                ItemModel.ItemSubType = dt.Rows[0]["ItemSubType"].ToString();
                ItemModel.Color = dt.Rows[0]["Color"].ToString();
               // ItemModel.UOM = dt.Rows[0]["UOM"].ToString();
                ItemModel.HSNCODE = dt.Rows[0]["HSNCODE"].ToString();
                ItemModel.GSTRate = Convert.ToDecimal(dt.Rows[0]["GSTRate"].ToString());
                ItemModel.PurchaseCost = Convert.ToDecimal(dt.Rows[0]["PurchaseCost"].ToString());
                ItemModel.SellingPrice = Convert.ToDecimal(dt.Rows[0]["SellingPrice"].ToString());
            }

            return ItemModel;
        }

        [WebMethod]
        public static string SaveData(dbItemMaster SaveData)
        {
            ItemMasterMngr ItemBal = new ItemMasterMngr();
            ItemBal.SaveITemMaster(SaveData);
            return "Data Saved !";
        }

        [WebMethod]
        public static string UpdateData(dbItemMaster UpdateData)
        {
            ItemMasterMngr ItemBal = new ItemMasterMngr();
            ItemBal.SaveITemMaster(UpdateData);
            return "Record Updated !";
        }

/*
        [WebMethod]
        public static string DeleteData(dbItemMaster DeleteData)
        {
            ItemMasterModel ItemModel = new ItemMasterModel();
            DataTable dt = new DataTable();
            ItemMasterMngr ItemBal = new ItemMasterMngr();
            dt = ItemBal.DeleteData(DeleteData);
                
        }
*/
         
    }
}