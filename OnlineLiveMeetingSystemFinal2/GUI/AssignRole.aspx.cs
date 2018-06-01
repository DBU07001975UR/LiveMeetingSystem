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

namespace OnlineLiveMeetingSystemFinal2.ManageAccount
{
    public partial class AssignRole :Page
    {
        string userid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"]== null)
            {
                Response.Redirect("~/GUI/Login.aspx");
            }
            if (Session["Role"].ToString() == "Plenary"|| Session["Role"].ToString() == "MeetingLeader" || Session["Role"].ToString() == "MeetingManager")
            {
                Response.Redirect("~/GUI/ErrorPage.aspx");
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            try
            {
                UserAccount user = new UserAccount();
                user = user.GetUserAccount(UserName.Text);
                if (user != null)
                {
                    userid = user.UserID;
                    FirstName.Text = user.FirstName;
                    //txtmname.Text = user.FatherName;
                    LastName.Text = user.LastName;
                    //Get Roles
                    List<Role> roleList = new List<Role>();
                    Role role = new Role();
                    roleList = role.GetUnAssignedRoles(user.UserID);
                    if (roleList != null)
                    {
                        ddlRole.DataSource = roleList;
                        ddlRole.DataTextField = "Name";
                        ddlRole.DataValueField = "Id";
                        ddlRole.DataBind();
                    }
                }
                else
                {
                    userid = "";
                    FirstName.Text = "";
                    ddlRole.DataSource = null;
                    lblMessage.ForeColor = Color.Green;
                    lblMessage.Visible = true;
                    lblMessage.Text=("Record not found");
                }
            }
            catch (Exception)
            {
               Response.Redirect("~/GUI/ExceptionPage.aspx");
            }
        }
        protected void AssignButton_Click1(object sender, EventArgs e)
        {
            try
            {
                Role role = new Role();
                UserRole userRole = new UserRole();
                UserAccount user = new UserAccount();
                user = user.GetUserAccount(UserName.Text);
                if (user != null)
                {
                        userid = user.UserID;
                        userRole.UserId = userid;
                        userRole.RoleId = Convert.ToInt32(ddlRole.SelectedValue);
                        userRole.EffectiveDate = Convert.ToDateTime(EffectiveDate.Text);
                        userRole.ExpiryDate = Convert.ToDateTime(ExpiredDate.Text);
                        userRole.Status = 1;
                    List<string> userRoleList = new List<string>();
                    SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
                    SqlCommand cmd = new SqlCommand("SELECT * FROM UserRole where UserId=@userid", conn);
                    //
                    cmd.Parameters.AddWithValue("@userid", user.UserID);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        string sqlupdate = "Update UserRole set RoleId=@roleid where UserId=@userid";
                        SqlConnection conn1 = new SqlConnection(DbConnection.GetConnString());
                        SqlCommand cmd1 = new SqlCommand(sqlupdate, conn1);
                        cmd1.Parameters.AddWithValue("@userid", user.UserID);
                        cmd1.Parameters.AddWithValue("@roleid", Convert.ToInt32(ddlRole.SelectedValue));
                        conn1.Open();
                        cmd1.ExecuteScalar();
                        lblMessage.ForeColor = Color.Green;
                        lblMessage.Visible = true;
                        lblMessage.Text = "Role assigned to user successfuly.";
                        Clear_Click(sender, e);
                    }
                    else
                    {
                        int success = userRole.AssignRole(userRole);
                        if (success > 0)
                        {
                            lblMessage.ForeColor = Color.Green;
                            lblMessage.Visible = true;
                            lblMessage.Text = "Role assigned to user successfuly.";
                            Clear_Click(sender, e);
                        }
                        else
                        {
                            lblMessage.ForeColor = Color.Red;
                            lblMessage.Visible = true;
                            lblMessage.Text = "Failed to assign role to user.";
                        }
                    }
                }

            }
            catch (Exception)
            {
                Response.Redirect("~/GUI/ExceptionPage.aspx");
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/AuthorizedDefault.aspx");
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            UserName.Text = "";
            FirstName.Text = "";
            LastName.Text = "";
            ddlRole.SelectedValue=null;
            EffectiveDate.Text = "";
            ExpiredDate.Text = "";
        }
    }
}