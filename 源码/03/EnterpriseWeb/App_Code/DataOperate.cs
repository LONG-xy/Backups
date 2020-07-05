using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;

/// <summary>
/// 数据验证、自动生成编号、DataList绑定及分页、截取字符串、FreeTextBox控件的字体
/// </summary>
public class DataOperate
{
	public DataOperate()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    #region 自动生成编号
    /// <summary>
    /// 自动生成编号
    /// </summary>
    /// <param name="tbName">数据表名</param>
    /// <returns></returns>
    public string getID(string tbName, DataSet ds)
    {
        string P_Str_ID = "";
        int P_Int_ID = 0;
        if (ds.Tables[0].Rows.Count == 0)
        {
            P_Str_ID = "BH100001";
        }
        else
        {
            P_Str_ID = Convert.ToString(ds.Tables[0].Rows[ds.Tables[0].Rows.Count - 1]["ID"]);
            P_Int_ID = Convert.ToInt32(P_Str_ID.Substring(2, 6)) + 1;
            P_Str_ID = "BH" + P_Int_ID.ToString();
        }
        return P_Str_ID;
    }
    #endregion

    #region  验证输入为数字
    /// <summary>
    /// 验证输入为数字
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public bool validateNum(string str)
    {
        return Regex.IsMatch(str, "^[0-9]*[1-9][0-9]*$");
    }
    /// <summary>
    /// 验证输入为小数
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public bool validateDNum(string str)
    {
        return Regex.IsMatch(str, "^[0-9]+(.[0-9]{1,3})?$");
    }
    #endregion

    #region  验证输入为邮编
    /// <summary>
    /// 验证输入为邮编
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public bool validatePCode(string str)
    {
        return Regex.IsMatch(str, @"\d{6}");
    }
    #endregion

    #region  验证输入为电话号码
    /// <summary>
    /// 验证输入为电话号码
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public bool validatePhone(string str)
    {
        return Regex.IsMatch(str, @"^(\d{3,4})-(\d{7,8})$");
    }
    #endregion

    #region  验证输入为Email
    /// <summary>
    /// 验证输入为Email
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public bool validateEmail(string str)
    {
        return Regex.IsMatch(str, @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
    }
    #endregion

    #region  验证输入为网址
    /// <summary>
    /// 验证输入为网址
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public bool validateNAddress(string str)
    {
        return Regex.IsMatch(str, @"http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?");
    }
    #endregion

    #region  上传图片
    /// <summary>
    /// 上传图片
    /// </summary>
    /// <param name="upload">FileUpload控件对象</param>
    /// <param name="img">Image控件对象</param>
    /// <param name="img">虚拟路径</param>
    public bool UpPhoto(FileUpload upload, System.Web.UI.WebControls.Image img,string strPath)
    {
        string filePath = upload.PostedFile.FileName;
        string filename = filePath.Substring(filePath.LastIndexOf("\\") + 1);
        string fileEx = filePath.Substring(filePath.LastIndexOf(".") + 1);
        string serverpath = strPath + filename;
        string relativepath = @"..\images\Photo\" + filename;
        //判断图片格式
        if (fileEx == "jpg" || fileEx == "bmp" || fileEx == "gif")
        {
            upload.PostedFile.SaveAs(serverpath);
            img.ImageUrl = relativepath;
            return true;
        }
        else
        {
            return false;
        }
    }
    #endregion

    #region DataList控件绑定及分页
    /// <summary>
    /// DataList控件绑定及分页
    /// </summary>
    /// <param name="intCount">每页显示的记录条数</param>
    /// <param name="ds">DataSet数据集</param>
    /// <param name="labPage">当前页码</param>
    /// <param name="labTPage">总页码</param>
    /// <param name="lbtnUp">上一页</param>
    /// <param name="lbtnNext">下一页</param>
    /// <param name="lbtnBack">最后一页</param>
    /// <param name="lbtnOne">第一页</param>
    /// <param name="dl">DataList控件对象</param>
    public void dlBind(int intCount,DataSet ds,Label labPage,Label labTPage,LinkButton lbtnUp,LinkButton lbtnNext,LinkButton lbtnBack,LinkButton lbtnOne,DataList dl)
    {
        int curpage = Convert.ToInt32(labPage.Text);
        PagedDataSource ps = new PagedDataSource();
        ps.DataSource = ds.Tables[0].DefaultView;
        ps.AllowPaging = true; //是否可以分页
        ps.PageSize = intCount; //显示的数量
        ps.CurrentPageIndex = curpage - 1; //取得当前页的页码
        lbtnUp.Enabled = true;
        lbtnNext.Enabled = true;
        lbtnBack.Enabled = true;
        lbtnOne.Enabled = true;
        if (curpage == 1)
        {
            lbtnOne.Enabled = false;//不显示第一页按钮
            lbtnUp.Enabled = false;//不显示上一页按钮
        }
        if (curpage == ps.PageCount)
        {
            lbtnNext.Enabled = false;//不显示下一页
            lbtnBack.Enabled = false;//不显示最后一页
        }
        labTPage.Text = Convert.ToString(ps.PageCount);
        dl.DataSource = ps;
        dl.DataKeyField = "ID";
        dl.DataBind();
    }
    #endregion

    #region 截取指定长度的字符串
    /// <summary>
    /// 截取指定长度的字符串
    /// </summary>
    /// <param name="str">要截取的字符串</param>
    /// <param name="intLength">要截取的长度</param>
    /// <returns>截取后的字符串</returns>
    public string SubStr(string str, int intLength)
    {
        if (str.Length < intLength)
        {
            return str;
        }
        string newStr = str.Substring(0, intLength - 1);
        newStr = newStr + "...";
        return newStr;
    }
    #endregion

    #region FreeTextBox控件的字体
    /// <summary>
    /// FreeTextBox控件的字体
    /// </summary>
    /// <returns></returns>
    public string[] strFont()
    {
        string[] str = null;
        str = new string[] { "宋体", "楷体_GB2312", "隶书", "华文行楷", "华文中宋", "新宋体", "黑体", 
            "方正舒体", "方正姚体", "仿宋_GB2312", "华文彩云", "华文细黑", "华文新魏", "华文中宋"};
        return str;
    }
    #endregion
}

/// <summary>
/// 用户操作类
/// </summary>
public class UserOperate
{
    DataBase data = new DataBase();

    #region 定义用户信息--数据结构
    private string id = "";
    private string name = "";
    private string pwd = "";
    private string question = "";
    private string result = "";
    private string photo = "";
    private string sex = "";
    private int age = 0;
    private string tel = "";
    private string mobile = "";
    private string email = "";
    private string qq = "";
    private DateTime registertime = Convert.ToDateTime(DateTime.Now.ToShortDateString());
    private string address = "";
    private string naddress = "";
    private string remark = "";
    private string marker = "用户";
    /// <summary>
    /// 编号
    /// </summary>
    public string ID
    {
        get { return id; }
        set { id = value; }
    }
    /// <summary>
    /// 姓名
    /// </summary>
    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    /// <summary>
    /// 密码
    /// </summary>
    public string Pwd
    {
        get { return pwd; }
        set { pwd = value; }
    }
    /// <summary>
    /// 密保问题
    /// </summary>
    public string Question
    {
        get { return question; }
        set { question = value; }
    }
    /// <summary>
    /// 密保密码
    /// </summary>
    public string Result
    {
        get { return result; }
        set { result = value; }
    }
    /// <summary>
    /// 头像
    /// </summary>
    public string Photo
    {
        get { return photo; }
        set { photo = value; }
    }
    /// <summary>
    /// 性别
    /// </summary>
    public string Sex
    {
        get { return sex; }
        set { sex = value; }
    }
    /// <summary>
    /// 年龄
    /// </summary>
    public int Age
    {
        get { return age; }
        set { age = value; }
    }
    /// <summary>
    /// 电话
    /// </summary>
    public string Tel
    {
        get { return tel; }
        set { tel = value; }
    }
    /// <summary>
    /// 手机号
    /// </summary>
    public string Mobile
    {
        get { return mobile; }
        set { mobile = value; }
    }
    /// <summary>
    /// 邮箱
    /// </summary>
    public string Email
    {
        get { return email; }
        set { email = value; }
    }
    /// <summary>
    /// QQ号码
    /// </summary>
    public string QQ
    {
        get { return qq; }
        set { qq = value; }
    }
    /// <summary>
    /// 注册时间
    /// </summary>
    public DateTime RegisterTime
    {
        get { return registertime; }
        set { registertime = value; }
    }
    /// <summary>
    /// 地址
    /// </summary>
    public string Address
    {
        get { return address; }
        set { address = value; }
    }
    /// <summary>
    /// 个人主页
    /// </summary>
    public string NAddress
    {
        get { return naddress; }
        set { naddress = value; }
    }
    /// <summary>
    /// 备注
    /// </summary>
    public string Remark
    {
        get { return remark; }
        set { remark = value; }
    }
    /// <summary>
    /// 标识
    /// </summary>
    public string Marker
    {
        get { return marker; }
        set { marker = value; }
    }
    #endregion

    #region 添加--用户信息
    /// <summary>
    /// 添加--用户--信息
    /// </summary>
    /// <returns></returns>
    public int AddUser()
    {
        SqlParameter[] prams = {
			data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
            data.MakeInParam("@name",  SqlDbType.VarChar, 100,Name ),
            data.MakeInParam("@pwd",  SqlDbType.VarChar, 50,Pwd),
            data.MakeInParam("@question",  SqlDbType.VarChar, 100, Question ),
            data.MakeInParam("@result",  SqlDbType.VarChar, 100, Result ),
            data.MakeInParam("@photo",  SqlDbType.VarChar, 200, Photo ),
            data.MakeInParam("@sex",  SqlDbType.Char, 4, Sex ),
            data.MakeInParam("@age",  SqlDbType.Int, 4, Age ),
            data.MakeInParam("@tel",  SqlDbType.VarChar, 20, Tel),
            data.MakeInParam("@mobile",  SqlDbType.VarChar, 20, Mobile ),
            data.MakeInParam("@email",  SqlDbType.VarChar,50, Email ),
            data.MakeInParam("@qq",  SqlDbType.VarChar, 10, QQ ),
            data.MakeInParam("@registertime",  SqlDbType.DateTime, 4, RegisterTime ),
            data.MakeInParam("@address",  SqlDbType.VarChar, 100, Address ),
            data.MakeInParam("@naddress",  SqlDbType.VarChar, 50, NAddress ),
            data.MakeInParam("@remark",  SqlDbType.VarChar, 4000, Remark ),
            data.MakeInParam("@marker",  SqlDbType.Char,10, Marker ),
		};
        return (data.RunProc("INSERT INTO tb_User (ID, Name,Pwd,Question,Result,Photo,Sex,Age,Tel,Mobile,Email,QQ,RegisterTime,Address,NAddress,Remark,Marker)"
            + " VALUES (@id,@name,@pwd,@question,@result,@photo,@sex,@age,@tel,@mobile,@email,@qq,@registertime,@address,@naddress,@remark,@marker)", prams));
    }
    #endregion

    #region 修改--用户信息
    /// <summary>
    /// 修改--用户--信息
    /// </summary>
    /// <returns></returns>
    public int UpdateUser()
    {
        SqlParameter[] prams = {
                						data.MakeInParam("@name",  SqlDbType.VarChar, 100,Name ),
                                        data.MakeInParam("@pwd",  SqlDbType.VarChar, 50,Pwd),
                						data.MakeInParam("@question",  SqlDbType.VarChar, 100, Question ),
                						data.MakeInParam("@result",  SqlDbType.VarChar, 100, Result ),
                						data.MakeInParam("@photo",  SqlDbType.VarChar, 200, Photo ),
                						data.MakeInParam("@sex",  SqlDbType.Char, 4, Sex ),
                                        data.MakeInParam("@age",  SqlDbType.Int, 4, Age ),
                                        data.MakeInParam("@tel",  SqlDbType.VarChar, 20, Tel),
                                        data.MakeInParam("@mobile",  SqlDbType.VarChar, 20, Mobile ),
                                        data.MakeInParam("@email",  SqlDbType.VarChar,50, Email ),
                                        data.MakeInParam("@qq",  SqlDbType.VarChar, 10, QQ ),
                						data.MakeInParam("@registertime",  SqlDbType.DateTime, 4, RegisterTime ),
                                        data.MakeInParam("@address",  SqlDbType.VarChar, 100, Address ),
                                        data.MakeInParam("@naddress",  SqlDbType.VarChar, 50, NAddress ),
                                        data.MakeInParam("@remark",  SqlDbType.VarChar, 4000, Remark ),
			};
        return (data.RunProc("update tb_User set Pwd=@pwd,Question=@question,Result=@result,Photo=@photo,Sex=@sex,Age=@age,Tel=@tel,"
            + "Mobile=@mobile,Email=@email,QQ=@qq,Address=@address,NAddress=@naddress,Remark=@remark where Name=@name", prams));
    }
    #endregion

    #region 删除--用户信息
    /// <summary>
    /// 删除--用户--信息
    /// </summary>
    /// <returns></returns>
    public int DeleteUser()
    {
        SqlParameter[] prams = {
						data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
			};
        return (data.RunProc("delete from tb_User where ID=@id", prams));
    }
    #endregion

    #region 查询--用户信息
    /// <summary>
    /// 根据--姓名--得到用户信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindUserByName(string tbName)
    {
        SqlParameter[] prams = {
                                        data.MakeInParam("@marker",  SqlDbType.Char,10, Marker ),
            　　　　　　　　　　　　　　data.MakeInParam("@name",  SqlDbType.VarChar, 100,Name+"%"),
			};
        return (data.RunProcReturn("select * from tb_User where Name like @name AND (Marker=@marker)", prams, tbName));
    }
    /// <summary>
    /// 根据--用户名和密保问题--得到密保答案
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindResult(string tbName)
    {
        SqlParameter[] prams = {
                                        data.MakeInParam("@name",  SqlDbType.VarChar, 100,Name),
									    data.MakeInParam("@question",  SqlDbType.VarChar, 100, Question ),
			};
        return (data.RunProcReturn("select Result from tb_User where (Name=@name) AND (Question=@question)", prams, tbName));
    }
    /// <summary>
    /// 根据--标识--得到用户信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindUserByMarker(string tbName)
    {
        SqlParameter[] prams = {
                                        data.MakeInParam("@marker",  SqlDbType.Char,10, Marker ),
			};
        return (data.RunProcReturn("select * from tb_User where Marker=@marker", prams, tbName));
    }
    /// <summary>
    /// 得到所有--用户信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet GetAllUser(string tbName)
    {
        return (data.RunProcReturn("select * from tb_User ORDER BY ID", tbName));
    }
    #endregion

    #region 用户登录
    /// <summary>
    /// 用户登录
    /// </summary>
    /// <returns></returns>
    public DataSet UserLogin()
    {
        SqlParameter[] prams = {
            data.MakeInParam("@name",  SqlDbType.VarChar, 100,Name),
            data.MakeInParam("@pwd",  SqlDbType.VarChar, 50, Pwd),
			};
        return (data.RunProcReturn("SELECT * FROM tb_User WHERE (Name = @name) AND (Pwd = @pwd) AND (Marker='用户')", prams, "tb_User"));
    }
    /// <summary>
    /// 管理员登录
    /// </summary>
    /// <returns></returns>
    public DataSet AdminLogin()
    {
        SqlParameter[] prams = {
            data.MakeInParam("@name",  SqlDbType.VarChar, 100,Name),
            data.MakeInParam("@pwd",  SqlDbType.VarChar, 50, Pwd),
			};
        return (data.RunProcReturn("SELECT * FROM tb_User WHERE (Name = @name) AND (Pwd = @pwd) AND (Marker='管理员')", prams, "tb_User"));
    }
    #endregion
}

/// <summary>
/// 产品操作类
/// </summary>
public class ProductOperate
{
    DataBase data = new DataBase();

    #region 定义产品信息--数据结构
    private string id = "";
    private string name = "";
    private string edition = "";
    private decimal price = 0;
    private DateTime uptime = Convert.ToDateTime(DateTime.Now.ToShortDateString());
    private string upuser = "";
    private string photo = "";
    private string type = "";
    private int filesize = 0;
    private int commend = 0;
    private int loadnum = 0;
    private string environment = "";
    private string introduce = "";
    private string remark = "";
    private string accessories = "";
    /// <summary>
    /// 编号
    /// </summary>
    public string ID
    {
        get { return id; }
        set { id = value; }
    }
    /// <summary>
    /// 姓名
    /// </summary>
    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    /// <summary>
    /// 版本
    /// </summary>
    public string Edition
    {
        get { return edition; }
        set { edition = value; }
    }
    /// <summary>
    /// 价格
    /// </summary>
    public decimal Price
    {
        get { return price; }
        set { price = value; }
    }
    /// <summary>
    /// 上传时间
    /// </summary>
    public DateTime UpTime
    {
        get { return uptime; }
        set { uptime = value; }
    }
    /// <summary>
    /// 上传用户
    /// </summary>
    public string UpUser
    {
        get { return upuser; }
        set { upuser = value; }
    }
    /// <summary>
    /// 产品图片
    /// </summary>
    public string Photo
    {
        get { return photo; }
        set { photo = value; }
    }
    /// <summary>
    /// 产品类别
    /// </summary>
    public string Type
    {
        get { return type; }
        set { type = value; }
    }
    /// <summary>
    /// 文件大小
    /// </summary>
    public int FileSize
    {
        get { return filesize; }
        set { filesize = value; }
    }
    /// <summary>
    /// 推荐指数
    /// </summary>
    public int Commend
    {
        get { return commend; }
        set { commend = value; }
    }
    /// <summary>
    /// 下载次数
    /// </summary>
    public int LoadNum
    {
        get { return loadnum; }
        set { loadnum = value; }
    }
    /// <summary>
    /// 运行环境
    /// </summary>
    public string Environment
    {
        get { return environment; }
        set { environment = value; }
    }
    /// <summary>
    /// 介绍
    /// </summary>
    public string Introduce
    {
        get { return introduce; }
        set { introduce = value; }
    }
    /// <summary>
    /// 备注
    /// </summary>
    public string Remark
    {
        get { return remark; }
        set { remark = value; }
    }
    /// <summary>
    /// 附件
    /// </summary>
    public string Accessories
    {
        get { return accessories; }
        set { accessories = value; }
    }
    #endregion

    #region 添加--产品信息
    /// <summary>
    /// 添加--产品--信息
    /// </summary>
    /// <returns></returns>
    public int AddProduct()
    {
        SqlParameter[] prams = {
									    data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
                						data.MakeInParam("@name",  SqlDbType.VarChar, 100,Name ),
                                        data.MakeInParam("@edition",  SqlDbType.VarChar, 20,Edition ),
                						data.MakeInParam("@price",  SqlDbType.Money, 8, Price  ),
                						data.MakeInParam("@uptime",  SqlDbType.DateTime, 4, UpTime  ),
                						data.MakeInParam("@upuser",  SqlDbType.VarChar, 50, UpUser  ),
                						data.MakeInParam("@photo",  SqlDbType.VarChar, 200, Photo  ),
                                        data.MakeInParam("@type",  SqlDbType.VarChar, 20, Type  ),
                                        data.MakeInParam("@filesize",  SqlDbType.BigInt, 8, FileSize ),
                                        data.MakeInParam("@commend",  SqlDbType.Int, 4, Commend  ),
                                        data.MakeInParam("@loadnum",  SqlDbType.BigInt,8, LoadNum  ),
                                        data.MakeInParam("@environment",  SqlDbType.VarChar, 200, Environment  ),
                						data.MakeInParam("@introduce",  SqlDbType.VarChar, 4000, Introduce  ),
                                        data.MakeInParam("@remark",  SqlDbType.VarChar, 4000, Remark ),
                                        data.MakeInParam("@accessories",  SqlDbType.VarChar, 200,Accessories),
			};
        return (data.RunProc("INSERT INTO tb_Product (ID, Name,Edition,Price,UpTime,UpUser,Photo,Type,FileSize,Commend,LoadNum,Environment,Introduce,Remark,Accessories)"
            + " VALUES (@id,@name,@edition,@price,@uptime,@upuser,@photo,@type,@filesize,@commend,@loadnum,@environment,@introduce,@remark,@accessories)", prams));
    }
    #endregion

    #region 修改--产品信息
    /// <summary>
    /// 修改--产品--信息
    /// </summary>
    /// <returns></returns>
    public int UpdateProduct()
    {
        SqlParameter[] prams = {
                						data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
                						data.MakeInParam("@name",  SqlDbType.VarChar, 100,Name ),
                                        data.MakeInParam("@edition",  SqlDbType.VarChar, 20,Edition ),
                						data.MakeInParam("@price",  SqlDbType.Money, 8, Price  ),
                						data.MakeInParam("@uptime",  SqlDbType.DateTime, 4, UpTime  ),
                						data.MakeInParam("@upuser",  SqlDbType.VarChar, 50, UpUser  ),
                						data.MakeInParam("@photo",  SqlDbType.VarChar, 200, Photo  ),
                                        data.MakeInParam("@type",  SqlDbType.VarChar, 20, Type  ),
                                        data.MakeInParam("@filesize",  SqlDbType.BigInt, 8, FileSize ),
                                        data.MakeInParam("@commend",  SqlDbType.Int, 4, Commend  ),
                                        data.MakeInParam("@environment",  SqlDbType.VarChar, 200, Environment  ),
                						data.MakeInParam("@introduce",  SqlDbType.VarChar, 4000, Introduce  ),
                                        data.MakeInParam("@remark",  SqlDbType.VarChar, 4000, Remark ),
                                        data.MakeInParam("@accessories",  SqlDbType.VarChar, 200,Accessories),
			};
        return (data.RunProc("update tb_Product set Name=@name,Edition=@edition,Price=@price,UpTime=@uptime,UpUser=@upuser,Photo=@photo,Type=@type,"
            + "FileSize=@filesize,Commend=@commend,Environment=@environment,Introduce=@introduce,Remark=@remark,Accessories=@accessories where ID=@id", prams));
    }
    /// <summary>
    /// 修改--产品--下载次数
    /// </summary>
    /// <returns></returns>
    public int UpdateLoadNum()
    {
        SqlParameter[] prams = {
                						data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
                                        data.MakeInParam("@loadnum",  SqlDbType.BigInt,8, LoadNum  ),
			};
        return (data.RunProc("update tb_Product set LoadNum=@loadnum where ID=@id", prams));
    }
    #endregion

    #region 删除--产品信息
    /// <summary>
    /// 删除--产品--信息
    /// </summary>
    /// <returns></returns>
    public int DeleteProduct()
    {
        SqlParameter[] prams = {
						data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
			};
        return (data.RunProc("delete from tb_Product where ID=@id", prams));
    }
    #endregion

    #region 查询--产品信息
    /// <summary>
    /// 根据--编号--得到产品信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindProductByID(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
			};
        return (data.RunProcReturn("select * from tb_Product where ID=@id", prams, tbName));
    }
    /// <summary>
    /// 根据--名称--得到产品信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindProductByName(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@name",  SqlDbType.VarChar, 100,Name+"%"),
			};
        return (data.RunProcReturn("select * from tb_Product where Name like @name", prams, tbName));
    }
    /// <summary>
    /// 根据--类别--得到产品信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindProductByType(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@type",  SqlDbType.VarChar, 20, Type+"%"),
			};
        return (data.RunProcReturn("select * from tb_Product where Type like @type", prams, tbName));
    }
    /// <summary>
    /// 根据--类别--得到产品前几条信息
    /// </summary>
    /// <param name="intCount">指定要得到的记录条数</param>
    /// <param name="tbName">表名</param>
    /// <returns></returns>
    public DataSet FindTopProductByType(int intCount, string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@type",  SqlDbType.VarChar, 20, Type),
			};
        return (data.RunProcReturn("select top " + intCount + "* from tb_Product where Type=@type order by LoadNum desc", prams, tbName));
    }
    /// <summary>
    /// 根据--名称和类别--得到产品信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindProductByNT(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@name",  SqlDbType.VarChar, 100,Name+"%"),
                                        data.MakeInParam("@type",  SqlDbType.VarChar, 20, Type),
			};
        return (data.RunProcReturn("select * from tb_Product where (Name like @name) AND (Type=@type)", prams, tbName));
    }
    /// <summary>
    /// 得到所有--产品信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet GetAllProduct(string tbName)
    {
        return (data.RunProcReturn("select * from tb_Product ORDER BY ID", tbName));
    }
    #endregion
}

/// <summary>
/// 公告及新闻操作类
/// </summary>
public class NewsOperate
{
    DataBase data = new DataBase();

    #region 定义公告及新闻信息--数据结构
    private string id = "";
    private string title = "";
    private string content = "";
    private DateTime delivertime = Convert.ToDateTime(DateTime.Now.ToShortDateString());
    private string type = "新闻";
    /// <summary>
    /// 编号
    /// </summary>
    public string ID
    {
        get { return id; }
        set { id = value; }
    }
    /// <summary>
    /// 标题
    /// </summary>
    public string Title
    {
        get { return title; }
        set { title = value; }
    }
    /// <summary>
    /// 内容
    /// </summary>
    public string Content
    {
        get { return content; }
        set { content = value; }
    }
    /// <summary>
    /// 发布时间
    /// </summary>
    public DateTime DeliverTime
    {
        get { return delivertime; }
        set { delivertime = value; }
    }
    /// <summary>
    /// 类型
    /// </summary>
    public string Type
    {
        get { return type; }
        set { type = value; }
    }
    #endregion

    #region 添加--公告及新闻信息
    /// <summary>
    /// 添加--公告及新闻--信息
    /// </summary>
    /// <returns></returns>
    public int AddNews()
    {
        SqlParameter[] prams = {
									    data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
                						data.MakeInParam("@title",  SqlDbType.VarChar, 200,Title ),
                                        data.MakeInParam("@content",  SqlDbType.VarChar, 4000,Content ),
                						data.MakeInParam("@deliverTime",  SqlDbType.DateTime, 8, DeliverTime ),
                						data.MakeInParam("@type",  SqlDbType.Char, 10, Type ),
			};
        return (data.RunProc("INSERT INTO tb_News (ID,Title,Content,DeliverTime,Type)"
            + " VALUES (@id,@title,@content,@deliverTime,@type)", prams));
    }
    #endregion

    #region 修改--公告及新闻信息
    /// <summary>
    /// 修改--公告及新闻--信息
    /// </summary>
    /// <returns></returns>
    public int UpdateNews()
    {
        SqlParameter[] prams = {
                						data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
                						data.MakeInParam("@title",  SqlDbType.VarChar, 200,Title ),
                                        data.MakeInParam("@content",  SqlDbType.VarChar, 4000,Content ),
                						data.MakeInParam("@deliverTime",  SqlDbType.DateTime, 8, DeliverTime ),
                						data.MakeInParam("@type",  SqlDbType.Char, 10, Type ),
			};
        return (data.RunProc("update tb_News set Title=@title,Content=@content,DeliverTime=@deliverTime,Type=@type where ID=@id", prams));
    }
    #endregion

    #region 删除--公告及新闻信息
    /// <summary>
    /// 删除--公告及新闻--信息
    /// </summary>
    /// <returns></returns>
    public int DeleteNews()
    {
        SqlParameter[] prams = {
						data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
			};
        return (data.RunProc("delete from tb_News where ID=@id", prams));
    }
    #endregion

    #region 查询--公告及新闻信息
    /// <summary>
    /// 根据--编号--得到公告及新闻信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindNewsByID(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
			};
        return (data.RunProcReturn("select * from tb_News where ID=@id", prams, tbName));
    }
    /// <summary>
    /// 根据--标题和类别--得到公告及新闻信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindNewsByTT(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@title",  SqlDbType.VarChar, 200,Title+"%"),
                                        data.MakeInParam("@type",  SqlDbType.Char, 10, Type),
			};
        return (data.RunProcReturn("select * from tb_News where (Title like @title) AND (Type=@type)", prams, tbName));
    }
    /// <summary>
    /// 根据--类别--得到公告及新闻信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindNewsByType(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@type",  SqlDbType.Char, 10, Type),
			};
        return (data.RunProcReturn("select * from tb_News where Type=@type", prams, tbName));
    }
    /// <summary>
    /// 根据--类别--得到公告及新闻前几条信息
    /// </summary>
    /// <param name="intCount">指定要得到的记录条数</param>
    /// <param name="tbName">表名</param>
    /// <returns></returns>
    public DataSet FindTopNewsByType(int intCount, string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@type",  SqlDbType.Char, 10, Type),
			};
        return (data.RunProcReturn("select top " + intCount + "* from tb_News where Type=@type", prams, tbName));
    }
    /// <summary>
    /// 得到所有--公告及新闻信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet GetAllNews(string tbName)
    {
        return (data.RunProcReturn("select * from tb_News ORDER BY ID", tbName));
    }
    #endregion
}

/// <summary>
/// 友情链接操作类
/// </summary>
public class LinkOperate
{
    DataBase data = new DataBase();

    #region 定义友情链接信息--数据结构
    private string id = "";
    private string name = "";
    private string photo = "";
    private string laddress = "";
    /// <summary>
    /// 编号
    /// </summary>
    public string ID
    {
        get { return id; }
        set { id = value; }
    }
    /// <summary>
    /// 公司名称
    /// </summary>
    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    /// <summary>
    /// 公司图标
    /// </summary>
    public string Photo
    {
        get { return photo; }
        set { photo = value; }
    }
    /// <summary>
    /// 公司网址
    /// </summary>
    public string LAddress
    {
        get { return laddress; }
        set { laddress = value; }
    }
    #endregion

    #region 添加--友情链接信息
    /// <summary>
    /// 添加--友情链接--信息
    /// </summary>
    /// <returns></returns>
    public int AddLink()
    {
        SqlParameter[] prams = {
									    data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
                						data.MakeInParam("@name",  SqlDbType.VarChar, 100,Name ),
                                        data.MakeInParam("@photo",  SqlDbType.VarChar, 200,Photo ),
                						data.MakeInParam("@laddress",  SqlDbType.VarChar, 100, LAddress ),
			};
        return (data.RunProc("INSERT INTO tb_Link (ID,Name,Photo,LAddress) VALUES (@id,@name,@photo,@laddress)", prams));
    }
    #endregion

    #region 修改--友情链接信息
    /// <summary>
    /// 修改--友情链接--信息
    /// </summary>
    /// <returns></returns>
    public int UpdateLink()
    {
        SqlParameter[] prams = {
                						data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
                						data.MakeInParam("@name",  SqlDbType.VarChar, 100,Name ),
                                        data.MakeInParam("@photo",  SqlDbType.VarChar, 200,Photo ),
                						data.MakeInParam("@laddress",  SqlDbType.VarChar, 100, LAddress ),
			};
        return (data.RunProc("update tb_Link set Name=@name,Photo=@photo,LAddress=@laddress where ID=@id", prams));
    }
    #endregion

    #region 删除--友情链接信息
    /// <summary>
    /// 删除--友情链接--信息
    /// </summary>
    /// <returns></returns>
    public int DeleteLink()
    {
        SqlParameter[] prams = {
						data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
			};
        return (data.RunProc("delete from tb_Link where ID=@id", prams));
    }
    #endregion

    #region 查询--友情链接信息
    /// <summary>
    /// 根据--公司名称--得到友情链接信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindLinkByName(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@name",  SqlDbType.VarChar, 100,Name+"%"),
			};
        return (data.RunProcReturn("select * from tb_Link where Name like @name", prams, tbName));
    }
    /// <summary>
    /// 根据--ID--得到友情链接信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindLinkByID(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
			};
        return (data.RunProcReturn("select * from tb_Link where ID=@id", prams, tbName));
    }
    /// <summary>
    /// 根据--公司网址--得到友情链接信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindLinkByLAddress(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@laddress",  SqlDbType.VarChar, 100, LAddress),
			};
        return (data.RunProcReturn("select * from tb_Link where LAddress=@laddress)", prams, tbName));
    }
    /// <summary>
    /// 得到所有--友情链接信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet GetAllLink(string tbName)
    {
        return (data.RunProcReturn("select * from tb_Link ORDER BY ID", tbName));
    }
    #endregion
}

/// <summary>
/// 留言簿操作类
/// </summary>
public class LeaveWordOperate
{
    DataBase data = new DataBase();

    #region 定义留言--数据结构
    private string id = "";
    private string title = "";
    private string host = "";
    private DateTime leavetime = Convert.ToDateTime(DateTime.Now.ToShortDateString());
    private string content = "";
    /// <summary>
    /// 留言编号
    /// </summary>
    public string ID
    {
        get { return id; }
        set { id = value; }
    }
    /// <summary>
    /// 留言标题
    /// </summary>
    public string Title
    {
        get { return title; }
        set { title = value; }
    }
    /// <summary>
    /// 留言人
    /// </summary>
    public string Host
    {
        get { return host; }
        set { host = value; }
    }
    /// <summary>
    /// 留言日期
    /// </summary>
    public DateTime LeaveTime
    {
        get { return leavetime; }
        set { leavetime = value; }
    }
    /// <summary>
    /// 留言内容
    /// </summary>
    public string Content
    {
        get { return content; }
        set { content = value; }
    }
    #endregion

    #region 添加--留言信息
    /// <summary>
    /// 添加--留言--信息
    /// </summary>
    /// <returns></returns>
    public int AddLeaveWord()
    {
        SqlParameter[] prams = {
									    data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
                						data.MakeInParam("@title",  SqlDbType.VarChar, 200,Title ),
                                        data.MakeInParam("@host",  SqlDbType.VarChar, 100,Host ),
                						data.MakeInParam("@leavetime",  SqlDbType.DateTime, 4, LeaveTime ),
                						data.MakeInParam("@content",  SqlDbType.VarChar, 4000, Content ),
			};
        return (data.RunProc("INSERT INTO tb_LeaveWord (ID,Title,Host,LeaveTime,Content)"
            + " VALUES (@id,@title,@host,@leavetime,@content)", prams));
    }
    #endregion

    #region 修改--留言信息
    /// <summary>
    /// 修改--留言--信息
    /// </summary>
    /// <returns></returns>
    public int UpdateLeaveWord()
    {
        SqlParameter[] prams = {
                						data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
                						data.MakeInParam("@title",  SqlDbType.VarChar, 200,Title ),
                						data.MakeInParam("@leavetime",  SqlDbType.DateTime, 4, LeaveTime ),
                						data.MakeInParam("@content",  SqlDbType.VarChar, 4000, Content ),
			};
        return (data.RunProc("update tb_LeaveWord set Title=@title,LeaveTime=@leavetime,Content=@content where ID=@id", prams));
    }
    #endregion

    #region 删除--留言信息
    /// <summary>
    /// 删除--留言--信息
    /// </summary>
    /// <returns></returns>
    public int DeleteLeaveWord()
    {
        SqlParameter[] prams = {
						data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
			};
        return (data.RunProc("delete from tb_LeaveWord where ID=@id", prams));
    }
    #endregion

    #region 查询--留言信息
    /// <summary>
    /// 根据--编号--得到留言信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindLeaveWordByID(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
			};
        return (data.RunProcReturn("select * from tb_LeaveWord where ID=@id", prams, tbName));
    }
    /// <summary>
    /// 根据--标题--得到留言信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindLeaveWordByTitle(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@title",  SqlDbType.VarChar, 200,Title+"%"),
			};
        return (data.RunProcReturn("select * from tb_LeaveWord where Title like @title", prams, tbName));
    }
    /// <summary>
    /// 得到所有--留言信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet GetAllLeaveWord(string tbName)
    {
        return (data.RunProcReturn("select * from tb_LeaveWord ORDER BY LeaveTime", tbName));
    }
    #endregion
}

/// <summary>
/// 回复留言操作类
/// </summary>
public class RevertOperate
{
    DataBase data = new DataBase();

    #region 定义回复留言--数据结构
    private string id = "";
    private string leaveid = "";
    private string content = "";
    private string revertuser = "";
    private DateTime reverttime = Convert.ToDateTime(DateTime.Now.ToShortDateString());
    /// <summary>
    /// 回复留言编号
    /// </summary>
    public string ID
    {
        get { return id; }
        set { id = value; }
    }
    /// <summary>
    /// 留言编号
    /// </summary>
    public string LeaveID
    {
        get { return leaveid; }
        set { leaveid = value; }
    }
    /// <summary>
    /// 回复内容
    /// </summary>
    public string Content
    {
        get { return content; }
        set { content = value; }
    }
    /// <summary>
    /// 回复人
    /// </summary>
    public string RevertUser
    {
        get { return revertuser; }
        set { revertuser = value; }
    }
    /// <summary>
    /// 回复时间
    /// </summary>
    public DateTime RevertTime
    {
        get { return reverttime; }
        set { reverttime = value; }
    }
    #endregion

    #region 添加--回复信息
    /// <summary>
    /// 添加--回复信息
    /// </summary>
    /// <returns></returns>
    public int AddRevert()
    {
        SqlParameter[] prams = {
									    data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
                                        data.MakeInParam("@leaveid",  SqlDbType.VarChar, 20,LeaveID ),
                						data.MakeInParam("@content",  SqlDbType.VarChar, 4000,Content ),
                						data.MakeInParam("@revertuser",  SqlDbType.VarChar, 100, RevertUser ),
                						data.MakeInParam("@reverttime",  SqlDbType.SmallDateTime, 4,RevertTime ),
			};
        return (data.RunProc("INSERT INTO tb_Revert (ID,LeaveID,Content,RevertUser,RevertTime) VALUES (@id,@leaveid,@content,@revertuser,@reverttime)", prams));
    }
    #endregion

    #region 修改--回复信息
    /// <summary>
    /// 修改--回复信息
    /// </summary>
    /// <returns></returns>
    public int UpdateRevert()
    {
        SqlParameter[] prams = {
									    data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
                                        data.MakeInParam("@leaveid",  SqlDbType.VarChar, 20,LeaveID ),
                						data.MakeInParam("@content",  SqlDbType.VarChar, 4000,Content ),
			};
        return (data.RunProc("update tb_Revert set LeaveID=@leaveid,Content=@content where ID=@id", prams));
    }
    #endregion

    #region 删除--回复信息
    /// <summary>
    /// 删除--回复信息
    /// </summary>
    /// <returns></returns>
    public int DeleteRevert()
    {
        SqlParameter[] prams = {
									    data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
			};
        return (data.RunProc("delete from tb_Revert where ID=@id", prams));
    }
    /// <summary>
    /// 根据留言编号删除--回复信息
    /// </summary>
    /// <returns></returns>
    public int DeleteRevertByLID()
    {
        SqlParameter[] prams = {
									    data.MakeInParam("@leaveid",  SqlDbType.VarChar, 20,LeaveID ),
			};
        return (data.RunProc("delete from tb_Revert where LeaveID=@leaveid", prams));
    }
    #endregion

    #region 查询--回复信息
    /// <summary>
    /// 根据--留言编号--得到回复信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindRevertByLID(string tbName)
    {
        SqlParameter[] prams = {
									    data.MakeInParam("@leaveid",  SqlDbType.VarChar, 20,LeaveID ),
			};
        return (data.RunProcReturn("select * from tb_Revert where LeaveID=@leaveid ORDER BY RevertTime", prams, tbName));
    }
    /// <summary>
    /// 得到所有--回复信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet GetAllRevert(string tbName)
    {
        return (data.RunProcReturn("select * from tb_Revert ORDER BY RevertTime", tbName));
    }
    #endregion
}

/// <summary>
/// 招聘信息操作类
/// </summary>
public class EngageOperate
{
    DataBase data = new DataBase();

    #region 定义招聘信息--数据结构
    private string id = "";
    private string eposition = "";
    private string pintroduce = "";
    private string schoolage = "";
    private string prequest = "";
    private string department = "";
    private string place = "";
    private int num = 0;
    private DateTime puttime = Convert.ToDateTime(DateTime.Now.ToShortDateString());
    private string email = "";
    /// <summary>
    /// 编号
    /// </summary>
    public string ID
    {
        get { return id; }
        set { id = value; }
    }
    /// <summary>
    /// 招聘职位
    /// </summary>
    public string EPosition
    {
        get { return eposition; }
        set { eposition = value; }
    }
    /// <summary>
    /// 职位描述
    /// </summary>
    public string PIntroduce
    {
        get { return pintroduce; }
        set { pintroduce = value; }
    }
    /// <summary>
    /// 要求学历
    /// </summary>
    public string SchoolAge
    {
        get { return schoolage; }
        set { schoolage = value; }
    }
    /// <summary>
    /// 职位要求
    /// </summary>
    public string PRequest
    {
        get { return prequest; }
        set { prequest = value; }
    }
    /// <summary>
    /// 工作部门
    /// </summary>
    public string Department
    {
        get { return department; }
        set { department = value; }
    }
    /// <summary>
    /// 工作地点
    /// </summary>
    public string Place
    {
        get { return place; }
        set { place = value; }
    }
    /// <summary>
    /// 招聘人数
    /// </summary>
    public int Num
    {
        get { return num; }
        set { num = value; }
    }
    /// <summary>
    /// 发布日期
    /// </summary>
    public DateTime PutTime
    {
        get { return puttime; }
        set { puttime = value; }
    }
    /// <summary>
    /// 联系邮件
    /// </summary>
    public string Email
    {
        get { return email; }
        set { email = value; }
    }
    #endregion

    #region 添加--招聘信息
    /// <summary>
    /// 添加--招聘--信息
    /// </summary>
    /// <returns></returns>
    public int AddEngage()
    {
        SqlParameter[] prams = {
									    data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
                						data.MakeInParam("@eposition",  SqlDbType.VarChar, 20,EPosition ),
                                        data.MakeInParam("@pintroduce",  SqlDbType.VarChar, 500,PIntroduce ),
                						data.MakeInParam("@schoolage",  SqlDbType.Char, 10, SchoolAge ),
                						data.MakeInParam("@prequest",  SqlDbType.VarChar, 4000, PRequest ),
                						data.MakeInParam("@department",  SqlDbType.VarChar, 30, Department ),
                						data.MakeInParam("@place",  SqlDbType.VarChar, 100, Place ),
                                        data.MakeInParam("@num",  SqlDbType.Int, 4, Num ),
                                        data.MakeInParam("@puttime",  SqlDbType.SmallDateTime, 4,PutTime ),
                                        data.MakeInParam("@email",  SqlDbType.VarChar, 100, Email ),
			};
        return (data.RunProc("INSERT INTO tb_Engage (ID,EPosition,PIntroduce,SchoolAge,PRequest,Department,Place,Num,PutTime,Email)"
            + " VALUES (@id,@eposition,@pintroduce,@schoolage,@prequest,@department,@place,@num,@puttime,@email)", prams));
    }
    #endregion

    #region 修改--招聘信息
    /// <summary>
    /// 修改--招聘--信息
    /// </summary>
    /// <returns></returns>
    public int UpdateEngage()
    {
        SqlParameter[] prams = {
                						data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
                						data.MakeInParam("@eposition",  SqlDbType.VarChar, 20,EPosition ),
                                        data.MakeInParam("@pintroduce",  SqlDbType.VarChar, 500,PIntroduce ),
                						data.MakeInParam("@schoolage",  SqlDbType.Char, 10, SchoolAge ),
                						data.MakeInParam("@prequest",  SqlDbType.VarChar, 4000, PRequest ),
                						data.MakeInParam("@department",  SqlDbType.VarChar, 30, Department ),
                						data.MakeInParam("@place",  SqlDbType.VarChar, 100, Place ),
                                        data.MakeInParam("@num",  SqlDbType.Int, 4, Num ),
                                        data.MakeInParam("@puttime",  SqlDbType.SmallDateTime, 4,PutTime ),
                                        data.MakeInParam("@email",  SqlDbType.VarChar, 100, Email ),
			};
        return (data.RunProc("update tb_Engage set EPosition=@eposition,PIntroduce=@pintroduce,SchoolAge=@schoolage,PRequest=@prequest,"
            + "Department=@department,Place=@place,Num=@num,PutTime=@puttime,Email=@email where ID=@id", prams));
    }
    #endregion

    #region 删除--招聘信息
    /// <summary>
    /// 删除--招聘--信息
    /// </summary>
    /// <returns></returns>
    public int DeleteEngage()
    {
        SqlParameter[] prams = {
						data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
			};
        return (data.RunProc("delete from tb_Engage where ID=@id", prams));
    }
    #endregion

    #region 查询--招聘信息
    /// <summary>
    /// 根据--编号--得到招聘信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindEngageByID(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@id",  SqlDbType.VarChar, 20, ID),
			};
        return (data.RunProcReturn("select * from tb_Engage where ID=@id order by PutTime", prams, tbName));
    }
    /// <summary>
    /// 根据--职位--得到招聘信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindEngageByName(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@eposition",  SqlDbType.VarChar, 20,EPosition+"%"),
			};
        return (data.RunProcReturn("select * from tb_Engage where EPosition like @eposition order by PutTime", prams, tbName));
    }
    /// <summary>
    /// 根据--工作地点--得到招聘信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet FindEngageByPlace(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@place",  SqlDbType.VarChar, 100, Place+"%"),
			};
        return (data.RunProcReturn("select * from tb_Engage where Place like @place", prams, tbName));
    }
    /// <summary>
    /// 根据--工作部门--得到招聘信息
    /// </summary>
    /// <param name="tbName">表名</param>
    /// <returns></returns>
    public DataSet FindEngageByDepartment(string tbName)
    {
        SqlParameter[] prams = {
            　　　　　　　　　　　　　　data.MakeInParam("@department",  SqlDbType.VarChar, 30, Department+"%"),
			};
        return (data.RunProcReturn("select * from tb_Engage where Department like @department", prams, tbName));
    }
    /// <summary>
    /// 得到所有--招聘信息
    /// </summary>
    /// <param name="tbName"></param>
    /// <returns></returns>
    public DataSet GetAllEngage(string tbName)
    {
        return (data.RunProcReturn("select * from tb_Engage ORDER BY PutTime", tbName));
    }
    #endregion
}
