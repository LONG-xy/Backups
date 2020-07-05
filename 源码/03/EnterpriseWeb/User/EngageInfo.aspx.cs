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

public partial class User_EngageInfo : System.Web.UI.Page
{
    DataOperate dataoperate = new DataOperate();
    EngageOperate engageoperate = new EngageOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.Title = "企业门户网——招聘信息";
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
        ds = engageoperate.GetAllEngage("tb_Engage");
        dataoperate.dlBind(2, ds, labPage, labBackPage, lbtnUp, lbtnNext, lbtnBack, lbtnOne, dlInfo);
    }
}
