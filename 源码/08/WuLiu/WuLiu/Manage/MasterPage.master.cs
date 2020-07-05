using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_MasterPage : System.Web.UI.MasterPage
{
    protected string open1, open2, open3;
    protected void Page_Load(object sender, EventArgs e)
    {
        open1 = Request.QueryString["open1"];
        open2 = Request.QueryString["open2"];
        open3 = Request.QueryString["open3"];
    }
}
