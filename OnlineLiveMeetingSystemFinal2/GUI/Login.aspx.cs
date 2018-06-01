using OnlineLiveMeetingSystemFinal2BL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ForgotPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/ForgotPassword.aspx");
        }

        protected void btnLogin1_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
               
                    UserAccount userAccount = new UserAccount();
                    UserAccount eeee = new UserAccount();
                    int status = userAccount.Login(txtUserName.Text, txtPassword.Text);
                    if (status == 1)
                    {
                        eeee = eeee.GetLastLoginDate(txtUserName.Text);
                        if (eeee.Question == ""||eeee.Answer == "")
                        {
                        Session["UserName"] = txtUserName.Text;
                            Session["Password"] = (txtPassword.Text);
                            string sql = "Update UserAccount set LastLoginDate=@loginDate Where UserName = @username";
                            SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
                            SqlCommand cmd = new SqlCommand(sql, conn);
                            cmd.Parameters.AddWithValue("@username", Session["UserName"]);
                            cmd.Parameters.AddWithValue("@loginDate", DateTime.Now);
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            Response.Redirect("~/GUI/ChangePassword.aspx");

                        }
                        else
                        {
                        labErrorUser.Visible = true;
                        labErrorUser.Text = "question returns" + eeee.Question;
                        Session["UserName"] = txtUserName.Text;
                            Session["Password"] = (txtPassword.Text);
                            string sql = "Update UserAccount set LastLoginDate=@loginDate where username = @username";
                            SqlConnection conn = new SqlConnection(DbConnection.GetConnString());
                            SqlCommand cmd = new SqlCommand(sql, conn);
                            cmd.Parameters.AddWithValue("@username", Session["UserName"]);
                            cmd.Parameters.AddWithValue("@loginDate", DateTime.Now);
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            Response.Redirect("/GUI/AuthorizedDefault.aspx");
                        }
                    }
                    else if (status == 0)
                    {
                        labErrorUser.Visible = true;
                        labErrorUser.Text = "Account not activated";
                    }
                    else if (status == 2)
                    {
                        labErrorUser.Visible = true;
                        labErrorUser.Text = "Account marked as disabled";
                    }
                    else if (status == 3)
                    {
                        labErrorUser.Visible = true;
                        labErrorUser.Text = "Account Marked as Deleted";
                    }
                    else
                    {
                        labErrorUser.Visible = true;
                        labErrorUser.Text = "Invalid User Name and/or Password Try again";
                    }
            }
        }
        protected void ForgotPassword_Click1(object sender, EventArgs e)
        {

            Response.Redirect("~/GUI/ForgotPassword.aspx");

        }
    }
}
