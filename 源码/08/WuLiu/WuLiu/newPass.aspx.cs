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

public partial class newPass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string name = Session["UserName"].ToString();
        string userType = Session["UserType"].ToString();
        string sql = "";
        if (userType == "gr")
        {
            sql = "update tb_grUser set Pass='" + txtNewPass.Text + "'where Name='" + name + "'";
        }
        else if (userType == "qy")
        {
            sql = "update tb_User set UserPass='" + txtNewPass.Text + "' where UserName='" + name + "'";
        }
        if (dataOperate.execSQL(sql))
        {
            RegisterStartupScript("true", "<script>alert('修改成功！')</script>");
        }
        else
        {
            RegisterStartupScript("false", "<script>alert('修改失败！')</script>");
        }

    }
}
