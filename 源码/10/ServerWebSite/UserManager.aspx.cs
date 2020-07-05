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

public partial class UserManager : System.Web.UI.Page
{

    DataClassesDataContext DC = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        OurPager1.RecordCount = GetDataCount();
        LoadData(1);
    }

    /// <summary>
    /// 获得记录总数
    /// </summary>
    /// <returns></returns>
    private int GetDataCount()
    {
        if (txtUserName.Text.Trim() == "")
        {
            return DC.tb_UserInfo.Count();
        }
        else
        {
            return DC.tb_UserInfo.Count(itm => itm.UserName.Contains(txtUserName.Text.Trim()));
        }
    }

    /// <summary>
    /// 加载GridView数据
    /// </summary>
    /// <param name="CurrentPageIndex"></param>
    private void LoadData(int CurrentPageIndex)
    {
        if (txtUserName.Text.Trim() == "")
        {
            var query = from item in DC.tb_UserInfo
                        select new 
                        {
                            Code = item.Code ,
                            UserName = item.UserName ,
                            Sex = item.Sex ,
                            Email = item.Email ,
                            Mark = item.Mark ,
                            ACount = item.ACount,
                            AAcceptCount = item.AAcceptCount
                        };
            GridView1.DataSource = query.Skip((CurrentPageIndex - 1) * OurPager1.PageSize).Take(OurPager1.PageSize);
            GridView1.DataBind();
        }
        else
        {
            var query = from item in DC.tb_UserInfo
                        where item.UserName.Contains(txtUserName.Text.Trim())
                        select new
                        {
                            Code = item.Code,
                            UserName = item.UserName,
                            Sex = item.Sex,
                            Email = item.Email,
                            Mark = item.Mark,
                            ACount = item.ACount,
                            AAcceptCount = item.AAcceptCount
                        };
            GridView1.DataSource = query.Skip((CurrentPageIndex - 1) * OurPager1.PageSize).Take(OurPager1.PageSize);
            GridView1.DataBind();
        }
    }

    /// <summary>
    /// 分页控件页码改变事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void OurPager1_PageChanged(object sender, ServerControl.PageArgs e)
    {
        LoadData(e.NewPageIndex);
    }

    /// <summary>
    /// 查询按钮单击事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        OurPager1.RecordCount = GetDataCount();
        LoadData(1);
    }

}
