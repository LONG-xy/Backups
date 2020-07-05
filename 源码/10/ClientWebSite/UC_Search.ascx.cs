using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UC_Search : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["SearchContent"] != null)
            {
                txtSearch.Text = Session["SearchContent"].ToString();
            }
        }
    }
    protected void ibtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        if (txtSearch.Text.Trim() != "")
        {
            Session["SearchContent"] = txtSearch.Text;  //搜索关键字
            Session["SearchCatalog"] = hidCatalog.Value;//搜索类别
            Response.Redirect("QuestionList2.aspx");    //页面跳转到搜索问题列表页面
        }
    }
}
