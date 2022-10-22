using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BAL;
using Modal;
using System.Data.OleDb;
using System.IO;
using System.Configuration;

namespace NavnathWebsite.Masters
{
    public partial class UploadMaster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCompany();
                BindUploadName();
                //BindUploadType();
            }
        }

        UploadMasterBAL ClientBAL = new UploadMasterBAL();
        UploadMasterModel ClientModel = new UploadMasterModel();

        public void BindCompany()
        {

            DataTable dt = ClientBAL.BindCompany(ClientModel);
            drpClient.DataSource = dt;
            drpClient.DataBind();
            drpClient.DataTextField = "CompanyName";
            drpClient.DataValueField = "Id";
            drpClient.DataBind();

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

        //BindUploadName
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

        public void SetValue()
        {
            ClientModel.TamplateTypeID = Convert.ToInt32(drpUploadName.SelectedValue);
        }

        protected void drpUploadName_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (drpUploadName.SelectedItem.Text != "--Select--")
            {
                BindUploadType();
            }

        }

        protected void btnValidate_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidateExcel())
                {
                    Response.Write("<script language='JavaScript'>alert('Record Save Successfully')</script>");
                }
                else
                {
                    Response.Write("<script language='JavaScript'>alert('Record Not save to database')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script language='JavaScript'>alert('" + ex.Message + "')</script>");
            }


        }


        public bool ValidateExcel()
        {
            bool validate = true;

            string path = Path.GetFileName(uploadExcel.FileName);
            string fileExtension = Path.GetExtension(uploadExcel.FileName);
            path = path.Replace(" ", " ");
            string fileLocation = Server.MapPath("~/ExcelFile/") + path;
            if (File.Exists(fileLocation))
            {
                File.Delete(fileLocation);
            }
            uploadExcel.SaveAs(fileLocation);
            String ExcelPath = fileLocation;
            OleDbConnection mycon = new OleDbConnection();
            switch (fileExtension)
            {
                case ".xls": //Excel 1997-2003  
                    mycon.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + fileLocation + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=1\"";
                    break;
                case ".xlsx": //Excel 2007-2010  
                    mycon.ConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileLocation + ";Extended Properties=\"Excel 12.0 xml;HDR=Yes;IMEX=1\"";
                    break;
            }

            mycon.Open();
            OleDbCommand cmd = new OleDbCommand("select * from [Sheet1$]", mycon);

            OleDbDataAdapter da = new OleDbDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataTable dt = ds.Tables[0];

            string connectionString = ConfigurationManager.ConnectionStrings["StandardMetalsConnectionString2"].ConnectionString;
            SqlBulkCopy bulkcpy = new SqlBulkCopy(connectionString);
            //bulkcpy.DestinationTableName = "UT_EmployeeMaster_Validation";
            bulkcpy.DestinationTableName = "UT_MachineVsCheckPoint_Validation";
            bulkcpy.WriteToServer(dt);

            //for (int i = 0; i < dt.Columns.Count; i++)
            //{
            //    string temp2 = dt.Columns[i].ColumnName.ToString();
            //}

            return validate;
        }



    }
}