using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineLiveMeetingSystemFinal2BL
{
    public class DbConnection
    {
        public static string GetConnString()
        {
            return @"Data Source=DESKTOP-RHTPOBL\SQLEXPRESS;Initial Catalog=LiveMeetingSystemDB;Persist Security Info=True;User ID=YYY;Password=1975";
        }
    }
}
