using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class BackGround_CheckInfo : System.Web.UI.Page
{
    string infoType = "";
    Operation operation = new Operation(); //业务类对象
    protected DataRowCollection drs = null;//绑定页面数据的全局变量
    protected void Page_Load(object sender, EventArgs e)
    {
        infoType = Request.QueryString["id"];
        string opearID = null, opearCheckState = null;
        //验证成功表示用户点击了页面上的操作按钮
        if ((opearID = Request.Form["opearID"]) != null && opearID != "")
        {
            opearCheckState = Request.Form["opearCheckState"];
            if (opearCheckState != "")//验证成功表示用户点击了“审核/取消”按钮
            {
                ChangeCheckState(int.Parse(opearID), opearCheckState);//更改审核状态
                if (infoType != null && infoType != "")
                {
                    DataBind(infoType, Convert.ToInt32(this.CurPageIndex.Text));//重新绑定页面数据
                }
            }
            else
            {
                //表示用户点击了详细信息按钮，并执行了页面跳转操作
                Response.Redirect("DetailInfo.aspx?id=" + opearID);
            }
        }
        if (!IsPostBack)
        {
            if (infoType != null && infoType != "")
            {
                DataBind(infoType, 1);//页面第一次加载绑定页面数据
            }
        }
    }
    /// <summary>
    /// 绑定供求信息到GridViev控件
    /// </summary>
    /// <param name="type">供求信息类别</param>
    private void DataBind(string type, int PageIndex)
    {
        int PageSize = 10;//定义每页数据总数
        //查询数据
        DataSet ds = operation.SelectInfo(type, PageIndex, PageSize);
        if (ds != null && ds.Tables.Count > 0)
        {
            int Count = 0;
            int.TryParse(ds.Tables[0].Rows[0][0].ToString(), out Count);//获取总数据条数
            drs = ds.Tables[1].Rows;
            //计算分页数据
            int GetTotalPageIndex = (Count / PageSize) + ((Count % PageSize) > 0 ? 1 : 0);
            this.TotalPageIndex.Text = GetTotalPageIndex.ToString();
            this.CurPageIndex.Text = PageIndex.ToString();
            if (PageIndex == 1 && PageIndex == GetTotalPageIndex)
            {
                SetPageState(0);//如果当前总页数共为1页时调用的样式
            }
            else if (PageIndex == 1)
            {
                SetPageState(1);//如果当前为第一页时调用的样式
            }
            else if (PageIndex == GetTotalPageIndex)
            {
                SetPageState(2);//如果当前为最后一页时调用的样式
            }
            else
            {
                SetPageState(3);//如果当前为除第一页和最后一页外的其他页数时调用的样式
            }
        }
    }
    protected void ChangeCheckState(int ChangeID, string CheckState)
    {
        if (CheckState == "True")
        {
            operation.UpdateInfo(ChangeID, true);//更改为取消审核状态
        }
        else
        {
            operation.UpdateInfo(ChangeID, false);//更改为已审核状态
        }
    }
    /// <summary>
    /// 上一页处理方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void UpPage_Click(object sender, EventArgs e)
    {
        //取出当前页码
        int CurIndex = Convert.ToInt32(this.CurPageIndex.Text);
        CurIndex--;//将当前页码减1
        DataBind(infoType, CurIndex);//绑定数据
    }
    /// <summary>
    /// 下一页处理方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void DownPage_Click(object sender, EventArgs e)
    {
        //取出当前页码
        int CurIndex = Convert.ToInt32(this.CurPageIndex.Text);
        CurIndex++;//将当前页码加1
        DataBind(infoType, CurIndex);//绑定数据
    }

    /// <summary>
    /// 设置分页样式
    /// </summary>
    /// <param name="SetIndex"></param>
    public void SetPageState(int SetIndex)
    {
        //根据不同的页码设置不同的样式
        if (SetIndex == 0)
        {
            this.UpPage.Enabled = false;
            this.DownPage.Enabled = false;
            this.UpPage.Style["color"] = "#808080";
            this.DownPage.Style["color"] = "#808080";
        }
        else if (SetIndex == 1)
        {
            this.UpPage.Enabled = false;
            this.DownPage.Enabled = true;
            this.UpPage.Style["color"] = "#808080";
            this.DownPage.Style["color"] = "#23527c";
        }
        else if (SetIndex == 2)
        {
            this.UpPage.Enabled = true;
            this.DownPage.Enabled = false;
            this.UpPage.Style["color"] = "#23527c";
            this.DownPage.Style["color"] = "#808080";
        }
        else
        {
            this.UpPage.Enabled = true;
            this.DownPage.Enabled = true;
            this.UpPage.Style["color"] = "#23527c";
            this.DownPage.Style["color"] = "#23527c";
        }
    }
}
