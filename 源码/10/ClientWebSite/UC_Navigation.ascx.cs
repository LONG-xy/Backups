using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Navigation : System.Web.UI.UserControl
{
    public string UserName
    {
        get
        {
            return ClientHelper.UserName;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}
