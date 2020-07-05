using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
/// <summary>
/// BaseClass 的摘要说明
/// </summary>
public class BaseClass
{
	public BaseClass()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public static SqlConnection DBCon()//建立连接数据库的公共方法
    {
        return new SqlConnection("server=127.0.0.1;database=db_ExamOnline;uid=sa;pwd=123456;");
    }
    //建立绑定GridView控件的方法
    public static void BindDG(GridView dg, string id, string strSql, string Tname)
    {
        SqlConnection conn = DBCon();//连接数据库
        SqlDataAdapter sda = new SqlDataAdapter(strSql, conn);//执行SQL查询语句
        DataSet ds = new DataSet();//创建数据集对象
        sda.Fill(ds, Tname);//填充数据集
        dg.DataSource = ds.Tables[Tname];//设置绑定数据源
        dg.DataKeyNames = new string[] { id };//设置绑定的主键字段
        dg.DataBind();//绑定控件
    }
    public static void OperateData(string strsql)//建立一个执行SQL语句的方法
    {
        SqlConnection conn = DBCon();//连接数据库
        conn.Open();//打开数据库
        SqlCommand cmd = new SqlCommand(strsql, conn);//指定要执行的SQL语句
        cmd.ExecuteNonQuery();//执行SQL语句
        conn.Close();//关闭连接
    }
    //================如果是学生登录=========================================
    public static bool CheckStudent(string studentNum, string studentPwd)
    {
        SqlConnection conn = DBCon();//连接数据库
        conn.Open();//打开数据库
        //根据账号和密码查询学生信息
        SqlCommand cmd = new SqlCommand("select count(*) from tb_Student where StudentNum='" + studentNum + "' and StudentPwd='" + studentPwd + "'", conn);
        int i = Convert.ToInt32(cmd.ExecuteScalar());//返回执行结果
        conn.Close();//关闭连接
        if (i > 0)//判断结果值，并返回相应的bool值
        {
            return true;
        }
        else
        {
            return false;
        }
        
    }
    //================如果是教师登录=========================================
    public static bool CheckTeacher(string teacherNum, string teacherPwd)
    {
        SqlConnection conn = DBCon();//连接数据库
        conn.Open();//打开数据库
        //根据账号和密码查询教师信息
        SqlCommand cmd = new SqlCommand("select count(*) from tb_Teacher where TeacherNum='" + teacherNum + "' and TeacherPwd='" + teacherPwd + "'", conn);
        int i = Convert.ToInt32(cmd.ExecuteScalar());//返回执行结果
        conn.Close();//关闭连接
        if (i > 0)//判断结果值，并返回相应的bool值
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    //================如果是管理员登录=========================================
    public static bool CheckAdmin(string adminNum, string adminPwd)
    {
        SqlConnection conn = DBCon();//连接数据库
        conn.Open();//打开数据库
        //根据账号和密码查询管理员信息
        SqlCommand cmd = new SqlCommand("select count(*) from tb_Admin where AdminNum='" + adminNum + "' and adminPwd='" + adminPwd + "'", conn);
        int i = Convert.ToInt32(cmd.ExecuteScalar());//返回执行结果
        conn.Close();//关闭连接
        if (i > 0)//判断结果值，并返回相应的bool值
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}
