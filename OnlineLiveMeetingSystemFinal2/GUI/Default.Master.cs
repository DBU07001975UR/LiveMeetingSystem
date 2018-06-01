using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2
{
    public partial class Default1 : System.Web.UI.MasterPage
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            labDate.Visible = true;
            labDate.Text = DateTime.Now.ToLongDateString();
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/Login.aspx");

        }
    }
}