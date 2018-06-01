using OnlineLiveMeetingSystemFinal2BL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.GUI.ManageVoting
{
    public partial class StoreCandidate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("~/GUI/Login.aspx");
            }
            if (Session["Role"].ToString() == "Plenary" || Session["Role"].ToString() == "Admin" || Session["Role"].ToString() == "MeetingManager")
            {
                Response.Redirect("~/GUI/ErrorPage.aspx");
            }
        }

        protected void Store_Click(object sender, EventArgs e)
        {
            try
            {
                UserAccount user = new UserAccount();
                user = user.GetUserAccount(userid.SelectedValue.ToString());
                string sql = "Insert into [Candidates] (UserId,DeptCode)Values(@userid,@deptcode)";
                using (SqlConnection conn = new SqlConnection(DbConnection.GetConnString()))
                {
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@userid", userid.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@deptcode", user.DeptCode);
                    conn.Open();
                    int affectedRow = cmd.ExecuteNonQuery();
                    if (affectedRow > 0)
                    {
                        lblMessage.ForeColor = Color.Green;
                        lblMessage.Visible = true;
                        lblMessage.Text = "Candidates Stored Successfully.";
                    }
                    else
                    {
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Visible = true;
                        lblMessage.Text = "Error Try again.";
                    }

                }
            }
            catch (Exception)
            {
                Response.Redirect("~/GUI/ExceptionPage.aspx");
            }
        }

        protected void CandidateType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (CandidateType.SelectedValue == "Candidate")
            {
                ddlselect.Visible = false;
                tablecandidate.Visible = true;
                Back.Visible = true;
            }
            else if(CandidateType.SelectedValue=="Issue")
            {
                ddlselect.Visible = false;
                tableissue.Visible = true;
                Back.Visible = true;
            }
            else
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Visible = true;
                lblMessage.Text = "Error try again";
            }
        }

        protected void StoreIssue_Click(object sender, EventArgs e)
        {
            try
            {
                UserAccount user = new UserAccount();
                user = user.GetUserAccount(Session["UserName"].ToString());
                string sql = "Insert into [Issue] (Issue,DeptCode)Values(@issue,@deptcode)";
                using (SqlConnection conn = new SqlConnection(DbConnection.GetConnString()))
                {
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@issue", txtIssue.Text);
                    cmd.Parameters.AddWithValue("@deptcode", user.DeptCode);
                  
                    conn.Open();
                    int affectedRow = cmd.ExecuteNonQuery();
                    if (affectedRow > 0)
                    {
                        txtIssue.Text = "";
                        lblMessage.ForeColor = Color.Green;
                        lblMessage.Visible = true;
                        lblMessage.Text = "Issue Stored Successfully.";
                    }
                    else
                    {
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Visible = true;
                        lblMessage.Text = "Error Try again.";
                    }

                }
            }
            catch (Exception)
            {
                Response.Redirect("~/GUI/ExceptionPage.aspx");
            }
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            tablecandidate.Visible = false;
            tableissue.Visible = false;
            Back.Visible = false;
            ddlselect.Visible = true;
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/AuthorizedDefault.aspx");
        }
    }
}