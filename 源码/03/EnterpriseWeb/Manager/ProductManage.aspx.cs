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

public partial class Manager_ProductManage : System.Web.UI.Page
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
            Response.Write("<script language=javascript>alert('请选择本产品图片')</script>");
        }
        else
        {
            bool IsUpload = dataoperate.UpPhoto(uploadPhoto, imgPhoto, Server.MapPath(@"..\images\Photo\"));
            if (!IsUpload)
            {
                Response.Write("<script language=javascript>alert('请上传jpg、bmp或gif类型的图片格式!')</script>");
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (txtName.Text == string.Empty)
        {
            Response.Write("<script language=javascript>alert('产品名称不能为空！')</script>");
        }
        else if (!dataoperate.validateNum(txtPrice.Text) && !dataoperate.validateDNum(txtPrice.Text))
        {
            Response.Write("<script language=javascript>alert('价格输入必须为数字！')</script>");
        }
        else
        {
            productoperate.Name = txtName.Text;
            int intPID = Int32.Parse(Request["PID"]);
            switch (intPID)
            {
                case 0:
                    productoperate.Type = "C#+ASP.NET";
                    break;
                case 1:
                    productoperate.Type = "Java+JSP";
                    break;
                case 2:
                    productoperate.Type = "ASP+PHP";
                    break;
                case 3:
                    productoperate.Type = "VC++";
                    break;
                case 4:
                    productoperate.Type = "VB";
                    break;
                case 5:
                    productoperate.Type = "Delphi";
                    break;
            }
            DataSet ds = productoperate.FindProductByNT("tb_Product");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Write("<script language=javascript>alert('该产品已经存在！')</script>");
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
                productoperate.Price = Convert.ToDecimal(txtPrice.Text);
                productoperate.Photo = imgPhoto.ImageUrl;
                productoperate.Type = ddlType.Text;
                productoperate.Environment = txtEnvironment.Text;
                productoperate.Introduce = txtIntroduce.Text;
                productoperate.Remark = txtRemark.Text;
                productoperate.AddProduct();
                Response.Write("<script language=javascript>alert('产品添加成功！')</script>");
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
                Response.Write("<script language=javascript>alert('产品名称不能为空！')</script>");
            }
            else if (!dataoperate.validateNum(txtPrice.Text) && !dataoperate.validateDNum(txtPrice.Text))
            {
                Response.Write("<script language=javascript>alert('价格输入必须为数字！')</script>");
            }
            else
            {
                productoperate.ID = Session["id"].ToString();
                productoperate.Name = txtName.Text;
                productoperate.Edition = txtEdition.Text;
                productoperate.Price = Convert.ToDecimal(txtPrice.Text);
                productoperate.Photo = imgPhoto.ImageUrl;
                productoperate.Type = ddlType.Text;
                productoperate.Environment = txtEnvironment.Text;
                productoperate.Introduce = txtIntroduce.Text;
                productoperate.Remark = txtRemark.Text;
                productoperate.UpdateProduct();
                Response.Write("<script language=javascript>alert('产品信息修改成功！')</script>");
            }
        }
        else
        {
            Response.Write("<script language=javascript>alert('请选择要修改的产品！')</script>");
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
        gvPInfo.PageIndex = e.NewPageIndex;
        BindInfo();
    }
    protected void gvPInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        productoperate.ID = gvPInfo.DataKeys[e.RowIndex].Value.ToString();
        productoperate.DeleteProduct();
        BindInfo();
    }
    protected void gvPInfo_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = null;
        productoperate.ID = gvPInfo.SelectedDataKey.Value.ToString();
        Session["id"] = gvPInfo.SelectedDataKey.Value.ToString();
        ds = productoperate.FindProductByID("tb_Product");
        txtName.Text = ds.Tables[0].Rows[0][1].ToString();
        txtEdition.Text = ds.Tables[0].Rows[0][2].ToString();
        txtPrice.Text = ds.Tables[0].Rows[0][3].ToString();
        imgPhoto.ImageUrl = ds.Tables[0].Rows[0][6].ToString();
        ddlType.Text = ds.Tables[0].Rows[0][7].ToString();
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
        txtName.Text = txtEdition.Text = txtPrice.Text = txtEnvironment.Text = txtIntroduce.Text = txtRemark.Text = string.Empty;
    }
    private void BindInfo()
    {
        DataSet ds = null;
        int intPID = Int32.Parse(Request["PID"]);
        switch (intPID)
        {
            case 0:
                productoperate.Type = "C#+ASP.NET";
                ddlType.Text = "C#+ASP.NET";
                break;
            case 1:
                productoperate.Type = "Java+JSP";
                ddlType.Text = "Java+JSP";
                break;
            case 2:
                productoperate.Type = "ASP+PHP";
                ddlType.Text = "ASP+PHP";
                break;
            case 3:
                productoperate.Type = "VC++";
                ddlType.Text = "VC++";
                break;
            case 4:
                productoperate.Type = "VB";
                ddlType.Text = "VB";
                break;
            case 5:
                productoperate.Type = "Delphi";
                ddlType.Text = "Delphi";
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
        gvPInfo.DataSource = ds;
        gvPInfo.DataKeyNames = new string[] { "ID" };
        gvPInfo.DataBind();
    }
}
