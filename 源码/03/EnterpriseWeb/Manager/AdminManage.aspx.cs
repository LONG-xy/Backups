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

public partial class Manager_AdminManage : System.Web.UI.Page
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
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtName.Text == string.Empty)
        {
            Response.Write("<script language=javascript>alert('管理员名称不能为空！')</script>");
        }
        else if (txtPwd.Text == string.Empty)
        {
            Response.Write("<script language=javascript>alert('管理员密码不能为空！')</script>");
        }
        else
        {
            DataSet ds = null;
            ds = useroperate.GetAllUser("tb_User");
            useroperate.ID = dataoperate.getID("tb_User", ds);
            useroperate.Name = txtName.Text;
            useroperate.Pwd = txtPwd.Text;
            useroperate.Marker = "管理员";
            useroperate.AddUser();
            Response.Write("<script language=javascript>alert('管理员信息添加成功！')</script>");
            BindInfo();
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtName.Text = txtPwd.Text = txtSPwd.Text = string.Empty;
    }
    protected void gvUserInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvUserInfo.PageIndex = e.NewPageIndex;
        BindInfo();
    }
    protected void gvUserInfo_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvUserInfo.EditIndex = e.NewEditIndex;
        BindInfo();
    }
    protected void gvUserInfo_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        useroperate.Name = gvUserInfo.Rows[e.RowIndex].Cells[0].Text;
        useroperate.Pwd = ((TextBox)(gvUserInfo.Rows[e.RowIndex].Cells[1].Controls[0])).Text;
        useroperate.UpdateUser();
        gvUserInfo.EditIndex = -1;
        BindInfo();
    }
    protected void gvUserInfo_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvUserInfo.EditIndex = -1;
        BindInfo();
    }
    protected void gvUserInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (gvUserInfo.Rows[e.RowIndex].Cells[0].Text.ToLower() == "mr")
        {
            Response.Write("<script>alert('该用户为超级用户，不能删除')</script>");
        }
        else
        {
            useroperate.ID = gvUserInfo.DataKeys[e.RowIndex].Value.ToString();
            useroperate.DeleteUser();
        }
        BindInfo();
    }
    protected void btnQuery_Click(object sender, EventArgs e)
    {
        BindInfo();
    }
    private void BindInfo()
    {
        DataSet ds = new DataSet();
        useroperate.Marker = "管理员";
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