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

public partial class User_Sort : System.Web.UI.Page
{
    DataOperate dataoperate = new DataOperate();
    ProductOperate productoperate = new ProductOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["TID"] != null || Request["MID"] != null || Request["NetID"] != null || Request["JavaID"] != null || Request["ASPID"] != null || Request["VCID"] != null || Request["VBID"] != null || Request["DelphiID"] != null)
            {
                BindInfo();
            }
            else
            {
                BindAllInfo();
            }
        }
    }
    protected void lbtnOne_Click(object sender, EventArgs e)
    {
        labPage.Text = "1";
        BindAllInfo();
    }
    protected void lbtnUp_Click(object sender, EventArgs e)
    {
        labPage.Text = Convert.ToString(Convert.ToInt32(labPage.Text) - 1);
        BindAllInfo();
    }
    protected void lbtnNext_Click(object sender, EventArgs e)
    {
        labPage.Text = Convert.ToString(Convert.ToInt32(labPage.Text) + 1);
        BindAllInfo();
    }
    protected void lbtnBack_Click(object sender, EventArgs e)
    {
        labPage.Text = labBackPage.Text;
        BindAllInfo();
    }
    protected void dlInfo_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        productoperate.ID = dlInfo.DataKeys[e.Item.ItemIndex].ToString();
        DataSet ds=productoperate.FindProductByID("tb_Product");
        string strPath = ds.Tables[0].Rows[0][14].ToString();
        if (strPath != "")
        {
            FileInfo FInfo = new FileInfo(Server.MapPath(strPath));
            if (FInfo.Exists)
            {
                Response.Clear();
                Response.ClearHeaders();
                Response.Buffer = false;
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(FInfo.FullName, System.Text.Encoding.UTF8));
                Response.AppendHeader("Content-Length", FInfo.Length.ToString());
                Response.WriteFile(FInfo.FullName);
                Response.Flush();
                productoperate.LoadNum = Convert.ToInt32(ds.Tables[0].Rows[0][10].ToString()) + 1;
                productoperate.UpdateLoadNum();
            }
            else
                Response.Write("<script>alert('文件不存在')</script>");
        }
    }
    public void BindInfo()
    {
        DataSet ds = null;
        if (Request["TID"] != null)
        {
            this.Title = "企业门户网——软件详细信息";
            productoperate.ID = Request["TID"].ToString();
        }
        else if (Request["MID"] != null)
        {
            this.Title = "企业门户网——补丁详细信息";
            productoperate.ID = Request["MID"].ToString();
        }
        else
        {
            this.Title = "企业门户网——产品详细信息";
            if (Request["NetID"] != null)
            {
                productoperate.ID = Request["NetID"].ToString();
            }
            else if (Request["JavaID"] != null)
            {
                productoperate.ID = Request["JavaID"].ToString();
            }
            else if (Request["ASPID"] != null)
            {
                productoperate.ID = Request["ASPID"].ToString();
            }
            else if (Request["VCID"] != null)
            {
                productoperate.ID = Request["VCID"].ToString();
            }
            else if (Request["VBID"] != null)
            {
                productoperate.ID = Request["VBID"].ToString();
            }
            else if (Request["DelphiID"] != null)
            {
                productoperate.ID = Request["DelphiID"].ToString();
            }
        }
        ds = productoperate.FindProductByID("tb_Product");
        dlInfo.DataSource = ds;
        dlInfo.DataKeyField = "ID";
        dlInfo.DataBind();
        Label7.Visible = labPage.Visible = Label6.Visible = labBackPage.Visible 
            = lbtnOne.Visible = lbtnUp.Visible = lbtnNext.Visible = lbtnBack.Visible = false;
    }
    public void BindAllInfo()
    {
        DataSet ds = null;
        if (Request["SortID"] != null)
        {
            if (Int32.Parse(Request["SortID"]) == 0)
            {
                this.Title = "企业门户网——工具软件下载";
                productoperate.Type = "工具";
            }
            else if (Int32.Parse(Request["SortID"]) == 1)
            {
                this.Title = "企业门户网——补丁下载";
                productoperate.Type = "补丁";
            }
        }
        else
        {
            this.Title = "企业门户网——产品信息";
            if (Int32.Parse(Request["PID"]) == 0)
            {
                productoperate.Type = "C#+ASP.NET";
            }
            else if (Int32.Parse(Request["PID"]) == 1)
            {
                productoperate.Type = "Java+JSP";
            }
            else if (Int32.Parse(Request["PID"]) == 2)
            {
                productoperate.Type = "ASP+PHP";
            }
            else if (Int32.Parse(Request["PID"]) == 3)
            {
                productoperate.Type = "VC++";
            }
            else if (Int32.Parse(Request["PID"]) == 4)
            {
                productoperate.Type = "VB";
            }
            else if (Int32.Parse(Request["PID"]) == 5)
            {
                productoperate.Type = "Delphi";
            }
        }
        ds = productoperate.FindProductByType("tb_Prodcut");
        Label7.Visible = labPage.Visible = Label6.Visible = labBackPage.Visible
            = lbtnOne.Visible = lbtnUp.Visible = lbtnNext.Visible = lbtnBack.Visible = true;
        dataoperate.dlBind(2, ds, labPage, labBackPage, lbtnUp, lbtnNext, lbtnBack, lbtnOne, dlInfo);
    }
}
