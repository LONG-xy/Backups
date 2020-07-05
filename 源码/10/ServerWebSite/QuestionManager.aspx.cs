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

public partial class QuestionManager : System.Web.UI.Page
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
        if (txtTitle.Text.Trim() == "")
        {
            return DC.tb_Question.Count();
        }
        else
        {
            return DC.tb_Question.Count(itm => itm.Title.Contains(txtTitle.Text.Trim()));
        }
    }

    /// <summary>
    /// 加载GridView数据
    /// </summary>
    /// <param name="CurrentPageIndex"></param>
    private void LoadData(int CurrentPageIndex)
    {
        if (txtTitle.Text.Trim() == "")
        {
            var questionQuery = DC.tb_Question.Skip((CurrentPageIndex - 1) * OurPager1.PageSize).Take(OurPager1.PageSize);
            var query = from item in questionQuery
                        join catalog in DC.tb_Catalog
                        on item.CatalogCode equals catalog.Code
                        join user in DC.tb_UserInfo
                        on item.UserCode equals user.Code
                        select new
                        {
                            Code = item.Code,
                            CatalogCode = catalog.Name,
                            UserCode = user.UserName,
                            Title = item.Title,
                            Text = item.Text,
                            Mark = item.Mark,
                            PostDatetime = item.PostDatetime,
                            State = ClientHelper.GetQuestionState(item.State??0)
                        };
            GridView1.DataSource = query;
            GridView1.DataBind();
        }
        else
        {
            var questionQuery = DC.tb_Question.Where(itm => itm.Title.Contains(txtTitle.Text.Trim())).Skip((CurrentPageIndex - 1) * OurPager1.PageSize).Take(OurPager1.PageSize);
            var query = from item in questionQuery
                        join catalog in DC.tb_Catalog
                        on item.CatalogCode equals catalog.Code
                        join user in DC.tb_UserInfo
                        on item.UserCode equals user.Code
                        select new
                        {
                            Code = item.Code,
                            CatalogCode = catalog.Name,
                            UserCode = user.UserName,
                            Title = item.Title,
                            Text = item.Text,
                            Mark = item.Mark,
                            PostDatetime = item.PostDatetime,
                            State = ClientHelper.GetQuestionState(item.State??0)
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

    /// <summary>
    /// GridView行命令事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Del")
        {
            int index = Convert.ToInt32(e.CommandArgument); //取GridView行索引
            GridView grid = (GridView)e.CommandSource;  //取当前操作的GridView
            string code = grid.DataKeys[index].Value.ToString();   //取GridView主键值
            //删除提问表的当前记录,回答表的相关记录
            var questionRec = DC.tb_Question.FirstOrDefault(itm => itm.Code == code);
            if (questionRec != null)
            {
                var answerRecs = DC.tb_Answer.Where(itm =>itm.QuestionCode == code);
                if (answerRecs.Count() > 0)
                {
                    DC.tb_Answer.DeleteAllOnSubmit(answerRecs);
                }
                DC.tb_Question.DeleteOnSubmit(questionRec);
                DC.SubmitChanges();
            }
            LoadData(OurPager1.CurrentPageIndex); //加载GridView数据
        }
    }

    /// <summary>
    /// GridView行数据绑定事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)    //如果是数据行
        {
            GridView grid = sender as GridView; //取当前操作的GridView
            ((LinkButton)(e.Row.Cells[grid.Columns.Count - 1].Controls[0])).Attributes.Add("onclick", "return confirm('确认删除?');");  //为GridView数据行的删除按钮添加删除确认对话框
        }
        else if (e.Row.RowType == DataControlRowType.Footer)
        {
            if (Cache["tb_Config"] == null)
            {
                //30秒过期
                Cache.Insert("tb_Config", DC.tb_Config.FirstOrDefault(), null, DateTime.Now.AddSeconds(5), TimeSpan.Zero);
            }
            if (Cache["tb_Config"] != null)
            {
                tb_Config config = Cache["tb_Config"] as tb_Config;
                e.Row.Cells[1].Text = "未解决问题数：";
                e.Row.Cells[2].Text = config.UnSolved.ToString();
                e.Row.Cells[5].Text = "已解决问题数：";
                e.Row.Cells[6].Text = config.Solved.ToString();
                Cache["tb_Config"] = config;
            }
        }
    }
}
