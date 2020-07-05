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

public partial class MasterPage_MainMasterPage : System.Web.UI.MasterPage
{
    OperatorClass operatorclass = new OperatorClass();
    AdminManage adminmanage = new AdminManage();
    PurviewManage purviewmanage = new PurviewManage();
    //定义各权限标记变量
    protected bool IsReader = false;
    protected bool sysset = true;
    protected bool readset = true;
    protected bool bookset = true;
    protected bool borrowback = true;
    protected bool sysquery = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        string CurrName = null;
        if (Session["Name"] == null || (CurrName = Session["Name"].ToString()) == "")
        {
            Response.Redirect("/Login.aspx");//返回登录页
            return;
        }
        if (Session["role"] != null && Session["role"].ToString() == "Reader")
        {
            IsReader = true;//标记为读者
        }
        else
        {
            //设置首页显示信息
            labDate.Text = DateTime.Now.Year + "年" + DateTime.Now.Month + "月" + DateTime.Now.Day + "日";
            labXQ.Text = operatorclass.getWeek();
            labAdmin.Text = CurrName;
            adminmanage.Name = CurrName;
            //获取用户信息及权限
            DataSet adminds = adminmanage.GetAllAdminByName(adminmanage, "tb_admin");
            string strAdminID = adminds.Tables[0].Rows[0][0].ToString();
            purviewmanage.ID = strAdminID;
            DataSet pviewds = purviewmanage.FindPurviewByID(purviewmanage, "tb_purview");
            //标记响应的权限
            sysset = Convert.ToBoolean(pviewds.Tables[0].Rows[0][1].ToString());
            readset = Convert.ToBoolean(pviewds.Tables[0].Rows[0][2].ToString());
            bookset = Convert.ToBoolean(pviewds.Tables[0].Rows[0][3].ToString());
            borrowback = Convert.ToBoolean(pviewds.Tables[0].Rows[0][4].ToString());
            sysquery = Convert.ToBoolean(pviewds.Tables[0].Rows[0][5].ToString());
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Remove("Name");
        Session.Remove("readid");
        Session.Remove("role");
        Response.Redirect("/Login.aspx");
    }
}
