﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class main : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["conectado"] == null)
            Response.Redirect("login.aspx");
    }
    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session["conectado"] = null;
        Response.Redirect("~/login.aspx");
    }
}
