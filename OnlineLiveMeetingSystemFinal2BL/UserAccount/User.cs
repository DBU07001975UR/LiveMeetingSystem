using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineLiveMeetingSystemFinal2BL
{
   public class User
    {
        public string UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Sex { get; set; }
        public string Phone { get; set; }

        public User SearchUser(string userId)
        {
            try { 
            User userData = new User();
            string sql = "Select * from [User] where UserId=@Id";
                string CS = ConfigurationManager.ConnectionStrings["DBLMS"].ConnectionString;
                SqlConnection conn = new SqlConnection(CS);
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@Id", userId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    userData.UserId = reader["UserId"].ToString();
                    userData.FirstName = reader["FirstName"].ToString();
                    userData.LastName = reader["LastName"].ToString();
                   // userData.GrandfatherName = reader["LastName"].ToString();
                }
                else
                {
                    userData = null;
                }
                return userData;
        }
            catch (Exception)
            {
                return null;
            }
}
        }
    }
