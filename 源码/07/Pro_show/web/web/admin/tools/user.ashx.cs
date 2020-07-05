using Bll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using web.Tools;

namespace web.admin.tools
{
    /// <summary>
    /// user 的摘要说明
    /// </summary>
    public class user : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string t = HttpContext.Current.Request.Form["t"];//干什么用的
            switch (t)
            {
                case "1":
                    Login(context);
                    break;
                case "2":
                    Out(context);
                    break;
                case "3":
                    GetUserList(context);
                    break;
                case "4":
                    GetUserCount(context);
                    break;
                case "5":
                    GetModelAdminByUserName(context);
                    break;
                case "6":
                    SaveUser(context);
                    break;
                case "7":
                    GetCodeGroup(context);
                    break;
                case "8":
                    GetCode(context);
                    break;
                case "9":
                    GetCodeCount(context);
                    break;
                case "10":
                    SetStatus(context);
                    break;
                case "11":
                    GetCodeText(context);
                    break;
                case "12":
                    UpdateCode(context);
                    break;
                case "13":
                    AddCode(context);
                    break;
            }
        }
        //用户登录
        public void Login(HttpContext context)
        {
            show_userBll bll = new show_userBll();
            string userName = HttpContext.Current.Request.Form["userName"];
            string pwd = HttpContext.Current.Request.Form["pwd"];
            string code = HttpContext.Current.Request.Form["code"];
            if (HttpContext.Current.Session["code"] == null)
            {
                context.Response.Write("{\"status\":\"验证码过期\"}");
                return;
            }
            if (HttpContext.Current.Session["code"].ToString().ToLower() != code.ToLower())
            {
                context.Response.Write("{\"status\":\"验证码不正确\"}");
                return;
            }
            string userId = bll.AdminLogin(userName, pwd);
            if (userId != "")
            {
                HttpContext.Current.Session["adminUserName"] = userName;
                HttpContext.Current.Session["UserName"] = userName;
                HttpContext.Current.Session["userID"] = userId;
                context.Response.Write("{\"status\":\"0\"}");
            }
            else
            {
                context.Response.Write("{\"status\":\"用户名密码不正确\"}");
            }
        }
        /// <summary>
        /// 用户退出
        /// </summary>
        /// <param name="context"></param>
        public void Out(HttpContext context)
        {
            HttpContext.Current.Session["adminUserName"] = null;
            context.Response.Write("{\"status\":\"0\"}");
        }
        /// <summary>
        /// 获取用户列表
        /// </summary>
        /// <param name="context"></param>
        public void GetUserList(HttpContext context)
        {
            string userName = HttpContext.Current.Request.Form["userName"];
            string phone = HttpContext.Current.Request.Form["phone"];
            string Email = HttpContext.Current.Request.Form["Email"];
            string status = HttpContext.Current.Request.Form["status"];
            string pageNum = HttpContext.Current.Request.Form["pageNum"];
            string RowCount = HttpContext.Current.Request.Form["RowCount"];
            show_userBll bll = new show_userBll();
            DataTable dt = bll.GetUserList(userName, phone, Email, status, int.Parse(pageNum), int.Parse(RowCount));
            if (dt != null)
            {
                string json = f.ToJson(dt);
                json = json.Replace("\"", "\\\"");
                context.Response.Write("{\"status\":\"" + json + "\"}");
            }
            else
            {
                context.Response.Write("{\"status\":\"-1\"}");
            }
        }
        /// <summary>
        /// 获取用户列表count
        /// </summary>
        /// <param name="context"></param>
        public void GetUserCount(HttpContext context)
        {
            string userName = HttpContext.Current.Request.Form["userName"];
            string phone = HttpContext.Current.Request.Form["phone"];
            string Email = HttpContext.Current.Request.Form["Email"];
            string status = HttpContext.Current.Request.Form["status"];
            show_userBll bll = new show_userBll();
            int count = bll.GetUserCount(userName, phone, Email, status);
            context.Response.Write("{\"status\":\"" + count + "\"}");
        }

        /// <summary>
        /// 根据用户名查询用户信息
        /// </summary>
        /// <param name="context"></param>
        public void GetModelAdminByUserName(HttpContext context)
        {
            show_userBll bll = new show_userBll();
            string uName = HttpContext.Current.Request.Form["uName"];
            Model.User user = bll.GetModelAdminByUserName(uName);
            if (user != null)
            {
                context.Response.Write("{\"status\":\"0\",\"Phone\":\"" + user.Phone + "\",\"email\":\"" + user.email + "\",\"qq\":\"" + user.qq + "\",\"wechat\":\"" + user.wechat + "\",\"gender\":\"" + user.gender + "\",\"addtime\":\"" + user.addtime + "\",\"state\":\"" + user.state_code_id + "\"}");
            }
            else
            {
                context.Response.Write("{\"status\":\"-1\"}");
            }
        }
        /// <summary>
        /// 修改用户信息
        /// </summary>
        /// <param name="context"></param>
        public void SaveUser(HttpContext context)
        {
            string Phone = HttpContext.Current.Request.Form["Phone"];
            string email = HttpContext.Current.Request.Form["email"];
            string qq = HttpContext.Current.Request.Form["qq"];
            string wechat = HttpContext.Current.Request.Form["wechat"];
            string gender = HttpContext.Current.Request.Form["gender"];
            string addtime = HttpContext.Current.Request.Form["addtime"];
            string state_code_id = HttpContext.Current.Request.Form["state_code_id"];
            string user_name = HttpContext.Current.Request.Form["user_name"];
            show_userBll bll = new show_userBll();
            Model.User user = new Model.User();
            user.Phone = Phone;
            user.email = email;
            user.qq = qq;
            user.wechat = wechat;
            user.gender = gender;
            user.addtime = addtime;
            user.state_code_id = state_code_id;
            user.user_name = user_name;
            bll.UpdateUserModel(user);
            context.Response.Write("{\"status\":\"0\"}");
        }
        /// <summary>
        /// 查询所有的字典类型
        /// </summary>
        /// <param name="context"></param>
        public void GetCodeGroup(HttpContext context)
        {
            CodeBll bll = new CodeBll();
            DataTable dt = bll.GetGroung();
            if (dt != null)
            {
                string json = f.ToJson(dt);
                json = json.Replace("\"", "\\\"");
                context.Response.Write("{\"status\":\"" + json + "\"}");
            }
            else
            {
                context.Response.Write("{\"status\":\"-1\"}");
            }
        }
        /// <summary>
        /// 按照字典类型查询字典信息
        /// </summary>
        /// <param name="context"></param>
        public void GetCode(HttpContext context)
        {
            CodeBll bll = new CodeBll();
            string codegroup = HttpContext.Current.Request.Form["codegroup"];
            string pageNo = HttpContext.Current.Request.Form["pageNum"];
            string pageSize = HttpContext.Current.Request.Form["RowCount"];
            DataTable dt = bll.GetCode(codegroup, int.Parse(pageNo), int.Parse(pageSize));
            if (dt != null)
            {
                string json = f.ToJson(dt);
                json = json.Replace("\"", "\\\"");
                context.Response.Write("{\"status\":\"" + json + "\"}");
            }
            else
            {
                context.Response.Write("{\"status\":\"-1\"}");
            }
        }
        /// <summary>
        /// 按照字典类型查询字典信息总数
        /// </summary>
        /// <param name="context"></param>
        public void GetCodeCount(HttpContext context)
        {
            CodeBll bll = new CodeBll();
            string codegroup = HttpContext.Current.Request.Form["codegroup"];
            int count = bll.GetCodeCount(codegroup);
            context.Response.Write("{\"status\":\"" + count + "\"}");
        }
        /// <summary>
        /// 设置字典状态
        /// </summary>
        /// <param name="context"></param>
        public void SetStatus(HttpContext context)
        {
            CodeBll bll = new CodeBll();
            string codeid = HttpContext.Current.Request.Form["codeid"];
            string groupid = HttpContext.Current.Request.Form["groupid"];
            string status = HttpContext.Current.Request.Form["status"];
            bll.SetStatus(codeid, groupid, status);
            context.Response.Write("{\"status\":\"0\"}");
        }
        /// <summary>
        /// 查询字典名称
        /// </summary>
        /// <param name="context"></param>
        public void GetCodeText(HttpContext context)
        {
            CodeBll bll = new CodeBll();
            string codeid = HttpContext.Current.Request.Form["codeid"];
            string groupid = HttpContext.Current.Request.Form["groupid"];
            string msg=bll.GetStrByGroupCode(groupid, codeid);
            context.Response.Write("{\"status\":\""+ msg + "\"}");
        }
        /// <summary>
        /// 修改字典项
        /// </summary>
        /// <param name="context"></param>
        public void UpdateCode(HttpContext context)
        {
            CodeBll bll = new CodeBll();
            string codeid = HttpContext.Current.Request.Form["codeid"];
            string groupid = HttpContext.Current.Request.Form["groupid"];
            string msg = HttpContext.Current.Request.Form["msg"];
            bll.UpdateCode(codeid, groupid, msg);
            context.Response.Write("{\"status\":\"0\"}");
        }
        /// <summary>
        /// 添加字典项
        /// </summary>
        /// <param name="context"></param>
        public void AddCode(HttpContext context)
        {
            CodeBll bll = new CodeBll();
            string groupid = HttpContext.Current.Request.Form["groupid"];
            string msg = HttpContext.Current.Request.Form["msg"];
            bll.AddCode(groupid, msg);
            context.Response.Write("{\"status\":\"0\"}");
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