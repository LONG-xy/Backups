using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminName"] == null || Session["AdminName"].ToString() == "")
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Session.Remove("AdminName");
        Session.Remove("POP");
        Response.Redirect("Login.aspx");
    }
}
