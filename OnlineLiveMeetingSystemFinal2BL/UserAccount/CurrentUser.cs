using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlineLiveMeetingSystemFinal2BL
{
    public class CurrentUser
    {
        public static List<string> CurrentUserRoles { get; set; }
        public static bool IsLoggedin { get; set; }
        public static bool HasRole(string role)
        {
                foreach (string userRole in CurrentUserRoles)
                {
                    if (role == userRole)
                    {
                        return true;
                    }
                }
                return false;
        }
            
    }
}
