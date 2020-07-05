using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class WebUserControl : System.Web.UI.UserControl
{
    protected string[] actives = new string[10];
    protected void Page_Load(object sender, EventArgs e)
    {
        string active = Request.QueryString["active"];
        int activeValue = 0;
        int.TryParse(active, out activeValue);
        actives[activeValue] = "active";
    }
}
