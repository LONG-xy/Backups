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

public partial class User_InName : System.Web.UI.Page
{
    UserOperate useroperate = new UserOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "企业门户网——找回密码第一步";
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (txtName.Text == string.Empty)
        {
            Response.Write("<script language=javascript>alert('用户名不能为空！')</script>");
        }
        else
        {
            useroperate.Name = txtName.Text;
            DataSet ds = useroperate.FindUserByName("tb_User");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["FindName"] = txtName.Text;
                Response.Redirect("InResult.aspx");
            }
            else
                Response.Write("<script language=javascript>alert('该用户不存在，请重新输入！')</script>");
        }
    }
}
