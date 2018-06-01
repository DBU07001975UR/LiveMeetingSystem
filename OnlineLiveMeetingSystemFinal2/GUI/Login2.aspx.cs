using OnlineLiveMeetingSystemFinal2BL;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

namespace OnlineLiveMeetingSystemFinal2.GUI.ConductMeeting
{
    public partial class Login2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                UserName.Text = Session["UserName"].ToString();
            }
            else
            {
                Response.Redirect("~/GUI/Login.aspx");
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string username = UserName.Text.Trim();
            string password = Password.Text.Trim();
            int userId = 0;

            string constr = ConfigurationManager.ConnectionStrings["DBLMS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("spLogin"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Connection = con;
                    con.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
                switch (userId)
                {
                    case -1:
                        FailureText.Visible = true;
                        FailureText.Text = "Username and/or password is incorrect.";
                        break;
                    case -2:
                        FailureText.Visible = true;
                        FailureText.Text = "Account has not been activated.";
                        break;
                    default:
                        if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                        {
                            FormsAuthentication.SetAuthCookie(username, RememberMe.Checked);
                            Response.Redirect(Request.QueryString["ReturnUrl"]);
                        }
                        else
                        {
                            UserAccount userAccount = new UserAccount();
                            FormsAuthentication.RedirectFromLoginPage(username, RememberMe.Checked);
                            Session["UserName1"] = UserName.Text;
                            Session["Password1"] = Password.Text;
                            userAccount = userAccount.GetUserAccount(UserName.Text);
                            try
                            {
                                string sqlinsert = "insert into [tbl_UserLoginHistory](UserId,LoginDate,DeptCode) values (@UserId,@LoginDate,@DeptCode)";
                                SqlConnection conn1 = new SqlConnection(DbConnection.GetConnString());
                                SqlCommand cmd1 = new SqlCommand(sqlinsert, conn1);
                                userAccount = userAccount.GetUserAccount(UserName.Text);
                                if (userAccount != null)
                                {
                                    cmd1.Parameters.AddWithValue("@UserId", userAccount.UserID);
                                    cmd1.Parameters.AddWithValue("@LoginDate", DateTime.Now);
                                    cmd1.Parameters.AddWithValue("@DeptCode", userAccount.DeptCode);
                                    conn1.Open();
                                    cmd1.ExecuteScalar();
                                    Response.Redirect("~/GUI/AuthorizedDefault.aspx");
                                }
                            }
                            catch (Exception)
                            {
                                FailureText.Text = "Error Server running out.";
                            }
                        }
                        Session["UserName1"] = UserName.Text;
                        Session["Password1"] = Password.Text;
                        //Response.Redirect("/GUI/AuthorizedDefault.aspx");
                        break;
                }
            }

        }

    }
}