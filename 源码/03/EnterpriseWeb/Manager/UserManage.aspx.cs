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

public partial class Manager_UserManage : System.Web.UI.Page
{
    DataOperate dataoperate = new DataOperate();
    UserOperate useroperate = new UserOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindInfo();
        }
    }
    protected void gvUserInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvUserInfo.PageIndex = e.NewPageIndex;
        BindInfo();
    }
    protected void gvUserInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        useroperate.ID = gvUserInfo.DataKeys[e.RowIndex].Value.ToString();
        useroperate.DeleteUser();
        BindInfo();
    }
    protected void gvUserInfo_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            Response.Redirect("UserInfo.aspx?UserName=" + gvUserInfo.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text + "");
        }
    }
    protected void btnQuery_Click(object sender, EventArgs e)
    {
        BindInfo();
    }
    private void BindInfo()
    {
        DataSet ds = new DataSet();
        useroperate.Marker = "用户";
        if (txtCondition.Text == "")
        {
            ds = useroperate.FindUserByMarker("tb_User");
        }
        else
        {
            useroperate.Name = txtCondition.Text;
            ds = useroperate.FindUserByName("tb_User");
        }
        gvUserInfo.DataSource = ds;
        gvUserInfo.DataKeyNames = new string[] { "ID" };
        gvUserInfo.DataBind();
    }
}
