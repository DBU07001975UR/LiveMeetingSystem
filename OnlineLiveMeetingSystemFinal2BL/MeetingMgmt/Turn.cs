using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineLiveMeetingSystemFinal2BL
{
    public class Turn
    {
        public int TurnID { get; set; }
        public string UserID { get; set; }
        public string Status { get; set; }
        public DateTime Date { get; set; }

        public int CreateTurn(Turn turn)
        {
            try
            {
                string sql = "Insert into [Turn] (Status,UserId,Date)Values(@status,@userid,@date)";
                using (SqlConnection conn = new SqlConnection(DbConnection.GetConnString()))
                {
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@status", turn.Status);
                    cmd.Parameters.AddWithValue("@userid", turn.UserID);
                    cmd.Parameters.AddWithValue("@date", turn.Date);
                    conn.Open();
                    int affectedRow = cmd.ExecuteNonQuery();
                    return affectedRow;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public bool UpdateTurn(Turn turn)
        {
            string sql = "Update [Turn] set Status=@status,Date=@date where UserId = @userid";
            SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
            SqlCommand cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@userid", turn.UserID);
            cmd.Parameters.AddWithValue("@status", turn.Status);
            cmd.Parameters.AddWithValue("@date", turn.Date);
            conn.Open();
            int affRow = cmd.ExecuteNonQuery();
            return affRow > 0;
        }

        public bool UpdateTurnByLeader(Turn turn)
        {
            string sql = "Update [Turn] set Status=@status where UserId = @userid";
            SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
            SqlCommand cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@userid", turn.UserID);
            cmd.Parameters.AddWithValue("@status", turn.Status);
            conn.Open();
            int affRow = cmd.ExecuteNonQuery();
            return affRow > 0;
        }

        public Turn GetUserStatus(string userID)
        {
            Turn turn = new Turn();
            string sql = "select * From [Turn] where UserId = @userid";
            SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@userid", userID);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                turn.UserID = reader["UserId"].ToString();
                turn.Status = reader["Status"].ToString();
                turn.Date = Convert.ToDateTime(reader["Date"].ToString());
            }
            return turn;
        }
    }
}
