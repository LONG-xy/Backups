using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Login : System.Web.UI.Page
{
    DataClassesDataContext DC = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ibtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        if (!ValidateCode1.CheckSN(txtCheckCode.Text))
        {
            lblMessage.Text = "输入验证码不正确!";
            return;
        }
        tb_UserInfo user = DC.tb_UserInfo.FirstOrDefault(itm => itm.UserName == txtUserName.Text);
        if (user == null)
        {
            lblMessage.Text = "该用户名不存在!";
        }
        else
        {
            if (txtPassword.Text != user.Password)
            {
                lblMessage.Text = "密码不正确,请重新输入";
            }
            else
            {
                ClientHelper.UserCode = user.Code;
                ClientHelper.UserName = user.UserName;
                //跳转到主页
                //FormsAuthentication.RedirectFromLoginPage(user.Code, true);
                if (Session["RedirectFrom"] != null)
                {
                    string redirectFrom = Session["RedirectFrom"].ToString();
                    Session["RedirectFrom"] = null;
                    Response.Redirect(redirectFrom);
                }
                else
                {
                    Response.Redirect("~/index.aspx");
                }
            }
        }
    }
}

