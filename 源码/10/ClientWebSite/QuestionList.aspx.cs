using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class QuestionList : System.Web.UI.Page
{
    DataClassesDataContext DC = new DataClassesDataContext();

    public string CatalogCode
    {
        get
        {
            if (ViewState["CatalogCode"] == null || ViewState["CatalogCode"].ToString() == "")
                return "";
            return ViewState["CatalogCode"].ToString();
        }
        set
        {
            ViewState["CatalogCode"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["CatalogCode"] != null)
            {
                CatalogCode = Request.QueryString["CatalogCode"].ToString();
                OurPager1.RecordCount = GetDataCount();
                LoadData(1);
            }
        }
    }

    /// <summary>
    /// 获得记录总数
    /// </summary>
    /// <returns></returns>
    private int GetDataCount()
    {
        return DC.tb_Question.Count(itm => itm.CatalogCode == CatalogCode && (itm.State==0 || itm.State== null) );
    }

    /// <summary>
    /// 加载GridView数据
    /// </summary>
    /// <param name="CurrentPageIndex"></param>
    private void LoadData(int CurrentPageIndex)
    {
        //指定类别,装态是未解决
        var questionQuery = DC.tb_Question.Where(itm => itm.CatalogCode == CatalogCode && (itm.State == 0 || itm.State == null)).Skip((CurrentPageIndex - 1) * OurPager1.PageSize).Take(OurPager1.PageSize);

        var query = from item in questionQuery
                    join user in DC.tb_UserInfo
                    on item.UserCode equals user.Code
                    select new
                    {
                        Code = item.Code,
                        Title = item.Title,
                        UserCode = user.UserName,
                        Mark = item.Mark,
                        PostDatetime = item.PostDatetime,
                    };
        DataList1.DataSource = query;
        DataList1.DataBind();
    }

    /// <summary>
    /// 分页控件页码改变事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void OurPager1_PageChanged(object sender, ServerControl.PageArgs e)
    {
        lblCurrentPageIndex.Text = e.NewPageIndex.ToString();
        LoadData(e.NewPageIndex);
    }
}
