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

public partial class User_InResult : System.Web.UI.Page
{
    UserOperate useroperate = new UserOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "企业门户网——找回密码第二步";
        if (!IsPostBack)
        {
            if (Session["FindName"] == null)
            {
                Response.Write("<script language=javascript>alert('请返回上一步输入您要查找的用户！')</script>");
                Response.Redirect("InName.aspx");
            }
            else
            {
                DataSet ds = null;
                useroperate.Name = Session["FindName"].ToString();
                ds = useroperate.FindUserByName("tb_User");
                txtQuestion.Text = ds.Tables[0].Rows[0][3].ToString();
            }
        }
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        DataSet ds = null;
        useroperate.Name = Session["FindName"].ToString();
        useroperate.Question = txtQuestion.Text;
        ds = useroperate.FindResult("tb_User");
        if (txtResult.Text == ds.Tables[0].Rows[0][0].ToString())
        {
            Response.Redirect("GetPwd.aspx");
        }
        else
        {
            Response.Write("<script language=javascript>alert('输入的密保答案不正确！')</script>");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtResult.Text = "";
    }
}
