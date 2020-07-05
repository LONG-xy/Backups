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
using System.Drawing.Imaging;
using System.Drawing;
public partial class Image : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string tmp = RndNum();//获取生成的验证码
        Session["verify"] = tmp;//将验证码存储在Session中，以便验证
        ValidateCode(tmp);//回执验证码
    }
    private void ValidateCode(string VNum)//绘制验证码
    {
        Bitmap Img = null;//创建位图对象，用来存储生成的验证码图片
        Graphics g = null;//绘制验证码的对象
        MemoryStream ms = null;//内存流对象，用来缓存验证码图片
        int gheight = VNum.Length * 9;//设置验证码高度
        Img = new Bitmap(gheight, 18);//创建位图对象
        g = Graphics.FromImage(Img);//从位图对象创建绘图对象
        g.Clear(Color.WhiteSmoke);//设置背景颜色
        Font f = new Font("Tahoma", 9);//设置文字字体
        SolidBrush s = new SolidBrush(Color.Red);//设置文字颜色
        g.DrawString(VNum, f, s, 3, 3);//绘制验证码
        ms = new MemoryStream();//创建内存流对象
        Img.Save(ms, ImageFormat.Jpeg);//将验证码保存到内存流中
        Response.ClearContent();//清空页面内容
        Response.ContentType = "image/Jpeg";//设置输出格式为jpeg格式
        Response.BinaryWrite(ms.ToArray());//输出验证码
        g.Dispose();//释放绘图对象资源
        Img.Dispose();//释放位图资源
        Response.End();//终止响应
    }
    private string RndNum()//生成验证码
    {
        string MaxNum = "";//最大值
        string MinNum = "";//最小值
        for (int i = 0; i < 5; i++)//控制验证码的最大位数
        {
            MaxNum = MaxNum + "5";
        }
        MinNum = MaxNum.Remove(0, 1);//控制验证码的最小位数
        Random rd = new Random();//定义随机数生成器
        string VNum = Convert.ToString(rd.Next(Convert.ToInt32(MinNum), Convert.ToInt32(MaxNum)));//生成4位或者5位的验证码
        return VNum;//返回生成的验证码
    }
}
