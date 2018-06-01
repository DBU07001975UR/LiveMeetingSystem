using OnlineLiveMeetingSystemFinal2BL.Organization;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.GUI.SisWeb
{
    public class DropDownFill
    {
        public static void LoadFaculty(DropDownList ddlFaculty)
        {

            Faculty fclty = new Faculty();
            DataTable dt = new DataTable("Faculty");
            try
            {
                dt = fclty.getFacultys();
                if (dt != null)
                {
                    ddlFaculty.DataTextField = "FacultyName";
                    ddlFaculty.DataValueField = "FacultyCode";
                    ddlFaculty.DataSource = dt;
                    ddlFaculty.DataBind();
                }
                ddlFaculty.Items.Insert(0, new ListItem("-- Select Faculty --", "-1"));
            }
            catch (Exception)
            {
                throw;
            }

        }
        public static void LoadDepartment(DropDownList ddlFaculty, DropDownList ddlDepartment)
        {
            if (ddlFaculty.SelectedIndex > 0)
            {
                try
                {
                    DataTable dt = new DataTable();
                    Department dept = new Department();
                    int fCode = Convert.ToInt32(ddlFaculty.SelectedValue);
                    dt = dept.getDepartments(fCode);
                    if (dt != null)
                    {
                        ddlDepartment.DataSource = dt;
                        ddlDepartment.DataTextField = "DeptName";
                        ddlDepartment.DataValueField = "DeptCode";
                        ddlDepartment.DataBind();
                    }
                    else
                    {
                        ddlDepartment.Items.Clear();
                        ddlDepartment.SelectedIndex = -1;
                    }

                }
                catch (Exception)
                {
                    throw;
                }

            }
            ddlDepartment.Items.Insert(0, new ListItem("-- Select Department --", "-1"));
        }
    }
}