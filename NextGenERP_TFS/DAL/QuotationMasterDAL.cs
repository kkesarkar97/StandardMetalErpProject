using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Modal;

namespace DAL
{
    public class QuotationMasterDAL : ConncetionClass
    {
        QuotationMasterModel model = new QuotationMasterModel();

        /*public List<QuotationDetailsModel> GetAllQuotationDetails()
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "";
                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();

                List<QuotationDetailsModel> lst = new List<QuotationDetailsModel>();
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        lst.Add(new QuotationDetailsModel() {
                            ItemName = dt.Rows[i]["ItemName"].ToString(),
                            ItemCode = dt.Rows[i]["ItemCode"].ToString(),
                            DeliveryLeadDate = Convert.ToDateTime(dt.Rows[i]["DeliveryLeadTime"].ToString()),
                            PackingCost = Convert.ToDecimal(dt.Rows[i]["PackingCost"].ToString()),
                            DevelopmentTool = dt.Rows[i]["DevelopmentTool"].ToString(),
                            Material = dt.Rows[i]["Material"].ToString(),
                            Eccess = dt.Rows[i]["Ecess"].ToString(),
                            ServiceTax = Convert.ToInt32(dt.Rows[i]["ServiceTax"]),
                            Excise = dt.Rows[i]["Excise"].ToString(),
                            SaleTax = Convert.ToInt32(dt.Rows[i]["SaleTax"]),
                        });

                    }
                }
                return lst;
             }
        }

        \
        public List<QuotationMasterModel>GetAllQuotationMasterData()
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "";
                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();

                List<QuotationMasterModel> lst = new List<QuotationMasterModel>();
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    { lst.Add(new QuotationMasterModel() {
                        QuotationId = Convert.ToInt32(dt.Rows[i]["Id"]),
                        WithEnquiry = Convert.ToBoolean(dt.Rows[i]["WithEnquiry"]),
                        EnquiryNumber = dt.Rows[i]["EnquiryNumber"].ToString(),
                        RevisionNumber = dt.Rows[i]["RevisionNumber"].ToString(),
                        QuotationNumber = dt.Rows[i]["QuotationNumber"].ToString(),
                        QuotationDate = Convert.ToDateTime(dt.Rows[i]["QuotationDate"]),
                        IsNewCustomer = Convert.ToBoolean(dt.Rows[i]["IsNewCustomer"]),
                        CustomerName = dt.Rows[i]["CustomerName"].ToString(),
                        CustomerCode = dt.Rows[i]["CustomerCode"].ToString(),
                        Address = dt.Rows[i]["Address"].ToString(),
                        Quantity = Convert.ToInt32(dt.Rows[i]["Quantity"]),
                        Rate = Convert.ToInt32(dt.Rows[i]["Rate"]),
                        SymbolId = Convert.ToInt32(dt.Rows[i]["SymbolId"]),

         



                    });
                }
            }
            return lst;
        }
    }*/

            public DataTable BindAllQuotationDetails(int QuotationId)
        {
            DataTable dt = new DataTable();
            this.Initialize();
            int nRecAffected = 0;
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "GetAllQuotationData1";
                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                
            }
                return dt;
        }
        public DataTable BindCustomer()
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindCustomer";
                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                return dt;
            }

        }

        public DataTable BindCustomerName()
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "Marketing_BindCustomerName";
                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                return dt;
            }


        }

    public DataTable BindCustomerCode()
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "Marketing_BindCustomerCode";
                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                return dt;
            }


        }

    public DataTable BindUnitDrpDown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindUnit";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }
        public DataTable BindItemNameDrpDown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "Marketing_BindItemName";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindItemCodeDrpDown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "Marketing_BindItemCode";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable Marketing_BindEnquiryMasterNo()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "Marketing_BindEnquiryMasterNo";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindSymbolDrpdown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindDrpdownSymbol";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindStatusDrpdown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindStatusMaster";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindFreightMaster()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "FreightMasterType";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindValidityType()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindValidityType";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindPackingType()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindPackingType";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindPaymentDrpdown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindPaymentTypeMaster";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }

        }

        public DataTable BindMarketingModeOfDrpdown()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "ModeOfTransPort";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindToolMasterCode()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindToolMasterCode";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }
        public DataTable BindToolMasterName()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindToolMasterName";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindDrawingBack()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindDrawingBack";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindDeliveryTerm()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindDeliveryTerm";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindApprovedByEmpCode()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindEmpCodeName";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindApprovedByEmpName()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindEmpCodeName";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                 this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindItemMaster()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindItemMaster1";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }
        public static int QuoId = 0;

        public int SaveQuotationData(QuotationMasterModel model,out string QuotationNumber)
        {
            SqlTransaction trans;
            this.Initialize();
            int NoOfRowsAffected = 0;
             
            QuotationNumber = "";
            using (cnUniversal)
            {
                cnUniversal.Open();
                trans = cnUniversal.BeginTransaction();
                try
                {
                    cmdUniversal = new SqlCommand("InsertIntoQuotationMaster", cnUniversal, trans); //SaveQuotationMaster1
                    cmdUniversal.CommandType = CommandType.StoredProcedure;

                    cmdUniversal.Parameters.AddWithValue("@WithEnquiry",model.WithEnquiry);
                    cmdUniversal.Parameters.AddWithValue("@EnquiryId", model.EnquiryId);
                    cmdUniversal.Parameters.AddWithValue("@RevisionNumber", model.RevisionNumber);
                    cmdUniversal.Parameters.AddWithValue("@QuotationNumber",model.QuotationNumber);
                    cmdUniversal.Parameters.AddWithValue("@QuotationDate", System.DateTime.Now);//model.QuotationDate
                    
                    cmdUniversal.Parameters.AddWithValue("@IsNewCustomer",model.IsNewCustomer);
                    cmdUniversal.Parameters.AddWithValue("@NewCustomerCode", model.NewCustomerCode);
                    cmdUniversal.Parameters.AddWithValue("@NewCustomerName", model.NewCustomerName);
                    cmdUniversal.Parameters.AddWithValue("@Id", model.CustomerId);
                    //cmdUniversal.Parameters.AddWithValue("@CustomerCode",model.CustomerCode);
                    //cmdUniversal.Parameters.AddWithValue("@CustomerName",model.CustomerName);
                    cmdUniversal.Parameters.AddWithValue("@ContactPerson", model.ContactPerson);
                    cmdUniversal.Parameters.AddWithValue("@Address", model.Address);
                    cmdUniversal.Parameters.AddWithValue("@Quantity", model.Quantity);
                    cmdUniversal.Parameters.AddWithValue("@Rate", model.Rate);
                    cmdUniversal.Parameters.AddWithValue("@SymbolId", model.SymbolId);
                    cmdUniversal.Parameters.AddWithValue("@LoginUserId", model.LoginUserId);
                    cmdUniversal.Parameters.AddWithValue("@BranchId", model.BranchId);
                    cmdUniversal.Parameters.AddWithValue("@SystemEntryDate", System.DateTime.Now);// model.SystemEntryDate
                    
                    SqlParameter outParamId = new SqlParameter();
                    outParamId.ParameterName = "@QuotationId";
                    outParamId.SqlDbType = System.Data.SqlDbType.Int;
                    outParamId.Direction = System.Data.ParameterDirection.Output;

                    /*SqlParameter outParamQuoNo = new SqlParameter();
                    outParamQuoNo.ParameterName = "@QuotationNumber";
                    outParamQuoNo.SqlDbType = SqlDbType.VarChar;
                    outParamQuoNo.Size = 100;
                    outParamQuoNo.Direction = System.Data.ParameterDirection.Output;*/

                    //cmdUniversal.Parameters.Add(outParamQuoNo);
                    cmdUniversal.Parameters.Add(outParamId);

                    NoOfRowsAffected= cmdUniversal.ExecuteNonQuery();
                    model.QuotationId = Convert.ToInt32(outParamId.Value.ToString());
                    //QuotationNumber = outParamQuoNo.Value.ToString();
                    
                    



                    trans.Commit();
                    this.Close();
                    return NoOfRowsAffected;
                }

                catch (Exception ex)
                {
                    trans.Rollback();
                    cnUniversal.Close();
                    Console.WriteLine(ex);
                    return NoOfRowsAffected = 0;
                }
            }
        }

        public int SaveQuotationDetails(QuotationDetailsModel dmodel, QuotationMasterModel model)
        {
            SqlTransaction trans;
            this.Initialize();
            int NoOfRowsAffected = 0;
            using (cnUniversal)
            {
                cnUniversal.Open();
                trans = cnUniversal.BeginTransaction();
                dmodel.QuotationId = model.QuotationId;
                try
                {
                    cmdUniversal = new SqlCommand("insertintoquotationfinal1", cnUniversal, trans);//SaveQuotationDetails
                    cmdUniversal.CommandType = CommandType.StoredProcedure;
        
                    
                    //cmdUniversal.Parameters.AddWithValue("@QuotationNumber", dmodel.QuotationNumber);
                    cmdUniversal.Parameters.AddWithValue("@ID", dmodel.ID);
                    //cmdUniversal.Parameters.AddWithValue("@ID", dmodel.ItemCode);
                    cmdUniversal.Parameters.AddWithValue("@ToolMouldId", dmodel.ToolMouldId);
                    //cmdUniversal.Parameters.AddWithValue("@ToolMouldId",dmodel.ToolMouldCode);
                    cmdUniversal.Parameters.AddWithValue("@DeliveryLeadTime", System.DateTime.Now);//dmodel.DeliveryLeadTime);
                    cmdUniversal.Parameters.AddWithValue("@PackingCost", dmodel.PackingCost);
                    cmdUniversal.Parameters.AddWithValue("@DevelopmentToolCost", dmodel.DevelopmentToolCost);
                    cmdUniversal.Parameters.AddWithValue("@MouldCost", dmodel.MouldCost);
                    cmdUniversal.Parameters.AddWithValue("@MouldCavity", dmodel.MouldCavity);
                    cmdUniversal.Parameters.AddWithValue("@OtherCost", dmodel.OtherCost);
                    cmdUniversal.Parameters.AddWithValue("@OtherCostRemark", dmodel.OtherCostRemark);
                    cmdUniversal.Parameters.AddWithValue("@Material", dmodel.Material);
                    cmdUniversal.Parameters.AddWithValue("@UnitId", dmodel.UnitId);
                    cmdUniversal.Parameters.AddWithValue("@Ecess", dmodel.Ecess);
                    cmdUniversal.Parameters.AddWithValue("@ServiceTax", dmodel.ServiceTax);
                    cmdUniversal.Parameters.AddWithValue("@Excise", dmodel.Excise);
                    cmdUniversal.Parameters.AddWithValue("@SaleTax", dmodel.SalesTax);
                    cmdUniversal.Parameters.AddWithValue("@PaymentTypeId", dmodel.PaymentTypeId);
                    cmdUniversal.Parameters.AddWithValue("@TransportId", dmodel.TransportId);
                    cmdUniversal.Parameters.AddWithValue("@FreightId", dmodel.FreightId);
                    cmdUniversal.Parameters.AddWithValue("@PlanTypeId", dmodel.PlanTypeId);
                    cmdUniversal.Parameters.AddWithValue("@PackingId", dmodel.PackingId);
                    cmdUniversal.Parameters.AddWithValue("@StatusId", dmodel.StatusId);
                    cmdUniversal.Parameters.AddWithValue("@AgainstForm", dmodel.AgainstFormNo);
                    cmdUniversal.Parameters.AddWithValue("@Remark", dmodel.Remark);
                    cmdUniversal.Parameters.AddWithValue("@DrawingId", dmodel.DrawingId);
                    cmdUniversal.Parameters.AddWithValue("@SampleRequired", dmodel.SampleRequired);
                    cmdUniversal.Parameters.AddWithValue("@DeliveryTermId", dmodel.DeliveryTermId);
                    cmdUniversal.Parameters.AddWithValue("@DocumentRequired", dmodel.DocumentRequired);
                    cmdUniversal.Parameters.AddWithValue("@Advance", dmodel.Advance);
                    cmdUniversal.Parameters.AddWithValue("@PreparedByEmpNameId", dmodel.PreparedByEmpNameId);
                    cmdUniversal.Parameters.AddWithValue("@ApprovedByEmpNameId", dmodel.ApprovedByEmpNameId);
                    cmdUniversal.Parameters.AddWithValue("@ReviewedByEmpNameId", dmodel.ReviewedByEmpNameId);

                    cmdUniversal.Parameters.AddWithValue("@ItemSubject", dmodel.ItemSubject);
                    cmdUniversal.Parameters.AddWithValue("@ItemTerms", dmodel.ItemTerms);
                    cmdUniversal.Parameters.AddWithValue("@ToolSubject", dmodel.ToolSubject);
                    cmdUniversal.Parameters.AddWithValue("@ToolTerms", dmodel.ToolTerms);
                    cmdUniversal.Parameters.AddWithValue("@QuotationId", dmodel.QuotationId);

                    NoOfRowsAffected = cmdUniversal.ExecuteNonQuery();
                    QuoId = dmodel.QuotationId;
                    QuoId += 1;
                    Console.WriteLine(QuoId);
                    trans.Commit();
                    this.Close();
                    return NoOfRowsAffected;
                }

                catch (Exception ex)
                {
                    trans.Rollback();
                    cnUniversal.Close();
                    Console.WriteLine(ex);
                    return NoOfRowsAffected = 0;
                }
            }
        }

        /*public DataTable DisplayQuantityList()
        {

            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "DisplaQuantityMaster";
                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();

                List<QuotationMasterModel> lst = new List<QuotationMasterModel>();
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        lst.Add(new QuotationMasterModel()
                        {
                            Quantity = Convert.ToInt32(dt.Rows[i]["Quantity"]),
                            Rate = Convert.ToInt32(dt.Rows[i]["Rate"]),
                            //SymbolId = (dt.Rows[i]["SymbolId"]),
                        });
                    }
                }
                return lst;
            }
            
        }*/
        public DataTable BindCustDtls(int Id)
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "Marketing_BindCustDtls";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                cmdUniversal.Parameters.AddWithValue("@Id", Id);
                //cmdUniversal.Parameters.Add("@CustCode", SqlDbType.VarChar).Value = CustCode;
                this.daUniversal.SelectCommand = cmdUniversal; 
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }
        public DataTable BindItemDtls(int Id)
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindItemDetails";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                cmdUniversal.Parameters.AddWithValue("@ID", Id);
                //cmdUniversal.Parameters.Add("@CustCode", SqlDbType.VarChar).Value = CustCode;
                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }
        public DataTable BindQuotationNumber()
        {
            DataTable dt = new DataTable();
            this.Initialize();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindQuotationMaster";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                this.daUniversal.SelectCommand = cmdUniversal;
                cnUniversal.Open();
                daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }
        public DataTable BindToolDetails(int Id)
        {
            this.Initialize();
            int nRecAffected = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindToolDetails";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                cmdUniversal.Parameters.AddWithValue("@Id", Id);
                //cmdUniversal.Parameters.Add("@CustCode", SqlDbType.VarChar).Value = CustCode;
                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                nRecAffected = this.daUniversal.Fill(dt);
                this.Close();
                return dt;
            }
        }

        public DataTable BindEnquiryDetails(int Id)
        {
            this.Initialize();
            int NoOfAffectedRows = 0;
            DataTable dt = new DataTable();
            using (cnUniversal)
            {
                cmdUniversal.CommandText = "BindEnquiryDetails";
                cmdUniversal.CommandType = CommandType.StoredProcedure;
                cmdUniversal.Parameters.AddWithValue("@Id",Id);
                this.daUniversal.SelectCommand = cmdUniversal;
                this.cnUniversal.Open();
                NoOfAffectedRows = this.daUniversal.Fill(dt);
                this.Close();
            }
            return dt;
        }
        

    }
}

