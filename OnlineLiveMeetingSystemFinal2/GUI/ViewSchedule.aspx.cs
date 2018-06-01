using OnlineLiveMeetingSystemFinal2.GUI.SisWeb;
using OnlineLiveMeetingSystemFinal2BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.ManageSchedule
{
    public partial class ViewSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            labMessagesucesse.Visible = false;
                if (Session["UserName"] == null)
                {
                    Response.Redirect("~/GUI/Login.aspx");
                }
                if (Session["Role"].ToString() == "Admin")
                {
                    Response.Redirect("~/GUI/ErrorPage.aspx");
                }
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
                labMessagesucesse.ForeColor = Color.Red;
                labMessagesucesse.Visible = false;
                labMessagesucesse.Text = "Sorry try again. ";
            }
        }

        protected void ddlFaculty_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlDepartment.Items.Clear();
            try
            {
                DropDownFill.LoadDepartment(ddlFaculty, ddlDepartment);
                //PopulateScedule();
            }
            catch (Exception)
            {
                Response.Redirect("~/GUI/ExceptionPage.aspx");
            }
        }

        

        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            PopulateGrid();
        }

        private void PopulateGrid()
        {
            try
            {
                DataTable datable = new DataTable();
                using (SqlConnection conn = new SqlConnection(DbConnection.GetConnString()))
                {
                    conn.Open();
                    SqlDataAdapter sqlda = new SqlDataAdapter("SELECT ScheduleID,StartDate,EndDate,Month,Agenda FROM Schedule where DeptCode='" + Convert.ToInt32(ddlDepartment.SelectedValue) + "' ", conn);
                    sqlda.Fill(datable);

                }
                if (datable.Rows.Count > 0)
                {
                    labMessagesucesse.Visible = false;
                    ScheduleGrid.DataSource = datable;
                    ScheduleGrid.DataBind();
                    ScheduleGrid.Visible = true;
                }
                else
                {
                    labMessagesucesse.ForeColor =Color.Red;
                    labMessagesucesse.Visible = true;
                    ScheduleGrid.Visible = false;
                    labMessagesucesse.Text = "Sorry, No Schedule Data can display.";
                   
                    

                }
            }
            catch (Exception)
            {
                Response.Redirect("~/GUI/ExceptionPage.aspx");

            }
        }
    }
}