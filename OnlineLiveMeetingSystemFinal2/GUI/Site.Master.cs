using OnlineLiveMeetingSystemFinal2BL;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
                if (!IsPostBack)
                {
                    UserAccount userAccount = new UserAccount();
                    userAccount = userAccount.GetUserAccount(Session["UserName"].ToString());
                    btnProfile.Visible = true;
                    ///btnProfile.Text = userAccount.FirstName + " " + userAccount.LastName;
                }
                labDate.Visible = true;
                labDate.Text = DateTime.Now.ToLongDateString();
                HideNavigationMenu();
                DisplayNavigationMenu();
           
            
        }
        private void HideNavigationMenu()
        {
            limanageaccount.Visible = false;
            licreateAccount.Visible = false;
            liupdateAccount.Visible = false;
            liassignRole.Visible = false;
            liviewAccount.Visible = false;
            limanageMeeting.Visible = false;
            liconductMeeting.Visible = false;
            licandidate.Visible = false;
            //liprofile.Visible = false;
            liselectcandidate.Visible = false;
            lideleteCandidate.Visible = false;
            ligroup.Visible = false;
            liAssigngroup.Visible = false;
            liupdategroup.Visible = false;
            lideletegroup.Visible = false;
            lischedule.Visible = false;
            liprepareschedule.Visible = false;
            liupdateschedule.Visible = false;
            lideleteschedule.Visible = false;
            lifile.Visible = false;
            listorefile.Visible = false;
            lideletefile.Visible = false;
            liview.Visible = false;
            liviewschedule.Visible = false;
            liviewgroup.Visible = false;
            liviewfile.Visible = false;
            lireport.Visible = false;
            liviewattendance.Visible = false;
            liviewminutes.Visible = false;
            lisummarizedminutes.Visible = false;
            //lijoinmeeting.Visible = false;
            //liAssigngroup.Visible = false;
            //liupdategroup.Visible = false;
            //lideletegroup.Visible = false;
            //lischedule.Visible = false;
            //liprepareschedule.Visible = false;
            //liupdateschedule.Visible = false;
            //lideleteschedule.Visible = false;
            //lifile.Visible = false;

        }

        private void DisplayNavigationMenu()
        {
                UserRole role = new UserRole();
                List<UserRole> rolelist = new List<UserRole>();

                ///get role list using user usrname/userid

                rolelist = role.GetUserRoleList(Session["UserName"].ToString());
                for (int i = 0; i < rolelist.Count; i++)
                {
                    if (rolelist[i].Name.ToString().Equals("Admin"))
                    {
                        Session["Role"] = "Admin";
                        limanageaccount.Visible = true;
                        licreateAccount.Visible = true;
                        liupdateAccount.Visible = true;
                        liassignRole.Visible = true;
                        liviewAccount.Visible = true;
                    }
                    if (rolelist[i].Name.ToString().Equals("MeetingManager"))
                    {
                        Session["Role"] = "MeetingManager";
                        limanageMeeting.Visible = true;
                        liconductMeeting.Visible = true;
                        //lijoinmeeting.Visible = true;
                        ligroup.Visible = true;
                        liAssigngroup.Visible = true;
                        liupdategroup.Visible = true;
                        lideletegroup.Visible = true;
                        lischedule.Visible = true;
                        liprepareschedule.Visible = true;
                        liupdateschedule.Visible = true;
                        lideleteschedule.Visible = true;
                        lifile.Visible = true;
                        listorefile.Visible = true;
                        lideletefile.Visible = true;
                        liview.Visible = true;
                        liviewschedule.Visible = true;
                        liviewgroup.Visible = true;
                        liviewfile.Visible = true;
                        lireport.Visible = true;
                        liviewattendance.Visible = true;
                        liviewminutes.Visible = true;
                        lisummarizedminutes.Visible = true;
                    }
                    if (rolelist[i].Name.ToString().Equals("MeetingLeader"))
                    {
                        Session["Role"] = "MeetingLeader";
                        limanageMeeting.Visible = true;
                        liconductMeeting.Visible = true;
                        licandidate.Visible = true;
                        //liprofile.Visible = false;
                        liselectcandidate.Visible = true;
                        lideleteCandidate.Visible = true;
                        liview.Visible = true;
                        liviewschedule.Visible = true;
                        liviewgroup.Visible = true;
                        liviewfile.Visible = true;
                    }
                    if (rolelist[i].Name.ToString().Equals("Plenary"))
                    {
                        Session["Role"] = "Plenary";
                        limanageMeeting.Visible = true;
                        liconductMeeting.Visible = true;
                        //lijoinmeeting.Visible = true;
                        liview.Visible = true;
                        liviewschedule.Visible = true;
                        liviewgroup.Visible = true;
                        liviewfile.Visible = true;
                    }
                }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/Logout.aspx");
        }

        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/UserProfile.aspx");
        }
    }
}