using OnlineLiveMeetingSystemFinal2.GUI.SisWeb;
using OnlineLiveMeetingSystemFinal2BL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.ManageGroup
{
    public partial class CreateGroup : System.Web.UI.Page
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
            if (!IsPostBack)
            {
               
                    ddlUserID.DataBind();
                    ddlUserRole.DataBind();
                    ddlScheduleID.DataBind();
                    loadFacult();
                    //load department
                    ddlFaculty_SelectedIndexChanged(sender, e);
               
               
            }
        }

        private void loadFacult()
        {
            ddlFaculty.Items.Clear();
            try
            {
                DropDownFill.LoadFaculty(ddlFaculty);
            }
            catch (Exception)
            {
                Response.Redirect("~/GUI/ExceptionPage.aspx");
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/AuthorizedDefault.aspx");
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            GroupName.Text = "";
            ddlUserID.SelectedValue = null;
            ddlUserRole.SelectedValue = null;
            ddlScheduleID.SelectedValue = null;
        }

        protected void Create_Click(object sender, EventArgs e)
        {
            try { 
            MeetingGroup meetingGroup = new MeetingGroup();
            meetingGroup.GroupName = GroupName.Text;
            meetingGroup.ScheduleID = Convert.ToInt32(ddlScheduleID.SelectedValue);
            meetingGroup.UserID = ddlUserID.SelectedValue;
            meetingGroup.UserRoleID =ddlUserRole.SelectedValue;
            //meetingGroup.FacultyCode = Convert.ToInt32(ddlFaculty.SelectedValue);
            meetingGroup.DeptCode = Convert.ToInt32(ddlDepartment.SelectedValue);
            int success = meetingGroup.CreateGroup(meetingGroup);
            if (success==1)
            {
                lblMessage.ForeColor = Color.Green;
                lblMessage.Visible = true;
                lblMessage.Text = "Group Assigned Successfully.";
                Clear_Click(sender, e);
            }
            else
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Visible = true;
                lblMessage.Text = "Error Occured Try Again.";
                Clear_Click(sender, e);
            }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Visible = true;
                lblMessage.Text = "Error Occurred try again"+ex.Message;
            }
        }

        protected void ddlFaculty_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlDepartment.Items.Clear();
            try
            {
                DropDownFill.LoadDepartment(ddlFaculty, ddlDepartment);
                //Fire ddlDepartment SelectedIndexChanged event
                //ddlDepartment_SelectedIndexChanged(sender, e);
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Visible = true;
                lblMessage.Text = "Sorry try again. " + ex.Message;
            }
        }

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}