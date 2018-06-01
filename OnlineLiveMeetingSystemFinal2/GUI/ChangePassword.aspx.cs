using OnlineLiveMeetingSystemFinal2BL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.MyAccount
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("~/GUI/Login.aspx");
            }
            else
            {
                CurrentPassword.Text = Session["Password"].ToString();
            }
        }

        protected void ChangePasswordPushButton_Click(object sender, EventArgs e)
        {
                UserAccount account = new UserAccount();
                bool changed = false;
                changed = account.ChangePassword(Session["UserName"].ToString(), Session["Password"].ToString(), NewPassword.Text, Answer.Text, Question.SelectedValue);
                if (changed == true)
                {
                Session["Password"] = NewPassword.ToString();
                Response.Redirect("~/GUI/ChangePasswordSuccess.aspx");
                }
                else
                {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Visible = true;
                lblMessage.Text = "Changing password failed. Try again.";
                }
          
        }

        protected void CancelPushButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/AuthorizedDefault.aspx");
        }
    }
}