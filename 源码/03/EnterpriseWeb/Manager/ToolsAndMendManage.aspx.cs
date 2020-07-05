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
using System.IO;

public partial class Manager_ToolsAndMendManage : System.Web.UI.Page
{
    DataOperate dataoperate = new DataOperate();
    ProductOperate productoperate = new ProductOperate();
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
            Response.Write("<script language=javascript>alert('请选择图片')</script>");
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
            Response.Write("<script language=javascript>alert('名称不能为空！')</script>");
        }
        else
        {
            productoperate.Name = txtName.Text;
            if (Request["TMID"].ToString() == "0")
                productoperate.Type = "工具";
            else
                productoperate.Type = "补丁";
            DataSet ds = productoperate.FindProductByNT("tb_Product");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Write("<script language=javascript>alert('已经存在！')</script>");
                txtName.Text = string.Empty;
                txtName.Focus();
            }
            else
            {
                ds = null;
                ds = productoperate.GetAllProduct("tb_Product");
                productoperate.ID = dataoperate.getID("tb_Product", ds);
                productoperate.Name = txtName.Text;
                productoperate.Edition = txtEdition.Text;
                productoperate.UpUser = txtUpUser.Text;
                productoperate.Photo = imgPhoto.ImageUrl;
                if (Request["TMID"].ToString() == "0")
                    productoperate.Type = "工具";
                else
                    productoperate.Type = "补丁";
                productoperate.Commend = Int32.Parse(txtCommend.Text);
                productoperate.Environment = txtEnvironment.Text;
                productoperate.Introduce = txtIntroduce.Text;
                productoperate.Remark = txtRemark.Text;
                string strPath = uploadFile.PostedFile.FileName;
                string Serverpath = Server.MapPath(@"..\File\" + strPath.Substring(strPath.LastIndexOf("\\") + 1));
                string Relativepath = @"..\File\" + strPath.Substring(strPath.LastIndexOf("\\") + 1);
                uploadFile.PostedFile.SaveAs(Serverpath);
                productoperate.Accessories = Relativepath;
                FileInfo fInfo = new FileInfo(Server.MapPath(Relativepath));
                productoperate.FileSize = Convert.ToInt32(fInfo.Length / 1024);
                productoperate.AddProduct();
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
            productoperate.ID = Session["id"].ToString();
            productoperate.Name = txtName.Text;
            productoperate.Edition = txtEdition.Text;
            productoperate.UpUser = txtUpUser.Text;
            productoperate.Photo = imgPhoto.ImageUrl;
            if (Request["TMID"].ToString() == "0")
                productoperate.Type = "工具";
            else
                productoperate.Type = "补丁";
            productoperate.Commend = Int32.Parse(txtCommend.Text);
            productoperate.Environment = txtEnvironment.Text;
            productoperate.Introduce = txtIntroduce.Text;
            productoperate.Remark = txtRemark.Text;
            string strPath = uploadFile.PostedFile.FileName;
            string Serverpath = Server.MapPath(@"..\File\" + strPath.Substring(strPath.LastIndexOf("\\") + 1));
            string Relativepath = @"..\File\" + strPath.Substring(strPath.LastIndexOf("\\") + 1);
            if (uploadFile.PostedFile.FileName == "")
            {
                productoperate.Accessories = productoperate.FindProductByID("tb_Product").Tables[0].Rows[0][14].ToString();
            }
            else
            {
                uploadFile.PostedFile.SaveAs(Serverpath);
                productoperate.Accessories = Relativepath;
            }

            FileInfo fInfo = new FileInfo(Server.MapPath(productoperate.Accessories));
            productoperate.FileSize = Convert.ToInt32(fInfo.Length / 1024);
            productoperate.UpdateProduct();
            Response.Write("<script language=javascript>alert('修改成功！')</script>");
        }
        else
        {
            Response.Write("<script language=javascript>alert('请选择要修改的信息！')</script>");
        }
        BindInfo();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clearData();
        btnAdd.Enabled = true;
    }
    protected void gvTMInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvTMInfo.PageIndex = e.NewPageIndex;
        BindInfo();
    }
    protected void gvTMInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        productoperate.ID = gvTMInfo.DataKeys[e.RowIndex].Value.ToString();
        productoperate.DeleteProduct();
        BindInfo();
    }
    protected void gvTMInfo_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = null;
        productoperate.ID = gvTMInfo.SelectedDataKey.Value.ToString();
        Session["id"] = gvTMInfo.SelectedDataKey.Value.ToString();
        ds = productoperate.FindProductByID("tb_Product");
        txtName.Text = ds.Tables[0].Rows[0][1].ToString();
        txtEdition.Text = ds.Tables[0].Rows[0][2].ToString();
        txtUpUser.Text = ds.Tables[0].Rows[0][5].ToString();
        imgPhoto.ImageUrl = ds.Tables[0].Rows[0][6].ToString();
        txtCommend.Text = ds.Tables[0].Rows[0][9].ToString();
        txtEnvironment.Text = ds.Tables[0].Rows[0][11].ToString();
        txtIntroduce.Text = ds.Tables[0].Rows[0][12].ToString();
        txtRemark.Text = ds.Tables[0].Rows[0][13].ToString();
        btnAdd.Enabled = false;
    }
    protected void btnQuery_Click(object sender, EventArgs e)
    {
        BindInfo();
    }
    private void clearData()
    {
        txtName.Text = txtEdition.Text = txtUpUser.Text = txtEnvironment.Text = txtIntroduce.Text = txtRemark.Text = string.Empty;
    }
    private void BindInfo()
    {
        DataSet ds = null;
        int intPID = Int32.Parse(Request["TMID"]);
        switch (intPID)
        {
            case 0:
                labTitle.Text = "工具软件管理";
                productoperate.Type = "工具";
                break;
            case 1:
                labTitle.Text = "补丁下载管理";
                productoperate.Type = "补丁";
                break;
        }
        if (txtCondition.Text == "")
        {
            ds = productoperate.FindProductByType("tb_Prodcut");
        }
        else
        {
            productoperate.Name = txtCondition.Text;
            ds = productoperate.FindProductByNT("tb_Product");
        }
        gvTMInfo.DataSource = ds;
        gvTMInfo.DataKeyNames = new string[] { "ID" };
        gvTMInfo.DataBind();
    }
}
