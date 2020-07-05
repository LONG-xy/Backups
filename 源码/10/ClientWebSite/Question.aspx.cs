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

public partial class Question : System.Web.UI.Page
{
    DataClassesDataContext DC = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (string.IsNullOrEmpty(ClientHelper.UserCode))//提问前判断用户是否登陆
            {
                Session["RedirectFrom"] = Request.Url;      //记住当前的Url
                Response.Redirect("NotLogin.aspx");         //跳转到登陆提示页
            }

            var query = from item in DC.tb_Catalog          //取类别数据表中的数据
                        select new
                        {
                            Code = item.Code,
                            Name = item.Name
                        };
            ddlCatalogCode.DataSource = query;              //将类别数据表中的数据绑定到类别下拉列表框
            ddlCatalogCode.DataTextField = "Name";
            ddlCatalogCode.DataValueField = "Code";
            ddlCatalogCode.DataBind();
        }
    }
    //保存提问信息
    protected void ibtnPostQuestion_Click(object sender, ImageClickEventArgs e)
    {
        if (!ValidateCode1.CheckSN(txtCheckCode.Text))          //判断验证码是否正确
        {
            lblMessage.Text = "输入验证码不正确!";
            return;
        }
        if (Page.IsValid)
        {
            tb_UserInfo user = DC.tb_UserInfo.FirstOrDefault(itm => itm.Code == ClientHelper.UserCode);
            if (txtMark.Text.Trim() != "" && user.Mark < Convert.ToInt32(txtMark.Text))
            {
                Response.Write("<Script>window.alert('用户的分数不足!')</Script>");
                return;            
            }

            tb_Question question = new tb_Question();           //创建提问信息实体
            question.Code = ClientHelper.BuildCode();           //调用公共类生成唯一号
            //给实体成员赋值
            question.CatalogCode = ddlCatalogCode.SelectedValue;
            question.UserCode = ClientHelper.UserCode;
            question.Title = txtTitle.Text;
            question.Text = txtText.Text;
            if (txtMark.Text.Trim() !="")
                question.Mark = Convert.ToInt32(txtMark.Text);
            question.PostDatetime = ClientHelper.ServerDate;
            question.State = 0;                                 //状态默认为0(未解决)
            DC.tb_Question.InsertOnSubmit(question);            //保存提问信息
            //用户信息表中提问者的"未解决问题数"+1
            user.QUnsolveCount = user.QUnsolveCount + 1;
            //全局配置表中"未解决问题数"+1
            tb_Config config = DC.tb_Config.FirstOrDefault();
            config.UnSolved = config.UnSolved + 1;

            DC.SubmitChanges();                                 //提交结果到服务器端
            txtTitle.Text = "";                                 //清空输入内容
            ddlCatalogCode.SelectedIndex = 0;
            txtText.Text = "";
            txtMark.Text = "";
            txtCheckCode.Text = "";
            Response.Write("<Script>window.alert('保存成功!')</Script>");
        }
    }
}
