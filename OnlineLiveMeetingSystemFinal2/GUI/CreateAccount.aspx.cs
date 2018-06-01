using OnlineLiveMeetingSystemFinal2BL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.ManageAccount
{
    public partial class CreateAccount : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
                if (Session["UserName"] == null)
                {
                    Response.Redirect("~/GUI/Login.aspx");
                }
                if (Session["Role"].ToString() == "Plenary" || Session["Role"].ToString() == "MeetingLeader" || Session["Role"].ToString() == "MeetingManager")
                {
                    Response.Redirect("~/GUI/ErrorPage.aspx");
                }
            
            
        }

        protected void Search_Click(object sender, EventArgs e)
        {
            try { 
                User usData = new User();
                
                usData = usData.SearchUser(UserID.Text);

                if (usData != null)
                {
                    FirstName.Text = usData.FirstName;
                    LastName.Text = usData.LastName;
                    UserID.Text = usData.UserId;
                    UserName.Text = usData.UserId;
                    Password.Text = usData.LastName + "@abcd1234";
                    ConfirmPassword.Text= usData.LastName + "@abcd1234";
                    Status.Checked = true;
                    //UserAccount acc = new UserAccount();
                    //string Encrypted = acc.Encrypt(Password.Text);
                    //string decrypted = acc.Decrypt(Encrypted);
                    //lblMessage.ForeColor = Color.Green;
                    //lblMessage.Visible = true;
                    //lblMessage.Text = "The Encrypted form of password " + decrypted + " is  " + Encrypted;
                }
                else
                {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Visible = true;
                lblMessage.Text = "No record found:\n Live Meeting System";
                }
        }
            catch (Exception )
            {
                Response.Redirect("~/GUI/ExceptionPage.aspx");
            }

}

        protected void CreateButton_Click(object sender, EventArgs e)
        {
            try
            {
                UserAccount acc = new UserAccount();
                UserRole userRole = new UserRole();
                acc.UserID = UserID.Text;
                acc.UserName = UserName.Text;
                acc.CreatedDate = DateTime.Now;
                //acc.Password = FormsAuthentication.HashPasswordForStoringInConfigFile(Password.Text,"SAH1") ;
                acc.Password = Password.Text;
                if (Status.Checked)
                {
                    acc.Status = 1;
                }
                else
                {
                    acc.Status = 0;
                }
                int created = acc.CreateAccount(acc);
                if (created == 1)
                {
                    //userRole.UserId = UserID.Text;
                    //userRole.
                    int assigned = userRole.AssignRoleDefault(UserID.Text);
                    if (assigned == 1)
                    {
                        lblMessage.Text = "Role Assigned successfully";
                    }
                    else
                    {
                        lblMessage.Text = "Role does not assigned";
                    }
                    lblMessage.ForeColor = Color.Green;
                    lblMessage.Visible = true;
                    lblMessage.Text = "User Account Created Successfully.";
                    Clear_Click(sender, e);
                }
                else if (created == -1)
                {
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Visible = true;
                    lblMessage.Text = UserID.Text + " This Person has an account.";
                }
                else if (created == -2)
                {
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Visible = true;
                    lblMessage.Text = "User record with ID " + UserID.Text + " not exist.\n  we can give only registered users.";
                }
                else
                {
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Visible = true;
                    lblMessage.Text = "Creating user account failed. Try again.\n Live Meeting System";
                }

            }
            catch (Exception)
            {
                Response.Redirect("~/GUI/ExceptionPage.aspx");
            }
               
}

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/AuthorizedDefault.aspx");
        }

        protected void Clear_Click(object sender, EventArgs e)
        {
            UserID.Text = "";
            UserName.Text = "";
            FirstName.Text = "";
            LastName.Text = "";
            Password.Text = "";
            ConfirmPassword.Text = "";
            Status.Checked = false;
        }
    }
}