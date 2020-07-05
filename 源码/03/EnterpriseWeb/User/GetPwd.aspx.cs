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

public partial class User_GetPwd : System.Web.UI.Page
{
    UserOperate useroperate = new UserOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "企业门户网——找到密码";
        if (Session["FindName"] != null)
        {
            labName.Text = Session["FindName"].ToString();
            DataSet ds = null;
            useroperate.Name = labName.Text;
            ds = useroperate.FindUserByName("tb_User");
            labPwd.Text = ds.Tables[0].Rows[0][2].ToString();
        }
    }
}
