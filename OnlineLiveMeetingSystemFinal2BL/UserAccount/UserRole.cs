using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineLiveMeetingSystemFinal2BL
{
    public class UserRole : Role
    {
        public int UserRoleId { get; set; }
        public int Status { get; set; }
        public DateTime EffectiveDate { get; set; }
        public DateTime ExpiryDate { get; set; }
        //
        public string UserId { get; set; }
        public int RoleId { get; set; }

        public int AssignRole(UserRole urData)
        {
            string sql = "spAssignUserToRole";
            try
            {
                SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                //
                cmd.Parameters.AddWithValue("@UserId", urData.UserId);
                cmd.Parameters.AddWithValue("@RoleId", urData.RoleId);
                cmd.Parameters.AddWithValue("@EffectiveDate", urData.EffectiveDate);
                cmd.Parameters.AddWithValue("@ExpiryDate", urData.ExpiryDate);
                cmd.Parameters.AddWithValue("@Status", urData.Status);
                conn.Open();
                int returnValue = cmd.ExecuteNonQuery();
                return returnValue;
            }
            catch (Exception)
            {
                return 0;
            }
        }


        public List<UserRole> GetUserRoleList(string username)
        {
            List<UserRole> userRoleList = new List<UserRole>();
            try
            {
                SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd = new SqlCommand("spGetUserRole", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                //
                cmd.Parameters.AddWithValue("@Username", username);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                //UserRole ur = new UserRole();
                while (reader.Read())
                {
                    UserRole roledata = new UserRole();
                    roledata.Id = Convert.ToInt32(reader["RoleId"].ToString());
                    roledata.Name = reader["RoleName"].ToString();
                    //roledata.username = reader["UserName"].ToString();
                    userRoleList.Add(roledata);
                }
                conn.Close();
                return userRoleList;

            }
            catch (Exception)
            {
                return null;
            }
        }

        public int AssignRoleDefault(string userid)
        {
            string sql = "spAssignUserToRole";
            try
            {
                SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                //
                cmd.Parameters.AddWithValue("@UserId", userid);
                cmd.Parameters.AddWithValue("@RoleId", 4);
                cmd.Parameters.AddWithValue("@EffectiveDate", DateTime.Now);
                cmd.Parameters.AddWithValue("@ExpiryDate", DateTime.Now.AddMonths(12));
                cmd.Parameters.AddWithValue("@Status", 1);
                conn.Open();
                int returnValue = cmd.ExecuteNonQuery();
                return returnValue;
            }
            catch (Exception)
            {
                return 0;
            }
        }
    }
}
