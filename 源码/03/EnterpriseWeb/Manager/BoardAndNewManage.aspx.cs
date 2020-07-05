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

public partial class Manager_BoardAndNewManage : System.Web.UI.Page
{
    DataOperate dataoperate = new DataOperate();
    NewsOperate newsoperate = new NewsOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        FreeTextBox1.FontFacesMenuList = dataoperate.strFont();
        if (!IsPostBack)
        {
            BindInfo();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtTitle.Text == string.Empty)
        {
            Response.Write("<script language=javascript>alert('标题不能为空！')</script>");
        }
        else
        {
            newsoperate.Title = txtTitle.Text;
            if (Request["BNID"].ToString() == "0")
                newsoperate.Type = "新闻";
            else
                newsoperate.Type = "公告";
            DataSet ds = newsoperate.FindNewsByTT("tb_News");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Write("<script language=javascript>alert('已经存在！')</script>");
                txtTitle.Text = string.Empty;
                txtTitle.Focus();
            }
            else
            {
                ds = null;
                ds = newsoperate.GetAllNews("tb_News");
                newsoperate.ID = dataoperate.getID("tb_News", ds);
                newsoperate.Title = txtTitle.Text;
                newsoperate.Content = FreeTextBox1.Text;
                if (Request["BNID"].ToString() == "0")
                    newsoperate.Type = "新闻";
                else
                    newsoperate.Type = "公告";
                newsoperate.AddNews();
                Response.Write("<script language=javascript>alert('添加成功！')</script>");
                clearData();
                BindInfo();
            }
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (Session["id"] != null)
        {
            newsoperate.ID = Session["id"].ToString();
            newsoperate.Title = txtTitle.Text;
            newsoperate.Content = FreeTextBox1.Text;
            newsoperate.UpdateNews();
            Response.Write("<script language=javascript>alert('修改成功！')</script>");
            BindInfo();
        }
        else
        {
            Response.Write("<script language=javascript>alert('请选择要修改的新闻或公告标题！')</script>");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clearData();
    }
    protected void gvBNInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBNInfo.PageIndex = e.NewPageIndex;
        BindInfo();
    }
    protected void gvBNInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        newsoperate.ID = gvBNInfo.DataKeys[e.RowIndex].Value.ToString();
        newsoperate.DeleteNews();
        BindInfo();
    }
    protected void gvBNInfo_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = null;
        newsoperate.ID = gvBNInfo.SelectedDataKey.Value.ToString();
        Session["id"] = gvBNInfo.SelectedDataKey.Value.ToString();
        ds = newsoperate.FindNewsByID("tb_News");
        txtTitle.Text = ds.Tables[0].Rows[0][1].ToString();
        FreeTextBox1.Text = ds.Tables[0].Rows[0][2].ToString();
    }
    protected void btnQuery_Click(object sender, EventArgs e)
    {
        BindInfo();
    }
    private void clearData()
    {
        txtTitle.Text = FreeTextBox1.Text = string.Empty;
    }
    private void BindInfo()
    {
        DataSet ds = null;
        int intID = Int32.Parse(Request["BNID"]);
        switch (intID)
        {
            case 0:
                labTitle.Text = "焦点新闻管理";
                newsoperate.Type = "新闻";
                break;
            case 1:
                labTitle.Text = "公司公告管理";
                newsoperate.Type = "公告";
                break;
        }
        if (txtCondition.Text == "")
        {
            ds = newsoperate.FindNewsByType("tb_News");
        }
        else
        {
            newsoperate.Title = txtCondition.Text;
            ds = newsoperate.FindNewsByTT("tb_News");
        }
        gvBNInfo.DataSource = ds;
        gvBNInfo.DataKeyNames = new string[] { "ID" };
        gvBNInfo.DataBind();
    }
}