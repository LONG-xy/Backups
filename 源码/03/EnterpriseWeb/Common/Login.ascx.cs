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

public partial class Common_Login : System.Web.UI.UserControl
{
    DataOperate dataoperate = new DataOperate();
    UserOperate useroperate = new UserOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Name"] != null)
            {
                Panel1.Visible = false;
                Panel2.Visible = true;
            }
        }
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/User/RegPro.aspx");
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtName.Text == string.Empty)
        {
            Response.Write("<script language=javascript>alert('用户名不能为空！')</script>");
            return;
        }
        else
        {
            DataSet ds = null;
            useroperate.Name = txtName.Text;
            useroperate.Pwd = txtPwd.Text;
            ds = useroperate.UserLogin();
            if (ds.Tables[0].Rows.Count > 0 && txtCode.Text == Request.Cookies["CheckCode"].Value)
            {
                Session["Name"] = txtName.Text;
                labName.Text = Session["Name"].ToString();
                Panel1.Visible = false;
                Panel2.Visible = true;
            }
            else
            {
                Response.Write("<script language=javascript>alert('用户名或密码不正确！')</script>");
            }
        }
    }
    protected void lbtnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/User/Register.aspx?mark=1");
    }
    protected void lbtnCancel_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
        FormsAuthentication.SignOut();//清除验证信息
        HttpContext.Current.Session.Clear();//清除Session内容
        HttpContext.Current.Session.Abandon();//取消当前会话
        Session["Name"] = null;
    }
}
