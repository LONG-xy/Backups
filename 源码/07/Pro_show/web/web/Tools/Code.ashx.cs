using Bll;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;


namespace web.Tools
{
    /// <summary>
    /// Code 的摘要说明
    /// </summary>
    public class Code : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        //返回 -1 为失败
        public void ProcessRequest(HttpContext context)
        {
            string t = HttpContext.Current.Request.Form["t"];//干什么用的
            switch (t)
            {
                case "1":
                    //根据分组id获取字典信息
                    GetCode(context);
                    break;
            }
        }

        /// <summary>
        /// 根据分组id获取字典信息
        /// </summary>
        /// <param name="context"></param>
        public void GetCode(HttpContext context)
        {
            //获取前台传递过来的分组id
            string GID=HttpContext.Current.Request.Form["Gid"];//分组id
            CodeBll bll = new CodeBll();
            //根据分组id获取数据库里面的一组数据
            DataTable dt=bll.GetTableByGroup(GID, 0);
            if (dt == null)
            {
                //如果后台没有数据，就向前台传递-1
                context.Response.Write("{\"status\":\"-1\"}");
                return;
            }
            //格式化后台传递过来的列表
            string json = f.ToJson(dt);
            json = json.Replace("\"", "\\\"");
            context.Response.Write("{\"status\":\"" + json + "\"}");
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