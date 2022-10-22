using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
//using ClosedXML.Excel;
using BAL;
using Modal;

namespace NavnathWebsite.Masters
{
    public partial class UploadExcelSheet : System.Web.UI.Page
    {

        UploadMasterBAL ClientBAL = new UploadMasterBAL();
        UploadMasterModel ClientModel = new UploadMasterModel();

        protected void Page_Load(object sender, EventArgs e)
        {
            btnUpload0.Enabled = false;

            if (!IsPostBack)
            {
                BindCompany();
                BindUploadName();
            }

        }

        OleDbConnection Econ;
        SqlConnection con;
        string constr, Query, sqlconn;
        string _path;
        public int UploadId = 1;

        public void BindUploadName()
        {
            DataTable dt = ClientBAL.BindUploadName(ClientModel);
            drpUploadName.DataSource = dt;

            drpUploadName.DataTextField = "TamplateType";
            drpUploadName.DataValueField = "TamplateTypeID";

            drpUploadName.DataBind();

            drpUploadName.Items.Insert(0, "--Select--");
            drpUploadName.SelectedIndex = 0;

        }

        public void BindCompany()
        {

            DataTable dt = ClientBAL.BindCompany(ClientModel);
            drpClient.DataSource = dt;
            drpClient.DataBind();
            drpClient.DataTextField = "CompanyName";
            drpClient.DataValueField = "Id";
            drpClient.DataBind();

        }



        private void connection()
        {
            sqlconn = ConfigurationManager.ConnectionStrings["StandardMetalsConnectionString"].ConnectionString;
            con = new SqlConnection(sqlconn);
        }


        private void InsertFileRecord(string SrNo, string MachineNumber, string Location, string Parameter, string CheckPt, string PlaneType, string Schedule, string CompanyName)
        {
            /*                        try
                                    {
            */
            String query = "insert into UT_MachineVsCheckPoint_Validation(SrNo,MachineNumber,Location,Parameter, CheckPt, PlaneType, Schedule, CompanyName) values('" + SrNo + "','" + MachineNumber + "','" + Location + "','" + Parameter + "','" + CheckPt + "','" + PlaneType + "','" + Schedule + "','" + CompanyName + "')";
            connection();
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = query;
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            /*                        }
                                    catch (Exception ex)
                                    {
                                        lblResult.Text = "Data Has Been Not Saved";
                                    }
            */
        }




        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {

                 DataTable dt = CreateDataTableFromExcel();

               
                connection();
                con.Open();

                
                SqlBulkCopy blk = new SqlBulkCopy(con);
                blk.DestinationTableName = "UT_MachineVsCheckPoint_Validation";
                blk.ColumnMappings.Add("SrNo", "SrNo");
                blk.ColumnMappings.Add("MachineNumber", "MachineNumber");
                blk.ColumnMappings.Add("Location", "Location");
                blk.ColumnMappings.Add("Parameter", "Parameter");
                blk.ColumnMappings.Add("CheckPt", "CheckPt");
                blk.ColumnMappings.Add("PlaneType", "PlaneType");
                blk.ColumnMappings.Add("Schedule", "Schedule");
                blk.ColumnMappings.Add("CompanyName", "CompanyName");
                //blk.ColumnMappings.Add("UploadId", "UploadId");
                blk.WriteToServer(dt);
                // Procedure Call
                SqlCommand PCMD = new SqlCommand("Upload_MachineVsCheckPoint_Validation", con);
                PCMD.CommandType = CommandType.StoredProcedure;
                PCMD.Parameters.Add("@UploadId", SqlDbType.Int, 100).Value = UploadId;
                PCMD.ExecuteNonQuery();
                con.Close();

                connection();
                con.Open();
                SqlCommand PCMD1 = new SqlCommand("Upload_MachineVsCheckPoint_Varification", con);
                PCMD1.CommandType = CommandType.StoredProcedure;
                PCMD1.Parameters.Add("@UploadId", SqlDbType.Int, 100).Value = UploadId;
                PCMD1.ExecuteNonQuery();
                con.Close();

                // Bind GridView for Uploded data
                connection();
                con.Open();
                lbl1.Text = "Uploded Data";
                grdUplodedData.Enabled = true;
                SqlCommand grdcmd = new SqlCommand("SELECT * FROM UT_MachineVsCheckPoint_Varification", con);
                SqlDataReader DR = grdcmd.ExecuteReader();
                grdUplodedData.DataSource = DR;
                grdUplodedData.DataBind();
                con.Close();

                // Bind GridView for Non Uploded data
                connection();
                con.Open();
                lbl2.Text = "Non Uploded Data";
                grdUplodedData1.Enabled = true;
                if (grdUplodedData1.Enabled == true)
                {
                    btnUpload0.Enabled = true;
                }
                else
                {
                    btnUpload0.Enabled = false;
                }
                SqlCommand grdcmd1 = new SqlCommand("SELECT MachineNumber, Location, CompanyName, ErrorStep,uploadId ,ErrorMessage FROM UT_MachineVsCheckPoint_Error", con);
                SqlDataReader DR1 = grdcmd1.ExecuteReader();
                grdUplodedData1.DataSource = DR1;
                grdUplodedData1.DataBind();
                DataTable ErrorDT = new DataTable("UT_MachineVsCheckPoint_Error");
                ErrorDT.Load(DR1);
                //ErrorDT = DR.GetSchemaTable();
                con.Close();
                lblResult.Text = "  Data Has Been Saved Successfully";
            }
            catch (Exception ex)
            {
                Response.Write("<script type=text/javascript>alert('Error: '" + ex.Message + ")</script>");
            }

        }


        public void CreateExcelFile(DataTable Excel, string tableName)
        {

            //Clears all content output from the buffer stream.  
            Response.ClearContent();
            //Adds HTTP header to the output stream  
            Response.AddHeader("content-disposition", string.Format("attachment; filename="+tableName+".xls"));

            // Gets or sets the HTTP MIME type of the output stream  
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            string space = "";

            foreach (DataColumn dcolumn in Excel.Columns)
            {

                Response.Write(space + dcolumn.ColumnName);
                space = "\t";
            }
            Response.Write("\n");
            int countcolumn;
            foreach (DataRow dr in Excel.Rows)
            {
                space = "";
                for (countcolumn = 0; countcolumn < Excel.Columns.Count; countcolumn++)
                {

                    Response.Write(space + dr[countcolumn].ToString());
                    space = "\t";

                }

                Response.Write("\n");


            }
            Response.End();
        }

        protected void btnUpload0_Click(object sender, EventArgs e)
        {
            connection();
            con.Open();
            SqlCommand ExportCmd = new SqlCommand("SELECT MachineNumber, Location, CompanyName, ErrorStep,uploadId ,ErrorMessage FROM UT_MachineVsCheckPoint_Error", con);
            SqlDataReader ExportDR = ExportCmd.ExecuteReader();
            DataTable ErrorDT = new DataTable("UT_MachineVsCheckPoint_Error");
            ErrorDT.Load(ExportDR);
            //ErrorDT = DR.GetSchemaTable();
            con.Close();
            CreateExcelFile(ErrorDT, "UT_MachineVsCheckPoint_Error");
        }



        public DataTable CreateDataTableFromExcel()
        {
            DataTable dt = new DataTable();
            dt = null;
            //try
            //{
            //     string path = Path.GetFileName(uploadExcel.FileName);
            //    path = path.Replace(" ", "");
            //    uploadExcel.SaveAs(Server.MapPath("~/ExcelFile/") + path);
            //    String filePath = Server.MapPath("~/ExcelFile/") + path;
            //    string fileExtension = Path.GetExtension(uploadExcel.FileName);
            //    using (XLWorkbook workBook = new XLWorkbook(filePath))
            //    {
            //        IXLWorksheet workSheet = workBook.Worksheet(1);
            //        bool firstRow = true;
            //        foreach (IXLRow row in workSheet.Rows())
            //        {
            //            //Use the first row to add columns to DataTable.
            //            if (firstRow)
            //            {
            //                foreach (IXLCell cell in row.Cells())
            //                {
            //                    dt.Columns.Add(cell.Value.ToString());
            //                }
            //                firstRow = false;
            //            }
            //            else
            //            {
            //                //Add rows to DataTable.
            //                dt.Rows.Add();
            //                int i = 0;
            //                foreach (IXLCell cell in row.Cells())
            //                {
            //                    dt.Rows[dt.Rows.Count - 1][i] = cell.Value.ToString();
            //                    i++;
            //                }
            //            }
            //        }
            //    }

            //}
            //catch(Exception ex)
            //{
            
            //}

            return dt;
        }

        protected void drpUploadName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpUploadName.SelectedItem.Text != "--Select--")
            {
                BindUploadType();
            }
        }

        //BindUploadType
        public void BindUploadType()
        {
            //SetValue();
            ClientModel.TamplateTypeID = Convert.ToInt32(drpUploadName.SelectedValue);
            DataTable dt = ClientBAL.BindUploadType(ClientModel);
            drpUploadType.DataSource = dt;
            drpUploadType.DataBind();
            //drpUploadType.Items.Insert(0,"--Select--");
            drpUploadType.DataTextField = "UploadType";
            drpUploadType.DataValueField = "UploadTypeID";
            drpUploadType.DataBind();
            drpUploadType.Items.Insert(0, "--Select--");
            drpUploadType.SelectedIndex = 0;

        }



    }
}