using OnlineLiveMeetingSystemFinal2BL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.GUI.Report
{
    public partial class GeneralizedMinutes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
                {
                    Response.Redirect("~/GUI/Login.aspx");
                }
                if (Session["Role"].ToString() == "Plenary" || Session["Role"].ToString() == "Admin" || Session["Role"].ToString() == "MeetingLeader")
                {
                    Response.Redirect("~/GUI/ErrorPage.aspx");
                }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                Minutes minutes = new Minutes();
                minutes.Minutess = txtMinutes.Text;
                minutes.Date = DateTime.Now;
                UserAccount userAccount = new UserAccount();
                userAccount = userAccount.GetUserAccount(Session["UserName"].ToString());
                if (userAccount != null)
                {
                    minutes.UserID = userAccount.UserID;
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
            }
            catch (Exception)
            {
                Response.Redirect("~/GUI/ExceptionPage.aspx");
            }
           
        }
    }
}