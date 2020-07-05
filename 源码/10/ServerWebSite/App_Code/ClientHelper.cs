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
    /// 获得提问状态
    /// </summary>
    /// <param name="state"></param>
    /// <returns></returns>
    public static string GetQuestionState(int state)
    {
        string resu = "";
        switch (state)
        {
            case 0:
                resu = "未解决";
                break;
            case 1:
                resu = "已解决";
                break;
            case 2:
                resu = "已关闭";
                break;
        }
        return resu;
    }

}
