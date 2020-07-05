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

public partial class User_CallBoardAndNews : System.Web.UI.Page
{
    DataOperate dataoperate = new DataOperate();
    NewsOperate newsoperate = new NewsOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bind();
        }
    }
    protected void lbtnOne_Click(object sender, EventArgs e)
    {
        labPage.Text = "1";
        Bind();
    }
    protected void lbtnUp_Click(object sender, EventArgs e)
    {
        labPage.Text = Convert.ToString(Convert.ToInt32(labPage.Text) - 1);
        Bind();
    }
    protected void lbtnNext_Click(object sender, EventArgs e)
    {
        labPage.Text = Convert.ToString(Convert.ToInt32(labPage.Text) + 1);
        Bind();
    }
    protected void lbtnBack_Click(object sender, EventArgs e)
    {
        labPage.Text = labBackPage.Text;
        Bind();
    }
    public void Bind()
    {
        DataSet ds = null;
        if (Int32.Parse(Request["CBID"]) == 0)
        {
            this.Title = "企业门户网——公司公告信息";
            labPageTitle.Text = "公司公告";
            newsoperate.Type = "公告";
        }
        else if (Int32.Parse(Request["CBID"]) == 1)
        {
            this.Title = "企业门户网——焦点新闻信息";
            labPageTitle.Text = "焦点新闻";
            newsoperate.Type = "新闻";
        }
        ds = newsoperate.FindNewsByType("tb_News");
        dataoperate.dlBind(15, ds, labPage, labBackPage, lbtnUp, lbtnNext, lbtnBack, lbtnOne, dlCallBoard);
    }
}
