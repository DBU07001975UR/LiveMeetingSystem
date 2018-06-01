using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.ManageAccount
{
    public partial class NewUserPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPassword();

            }
        }

        private void BindPassword()
        {
            lblPassword.Text = Session["Password"].ToString();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/Login.aspx");
        }
    }
}