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

public partial class Manager_EngageManage : System.Web.UI.Page
{
    DataOperate dataoperate = new DataOperate();
    EngageOperate engageoperate = new EngageOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindInfo();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtEPositon.Text == string.Empty)
        {
            Response.Write("<script language=javascript>alert('招聘岗位不能为空！')</script>");
        }
        else if (!dataoperate.validateNum(txtNum.Text))
        {
            Response.Write("<script language=javascript>alert('招聘人数只能为数字！')</script>");
        }
        else if (!dataoperate.validateEmail(txtEmail.Text))
        {
            Response.Write("<script language=javascript>alert('请输入正确的邮箱地址！')</script>");
        }
        else
        {
            engageoperate.EPosition = txtEPositon.Text;
            DataSet ds = engageoperate.FindEngageByName("tb_Engage");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Write("<script language=javascript>alert('该岗位信息已经存在！')</script>");
                txtEPositon.Text = string.Empty;
                txtEPositon.Focus();
            }
            else
            {
                ds = null;
                ds = engageoperate.GetAllEngage("tb_Engage");
                engageoperate.ID = dataoperate.getID("tb_Engage", ds);
                engageoperate.EPosition = txtEPositon.Text;
                engageoperate.PIntroduce = txtPIntroduce.Text;
                engageoperate.SchoolAge = ddlSchoolAge.SelectedValue;
                engageoperate.PRequest = txtPRequest.Text;
                engageoperate.Department = txtDepartment.Text;
                engageoperate.Place = txtPlace.Text;
                engageoperate.Num = Convert.ToInt32(txtNum.Text);
                engageoperate.Email = txtEmail.Text;
                engageoperate.AddEngage();
                Response.Write("<script language=javascript>alert('招聘信息添加成功！')</script>");
                clearData();
                BindInfo();
            }
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (txtEPositon.Text == string.Empty)
        {
            Response.Write("<script language=javascript>alert('招聘岗位不能为空！')</script>");
        }
        else if (!dataoperate.validateNum(txtNum.Text))
        {
            Response.Write("<script language=javascript>alert('招聘人数只能为数字！')</script>");
        }
        else if (!dataoperate.validateEmail(txtEmail.Text))
        {
            Response.Write("<script language=javascript>alert('请输入正确的邮箱地址！')</script>");
        }
        else
        {
            if (Session["id"] != null)
            {
                engageoperate.ID = Session["id"].ToString();
                engageoperate.EPosition = txtEPositon.Text;
                engageoperate.PIntroduce = txtPIntroduce.Text;
                engageoperate.SchoolAge = ddlSchoolAge.SelectedValue;
                engageoperate.PRequest = txtPRequest.Text;
                engageoperate.Department = txtDepartment.Text;
                engageoperate.Place = txtPlace.Text;
                engageoperate.Num = Convert.ToInt32(txtNum.Text);
                engageoperate.Email = txtEmail.Text;
                engageoperate.UpdateEngage();
                Response.Write("<script language=javascript>alert('招聘信息修改成功！')</script>");
                BindInfo();
            }
            else
            {
                Response.Write("<script language=javascript>alert('请选择要修改的招聘信息！')</script>");
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clearData();
    }
    protected void gvEngageInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvEngageInfo.PageIndex = e.NewPageIndex;
        BindInfo();
    }
    protected void gvEngageInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        engageoperate.ID = gvEngageInfo.DataKeys[e.RowIndex].Value.ToString();
        engageoperate.DeleteEngage();
        BindInfo();
    }
    protected void gvEngageInfo_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = null;
        engageoperate.ID = gvEngageInfo.SelectedDataKey.Value.ToString();
        Session["id"] = gvEngageInfo.SelectedDataKey.Value.ToString();
        ds = engageoperate.FindEngageByID("tb_Engage");
        txtEPositon.Text = ds.Tables[0].Rows[0][1].ToString();
        txtPIntroduce.Text = ds.Tables[0].Rows[0][2].ToString();
        ddlSchoolAge.Text = ds.Tables[0].Rows[0][3].ToString();
        txtPRequest.Text = ds.Tables[0].Rows[0][4].ToString();
        txtDepartment.Text = ds.Tables[0].Rows[0][5].ToString();
        txtPlace.Text = ds.Tables[0].Rows[0][6].ToString();
        txtNum.Text = ds.Tables[0].Rows[0][7].ToString();
        txtEmail.Text = ds.Tables[0].Rows[0][9].ToString();
    }
    protected void btnQuery_Click(object sender, EventArgs e)
    {
        BindInfo();
    }
    private void clearData()
    {
        txtEPositon.Text = txtPIntroduce.Text = txtPRequest.Text = txtDepartment.Text = txtPlace.Text = txtNum.Text = txtEmail.Text = string.Empty;
    }
    private void BindInfo()
    {
        DataSet ds = null;
        if (txtConditon.Text == "")
        {
            ds = engageoperate.GetAllEngage("tb_Engage");
        }
        else
        {
            if (ddlCondition.SelectedValue == "招聘岗位")
            {
                engageoperate.EPosition = txtConditon.Text;
                ds = engageoperate.FindEngageByName("tb_Engage");
            }
            else if (ddlCondition.SelectedValue == "工作地点")
            {
                engageoperate.Place = txtConditon.Text;
                ds = engageoperate.FindEngageByPlace("tb_Engage");
            }
            else if (ddlCondition.SelectedValue == "工作部门")
            {
                engageoperate.Department = txtConditon.Text;
                ds = engageoperate.FindEngageByDepartment("tb_Engage");
            }
        }
        gvEngageInfo.DataSource = ds;
        gvEngageInfo.DataKeyNames = new string[] { "ID" };
        gvEngageInfo.DataBind();
    }
}
