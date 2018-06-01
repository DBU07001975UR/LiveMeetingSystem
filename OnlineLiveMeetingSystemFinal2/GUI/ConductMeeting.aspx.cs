using OnlineLiveMeetingSystemFinal2BL;
using OnlineLiveMeetingSystemFinal2BL.MeetingMgmt;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.GUI.ConductMeeting
{
    public partial class ConductMeeting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserName"] == null)
            {
                Response.Redirect("~/GUI/Login.aspx");

            }
            if (Session["UserName1"] == null)
            {
                Response.Redirect("~/GUI/Login2.aspx");

            }
            if (Session["Role"].ToString() == "Admin")
            {
                Response.Redirect("~/GUI/ErrorPage.aspx");
            }
            if (Session["Role"].ToString() == "Plenary" || Session["Role"].ToString() == "MeetingManager")
            {
                minutesform.Visible = false;
                viewturn.Visible = false;
                close.Visible = false;
                up.Visible = false;


            }

            if (Session["Role"].ToString() == "MeetingLeader")
            {
                turnig.Visible = false;
                voting.Visible = false;
            }

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
                Turn turn = new Turn();
                turn.UserID = RadioButtonList1.SelectedValue;
                turn.Status = "In Speaking";
                bool success = turn.UpdateTurnByLeader(turn);
                if (success)
                {
                    lblMessage.Text = "";
                    ManageTurn.SelectedValue = "In Speaking";
                    ManageTurn.DataTextField = "In Speaking";
                    ManageTurn.SelectedIndex = 1;
                    //Page.ClientScript.RegisterStartupScript(GetType(), "Scripts", "<script>alert('Set Session Time To Speak the user');</script>");
                    DropDownList1_SelectedIndexChanged(sender, e);
                }
                else
                {
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Visible = true;
                    lblMessage.Text = "Turn can't be Updated !";
                }
            
        }
        protected void viewcandidate_Click(object sender, EventArgs e)
        {
            //lblMessage.ForeColor = Color.Red;
            //lblMessage.Visible = true;
            //lblMessage.Text = "The candidator Name and Id is  ";
            GridView1.Visible = true;
            GridView2.Visible = true;
        }

        protected void ViewRise_Click(object sender, EventArgs e)
        {

            RadioButtonList1.Visible = true;
        }

        protected void GiveVote_Click(object sender, EventArgs e)
        {
            //try
            //{
                VotingRadioButton.Visible = true;
                List<Candidate> assList = new List<Candidate>();
                Candidate assdata = new Candidate();
                assList = assdata.GetIssueData();
                test.DataSource = assList;
                test.DataBind();
                test.Visible = true;
                SubmitDecision.Visible = true;
            //}
            //catch (Exception)
            //{
            //    Response.Redirect("~/GUI/ExceptionPage.aspx");
            //}
            
        }

        protected void ManageTurn_SelectedIndexChanged(object sender, EventArgs e)
        {
            //try
            //{
                if (ManageTurn.SelectedValue == "Create Turn")
                {
                    string sql = "Select UserID From Turn where UserID=@userID";
                    SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@userID", Session["UserName"].ToString());
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        string userid = reader["CandidateID"].ToString();
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Visible = true;
                        lblMessage.Text = "You are Give the chance before this!!!";

                    }
                    else
                    {
                        Turn turn = new Turn();
                        turn.Status = ManageTurn.SelectedValue;
                        turn.Date = DateTime.Now;
                        UserAccount userAccount = new UserAccount();
                        userAccount = userAccount.GetUserAccount(Session["UserName"].ToString());
                        if (userAccount != null)
                        {
                            turn.UserID = userAccount.UserID;
                        }
                        int success = turn.CreateTurn(turn);
                        if (success > 0)
                        {
                            lblMessage.Text = "Turn Created Successfully";
                        }
                        else
                        {
                            lblMessage.ForeColor = Color.Red;
                            lblMessage.Visible = true;
                            lblMessage.Text = "Turn can't be Submit !";
                        }
                    }
                }
                else if (ManageTurn.SelectedValue == "Confirm Completion" || ManageTurn.SelectedValue == "In Speaking")
                {
                    string sql = "Select UserID From Turn where UserID=@userID";
                    SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@userID", Session["UserName"].ToString());
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (!reader.Read())
                    {
                        //string userid = reader["CandidateID"].ToString();
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Visible = true;
                        lblMessage.Text = "You Can not create aturn before!!!";

                    }
                    else
                    {
                        Turn turn = new Turn();
                        turn.Status = ManageTurn.SelectedValue;
                        turn.Date = DateTime.Now;
                        UserAccount userAccount = new UserAccount();
                        userAccount = userAccount.GetUserAccount(Session["UserName"].ToString());
                        if (userAccount != null)
                        {
                            turn.UserID = userAccount.UserID;
                        }
                        bool success = turn.UpdateTurn(turn);
                        if (success)
                        {
                            lblMessage.Text = "User " + userAccount.UserID + " has confirm completion successfully";
                        }
                        else
                        {
                            lblMessage.ForeColor = Color.Red;
                            lblMessage.Visible = true;
                            lblMessage.Text = "Turn can't be Updated !";
                        }
                    }
                }
                else
                {
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Visible = true;
                    lblMessage.Text = "Please select the turn first !";

                }
            //}
            //catch (Exception)
            //{
            //    Response.Redirect("~/GUI/ExceptionPage.aspx");
            //}
            
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            //try
            //{
                Minutes minutes = new Minutes();
                UserAccount userAccount = new UserAccount();
                userAccount = userAccount.GetUserAccount(Session["UserName"].ToString());
                if (userAccount != null)
                {
                    minutes.Minutess = txtMinutes.Text;
                    minutes.Date = DateTime.Now;
                    minutes.UserID = userAccount.UserID;
                    minutes.DeptCode = userAccount.DeptCode;
                    // minutes.FacultyCode = userAccount.FacultyCode;
                    int affectedRow = minutes.SubmitMinutes(minutes);
                    if (affectedRow > 0)
                    {
                        txtMinutes.Text = "";
                        lblMessage.ForeColor = Color.Green;
                        lblMessage.Visible = true;
                        lblMessage.Text = "Minutes Submit Successfully";

                    }
                    else
                    {
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Visible = true;
                        lblMessage.Text = "Minutes can't be Submit Error occured!";
                    }
                }
            //}
            //catch (Exception)
            //{
            //    Response.Redirect("~/GUI/ExceptionPage.aspx");
            //}
            
        }

        protected void CloseMeeting_Click(object sender, EventArgs e)
        {
            //try
            //{
                string delete = "Delete From Turn";
                SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd = new SqlCommand(delete, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                string deletecandidateResult = "Delete From CandidateResult";
                SqlConnection conn1 = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd1 = new SqlCommand(deletecandidateResult, conn1);
                conn1.Open();
                cmd1.ExecuteNonQuery();
                string deletecandidate = "DELETE FROM [dbo].[Candidates]";
                SqlConnection conn2 = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd2 = new SqlCommand(deletecandidate, conn2);
                conn2.Open();
                cmd2.ExecuteNonQuery();
                string deleteissueResult = "DELETE FROM [dbo].[IssueResult]";
                SqlConnection conn3 = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd3 = new SqlCommand(deleteissueResult, conn3);
                conn3.Open();
                cmd3.ExecuteNonQuery();
                string deleteissue = "DELETE FROM [dbo].[Issue]";
                SqlConnection conn4 = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd4 = new SqlCommand(deleteissue, conn4);
                conn4.Open();
                cmd4.ExecuteNonQuery();
                LinkButton1_Click(sender, e);
                Response.Redirect("~/GUI/AuthorizedDefault.aspx");
            //}
            //catch (Exception)
            //{

            //    Response.Redirect("~/GUI/ExceptionPage.aspx");
            //}
            
        }


        protected void VotingRadioButton_SelectedIndexChanged(object sender, EventArgs e)
        {
            //try
            //{
                string selectuserid = "Select VoterID From CandidateResult where VoterID = @userID";
                SqlConnection conn2 = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd2 = new SqlCommand(selectuserid, conn2);
                cmd2.Parameters.AddWithValue("@userID", Session["UserName"].ToString());
                conn2.Open();
                SqlDataReader reader1 = cmd2.ExecuteReader();
                if (reader1.Read())
                {
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Visible = true;
                    lblMessage.Text = "You are already Vote. can not vote twoice!!!";

                }
                else
                {
                    int Candidateid = 0;
                    string sql = "Select CandidateID From Candidates where UserID=@userID";
                    string insert = "INSERT INTO CandidateResult(UserID, VoterID, Sounds, CandidateID) VALUES (@UserID, @VoterID, @Sound, @CandidateID)";
                    SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
                    SqlConnection conn1 = new SqlConnection(DbConnection.GetConnString());
                    SqlCommand cmd1 = new SqlCommand(sql, conn1);
                    SqlCommand cmd = new SqlCommand(insert, conn);
                    cmd1.Parameters.AddWithValue("@userID", VotingRadioButton.SelectedValue.ToString());
                    conn1.Open();
                    SqlDataReader reader = cmd1.ExecuteReader();
                    while (reader.Read())
                    {
                        Candidateid = Convert.ToInt32(reader["CandidateID"].ToString());

                    }
                    cmd.Parameters.AddWithValue("@UserID", VotingRadioButton.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@VoterID", Session["UserName"].ToString());
                    cmd.Parameters.AddWithValue("@Sound", 1);
                    cmd.Parameters.AddWithValue("@CandidateID", Candidateid);
                    conn.Open();
                    int affectedRow = cmd.ExecuteNonQuery();
                    if (affectedRow > 0)
                    {
                        lblMessage.ForeColor = Color.Green;
                        lblMessage.Visible = true;
                        lblMessage.Text = "You are vote successfully.";
                    }
                    else
                    {
                        lblMessage.ForeColor = Color.Red;
                        lblMessage.Visible = true;
                        lblMessage.Text = "Error";
                    }
                }
            //}
            //catch (Exception)
            //{
            //    Response.Redirect("~/GUI/ExceptionPage.aspx");
            //}

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            UserAccount userAccount = new UserAccount();
            //try
            //{
                string sqlinsert = "insert into [tbl_UserLogoutHistory](UserId,LogoutDate,DeptCode) values (@UserId,@LogoutDate,@DeptCode)";
                SqlConnection conn1 = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd1 = new SqlCommand(sqlinsert, conn1);
                userAccount = userAccount.GetUserAccount(Session["UserName1"].ToString());
                if (userAccount != null)
                {
                    cmd1.Parameters.AddWithValue("@UserId", userAccount.UserID);
                    cmd1.Parameters.AddWithValue("@LogoutDate", DateTime.Now);
                    cmd1.Parameters.AddWithValue("@DeptCode", userAccount.DeptCode);
                    conn1.Open();
                    cmd1.ExecuteScalar();
                    Session.Remove("UserName1");
                    Session.Remove("Password1");
                    Response.Redirect("~/GUI/AuthorizedDefault.aspx");

                }
                else
                {
                    lblMessage.Text = ("Data Not Found Try Again!!!");
                }
            //}

            //catch (Exception)
            //{
            //    Response.Redirect("~/GUI/ExceptionPage.aspx");
            //}
        }

        protected void SubmitDecision_Click(object sender, EventArgs e)
        {
            int result = 0;
            Int32 id = 0;
            //try
            //{
                string selectuserid = "Select VoterID From IssueResult where VoterID = @userID";
                SqlConnection conn2 = new SqlConnection(DbConnection.GetConnString());
                SqlCommand cmd2 = new SqlCommand(selectuserid, conn2);
                cmd2.Parameters.AddWithValue("@userID", Session["UserName"].ToString());
                conn2.Open();
                SqlDataReader reader1 = cmd2.ExecuteReader();
                if (reader1.Read())
                {
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Visible = true;
                    lblMessage.Text = "You are already Vote. can not vote twoice!!!";

                }
                else
                {
                    foreach (GridViewRow row in test.Rows)
                    {
                        //Find the Radio button control
                        RadioButtonList rb = (RadioButtonList)row.FindControl("Radio1");
                        if (rb.SelectedItem != null)
                        {
                            if (rb.SelectedItem.Text == "Agree")
                            {
                                result = 1;
                                id = Convert.ToInt32(row.Cells[1].Text);
                            }
                            else
                            {
                                result = 0;
                                id = Convert.ToInt32(row.Cells[1].Text);
                            }

                            string query = "INSERT INTO [dbo].[IssueResult] ([IssueID],[VoterID],[FacultyCode],[DeptCode],[Result])VALUES (@IssueID,@VoterID,@FacultyCode,@DeptCode,@Result)";
                            UserAccount userAccount = new UserAccount();
                            userAccount = userAccount.GetUserAccount(Session["UserName"].ToString());
                            SqlConnection con = new SqlConnection(DbConnection.GetConnString());
                            SqlCommand cmd = new SqlCommand(query, con);
                            cmd.Parameters.AddWithValue("@IssueID", id);
                            cmd.Parameters.AddWithValue("@VoterID", userAccount.UserName);
                            cmd.Parameters.AddWithValue("@DeptCode", userAccount.DeptCode);
                            cmd.Parameters.AddWithValue("@FacultyCode", userAccount.FacultyCode);
                            cmd.Parameters.AddWithValue("@Result", result);
                            con.Open();
                            cmd.ExecuteNonQuery();

                            con.Close();
                        }

                    }
                }
            //}
            //catch (Exception)
            //{
            //    Response.Redirect("~/GUI/ExceptionPage.aspx");
            //}
            }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Timer"] = DateTime.Now.AddMinutes(Convert.ToInt16(DropDownList1.SelectedValue)).ToString();
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            //try
            //{
                if (DateTime.Compare(DateTime.Now, DateTime.Parse(Session["Timer"].ToString())) < 0)
                {
                    litmsg.Text = "Time Left  " + ((Int32)DateTime.Parse(Session["Timer"].ToString()).Subtract(DateTime.Now).TotalMinutes)
                        .ToString() + "  Minutes  " + (((Int32)DateTime.Parse(Session["Timer"].ToString()).Subtract(DateTime.Now).TotalSeconds) % 60)
                       .ToString() + "  Seconds ";
                }
                else
                {
                    Turn turn = new Turn();
                    turn.UserID = RadioButtonList1.SelectedValue;
                    turn.Status = "Confirm Completion";
                    bool success = turn.UpdateTurnByLeader(turn);
                    if (success)
                    {
                        ManageTurn.SelectedValue = "Confirm Completion";
                        ManageTurn.DataTextField = "Confirm Completion";
                        ManageTurn.SelectedIndex = 2;

                    }
                    up.Visible = false;
                }
            //}

            //catch (Exception)
            //{
            //    Response.Redirect("~/GUI/ExceptionPage.aspx");
            //}
    }
    }
}
    
