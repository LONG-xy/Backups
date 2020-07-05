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

public partial class Manager_LWordInfo : System.Web.UI.Page
{
    DataOperate dataoperate = new DataOperate();
    LeaveWordOperate leavewordoperate = new LeaveWordOperate();
    RevertOperate revertoperate = new RevertOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        FreeTextBox1.FontFacesMenuList = dataoperate.strFont();
        if (!IsPostBack)
        {
            DataSet ds = null;
            leavewordoperate.ID = Request["LWordID"].ToString();
            ds = leavewordoperate.FindLeaveWordByID("tb_LeaveWord");
            labTitle.Text = ds.Tables[0].Rows[0][1].ToString();
            labHost.Text = ds.Tables[0].Rows[0][2].ToString();
            labTime.Text = ds.Tables[0].Rows[0][3].ToString();
            labContent.Text = ds.Tables[0].Rows[0][4].ToString();
            Bind();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (FreeTextBox1.Text == "")
        {
            Response.Write("<script language=javascript>alert('回复内容不能为空！')</script>");
        }
        else
        {
            DataSet ds = null;
            ds = revertoperate.GetAllRevert("tb_Revert");
            revertoperate.ID = dataoperate.getID("tb_Revert", ds);
            revertoperate.LeaveID = Request["LWordID"].ToString();
            revertoperate.RevertUser = Session["AdminName"].ToString();
            revertoperate.Content = FreeTextBox1.Text;
            revertoperate.AddRevert();
            FreeTextBox1.Text = string.Empty;
            Bind();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        FreeTextBox1.Text = string.Empty;
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
    protected void dlRevertInfo_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string revertid = dlRevertInfo.DataKeys[e.Item.ItemIndex].ToString(); //获取当前DataList控件列
        deleteInfo(revertid);
    }
    private void Bind()
    {
        DataSet ds = null;
        revertoperate.LeaveID = Request["LWordID"].ToString();
        ds = revertoperate.FindRevertByLID("tb_Revert");
        dataoperate.dlBind(8, ds, labPage, labBackPage, lbtnUp, lbtnNext, lbtnBack, lbtnOne, dlRevertInfo);
    }
    private void deleteInfo(string revertid)
    {
        revertoperate.ID = revertid;
        revertoperate.DeleteRevert();
        Response.Write("<script>alert('回复信息--删除成功')</script>");
        Bind();
    }
}
