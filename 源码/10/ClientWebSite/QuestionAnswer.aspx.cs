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

public partial class QuestionAnswer : System.Web.UI.Page
{
    DataClassesDataContext DC = new DataClassesDataContext();

    public string QuestionCode
    {
        get
        {
            if (ViewState["QuestionCode"] == null)
                return "";
            return ViewState["QuestionCode"].ToString();
        }
        set
        {
            ViewState["QuestionCode"] = value;
        }
    }

    public string UserName
    {
        get
        {
            if (ViewState["UserName"] == null)
                return "";
            return ViewState["UserName"].ToString();
        }
        set
        {
            ViewState["UserName"] = value;
        }
    }

    public string State
    {
        get
        {
            if (ViewState["State"] == null)
                return "";
            return ViewState["State"].ToString();
        }
        set
        {
            ViewState["State"] = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["QuestionCode"] != null)
            {
                QuestionCode = Request.QueryString["QuestionCode"].ToString();
                LoadData();
            }
        }
    }

    /// <summary>
    /// 加载GridView数据
    /// </summary>
    /// <param name="CurrentPageIndex"></param>
    private void LoadData()
    {
        var questionQuery = from item in DC.tb_Question
                    where item.Code == QuestionCode
                    join user in DC.tb_UserInfo
                    on item.UserCode equals user.Code
                    join catalog in DC.tb_Catalog
                    on item.CatalogCode equals catalog.Code
                    select new
                    {
                        Code = item.Code,
                        Title = item.Title,
                        Text = item.Text,
                        QuestionMark = item.Mark,
                        PostDatetime = item.PostDatetime,
                        UserCode = user.UserName,
                        Mark = user.Mark,
                        AAcceptCount = user.AAcceptCount,
                        CreatedDate = user.CreatedDate,
                        CatalogCode = item.CatalogCode,
                        CatalogName = catalog.Name,
                        State = item.State
                    };
        if (questionQuery != null)
        {
            State = questionQuery.First().State.ToString();
            dlQuestion.DataSource = questionQuery;
            dlQuestion.DataBind();

            int cnt = DC.tb_Answer.Count(itm => itm.QuestionCode == QuestionCode && itm.BestAnswer == true);
            if (cnt == 0)
            {
                var answerQuery = from item in DC.tb_Answer
                                  where item.QuestionCode == QuestionCode
                                  join user in DC.tb_UserInfo
                                  on item.UserCode equals user.Code
                                  select new
                                  {
                                      Code = item.Code,
                                      QuestionCode = item.QuestionCode,
                                      Title = item.Title,
                                      Text = item.Text,
                                      PostDatetime = item.PostDatetime,
                                      UserCode = user.UserName,
                                      Mark = user.Mark,
                                      AAcceptCount = user.AAcceptCount,
                                      CreatedDate = user.CreatedDate
                                  };
                dlAnswer.DataSource = answerQuery;
            }
            else
            {
                var answerQuery = from item in DC.tb_Answer
                                  where item.BestAnswer == true && item.QuestionCode == QuestionCode
                                  join user in DC.tb_UserInfo
                                  on item.UserCode equals user.Code
                                  select new
                                  {
                                      Code = item.Code,
                                      QuestionCode = item.QuestionCode,
                                      Title = "<span style=' color: Red; font-weight: bold '>最佳答案</span>——"+item.Title,
                                      
                                      Text = item.Text,
                                      PostDatetime = item.PostDatetime,
                                      UserCode = user.UserName,
                                      Mark = user.Mark,
                                      AAcceptCount = user.AAcceptCount,
                                      CreatedDate = user.CreatedDate
                                  };
                dlAnswer.DataSource = answerQuery;
            }
            dlAnswer.DataBind();
        }
    }

    protected void dlQuestion_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName != null)
        {
            int index = e.Item.ItemIndex;               //取DataList行索引
            DataList dl = (DataList)source;             //取当前DataList
            string code = dl.DataKeys[index].ToString();//取DataList主键值
            if (e.CommandName == "CloseQuestion")       //命令是关闭关题
            {
                SetCloseQuestion(code);                 //执行关闭问题的方法                 
            }
            else if (e.CommandName == "Answer")
            {
                if (CurrencyCheck(code))
                    Response.Redirect("Answer.aspx?QuestionCode=" + code);
            }
        }
    }

    protected void dlAnswer_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName != "")
        {
            int index = e.Item.ItemIndex;               //取DataList行索引
            DataList dl = (DataList)source;             //取当前DataList
            string code = dl.DataKeys[index].ToString();//取DataList主键值
            tb_Answer answer = DC.tb_Answer.FirstOrDefault(itm => itm.Code == code);
            if (e.CommandName == "Edi")                 //命令名是修改答案
            {
                if (CurrencyCheck(answer.QuestionCode))
                    Response.Redirect("Answer.aspx?QuestionCode="+answer.QuestionCode+"&AnswerCode="+answer.Code);
            }
            else if (e.CommandName == "Del")            //命令名是删除答案
            {
                if (CurrencyCheck(answer.QuestionCode))
                {
                    DC.tb_Answer.DeleteOnSubmit(answer);
                    DC.SubmitChanges();
                    LoadData();
                }
            }
            else if (e.CommandName == "BestAnswer")     //命令名是设置最佳答案
            {
                SetBestAnswer(answer);                  //执行设置最佳答案的方法 
                LoadData();
            }
        }
    }

    private void SetBestAnswer(tb_Answer answer)
    {
        if (answer != null)
        {
            if (answer.BestAnswer == true)
            {
                Response.Write("<script>alert('该回答已经设为最佳答案!');</script>");
                return;
            }
            tb_Question question = DC.tb_Question.FirstOrDefault(itm => itm.Code == QuestionCode);
            if (question.State == 2)
            {
                Response.Write("<script>alert('该问题已关闭,不能再设最佳答案!');</script>");
                return;
            }
            int cnt = DC.tb_Answer.Count(itm => itm.QuestionCode == QuestionCode && itm.BestAnswer == true);
            if (cnt > 0)
            {
                Response.Write("<script>alert('该问题已经有最佳答案了!');</script>");
                return;
            }
            answer.BestAnswer = true;//回答表中BestAnswer=1
            question.State = 1;
            tb_UserInfo quser = DC.tb_UserInfo.FirstOrDefault(itm => itm.Code == ClientHelper.UserCode);
            //用户信息表中提问者的“未解决问题数”-1，“已解决提问数”+1，用户积分-，发出悬赏积分+
            quser.QUnsolveCount = quser.QUnsolveCount - 1;
            quser.QSolvedCount = quser.QSolvedCount + 1;
            quser.Mark = quser.Mark - question.Mark;
            quser.PaidMark = quser.PaidMark + question.Mark;
            //用户信息表中回答者的“被评为最佳答案数”+1，用户积分+，获得悬赏积分+
            tb_UserInfo auser = DC.tb_UserInfo.FirstOrDefault(itm => itm.Code == answer.UserCode);
            auser.AAcceptCount = auser.AAcceptCount + 1;
            auser.Mark = auser.Mark + question.Mark;
            auser.RewardMark = auser.RewardMark + question.Mark;
            //全局设置表中已解决+1，未解决-1
            tb_Config config = DC.tb_Config.FirstOrDefault();
            config.UnSolved = config.UnSolved - 1;
            config.Solved = config.Solved + 1;
            DC.SubmitChanges();
        }
    }

    private void SetCloseQuestion(string questionCode)
    {
        tb_Question question = DC.tb_Question.FirstOrDefault(itm => itm.Code == questionCode);
        if (question.State == 2)
        {
            Response.Write("<script>alert('该问题已关闭,不能重复关闭!');</script>");
            return;
        }
        int cnt = DC.tb_Answer.Count(itm => itm.QuestionCode == questionCode && itm.BestAnswer == true);
        if (cnt > 0)
        {
            Response.Write("<script>alert('该问题已经有最佳答案了,不能关闭!');</script>");
            return;
        }
        question.State = 2;                              //设置问题状态为"关闭"
        tb_UserInfo quser = DC.tb_UserInfo.FirstOrDefault(itm => itm.Code == ClientHelper.UserCode);
        quser.QUnsolveCount = quser.QCancelledCount + 1; //用户信息表中提问者的"已关闭提问数"+1
        tb_Config config = DC.tb_Config.FirstOrDefault();
        config.UnSolved = config.UnSolved - 1;           //全局设置表中累计未解决问题数-1
        DC.SubmitChanges();                              //提交结果
    }

    /// <summary>
    /// 通用验证
    /// </summary>
    /// <param name="questionCode"></param>
    /// <returns></returns>
    private bool CurrencyCheck(string questionCode)
    {
        tb_Question question = DC.tb_Question.FirstOrDefault(itm => itm.Code == questionCode);
        if (question.State == 2)
        {
            Response.Write("<script>alert('该问题已关闭!');</script>");
            return false;
        }
        int cnt = question.tb_Answer.Count(itm => itm.BestAnswer == true);
        if (cnt > 0)
        {
            Response.Write("<script>alert('该问题已经设置最佳答案!');</script>");
            return false ;
        }
        return true;
    }

    protected void dlQuestion_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            LinkButton lbtnCloseQuestion = (LinkButton)e.Item.FindControl("lbtnCloseQuestion");
            lbtnCloseQuestion.Visible = false;
            if ((State== null || State =="0") && e.Item.DataItem != null)
            {
                string[] lst = e.Item.DataItem.ToString().Split(',');
                string userName = lst.FirstOrDefault(itm => itm.Split('=')[0].Trim() == "UserCode" && itm.Split('=')[1].Trim() == ClientHelper.UserName);
                if (userName != null)//是当前登陆用户提问的
                {
                    lbtnCloseQuestion.Visible = true;
                }
                if (userName != null)
                    UserName = userName.Split('=')[1].Trim();
                else
                    UserName = null;

            }
        }
    }

    protected void dlAnswer_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            LinkButton lbtnUpdate = (LinkButton)e.Item.FindControl("lbtnUpdate");
            LinkButton lbtnDelete = (LinkButton)e.Item.FindControl("lbtnDelete");
            LinkButton lbtnBestAnswer = (LinkButton)e.Item.FindControl("lbtnBestAnswer");
            lbtnUpdate.Visible = false;
            lbtnDelete.Visible = false;
            lbtnBestAnswer.Visible = false;
            if ((State == null || State == "0") && e.Item.DataItem != null)
            {
                string[] lst = e.Item.DataItem.ToString().Split(',');
                string userName = lst.FirstOrDefault(itm => itm.Split('=')[0].Trim() == "UserCode" && itm.Split('=')[1].Trim() == ClientHelper.UserName);
                if (userName != null)//是当前登陆用户回答的
                {
                    lbtnUpdate.Visible = true;
                    lbtnDelete.Visible = true;
                }
                if (ClientHelper.UserName != "" && ClientHelper.UserName == UserName)//是当前登陆用户提问的
                    lbtnBestAnswer.Visible = true;

            }
        }
    }

}
