using OnlineLiveMeetingSystemFinal2.GUI.SisWeb;
using OnlineLiveMeetingSystemFinal2BL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.ManageSchedule
{
    public partial class PrepareSchedule : System.Web.UI.Page
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
                lblMessage.Visible = false;
                if (!IsPostBack)
                {
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

        protected void Save_Click(object sender, EventArgs e)
        {
            try { 
            Schedule schedule = new Schedule();
             schedule.DeptCode = Convert.ToInt32(ddlDepartment.SelectedValue);
            //schedule.FacultyCode = Convert.ToInt32(ddlFaculty.SelectedValue);
            schedule.StartDate = Convert.ToDateTime(StartDate.Text);
            schedule.EndDate = Convert.ToDateTime(EndDate.Text);
            schedule.Month = Month.Text;
            schedule.Agenda = Agenda.Text;
            int success = schedule.PrepareSchedule(schedule);
            if (success == 1)
            {
                lblMessage.ForeColor = Color.Green;
                lblMessage.Visible = true;
                lblMessage.Text = "Schedule set Successfully.\n Live Meeting System";
                Clear_Click(sender, e);
            }
            else
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Visible = true;
                lblMessage.Text = "Someting wrong Fix First.\n Live Meeting System.";
            }
            }
            catch (Exception )
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
            ddlFaculty.SelectedValue = null;
            ddlDepartment.SelectedValue = null;
            StartDate.Text = "";
            EndDate.Text = "";
            Month.Text = "";
            Agenda.Text = "";
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
            catch (Exception)
            {
                Response.Redirect("~/GUI/ExceptionPage.aspx");
            }
        }
    }
}