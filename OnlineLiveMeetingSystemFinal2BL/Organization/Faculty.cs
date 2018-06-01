using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineLiveMeetingSystemFinal2BL.Organization
{

   public class Faculty
    {
        #region fields and properties
        int code;

        public int Code
        {
            get { return code; }
            set { code = value; }
        }
        string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        string phone;

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        string fax;

        public string Fax
        {
            get { return fax; }
            set { fax = value; }
        }
        string email;

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string Website { get; set; }
        #endregion

        public DataTable getFacultys()
        {
            DataTable dt = new DataTable("Faculty");
            try
            {
                using (SqlConnection conn = new SqlConnection(DbConnection.GetConnString()))
                {
                    string sql = "Select * from Faculty order by FacultyName";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        dt.Load(reader);
                    }
                    else
                        dt = null;
                }
            }
            catch (Exception)
            {
                return null;
            }
            return dt;
        }
    }
}
