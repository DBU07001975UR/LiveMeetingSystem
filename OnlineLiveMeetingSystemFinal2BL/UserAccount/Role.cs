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
    public class Role
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string username { get; set; }

        public List<Role> GetUnAssignedRoles(string userid)
        {
            List<Role> roleList = new List<Role>();
            string sql = "spGetUnAssignedRole";
            try
            {
                SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId", userid);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Role roleData = new Role();
                    roleData.Id = Convert.ToInt32(reader["RoleId"]);
                    roleData.Name = reader["RoleName"].ToString();
                    roleList.Add(roleData);
                }
                return roleList;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<Role> GetRoleList()
        {
            List<Role> roleList = new List<Role>();
            string sql = "Select * from Role";
            try
            {
                SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Role roleData = new Role();
                    roleData.Id = Convert.ToInt32(reader["RoleId"]);
                    roleData.Name = reader["RoleName"].ToString();
                    roleData.Name = reader["Description"].ToString();
                    roleList.Add(roleData);
                }
                return roleList;
            }
            catch (Exception)
            {
                return null;
            }
        }
        //public List<Role> GetRoles(string username)
        //{
        //    List<Role> rolelist = new List<Role>();
        //    string sql = "Select * from Role where UserName=@UserName";
        //    try
        //    {

        //        SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
        //        SqlCommand cmd = new SqlCommand(sql, conn);
        //        cmd.Parameters.AddWithValue("@UserName", username);

        //        conn.Open();

        //        SqlDataReader reader = cmd.ExecuteReader();
        //        //conn.Close();
        //        while (reader.Read())
        //        {
        //            Role roledata = new Role();
        //            roledata.Id = Convert.ToInt32(reader["RoleId"].ToString());
        //            roledata.Name = reader["RoleName"].ToString();
        //            //roledata.username = reader["UserName"].ToString();
        //            rolelist.Add(roledata);
        //        }
        //        conn.Close();
        //        return rolelist;

        //    }
        //    catch (Exception e)
        //    {
        //        throw new Exception("error occure in the class GetRole  " + e.Message);
        //    }

        //}
    }
}
