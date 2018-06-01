using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.GUI
{
    public partial class JoinMeeting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("~/GUI/Login.aspx");

            }
            if (Session["Role"].ToString() == "Admin" && Session["Role"].ToString() == "MeetingLeader")
            {
                Response.Redirect("~/GUI/ErrorPage.aspx");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void VotingRadioButton_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ManageTurn_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void viewcandidate_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
        }

        protected void GiveVote_Click(object sender, EventArgs e)
        {
            VotingRadioButton.Visible = true;
        }
    }
}