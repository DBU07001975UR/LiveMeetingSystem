using OnlineLiveMeetingSystemFinal2BL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.ManageFile
{
    public partial class StoreFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
                if (Session["UserName"] == null)
                {
                    Response.Redirect("~/GUI/Login.aspx");
                }
                if (Session["Role"].ToString() == "Plenary" || Session["Role"].ToString() == "Admin" || Session["Role"].ToString() == "MeetingLeader")
                {
                    Response.Redirect("~/GUI/ErrorPage.aspx");
                }
                if (!IsPostBack)
                {
                    BindGrid();
                }
           
            
        }

        protected void Upload(object sender, EventArgs e)
        {
            UserAccount userAccount = new UserAccount();
            try { 
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            string contentType = FileUpload1.PostedFile.ContentType;
            int size = FileUpload1.PostedFile.ContentLength;
            string fsize = size / 1024 + "KB";
            using (Stream fs = FileUpload1.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    string CS = ConfigurationManager.ConnectionStrings["DBLMS"].ConnectionString;
                    using (SqlConnection conn = new SqlConnection(CS))
                    {
                        SqlCommand cmd = new SqlCommand("Sp_StoreFile", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        userAccount = userAccount.GetUserAccount(Session["UserName"].ToString());
                        if (userAccount != null)
                        {
                            cmd.Parameters.AddWithValue("@userid", userAccount.UserID);
                            cmd.Parameters.AddWithValue("@filename", filename);
                            cmd.Parameters.AddWithValue("@size", fsize);
                            cmd.Parameters.AddWithValue("@fileType", contentType);
                            cmd.Parameters.AddWithValue("@Data", bytes);
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            conn.Close();
                        }
                    }
                }
            }
                BindGrid();
            }
            catch (Exception)
            {
                Response.Redirect("~/GUI/ExceptionPage.aspx");
            }

        }
        private void BindGrid()
        {
            try { 
            string constr = ConfigurationManager.ConnectionStrings["DBLMS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "Select * from tbl_Files";
                    cmd.Connection = con;
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                    con.Close();
                }
            }
            }

            catch (Exception)
            {
                Response.Redirect("~/GUI/ExceptionPage.aspx");
            }
        }
       
    }
}