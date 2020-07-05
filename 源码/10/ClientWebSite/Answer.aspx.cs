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

public partial class Answer : System.Web.UI.Page
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

    public string AnswerCode
    {
        get
        {
            if (ViewState["AnswerCode"] == null)
                return "";
            return ViewState["AnswerCode"].ToString();
        }
        set
        {
            ViewState["AnswerCode"] = value;
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

    protected void Page_Load(object sender, EventArgs e)
    {
        //如果是添加:只传QuestionCode,修改还传AnswerCode
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["QuestionCode"] != null)                  //提问唯一号不为空
            {
                QuestionCode = Request.QueryString["QuestionCode"].ToString();//取出提问唯一号
                LoadData();                                                   //加载提问及回复信息
                if (Request.QueryString["AnswerCode"] != null)                //回复唯一号不为空
                {
                    AnswerCode = Request.QueryString["AnswerCode"].ToString();//取出回复唯一号
                    //根据回复唯一号到数据库中取出回复信息
                    tb_Answer answer = DC.tb_Answer.FirstOrDefault(itm => itm.Code == AnswerCode);
                    if (answer != null)
                    {
                        txtTitle.Text = answer.Title;                         //将回复信息填充到页面对应的编辑框中
                        txtText.Text = answer.Text;
                    }
                }
            }
            if (string.IsNullOrEmpty(ClientHelper.UserCode))//提问和回答必须先登陆
            {
                Session["RedirectFrom"] = Request.Url;
                Response.Redirect("NotLogin.aspx");
            }


        }
    }

    /// <summary>
    /// 加载DataList数据
    /// </summary>
    /// <param name="CurrentPageIndex"></param>
    private void LoadData()
    {
        var questionQuery = from item in DC.tb_Question//使用LINQ查询提问信息
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
                                CatalogName = catalog.Name
                            };
        if (questionQuery != null)
        {
            dlQuestion.DataSource = questionQuery;     //将提问信息绑定到DataList
            dlQuestion.DataBind();

            var answerQuery = from item in DC.tb_Answer//使用LINQ查询回复信息
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
            dlAnswer.DataSource = answerQuery;        //将回复信息绑定到DataList
            dlAnswer.DataBind();
        }
    }

    protected void dlQuestion_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName != null)
        {
            int index = e.Item.ItemIndex;//取DataList行索引
            DataList dl = (DataList)source;       //取当前DataList
            string code = dl.DataKeys[index].ToString();   //取DataList主键值
            if (e.CommandName == "CloseQuestion")
            {
                SetCloseQuestion(code);
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
            if (e.CommandName == "Edi")                 //修改答案
            {
                if (CurrencyCheck(answer.QuestionCode)) //操作合法性校验
                    //重新加载Answer.aspx页面,在查询字符串中传入一个AnswerCode参数
                    Response.Redirect("Answer.aspx?QuestionCode=" + answer.QuestionCode + "&AnswerCode=" + answer.Code);
            }
            else if (e.CommandName == "Del")            //删除答案
            {
                if (CurrencyCheck(answer.QuestionCode)) //操作合法性校验
                {
                    DC.tb_Answer.DeleteOnSubmit(answer);//删除回复信息
                    DC.SubmitChanges();
                    LoadData();                         //删除后重新加载数据
                }
            }
            else if (e.CommandName == "BestAnswer")    //设置最佳答案
            {
                SetBestAnswer(answer);
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
        question.State = 2;
        tb_UserInfo quser = DC.tb_UserInfo.FirstOrDefault(itm => itm.Code == ClientHelper.UserCode);
        //用户信息表中提问者的“已关闭提问数”+1
        quser.QUnsolveCount = quser.QCancelledCount + 1;
        //全局设置表中未解决-1
        tb_Config config = DC.tb_Config.FirstOrDefault();
        config.UnSolved = config.UnSolved - 1;
        DC.SubmitChanges();
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
            return false;
        }
        return true;
    }
    protected void ibtnPostAnswer_Click(object sender, ImageClickEventArgs e)
    {
        int cnt = DC.tb_Answer.Count(itm => itm.QuestionCode == QuestionCode && itm.UserCode == ClientHelper.UserCode);
        if (cnt > 0)
        {
            lblMessage.Text = "不能重复回复同一问题";
            return;
        }
        int cnt2 = DC.tb_Question.Count(itm => itm.Code == QuestionCode && itm.UserCode == ClientHelper.UserCode);
        if (cnt2 > 0)
        {
            lblMessage.Text = "不能回复自已提出的问题";
            return;
        }
        if (!CurrencyCheck(QuestionCode))
            return;

        //判断不能修改其他用户的帖子//??
        if (!ValidateCode1.CheckSN(txtCheckCode.Text))
        {
            lblMessage.Text = "输入验证码不正确!";
            return;
        }
        if (Page.IsValid)
        {
            if (AnswerCode == "")//传入的查询字符串为空,是新建回复信息操作
            {
                tb_Answer answer = new tb_Answer();
                answer.Code = ClientHelper.BuildCode();
                answer.QuestionCode = QuestionCode;
                answer.UserCode = ClientHelper.UserCode;
                answer.Title = txtTitle.Text;
                answer.Text = txtText.Text;
                answer.PostDatetime = ClientHelper.ServerDate;
                DC.tb_Answer.InsertOnSubmit(answer);//将回复信息保存到答案数据表中
                //用户信息表中回答者的"回答问题数"+1
                tb_UserInfo user = DC.tb_UserInfo.FirstOrDefault(itm => itm.Code == ClientHelper.UserCode);
                if (user != null)
                {
                    user.ACount = user.ACount + 1;
                }
                DC.SubmitChanges();
                lblMessage.Text = "发表贴子成功";
                Response.Redirect("QuestionAnswer.aspx?QuestionCode=" + QuestionCode);
            }
            else                 //是修改回复信息操作
            {
                tb_Answer answer = DC.tb_Answer.FirstOrDefault(itm => itm.Code == AnswerCode);
                if (answer != null)
                {
                    answer.Title = txtTitle.Text;
                    answer.Text = txtText.Text;
                    answer.PostDatetime = ClientHelper.ServerDate;
                    DC.SubmitChanges();
                    lblMessage.Text = "修改贴子成功";
                    Response.Redirect("QuestionAnswer.aspx?QuestionCode=" + QuestionCode);
                }
            }
        }
    }



    protected void dlQuestion_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            LinkButton lbtnCloseQuestion = (LinkButton)e.Item.FindControl("lbtnCloseQuestion");
            lbtnCloseQuestion.Visible = false;
            if (e.Item.DataItem != null)
            {
                string userName = e.Item.DataItem.ToString().Split(',').FirstOrDefault(itm => itm.Split('=')[0].Trim() == "UserCode" && itm.Split('=')[1].Trim() == ClientHelper.UserName);
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
            LinkButton lbtnUpdate = (LinkButton)e.Item.FindControl("lbtnUpdate");        //修改按钮
            LinkButton lbtnDelete = (LinkButton)e.Item.FindControl("lbtnDelete");        //删除按钮
            LinkButton lbtnBestAnswer = (LinkButton)e.Item.FindControl("lbtnBestAnswer");//设置最佳答案按钮
            lbtnUpdate.Visible = false;
            lbtnDelete.Visible = false;
            lbtnBestAnswer.Visible = false;
            if (e.Item.DataItem != null)
            {
                //如果是登陆用户回复的贴子
                string userName = e.Item.DataItem.ToString().Split(',').FirstOrDefault(itm => itm.Split('=')[0].Trim() == "UserCode" && itm.Split('=')[1].Trim() == ClientHelper.UserName);
                if (userName != null)
                {
                    lbtnUpdate.Visible = true;
                    lbtnDelete.Visible = true;
                }
                if (ClientHelper.UserName != "" && UserName == ClientHelper.UserName)    //是当前登陆用户提问的贴子
                    lbtnBestAnswer.Visible = true;

            }
        }
    }
}
