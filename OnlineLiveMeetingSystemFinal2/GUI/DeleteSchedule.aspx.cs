﻿using OnlineLiveMeetingSystemFinal2.GUI.SisWeb;
using OnlineLiveMeetingSystemFinal2BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineLiveMeetingSystemFinal2.ManageSchedule
{
    public partial class DeleteSchedule : System.Web.UI.Page
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

       
    }
}