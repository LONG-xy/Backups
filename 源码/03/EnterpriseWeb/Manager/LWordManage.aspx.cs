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

public partial class Manager_LWordManage : System.Web.UI.Page
{
    DataOperate dataoperate=new DataOperate();
    LeaveWordOperate leavewordoperate=new LeaveWordOperate();
    RevertOperate revertoperate = new RevertOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindInfo();
        }
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        BindInfo();
    }
    protected void gvLWordInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvLWordInfo.PageIndex = e.NewPageIndex;
        BindInfo();
    }
    protected void gvLWordInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        leavewordoperate.ID = gvLWordInfo.DataKeys[e.RowIndex].Value.ToString();
        leavewordoperate.DeleteLeaveWord();
        revertoperate.LeaveID = gvLWordInfo.DataKeys[e.RowIndex].Value.ToString();
        revertoperate.DeleteRevertByLID();
        BindInfo();
    }
    protected void gvLWordInfo_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            Response.Redirect("LWordInfo.aspx?LWordID=" + gvLWordInfo.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text + "");
        }
    }
    public void BindInfo()
    {
        DataSet ds = null;
        if (txtName.Text == string.Empty)
        {
            ds = leavewordoperate.GetAllLeaveWord("tb_LeaveWord");
            
        }
        else
        {
            leavewordoperate.Title = txtName.Text;
            ds = leavewordoperate.FindLeaveWordByTitle("tb_LeaveWord");
        }
        gvLWordInfo.DataSource = ds;
        gvLWordInfo.DataKeyNames = new string[] { "ID" };
        gvLWordInfo.DataBind();
        if (ds.Tables[0].Rows.Count > 0)
        {
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                gvLWordInfo.Rows[i].Cells[1].Text = dataoperate.SubStr(ds.Tables[0].Rows[i][1].ToString(), 8);
                gvLWordInfo.Rows[i].Cells[2].Text = Convert.ToDateTime(ds.Tables[0].Rows[i][3].ToString()).ToLongDateString();
            }
        }
    }
}
