using OnlineLiveMeetingSystemFinal2BL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.MyAccount
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
                if (Session["UserName"] == null)
                {
                    Response.Redirect("~/GUI/Login.aspx");
                }
                if (!IsPostBack)
                {
                try
                {
                    UserAccount userAccount = new UserAccount();
                    userAccount = userAccount.GetUserAccount(Session["UserName"].ToString());
                    if (userAccount != null)
                    {
                        username.Text = userAccount.UserName;
                        firstname.Text = userAccount.FirstName;
                        lastname.Text = userAccount.LastName;
                        password.Text = userAccount.Password;
                    }

                    //lblName.Text = user.UserName;
                    //lblLastLoginDate.Text = user.LastLoginDate.ToString();
                    //lblLastPassword.Text = user.LastPasswordChangedDate.ToString();
                }
                catch (Exception)
                {
                    Response.Redirect("~/GUI/ExceptionPage.aspx");
                }

            }
            

        }
    }
}