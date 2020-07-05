using Bll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class PwdEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //验证邮箱
            string code = Request.QueryString["code"];
            
            //用户名
            string un = Request.QueryString["un"];
            Session["userName"] = un;

            show_userBll bll = new show_userBll();

            string tag = bll.jHUserCheck(un, code);

            if (tag == "-1")
            {
                Response.Write("为没有此用户");
                respwd.InnerHtml = "";
            }
            else if (tag == "-2")
            {
                Response.Write("为验证码不正确");
                respwd.InnerHtml = "";
            }
        }
    }
}