using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace ServerControl
{
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:ValidateCode runat=server></{0}:ValidateCode>")]
    public class ValidateCode : WebControl
    {
        /// <summary>
        /// 记录随机生成的验证码
        /// </summary>
        private string _checkCode = string.Empty;

        /// <summary>
        /// 用于记录验证码的位数，初始值为4
        /// </summary>
        private int _codeLen = 4;

        /// <summary>
        /// Bindable：用于设置该属性是否可以绑定数据
        /// Category：设置属性显示在“按分类顺序”模式时，分组的类别名称
        /// Browsable：是否显示在控件的属性面板中
        /// DefaultValue：指定属性的默认值
        /// Description：指定属性的说明文字
        /// </summary>
        [Bindable(true), Category("Appearance"), Browsable(true), DefaultValue(true), Description("此属性用于设置验证码的长度")]
        public int CodeLength
        {
            get
            {
                return _codeLen;
            }
            set
            {
                _codeLen = value;
            }
        }

        /// <summary>
        /// 生成随机验证码
        /// </summary>
        /// <returns></returns>
        private string GetValidateCode()
        {
            //创建一个字符数组，用于存储组成验证码的数字和英文字母
            char[] s = new char[]{'2','3','4','5','6','7','8','9','a'
                ,'b','c','d','e','f','g','h','i','j','k','m','n','p','q'
                ,'r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G'
                ,'H','I','J','K','L','M','N','P','Q','R','S','T','U','V','W'
                ,'X','Y','Z'};
            string num = "";//创建变量用于记录指定长度的验证码的值
            Random r = new Random();//生成随机生成器
            //根据用户需要的长度来定义验证码的位数
            for (int i = 0; i < _codeLen; i++)
            {
                num += s[r.Next(0, s.Length)].ToString();
            }
            return num;//返回生成的随机验证码的值
        }

        /// <summary>
        /// 绘制图形验证码
        /// </summary>
        /// <param name="checkCode">随机生成的验证码</param>
        private void CreateCheckCodeImage(string checkCode)
        {
            System.Drawing.Bitmap image = new System.Drawing.Bitmap((int)Math.Ceiling((checkCode.Length * 14.5)), 22);//创建画布，用于绘制验证码
            Graphics g = Graphics.FromImage(image);//声明Graphics对象
            try
            {
                Random random = new Random();            //生成随机生成器
                g.Clear(Color.White);            			//清空图片背景色
                Font font = new System.Drawing.Font("宋体", 15, (System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic));//设置字体
                System.Drawing.Drawing2D.LinearGradientBrush brush = new System.Drawing.Drawing2D.LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Green, Color.Red, 1.2f, true);//设置笔刷
                g.DrawString(checkCode, font, brush, 0, 0);//将验证码绘制到画布中
                for (int i = 0; i < 100; i++)            //画图片的前景噪音点
                {
                    int x = random.Next(image.Width);
                    int y = random.Next(image.Height);
                    image.SetPixel(x, y, Color.FromArgb(random.Next()));
                }
                HttpContext.Current.Response.Cookies["code"].Value = checkCode;//将验证码存入cookie中
                //画图片的边框线
                g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);
                System.IO.MemoryStream ms = new System.IO.MemoryStream();//创建内存流
                image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);//将验证码图片存入内存流
                Page.Response.Clear();//清除缓冲区流中所有内容输出
                Page.Response.ContentType = "image/GIF";//设置输出流类型
                Page.Response.BinaryWrite(ms.ToArray());//写入输出流
                Page.Response.Flush();//向客户端发送输出流
                ms.Close();//释放资源
                ms.Dispose();//释放资源
                Page.Response.End();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                g.Dispose();
                image.Dispose();
            }
        }

        /// <summary>
        /// 控件加载事件
        /// </summary>
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            try
            {
                string sn = Page.Request.QueryString["_ImageTag"];//获取页面传递的参数
                if (sn != null)//判断参数是否为空，如果不为空时才能生成验证码，并绘制输出到页面
                {
                    _checkCode = GetValidateCode();//生成验证码
                    CreateCheckCodeImage(_checkCode);//绘制输出到页面
                }
                else
                {
                    //创建一个JavaScript函数用于生成随机数
                    string script = @"<script language='JavaScript'>
                                    function getnum()
                                    {
                                        var num=Math.floor(Math.random()*100);
                                        return num;
                                    }
                                    </script>";
                    //将该方法注册到控件所在的页面中
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "getnum", script);
                }
            }
            catch { }
        }

        protected override void RenderContents(HtmlTextWriter output)
        {
            string CID = string.Empty;
            try
            {
                if (string.IsNullOrEmpty(_checkCode))//首先判断是否生成了验证码
                {
                    CID = this.UniqueID + "img";//设置页面IMG的ID值
                    //输出表格到页面
                    output.Write("<table cellpadding=\"0\" cellspacing=\"0\" >");
                    output.Write("<tr>");
                    output.Write("<td>");
                    output.Write("<img border=\"0\" src=\"{0}\" id=\"{1}\"/>", this.Page.Request.Path + "?_ImageTag=" + DateTime.Now.Second, CID);//输出img图片，并且指定其src地址，因为验证码控件是被输出到当前的页面中，所以接收当前页面地址作为图片的数据源
                    output.Write("</td>");
                    output.Write("<td>");
                    output.Write("<a  style=\"cursor:pointer;font-size:small\" onclick=\"document.getElementById('" + CID + "').src=" + "'" + this.Page.Request.Path + "?_ImageTag='" + "+getnum()" + "\"" + ">&nbsp;&nbsp;看不清？</a>");//创建一个连接，单击后无刷新更换验证码
                    output.Write("</td>");
                    output.Write("</tr>");
                    output.Write("</table>");
                }
            }
            catch
            {
                output.Write("<table cellpadding=\"0\" cellspacing=\"0\" >");
                output.Write("<tr>");
                output.Write("<td>");
                output.Write("</td>");
                output.Write("<td>");
                //显示“看不清？”链接
                output.Write("<a  style=\"cursor:pointer;font-size:small\"" + ">&nbsp;&nbsp;看不清？</a>");
                output.Write("</td>");
                output.Write("</tr>");
                output.Write("</table>");
            }
        }

        /// <summary>
        /// 公共方法用于验证输入的验证码是否正确
        /// </summary>
        public bool CheckSN(string sn)
        {
            bool flag = false;
            if (HttpContext.Current.Request.Cookies["code"].Value != null)//如果cookie不为空
            {
                flag = sn.ToLower() == HttpContext.Current.Request.Cookies["code"].Value.ToString().ToLower();//判断记录的cookie与输入的验证码是否一致
            }
            return flag;
        }

    }
}
