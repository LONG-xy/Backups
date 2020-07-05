using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Xml.Linq;

public partial class Themes_MasterPage : System.Web.UI.MasterPage
{
    protected string _prototype = string.Empty;
    protected string _lightbox = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        _prototype = Page.ResolveClientUrl("~/Themes/Js/prototype.js");
        _lightbox = Page.ResolveClientUrl("~/Themes/Js/lightbox.js");

        tvNavigation.DataBind();

        string url = "~" + Request.CurrentExecutionFilePath.Substring(Request.CurrentExecutionFilePath.TrimStart('/').IndexOf('/') + 1);
        TreeNode node = GetSubNode(tvNavigation.Nodes[0], url);

        if (node == null)
        {
            node = GetSubNode(tvNavigation.Nodes[0], Cookie.GetCookie(HttpContext.Current, CookieItem.SAVEURL));
        }
        else
        {
            Cookie.AddCookie(CookieItem.SAVEURL, url, HttpContext.Current);
        }

        if (node != null)
        {
            node.Selected = true;
            litNavigation.Text = node.Text;
        }
    }

    private TreeNode GetSubNode(TreeNode node, string url)
    {
        if (node == null || String.IsNullOrEmpty(url))
            return null;

        if (node.NavigateUrl.ToLower() == url.ToLower())
            return node;

        TreeNode treeNode = null;
        if (node.ChildNodes.Count > 0)
        {
            foreach (TreeNode nod in node.ChildNodes)
            {
                treeNode = GetSubNode(nod, url);
                if (treeNode != null)
                    break;
            }
        }
        return treeNode;
    }

    protected void menuTemplate_MenuItemClick(object sender, MenuEventArgs e)
    {
        //取存放主题的xml文件路径
        string xmlFilePath = Server.MapPath("~/Themes/Xml/CustomConfig.xml");
        XElement xe = XElement.Load(xmlFilePath);   //加载xml文件
        //取xml中元素名称等于ThemeName的元素集合
        IEnumerable<XElement> element = from item in xe.Descendants("ThemeName")
                                        select item;
        if (element.Count() > 0)
        {
            XElement first = element.First();   //取元素集合的第一个元素
            first.SetValue(menuTemplate.SelectedValue); //将元素值设置为要更改的主题名称
        }
        xe.Save(xmlFilePath);   //保存xml文件
        Response.Redirect(Request.Path);    //刷新页面，应用主题
    }
}
