using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Modal
{
    public class MasterDataFieldsModel : ManufacturerMaster
    {

      public int loginUserId { get; set; }
      public int branchId { get; set; }
      public bool isActive { get; set; }
      public DateTime systemEntryDate { get; set; }

    }
}
