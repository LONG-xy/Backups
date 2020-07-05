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
using System.Data.SqlClient;
using System.IO;
using System.Drawing;

public partial class Manger_imagegallery : System.Web.UI.Page
{
    CommonClass ccObj = new CommonClass();
    DBClass dbObj = new DBClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            dlImageBind();
        }
    }
    public void dlImageBind()
    {
        string strSql = "select * from tb_Image";
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbImage");
        int curpage = Convert.ToInt32(this.labPage.Text);
        PagedDataSource ps = new PagedDataSource();
        ps.DataSource = dsTable.DefaultView;
        ps.AllowPaging = true; //是否可以分页
        ps.PageSize = 16; //显示的数量
        ps.CurrentPageIndex = curpage - 1; //取得当前页的页码
        this.lnkbtnUp.Enabled = true;
        this.lnkbtnNext.Enabled = true;
        this.lnkbtnBack.Enabled = true;
        this.lnkbtnOne.Enabled = true;
        if (curpage == 1)
        {
            this.lnkbtnOne.Enabled = false;//不显示第一页按钮
            this.lnkbtnUp.Enabled = false;//不显示上一页按钮
        }
        if (curpage == ps.PageCount)
        {
            this.lnkbtnNext.Enabled = false;//不显示下一页
            this.lnkbtnBack.Enabled = false;//不显示最后一页
        }
        this.labBackPage.Text = Convert.ToString(ps.PageCount);
        this.dlImage.DataSource = ps;
        this.dlImage.DataKeyField = dsTable.Columns[0].ToString();
        this.dlImage.DataBind();
    }
    protected void lnkbtnOne_Click(object sender, EventArgs e)
    {
        this.labPage.Text = "1";
        this.dlImageBind();
    }
    protected void lnkbtnUp_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) - 1);
        this.dlImageBind();
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(this.labPage.Text) + 1);
        this.dlImageBind();
    }
    protected void lnkbtnBack_Click(object sender, EventArgs e)
    {
        this.labPage.Text = this.labBackPage.Text;
        this.dlImageBind();
    }
    protected void UploadImage_OnClick(object sender, EventArgs e)
    {
        //检查上传文件的格式是否有效   
        if (this.imageUpload.PostedFile.ContentType.ToLower().IndexOf("image") < 0)
        {
            Response.Write(ccObj.MessageBox("上传图片格式无效！"));
            return;
        }
        string filePath = imageUpload.PostedFile.FileName;
        string filename = filePath.Substring(filePath.LastIndexOf("\\") + 1);
        //string fileEx = filePath.Substring(filePath.LastIndexOf(".") + 1);
        string serverpath = Server.MapPath(@"~\Images\ftp\") + filename;
        //string relativepath = @"~\images\ftp\" + filename;
        string strSql = "select * from tb_Image where ImageName='" + filename + "'";
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbImage");
        if (dsTable.Rows.Count > 0)
        {
            Response.Write(ccObj.MessageBox("该图片已存在！"));
        }
        else
        {
            //生成原图   
            Byte[] oFileByte = new byte[this.imageUpload.PostedFile.ContentLength];
            System.IO.Stream oStream = this.imageUpload.PostedFile.InputStream;
            System.Drawing.Image oImage = System.Drawing.Image.FromStream(oStream);
            int oWidth = oImage.Width; //原图宽度   
            int oHeight = oImage.Height; //原图高度   
            int tWidth = 67; //设置缩略图初始宽度   
            int tHeight = 90; //设置缩略图初始高度  
            //生成缩略原图   
            Bitmap tImage = new Bitmap(tWidth, tHeight);
            Graphics g = Graphics.FromImage(tImage);
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High; //设置高质量插值法   
            g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;//设置高质量,低速度呈现平滑程度   
            g.Clear(Color.Transparent); //清空画布并以透明背景色填充   
            g.DrawImage(oImage, new Rectangle(0, 0, tWidth, tHeight), new Rectangle(0, 0, oWidth, oHeight), GraphicsUnit.Pixel);           
            //保存缩略图的物理路径  
            string tFullName = serverpath;
            try
            {
                tImage.Save(tFullName);
                Response.Write(ccObj.MessageBox("上传成功！"));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                //释放资源   
                oImage.Dispose();
                g.Dispose();
                tImage.Dispose();
            }
        }
    }

    protected void dlImage_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string strSql = "select ImageName from tb_Image where ImageID=" + Convert.ToInt32(e.CommandArgument.ToString());
        DataTable dsTable = dbObj.GetDataSetStr(strSql, "tbImage");
        //删除指定文件的图片
        string strFilePath = Server.MapPath(@"~\Images\ftp\") + dsTable.Rows[0][0].ToString();
        File.Delete(strFilePath);
        //删除数据库中的图片
        string strDeleteSql = "delete from tb_Image where ImageID=" + Convert.ToInt32(e.CommandArgument.ToString());
        SqlCommand myCmd = dbObj.GetCommandStr(strDeleteSql);
        dbObj.ExecNonQuery(myCmd);
        dlImageBind();
        Response.Write(ccObj.MessageBox("删除成功！"));
    }
}
