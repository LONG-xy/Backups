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

public partial class Common_HotNews : System.Web.UI.UserControl
{
    NewsOperate newsoperate = new NewsOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = null;
            newsoperate.Type = "新闻";
            ds = newsoperate.FindTopNewsByType(5, "tb_News");
            if (ds.Tables[0].Rows.Count > 0)
            {
                dlHotNews.DataSource = ds;
                dlHotNews.DataKeyField = "ID";
                dlHotNews.DataBind();
            }
        }
    }
}
