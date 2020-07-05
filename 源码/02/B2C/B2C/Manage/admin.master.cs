using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manage_admin : System.Web.UI.MasterPage
{
    protected int menuInt = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            /*判断是否登录*/
            ST_check_Login();
        }
        string menu = Request.QueryString["menu"];
        int.TryParse(menu, out menuInt);
    }
    public void ST_check_Login()
    {
        if ((Session["AName"] == null))
        {
            Response.Write("<script>alert('对不起！您不是管理员，无权限浏览此页！');location='../Default.aspx'</script>");
            Response.End();
        }
    }
}
