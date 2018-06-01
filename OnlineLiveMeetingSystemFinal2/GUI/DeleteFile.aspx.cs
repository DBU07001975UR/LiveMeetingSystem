using OnlineLiveMeetingSystemFinal2BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.ManageFile
{
    public partial class DeleteFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("~/GUI/Login.aspx");
            }
            if (Session["Role"].ToString() == "Plenary" || Session["Role"].ToString() == "Admin" || Session["Role"].ToString() == "MeetingLeader")
            {
                Response.Redirect("~/GUI/ErrorPage.aspx");
            }
        }
    }
}