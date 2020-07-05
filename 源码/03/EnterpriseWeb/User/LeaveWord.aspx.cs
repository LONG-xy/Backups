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

public partial class User_LeaveWord : System.Web.UI.Page
{
    DataOperate dataoperate = new DataOperate();
    LeaveWordOperate leavewordoperate = new LeaveWordOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "企业门户网——留言簿";
        FreeTextBox1.FontFacesMenuList = dataoperate.strFont();
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
        ds = leavewordoperate.GetAllLeaveWord("tb_LeaveWord");
        dataoperate.dlBind(15, ds, labPage, labBackPage, lbtnUp, lbtnNext, lbtnBack, lbtnOne, dlLeaveWord);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtTitle.Text == "" || FreeTextBox1.Text == "")
        {
            Response.Write("<script language=javascript>alert('留言主题或内容不能为空！')</script>");
        }
        else
        {
            DataSet ds = null;
            ds = leavewordoperate.GetAllLeaveWord("tb_LeaveWord");
            leavewordoperate.ID = dataoperate.getID("tb_LeaveWord", ds);
            if (Request["Name"] != null)
            {
                leavewordoperate.Host = Request["Name"].ToString();
            }
            else
            {
                leavewordoperate.Host = "匿名";
            }
            leavewordoperate.Title = txtTitle.Text;
            leavewordoperate.Content = FreeTextBox1.Text;
            leavewordoperate.AddLeaveWord();
            txtTitle.Text = FreeTextBox1.Text = String.Empty;
        }
        Bind();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtTitle.Text = FreeTextBox1.Text = String.Empty;
    }
}
