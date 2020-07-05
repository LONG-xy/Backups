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

public partial class Common_Link : System.Web.UI.UserControl
{
    LinkOperate linkoperate = new LinkOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = null;
            ds = linkoperate.GetAllLink("tb_Link");
            if (ds.Tables[0].Rows.Count > 0)
            {
                dlLinkInfo.DataSource = ds;
                dlLinkInfo.DataKeyField = "ID";
                dlLinkInfo.DataBind();
            }
        }
    }
}
