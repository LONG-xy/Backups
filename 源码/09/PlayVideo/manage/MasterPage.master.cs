using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manage_MasterPage : System.Web.UI.MasterPage
{
    protected string[] actives = new string[10];
    protected string Manage_User = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Manage_User"] != null)
        {
            Manage_User = Session["Manage_User"].ToString();
        }
        else
        {
            Response.Redirect("manage_login.aspx");
        }
        string active = Request.QueryString["active"];
        int activeValue = 0;
        int.TryParse(active, out activeValue);
        actives[activeValue] = "active";
    }
}
