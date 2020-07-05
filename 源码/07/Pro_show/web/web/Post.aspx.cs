using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Bll;

public partial class Post : System.Web.UI.Page
{
    public static string PostUrl = ConfigurationManager.AppSettings["WebReference.Service.PostUrl"];
    protected void Page_Load(object sender, EventArgs e)
    {
        string account = "cf_mrkj";
        string password = "mrsoft";//密码可以使用明文密码或使用32位MD5加密
        string mobile = Request.QueryString["mobile"];
        Random rad = new Random();
        int mobile_code = rad.Next(100000, 1000000);
        string content = "您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。";
        string postStrTpl = "account={0}&password={1}&mobile={2}&content={3}";
        UTF8Encoding encoding = new UTF8Encoding();
        byte[] postData = encoding.GetBytes(string.Format(postStrTpl, account, password, mobile, content));
        HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create(PostUrl);
        myRequest.Method = "POST";
        myRequest.ContentType = "application/x-www-form-urlencoded";
        myRequest.ContentLength = postData.Length;
        Stream newStream = myRequest.GetRequestStream();
        newStream.Write(postData, 0, postData.Length);
        newStream.Flush();
        newStream.Close();

        HttpWebResponse myResponse = (HttpWebResponse)myRequest.GetResponse();
        if (myResponse.StatusCode == HttpStatusCode.OK)
        {
            //将code插入到数据库中
            show_userBll bll = new show_userBll();
            bll.AddCode(mobile, mobile_code.ToString());


            StreamReader reader = new StreamReader(myResponse.GetResponseStream(), Encoding.UTF8);
            string res = reader.ReadToEnd();
            int len1 = res.IndexOf("</code>");
            int len2 = res.IndexOf("<code>");
            string code = res.Substring((len2 + 6), (len1 - len2 - 6));
            int len3 = res.IndexOf("</msg>");
            int len4 = res.IndexOf("<msg>");
            string msg = res.Substring((len4 + 5), (len3 - len4 - 5));
            Response.Write(mobile_code);
            Response.End();
        }
        else
        {
            //访问失败
        }

    }
}
