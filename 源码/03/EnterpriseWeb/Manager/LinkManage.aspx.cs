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

public partial class Manager_LinkManage : System.Web.UI.Page
{
    DataOperate dataoperate = new DataOperate();
    LinkOperate linkoperate = new LinkOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindInfo();
        }
    }
    protected void btnShow_Click(object sender, EventArgs e)
    {
        if (uploadPhoto.PostedFile.FileName == "")
        {
            Response.Write("<script language=javascript>alert('请选择公司图标')</script>");
        }
        else
        {
            dataoperate.UpPhoto(uploadPhoto, imgPhoto, Server.MapPath(@"..\images\Photo\"));
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtName.Text == string.Empty)
        {
            Response.Write("<script language=javascript>alert('公司名称不能为空！')</script>");
        }
        else if (!dataoperate.validateNAddress(txtLAddress.Text))
        {
            Response.Write("<script language=javascript>alert('请输入合法的公司网址！')</script>");
        }
        else
        {
            linkoperate.Name = txtName.Text;
            DataSet ds = linkoperate.FindLinkByName("tb_Link");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Write("<script language=javascript>alert('该公司已经存在！')</script>");
                txtName.Text = string.Empty;
                txtName.Focus();
            }
            else
            {
                ds = null;
                ds = linkoperate.GetAllLink("tb_Link");
                linkoperate.ID = dataoperate.getID("tb_Link", ds);
                linkoperate.Name = txtName.Text;
                linkoperate.Photo = imgPhoto.ImageUrl;
                linkoperate.LAddress = txtLAddress.Text;
                linkoperate.AddLink();
                Response.Write("<script language=javascript>alert('友情链接信息添加成功！')</script>");
                clearData();
                BindInfo();
            }
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (Session["id"] != null)
        {
            if (txtName.Text == string.Empty)
            {
                Response.Write("<script language=javascript>alert('公司名称不能为空！')</script>");
            }
            else if (!dataoperate.validateNAddress(txtLAddress.Text))
            {
                Response.Write("<script language=javascript>alert('请输入合法的公司网址！')</script>");
            }
            else
            {
                linkoperate.ID = Session["id"].ToString();
                linkoperate.Name = txtName.Text;
                linkoperate.Photo = imgPhoto.ImageUrl;
                linkoperate.LAddress = txtLAddress.Text;
                linkoperate.UpdateLink();
                Response.Write("<script language=javascript>alert('友情链接信息修改成功！')</script>");
            }
        }
        else
        {
            Response.Write("<script language=javascript>alert('请选择要修改的友情链接信息！')</script>");
        }
        BindInfo();

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clearData();
        btnAdd.Enabled = true;
    }
    protected void gvPInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvLinkInfo.PageIndex = e.NewPageIndex;
        BindInfo();
    }
    protected void gvPInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        linkoperate.ID = gvLinkInfo.DataKeys[e.RowIndex].Value.ToString();
        linkoperate.DeleteLink();
        BindInfo();
    }
    protected void gvPInfo_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = null;
        linkoperate.ID = gvLinkInfo.SelectedDataKey.Value.ToString();
        Session["id"] = gvLinkInfo.SelectedDataKey.Value.ToString();
        ds = linkoperate.FindLinkByID("tb_Link");
        txtName.Text = ds.Tables[0].Rows[0][1].ToString();
        imgPhoto.ImageUrl = ds.Tables[0].Rows[0][2].ToString();
        txtLAddress.Text = ds.Tables[0].Rows[0][3].ToString();
        btnAdd.Enabled = false;
    }
    protected void btnQuery_Click(object sender, EventArgs e)
    {
        BindInfo();
    }
    private void clearData()
    {
        txtName.Text = txtLAddress.Text = string.Empty;
        imgPhoto.ImageUrl = null;
    }
    private void BindInfo()
    {
        DataSet ds = null;
        if (txtConditon.Text == "")
        {
            ds = linkoperate.GetAllLink("tb_Link");
        }
        else
        {
            if (ddlCondition.SelectedValue == "公司名称")
            {
                linkoperate.Name = txtConditon.Text;
                ds = linkoperate.FindLinkByName("tb_Link");
            }
            else if (ddlCondition.SelectedValue == "公司网址")
            {
                linkoperate.LAddress = txtConditon.Text;
                ds = linkoperate.FindLinkByLAddress("tb_Link");
            }
        }
        gvLinkInfo.DataSource = ds;
        gvLinkInfo.DataKeyNames = new string[] { "ID" };
        gvLinkInfo.DataBind();
    }
}
