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

public partial class UserAdd : System.Web.UI.Page
{
    DataClassesDataContext DC = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        int len = txtUserName.Text.Trim().Length;
        if (len >= 2 && len <= 15)
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }

    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        int len = txtPassword.Text.Trim().Length;
        if (len >= 6 && len <= 15)
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }

    protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
    {
        int cnt = DC.tb_UserInfo.Count(itm => itm.UserName == txtUserName.Text);
        if (cnt <= 0)
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }

    protected void ibtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        if (!ValidateCode1.CheckSN(txtCheckCode.Text))
        {
            lblMessage.Text = "输入验证码不正确!";
            return;
        }
        if (Page.IsValid)
        {
            tb_UserInfo user = new tb_UserInfo();
            user.Code = ClientHelper.BuildCode();
            user.UserName = txtUserName.Text;
            user.Password = txtPassword.Text;
            user.Sex = ddlSex.SelectedValue;
            user.Email = txtEmail.Text;
            user.AAcceptCount = 0;
            user.ACount = 0;
            user.Mark = 0;
            user.PaidMark = 0;
            user.QCancelledCount = 0;
            user.QSolvedCount = 0;
            user.QUnsolveCount = 0;
            user.RewardMark = 0;
            string defMark = ConfigurationManager.AppSettings["DefaultMark"].ToString();
            if (!string.IsNullOrEmpty(defMark))
            {
                user.Mark = Convert.ToInt32(defMark);
            }
            DC.tb_UserInfo.InsertOnSubmit(user);
            DC.SubmitChanges();
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtPassword2.Text = "";
            ddlSex.SelectedIndex = 0;
            txtEmail.Text = "";
            txtCheckCode.Text = "";

            lblMessage.Text = "";
            Response.Write("<Script>window.alert('注册用户成功!')</Script>");
            Server.Transfer("~/Login.aspx");


        }
    }
}
