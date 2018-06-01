using OnlineLiveMeetingSystemFinal2BL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.ManageAccount
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void Continue_Click(object sender, EventArgs e)
        {
            try { 
            UserAccount userAccount = new UserAccount();
            DataSet ds = new DataSet();
            userAccount.UserName = UserName.Text;
            userAccount.Question = Question1.Text;
            userAccount.Answer = Answer.Text;
            userAccount = userAccount.ForgotPassword(userAccount);
            if (userAccount!=null)
            {
                string sql = "update UserAccount set Password=@password Where UserName=@username and Question=@question and Answer=@answer";
                UserAccount user = new UserAccount();

                int num, num1;
                Random ran = new Random();
                Random ran1 = new Random();
                num = ran.Next(100);
                num1 = ran1.Next(1000);
                string password = userAccount.Password = num + "livemeeting" + num1;
                string CS = ConfigurationManager.ConnectionStrings["DBLMS"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@username", userAccount.UserName);
                    cmd.Parameters.AddWithValue("@question", userAccount.Question);
                    cmd.Parameters.AddWithValue("@answer", userAccount.Answer);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Session["Password"] = password;
                    Response.Redirect("~/GUI/NewUserPassword.aspx");
                }
            }else
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Visible = true;
                lblMessage.Text = "Your Information is Incorrect try again.\n Live Meeting System";
                UserName.Text = "";
                Question1.Text = "";
                Answer.Text = "";
            }
            }
            catch (Exception )
            {
                Response.Redirect("~/GUI/ExceptionPage.aspx");
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/Default.aspx");
            UserName.Text = "";
            Question1.Text = "";
            Answer.Text = "";
        }
    }
}