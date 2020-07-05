using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
///ClientHelper 的摘要说明
/// </summary>
public class ClientHelper
{
    public ClientHelper()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }

    /// <summary>
    /// 生成唯一键Code
    /// </summary>
    /// <returns></returns>
    public static string BuildCode()
    {
        return Guid.NewGuid().ToString();
    }

    /// <summary>
    /// 用户代码
    /// </summary>
    public static string UserCode
    {
        get
        {
            if (HttpContext.Current.Session["UserCode"] == null)
                return "";
            return HttpContext.Current.Session["UserCode"].ToString();
        }
        set
        {
            HttpContext.Current.Session["UserCode"] = value;
        }
    }

    /// <summary>
    /// 用户名称
    /// </summary>
    public static string UserName
    {
        get
        {
            if (HttpContext.Current.Session["UserName"] == null)
                return "";
            return HttpContext.Current.Session["UserName"].ToString();
        }
        set
        {
            HttpContext.Current.Session["UserName"] = value;
        }
    }

    public static DateTime ServerDate
    {
        get
        {
            return DateTime.Now;
        }
    }



}
