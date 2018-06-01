using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace OnlineLiveMeetingSystemFinal2BL
{
   public class Schedule
    {
        public int ScheduleID { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string Month { get; set; }
        public string Agenda { get; set; }
        public int DeptCode { get; set; }

        public int PrepareSchedule(Schedule schedule)
        {
            string CS = ConfigurationManager.ConnectionStrings["DBLMS"].ConnectionString;
            using(SqlConnection conn= new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("Insert into Schedule(StartDate,EndDate,Month,Agenda,DeptCode) values(@start,@end,@month,@agenda,@deptcode)", conn);
                cmd.Parameters.AddWithValue("@start", schedule.StartDate);
                cmd.Parameters.AddWithValue("@end",schedule.EndDate);
                cmd.Parameters.AddWithValue("@month",schedule.Month);
                cmd.Parameters.AddWithValue("@agenda",schedule.Agenda);
                cmd.Parameters.AddWithValue("@deptcode", schedule.DeptCode);
                //cmd.Parameters.AddWithValue("@facultycode", schedule.FacultyCode);
                conn.Open();
                int affectedRow = cmd.ExecuteNonQuery();
                return affectedRow;
            }
        }
    }
}
