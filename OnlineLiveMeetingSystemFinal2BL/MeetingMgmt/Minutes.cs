using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineLiveMeetingSystemFinal2BL
{
    public class Minutes
    {
        public int MinutesID { get; set; }
        public string Minutess { get; set; }
        public string UserID { get; set; }
        public DateTime Date { get; set; }
        public int DeptCode { get; set; }

        public int SubmitMinutes(Minutes minutes)
        {
            string sql = "Insert into [Minutes] (Minutes,UserId,Date,DeptCode)Values(@minutes,@userid,@date,@DeptCode)";
            using (SqlConnection conn = new SqlConnection(DbConnection.GetConnString()))
            {
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@minutes", minutes.Minutess);
                cmd.Parameters.AddWithValue("@userid", minutes.UserID);
                cmd.Parameters.AddWithValue("@date", minutes.Date);
                cmd.Parameters.AddWithValue("@DeptCode", minutes.DeptCode);
                //cmd.Parameters.AddWithValue("@FacultyCode", minutes.FacultyCode);
                conn.Open();
                int affectedRow = cmd.ExecuteNonQuery();
                return affectedRow;
            }
        }

        public Minutes GetMinutes()
        {
            return null;
            }
        }
    
}
