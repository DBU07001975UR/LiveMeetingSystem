using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace OnlineLiveMeetingSystemFinal2BL
{
    public class UserAccount
    {
        public string UserID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public short Status { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool RememberMe { get; set; }
        public string Month { get; private set; }
        public int ScheduleId { get; private set; }
        public int DeptCode { get; private set; }
        public int FacultyCode { get; private set; }
        public string FacultyName { get; set; }
        public string DeptName { get; set; }
        public DateTime CreatedDate { get; set; }

        public int Login(string username, string password)
        {
                int x = -1;
                try
                {
                    using (SqlConnection conn = new SqlConnection(DbConnection.GetConnString()))
                    {
                        string sql = "Select * from UserAccount";
                        SqlCommand cmd = new SqlCommand(sql, conn);
                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            if (username.Equals(reader["UserName"].ToString()) && password.Equals(reader["Password"].ToString()))
                            {
                                x = Convert.ToInt32(reader["Status"]);
                            }

                        }
                        conn.Close();


                    }
                }

                catch (Exception)
                {
                    return 100;
                    //throw;

                }
            return x;
        }

        public UserAccount GetLastLoginDate(string text)
        {
            try
            {
                string sql = "Select LastLoginDate,Question,Answer from UserAccount Where UserName=@username";
                UserAccount user = new UserAccount();
                //string CS = ConfigurationManager.ConnectionStrings["DBLMS"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(DbConnection.GetConnString()))
                {
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@username", text);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        user.UserName = reader["LastLoginDate"].ToString();
                        user.Question = reader["Question"].ToString();
                        user.Answer = reader["Answer"].ToString();
                        return user;
                    }
                    return null;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }

        public UserAccount ForgotPassword(UserAccount userAccount)
        {
            try
            {
                string sql = "Select * from UserAccount Where UserName=@username and Question=@question and Answer=@answer";
                UserAccount user = new UserAccount();
                //string CS = ConfigurationManager.ConnectionStrings["DBLMS"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(DbConnection.GetConnString()))
                {
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@username", userAccount.UserName);
                    cmd.Parameters.AddWithValue("@question", userAccount.Question);
                    cmd.Parameters.AddWithValue("@answer", userAccount.Answer);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        user.UserID = reader["UserId"].ToString();
                        user.Question = reader["Question"].ToString();
                        user.Answer = reader["Answer"].ToString();
                        //user.GrandfatherName = reader["LastName"].ToString();
                        user.UserName = reader["UserName"].ToString();
                        //user.Password = reader["Password"].ToString();
                        return user;
                    }
                    return null;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool ChangePassword(string currentUsername, string currentPassword, string newpassword, string answer, string question)
        {
            try
            {
                string sql = "Update UserAccount set Password=@newPass,Question=@question,Answer=@answer where UserName = @username and password=@oldPass";
                SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd = new SqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@username", currentUsername);
                cmd.Parameters.AddWithValue("@oldPass", currentPassword);
                cmd.Parameters.AddWithValue("@newPass", newpassword);
                cmd.Parameters.AddWithValue("@question", question);
                cmd.Parameters.AddWithValue("@answer", answer);
                conn.Open();
                int affRow = cmd.ExecuteNonQuery();
                return affRow > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public UserAccount GetUserAccount(string username)
        {
            try
            {
                string sql = "Select * from ViewUserInformation Where UserName=@username";
                UserAccount user = new UserAccount();
                //string CS = ConfigurationManager.ConnectionStrings["DBLMS"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(DbConnection.GetConnString()))
                {
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@username", username);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        user.UserID = reader["UserId"].ToString();
                        user.FirstName = reader["FirstName"].ToString();
                        user.LastName = reader["LastName"].ToString();
                        user.UserName = reader["UserName"].ToString();
                        user.Password = reader["Password"].ToString();
                        user.FacultyName = reader["FacultyName"].ToString();
                        user.DeptName = reader["DeptName"].ToString();
                        user.FacultyCode = Convert.ToInt32(reader["FacultyCode"].ToString());
                        user.DeptCode = Convert.ToInt32(reader["DeptCode"].ToString());
                        return user;
                    }
                    return null;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }
        public int CreateAccount(UserAccount acc)
        {
            try
            {
                //string CS = ConfigurationManager.ConnectionStrings["DBLMS"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(DbConnection.GetConnString()))
                {
                    SqlCommand cmd = new SqlCommand("spCreateAccount", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", acc.UserID);
                    cmd.Parameters.AddWithValue("@Username", acc.UserName);
                    cmd.Parameters.AddWithValue("@Password", acc.Password);
                    cmd.Parameters.AddWithValue("@Status", acc.Status);
                    cmd.Parameters.AddWithValue("@CreatedDate", acc.CreatedDate);
                    //
                    conn.Open();
                    int returnResult = (int)cmd.ExecuteScalar();//takes first column first row
                                                                //int returnResult = cmd.ExecuteNonQuery();//No. of affected row
                    return returnResult;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }
        public string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using(Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0 * 49, 0 * 76, 0 * 61, 0 * 63, 0 * 20, 0 * 45, 0 * 65, 0 * 64, 0 * 76, 0 * 65, 0 * 64, 0 * 65, 0 * 76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using(MemoryStream ms= new MemoryStream())
                {
                    using(CryptoStream cs= new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }
        public string Decrypt(string cipherText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0 * 49, 0 * 76, 0 * 61, 0 * 63, 0 * 20, 0 * 45, 0 * 65, 0 * 64, 0 * 76, 0 * 65, 0 * 64, 0 * 65, 0 * 76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }
    }
}
