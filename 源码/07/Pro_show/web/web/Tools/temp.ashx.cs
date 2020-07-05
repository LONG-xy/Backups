using Bll;
using System.Data;

using System;
using System.Web;


namespace web.Tools
{
    /// <summary>
    /// temp 的摘要说明
    /// </summary>
    public class temp : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        //返回 -1 为失败
        public void ProcessRequest(HttpContext context)
        {
            //干什么用的
            string t = HttpContext.Current.Request.Form["t"];
            switch (t)
            {
                case "1":
                    //获取模板
                    GetTemp(context);
                    break;
                case "2":
                    //添加点击次数
                    AddMouseClick(context);
                    break;
                case "3":
                    //获取模板详细信息
                    GetModel(context);
                    break;
                case "4":
                    //创建模板
                    CreateTemp(context);
                    break;
                case "5":
                    //获取此人的场景列表
                    GetSence(context);
                    break;
                case "6":
                    //删除场景
                    DeleteSence(context);
                    break;
                case "7":
                    //复制场景
                    CopeSence(context);
                    break;
                case "8":
                    //赠送场景
                    GiveSence(context);
                    break;
                case "9":
                    //使用模板
                    UseTemp(context);
                    break;
                case "10":
                    //获取用户拥有场景的数量
                    GetCount(context);
                    break;
                case "11":
                    //后台应用模板
                    AdminUserTemp(context);
                    break;

            }
        }

        /// <summary>
        /// 创建场景
        /// </summary>
        /// <param name="context"></param>
        public void CreateTemp(HttpContext context)
        {
            //验证用户是否登录
            if (HttpContext.Current.Session["userID"] == null)
            {
                //如果没有登录向前台返回-1
                context.Response.Write("{\"status\":\"-1\"}");
                return;
            }
            sceneBll bll = new sceneBll();
            //获取前台传过来的类型
            string hyid = HttpContext.Current.Request.Form["hyid"];
            //获取登录用户id
            string userId = HttpContext.Current.Session["userID"].ToString();
            //生成一个唯一id
            string sceneCode = Guid.NewGuid().ToString();
            //创建默认场景
            bll.DefaultScene(userId, hyid, sceneCode);
            //创建默认页面
            bll.DefaultScenePage(sceneCode);
            //向前台返回创建的唯一id
            context.Response.Write("{\"status\":\"" + sceneCode + "\"}");
        }

        /// <summary>
        /// 获取模板
        /// </summary>
        /// <param name="context"></param>
        public void GetTemp(HttpContext context)
        {
            //行业
            string H = HttpContext.Current.Request.Form["H"];
            //场景
            string C = HttpContext.Current.Request.Form["C"];
            //免费还是全部 全部为0 免费为1
            string orderByFree = HttpContext.Current.Request.Form["orderByFree"];
            //最新发布还是最受欢迎 1为最新发布 0为最受欢迎
            string OrderByNew = HttpContext.Current.Request.Form["OrderByNew"];
            //当前多少页
            string PageInt = HttpContext.Current.Request.Form["PageInt"];
            //每页多少行
            string CountRow = HttpContext.Current.Request.Form["CountRow"];
            //查询语句
            string SerachStr = HttpContext.Current.Request.Form["SerachStr"];
            TempsBll BLL = new TempsBll();
            //获取所有模板
            DataTable dt = BLL.GetTable(int.Parse(H), int.Parse(C), int.Parse(orderByFree), int.Parse(OrderByNew), int.Parse(PageInt), int.Parse(CountRow), f.MyEncodeInputString(SerachStr));
            if (dt == null)
            {
                //如果没有查询到模板就向前台返回-1
                context.Response.Write("{\"status\":\"-1\"}");
                return;
            }
            //格式会查询到的内容，返回到前台
            string json = f.ToJson(dt);
            json = json.Replace("\"", "\\\"");
            context.Response.Write("{\"status\":\"" + json + "\"}");
        }

        /// <summary>
        /// 添加点击次数
        /// </summary>
        /// <param name="context"></param>
        public void AddMouseClick(HttpContext context)
        {
            //获取前台传递过来的模板编号
            string temp_code = HttpContext.Current.Request.Form["temp_code"];
            TempsBll bll = new TempsBll();
            //添加点击次数
            bll.AddNum(temp_code);
            context.Response.Write("{\"status\":\"0\"}");
            return;
        }

        /// <summary>
        /// 获取模板详细信息
        /// </summary>
        /// <param name="context"></param>
        public void GetModel(HttpContext context)
        {
            //获取前台传递过来的模板编号
            string temp_code = HttpContext.Current.Request.Form["temp_code"];
            TempsBll bll = new TempsBll();
            //获取模板详细信息
            Model.temp t = bll.GetModel(temp_code);
            context.Response.Write("{\"status\":\"0\",\"cover\":\"" + t.cover + "\",\"des\":\"" + t.des + "\",\"authorName\":\"" + t.authorName + "\",\"author\":\"" + t.author + "\",\"MouseClick\":\"" + t.MouseClick + "\",\"Money\":\"" + t.Money + "\"}");
            return;
        }

        /// <summary>
        /// 获取此人的场景列表
        /// </summary>
        /// <param name="context"></param>
        public void GetSence(HttpContext context)
        {
            //验证用户是否登录
            if (HttpContext.Current.Session["userID"] != null)
            {
                //获取用户登录的用户id
                string userId = HttpContext.Current.Session["userID"].ToString();
                //获取前台传递过来的查询信息
                string selectStr= HttpContext.Current.Request.Form["selectStr"];
                //获取前台传递过来的类型
                string hnagye= HttpContext.Current.Request.Form["hnagye"];
                //获取当前页数
                string PageInt = HttpContext.Current.Request.Form["PageInt"];
                //获取每页多少行
                string CountRow = HttpContext.Current.Request.Form["CountRow"];
                sceneBll bll = new sceneBll();
                //获取此人的场景列表
                DataTable dt = bll.GetSenceByUserId(userId, selectStr, hnagye, int.Parse(PageInt), int.Parse(CountRow));
                if (dt == null)
                {
                    //如果没有场景列表，就向前台传递-1
                    context.Response.Write("{\"status\":\"-1\"}");
                    return;
                }
                //格式化后台获取到的信息
                string json = f.ToJson(dt);
                json = json.Replace("\"", "\\\"");
                context.Response.Write("{\"status\":\"" + json + "\"}");
            }
            else
            {
                context.Response.Write("{\"status\":\"-1\"}");
                return;
            }
        }

        /// <summary>
        /// 删除场景
        /// </summary>
        /// <param name="context"></param>
        public void DeleteSence(HttpContext context)
        {
            //验证用户是否登录
            if (HttpContext.Current.Session["userID"] != null)
            {
                //获取前台传递过来的场景id
                string id = HttpContext.Current.Request.Form["id"];
                sceneBll bll = new sceneBll();
                //删除场景
                if (bll.DeleteSence(id))
                {
                    context.Response.Write("{\"status\":\"0\"}");
                    return;
                }
                else
                {
                    context.Response.Write("{\"status\":\"-1\"}");
                    return;
                }
            }
            else
            {
                context.Response.Write("{\"status\":\"-1\"}");
                return;
            }
        }

        /// <summary>
        /// 复制场景
        /// </summary>
        /// <param name="context"></param>
        public void CopeSence(HttpContext context)
        {
            //获取用户是否登录
            if (HttpContext.Current.Session["userID"] != null)
            {
                sceneBll bll = new sceneBll();
                //获取前台传递过来的场景id
                string id = HttpContext.Current.Request.Form["id"];
                //复制场景
                if (bll.CopeSence(id, HttpContext.Current.Session["userID"].ToString()))
                {
                    context.Response.Write("{\"status\":\"0\"}");
                    return;
                }
                else
                {
                    context.Response.Write("{\"status\":\"-1\"}");
                    return;
                }
            }
            else
            {
                context.Response.Write("{\"status\":\"-1\"}");
                return;
            }

        }
        /// <summary>
        /// 赠送场景
        /// </summary>
        /// <param name="context"></param>
        public void GiveSence(HttpContext context)
        {
            //获取用户是否登录
            if (HttpContext.Current.Session["userID"] != null)
            {
                sceneBll bll = new sceneBll();
                //获取场景id
                string id = HttpContext.Current.Request.Form["id"];
                //赠送的用户名
                string uName = HttpContext.Current.Request.Form["uName"];
                show_userBll ubll = new show_userBll();
                //根据用户名查询用户id
                string uid = ubll.GetUidByuserName(uName);
                if (uid == "")
                {
                    context.Response.Write("{\"status\":\"-1\"}");
                    return;
                }
                //赠送场景
                if (bll.CopeSence(id, uid))
                {
                    context.Response.Write("{\"status\":\"0\"}");
                    return;
                }
                else
                {
                    context.Response.Write("{\"status\":\"-1\"}");
                    return;
                }
            }
            else
            {
                context.Response.Write("{\"status\":\"-1\"}");
                return;
            }
        }
        /// <summary>
        /// 用模板
        /// </summary>
        /// <param name="context"></param>
        public void UseTemp(HttpContext context)
        {
            //验证用户是否登录
            if (HttpContext.Current.Session["userID"] != null)
            {
                //获取前台传递过来的模板编号
                string temp_code = HttpContext.Current.Request.Form["temp_code"];
                //获取有用户登录的id
                string userId = HttpContext.Current.Session["userID"].ToString();
                TempsBll bll = new TempsBll();
                //是否模板
                string msg = bll.CopeTemp(temp_code, userId);
                context.Response.Write("{\"status\":\"" + msg + "\"}");
            }
            else
            {
                context.Response.Write("{\"status\":\"-1\"}");
                return;
            }
        }
        /// <summary>
        /// 后台应用模板
        /// </summary>
        /// <param name="context"></param>
        public void AdminUserTemp(HttpContext context)
        {
            //获取前台传递过来的模板编号
            string temp_code = HttpContext.Current.Request.Form["temp_code"];
            //设置用户id
            string userId = "fb7e2fb3212443b1b9c954e98a0c8c26";
            TempsBll bll = new TempsBll();
            //复制模板
            string msg = bll.CopeTemp(temp_code, userId);
            context.Response.Write("{\"status\":\"" + msg + "\"}");
        }
        /// <summary>
        /// 获取用户拥有场景的数量
        /// </summary>
        /// <param name="context"></param>
        public void GetCount(HttpContext context)
        {
            //验证用户是否登录
            if (HttpContext.Current.Session["userID"] != null)
            {
                sceneBll bll = new sceneBll();
                //获取此人拥有的场景数量
                int count=bll.GetSenceCount(HttpContext.Current.Session["userID"].ToString());
                context.Response.Write("{\"status\":\""+ count + "\"}");
            }
            else
            {
                context.Response.Write("{\"status\":\"-1\"}");
                return;
            }
        }
        
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}