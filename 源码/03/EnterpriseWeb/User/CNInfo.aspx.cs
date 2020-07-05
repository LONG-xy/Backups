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

public partial class User_CNInfo : System.Web.UI.Page
{
    NewsOperate newsoperate = new NewsOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = null;
            if (Request["CBoardID"] != null)
            {
                this.Title = "企业门户网——公告详细信息";
                newsoperate.ID = Request["CBoardID"].ToString();
            }
            if (Request["NewsID"] != null)
            {
                this.Title = "企业门户网——新闻详细信息";
                newsoperate.ID = Request["NewsID"].ToString();
            }
            ds = newsoperate.FindNewsByID("tb_News");
            labTitle.Text = ds.Tables[0].Rows[0][1].ToString();
            labDate.Text="日  期："+ds.Tables[0].Rows[0][3].ToString();
            labContent.Text = ds.Tables[0].Rows[0][2].ToString();
        }
    }
}
