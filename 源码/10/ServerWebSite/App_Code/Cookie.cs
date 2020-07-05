using System;
using System.Web;
using System.Web.UI;

/// <summary>
/// Cookie 的摘要说明
/// </summary>
public class Cookie
{
    /// <summary>
    /// Cookie构造函数
    /// </summary>
    public Cookie()
    {

    }

    public static void AddCookie(string name, string value, HttpContext h)
    {
        HttpCookie cookieName = new HttpCookie(name, System.Web.HttpUtility.UrlEncode(value, System.Text.Encoding.GetEncoding("GB2312")));
        h.Response.Cookies.Add(cookieName);
    }

    public static string GetCookie(HttpContext h, string name)
    {
        if (h.Request.Cookies[name] != null)
        { return System.Web.HttpUtility.UrlDecode(h.Request.Cookies[name].Value, System.Text.Encoding.GetEncoding("GB2312")); }
        else
        { return string.Empty; }
    }

    public static void RemoveCookie(string name, HttpContext h)
    {
        h.Response.Cookies.Remove(name);
    }

    public static void ClearCookie(HttpContext h)
    {
        h.Request.Cookies.Clear();
        h.Response.Cookies.Clear();
    }

    public static void ClearReaponserCookie(HttpContext h)
    {
        h.Response.Cookies.Clear();
    }

    public static void ClearRequestCookie(HttpContext h)
    {
        h.Request.Cookies.Clear();
    }
}

public struct CookieItem
{
    public const string SAVEURL = "saveUrl";
}

