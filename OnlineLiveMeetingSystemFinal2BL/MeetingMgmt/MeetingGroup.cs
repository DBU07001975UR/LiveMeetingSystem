using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineLiveMeetingSystemFinal2BL
{
   public class MeetingGroup
    {
        public int DeptCode { get; set; }
        public string GroupName { get; set; }
        public int ScheduleID { get; set; }
        public string UserID { get; set; }
        public string UserRoleID { get; set; }

        public int CreateGroup(MeetingGroup meetingGroup)
        {
            string sql = "insert into MeetingGroup(GroupName,ScheduleID,PlenaryID,LeaderID,DeptCode) values(@name,@scheduleid,@plenaryid,@leaderid,@deptcode)";
            try
            {
                SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@name", meetingGroup.GroupName);
                cmd.Parameters.AddWithValue("@scheduleid", meetingGroup.ScheduleID);
                cmd.Parameters.AddWithValue("@plenaryid", meetingGroup.UserID);
                cmd.Parameters.AddWithValue("@leaderid", meetingGroup.UserRoleID);
                cmd.Parameters.AddWithValue("@deptcode", meetingGroup.DeptCode);
                //cmd.Parameters.AddWithValue("@facultycode", meetingGroup.FacultyCode);
               // cmd.Parameters.AddWithValue("@Status", meetingGroup.Status);
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
