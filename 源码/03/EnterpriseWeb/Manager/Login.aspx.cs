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

public partial class Manager_Login : System.Web.UI.Page
{
    UserOperate useroperate = new UserOperate();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtName.Text == string.Empty)
        {
            Response.Write("<script language=javascript>alert('登录名不能为空！')</script>");
            return;
        }
        else
        {
            DataSet ds = null;
            useroperate.Name = txtName.Text;
            useroperate.Pwd = txtPwd.Text;
            ds = useroperate.AdminLogin();
            if (ds.Tables[0].Rows.Count > 0 && txtCode.Text == Request.Cookies["CheckCode"].Value)
            {
                Session["AdminName"] = txtName.Text;
                Session["POP"] = "管理员";
                Response.Redirect("AdminManage.aspx");
            }
            else
            {
                Response.Write("<script language=javascript>alert('登录名或密码不正确！')</script>");
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtName.Text = txtPwd.Text = txtCode.Text = string.Empty;
    }
}
