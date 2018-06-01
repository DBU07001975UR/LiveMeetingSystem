using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineLiveMeetingSystemFinal2BL.MeetingMgmt
{
    public class Candidate
    {
        public  int ID { get; set; }
        public string Issue { get; set; }

        public List<Candidate> GetIssueData()
        {
            try
            {
                List<Candidate> candidatelist = new List<Candidate>();
                string select = "SELECT ID,Issue FROM [Issue]";
                SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd = new SqlCommand(select, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Candidate candidateData = new Candidate();
                    candidateData.ID = Convert.ToInt32( reader["ID"].ToString());
                    candidateData.Issue = reader["Issue"].ToString();
                    candidatelist.Add(candidateData);
                }
                return candidatelist;
            }
            catch (Exception)
            {

                return null;
            }

        }

        //public List<Candidate> GetCandidateList(int deptCode)
        //{
        //    try
        //    {
        //        List<Candidate> candidatelist = new List<Candidate>();
        //        string select = "SELECT [User].FirstName, [User].LastName, Candidates.CandidateID, Candidates.UserID, Candidates.DeptCode FROM [User] INNER JOIN Candidates ON [User].UserId = Candidates.UserID AND Candidates.DeptCode=@deptcode";
        //        SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
        //        SqlCommand cmd = new SqlCommand(select, conn);
        //        cmd.Parameters.AddWithValue("@deptcode", deptCode);
        //        conn.Open();
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        while (reader.Read())
        //        {
        //            Candidate candidateData = new Candidate();
        //            candidateData.FisrtName = reader["FisrtName"].ToString();
        //            candidateData.UserID = reader["UserID"].ToString();
        //            candidatelist.Add(candidateData);
        //        }
        //        return candidatelist;
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }

        //}
    }
}
