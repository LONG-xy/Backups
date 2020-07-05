using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuestionList2 : System.Web.UI.Page
{
    DataClassesDataContext DC = new DataClassesDataContext();

    public string SearchContent
    {
        get
        {
            if (Session["SearchContent"] == null)
                return "";
            return Session["SearchContent"].ToString();
        }
    }

    public string SearchCatalog
    {
        get
        {
            if (Session["SearchCatalog"] == null)
                return "";
            return Session["SearchCatalog"].ToString();
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int cnt = GetDataCount();               //获得查找结果数
            if (cnt == 0)                           //如果查找结果数为0
            {
                Response.Redirect("NotSearch.aspx");//跳转到未查找到提示页面
            }
            OurPager1.RecordCount = cnt;            //设置分页控件的记录数属性
            OurPager2.RecordCount = cnt;
            LoadData(1);                            //加载查找的结果
        }
    }

    /// <summary>
    /// 获得记录总数
    /// </summary>
    /// <returns></returns>
    private int GetDataCount()
    {
        if (SearchCatalog =="")//查找所有的类别
        {
            return DC.tb_Question.Count(itm => itm.State !=2 && (itm.Title.Contains(SearchContent) || itm.Text.Contains(SearchContent)) );
        }
        else                   //查找指定的类别
        {
            return DC.tb_Question.Count(itm => itm.State !=2 && itm.CatalogCode == SearchCatalog && (itm.Title.Contains(SearchContent) || itm.Text.Contains(SearchContent)) );
        }
    }

    /// <summary>
    /// 加载GridView数据
    /// </summary>
    /// <param name="CurrentPageIndex"></param>
    private void LoadData(int CurrentPageIndex)
    {
        string redWord = string.Format("<span style='color: Red'>{0}</span>", SearchContent);

        if (SearchCatalog == "")//查找所有的类别
        {
            var query = from item in DC.tb_Question
                        where item.State != 2 && (item.Title.Contains(SearchContent) || item.Text.Contains(SearchContent))
                        select new
                        {
                            Code = item.Code,
                            CatalogCode = item.CatalogCode,
                            UserCode = item.UserCode,
                            Title = item.Title.Replace(SearchContent, redWord),
                            Text = (item.Text.Length > 200 ? item.Text.Substring(0, 200) + "..." : item.Text).ToString().Replace(SearchContent,redWord),
                            Mark = item.Mark,
                            PostDatetime = item.PostDatetime,
                            State = item.State
                        };
            DataList1.DataSource = query.Skip((CurrentPageIndex - 1) * OurPager1.PageSize).Take(OurPager1.PageSize);
        }
        else                   //查找指定的类别
        {
            var query = from item in DC.tb_Question
                        where item.CatalogCode == SearchCatalog && item.State != 2 && (item.Title.Contains(SearchContent) || item.Text.Contains(SearchContent))
                        select new
                        {
                            Code = item.Code,
                            CatalogCode = item.CatalogCode,
                            UserCode = item.UserCode,
                            Title = item.Title.Replace(SearchContent, redWord),
                            Text = (item.Text.Length > 200 ? item.Text.Substring(0, 200) + "..." : item.Text).ToString().Replace(SearchContent, redWord),
                            Mark = item.Mark,
                            PostDatetime = item.PostDatetime,
                            State = item.State
                        };
            DataList1.DataSource = query.Skip((CurrentPageIndex - 1) * OurPager1.PageSize).Take(OurPager1.PageSize);
        }
        DataList1.DataBind();
    }

    /// <summary>
    /// 分页控件页码改变事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void OurPager1_PageChanged(object sender, ServerControl.PageArgs e)
    {
        if (((ServerControl.OurPager)sender).ID == "OurPager1")//两个分页控件同步
            OurPager2.CurrentPageIndex = e.NewPageIndex;
        else
            OurPager1.CurrentPageIndex = e.NewPageIndex;
        LoadData(e.NewPageIndex);
    }
}
