using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    //获取公告标题
    public string title;
    //获取公告内容
    public string content;
    //获取公告发布时间
    public string issuanceDate;
    protected void Page_Load(object sender, EventArgs e)
    {
        bindBulletin();     //调用自定义方法显示公告信息!
    }
    //绑定公告内容！！
    protected void bindBulletin()
    {
        //设置SQL语句查询公告信息
        string sqlSel = "select * from bulletin where id=1";
        //调用公共类中方法getRow并接收返回的SqlDataReader对象
        SqlDataReader sdr = operateData.getRow(sqlSel);
        sdr.Read();
        //获取公告标题
        title = sdr["title"].ToString();
        //获取公告内容
        content = sdr["content"].ToString();
        //获取公告发布日期
        issuanceDate = Convert.ToDateTime(sdr["issuanceDate"]).ToShortDateString();
        sdr.Close();
    }
    protected void imgBtnEntry_Click(object sender, EventArgs e)
    {
        //判断用户是否登录
        if (Session["userName"] != "")
        {
            Session["userName"] = null;
        }
        //获取登录名
        string userName = txtUserName.Text;
        //获取密码
        string pass = txtUserPass.Text;
        //编写SQL语句，查询用户名和密码是否正确
        string sqlSel = "select * from userRegister where username=@name and userPass=@pass";
        //调用自定义方法执行SQL语句
        if (operateData.login(sqlSel, userName, pass))
        {
            //保存用户名
            Session["userName"] = userName;
            //编写SQL语句，指定用户的信息
            string sql = "select * from userRegister where userName='" + Session["userName"] + "'";
            //调用公共类中的getRow方法执行SQL语句，并接收SqlDataReader对象
            SqlDataReader sdr = operateData.getRow(sql);
            //读取一条记录
            sdr.Read();
            //判断当前用户是否锁定
            if (Convert.ToBoolean(sdr["lock"]))
            {
                //如锁定Session设置为空，并给出提示
                Session["userName"] = null;

                Page.ClientScript.RegisterStartupScript(this.GetType(), "jsalert", "alert('" + sdr["lockCause"].ToString() + "');", true);

            }
            else
            {
                //Response.Redirect("index.aspx");
            }
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "jsalert", "alert('登录成功！');location='';", true);
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "jsalert", "alert('用户名或密码错误！')", true);
        }

        txtUserName.Text = txtUserPass.Text = "";
    }
    protected void LinkBtnLogout_Click(object sender, EventArgs e)
    {
        Session["userName"] = null;
        Response.Redirect("~/index.aspx");
    }
}
