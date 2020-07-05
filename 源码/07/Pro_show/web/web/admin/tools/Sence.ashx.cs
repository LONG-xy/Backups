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
    /// Sence 的摘要说明
    /// </summary>
    public class Sence : IHttpHandler
    {
        private object sceneDal;

        public void ProcessRequest(HttpContext context)
        {
            string t = HttpContext.Current.Request.Form["t"];//干什么用的
            switch (t)
            {
                case "1":
                    GetSencelist(context);
                    break;
                case "2":
                    GetSenceCount(context);
                    break;
                case "3":
                    SetModel(context);
                    break;
                case "4":
                    GetSenceModel(context);
                    break;
                case "5":
                    UpdateSence(context);
                    break;
                case "6":
                    GetWebSencelist(context);
                    break;
                case "7":
                    webModel(context);
                    break;
                case "8":
                    shSence(context);
                    break;
                case "9":
                    GetWebSenceCount(context);
                    break;
                case "10":
                    GetTempByAdmin(context);
                    break;
                case "11":
                    GetTempByAdminCount(context);
                    break;
                case "12":
                    DeleteTemp(context);
                    break;
            }
        }
        /// <summary>
        /// 获取场景列表
        /// </summary>
        /// <param name="context"></param>
        public void GetSencelist(HttpContext context)
        {
            string userName = HttpContext.Current.Request.Form["userName"];
            string senceName = HttpContext.Current.Request.Form["senceName"];
            string Code = HttpContext.Current.Request.Form["Code"];
            string isModel = HttpContext.Current.Request.Form["isModel"];
            string SenceType = HttpContext.Current.Request.Form["SenceType"];
            string State = HttpContext.Current.Request.Form["State"];
            string pageNum = HttpContext.Current.Request.Form["pageNum"];
            string RowCount = HttpContext.Current.Request.Form["RowCount"];

            sceneBll bll = new sceneBll();
            DataTable dt = bll.GetUserCenceAll(userName, senceName, Code, isModel, SenceType, State, int.Parse(pageNum), int.Parse(RowCount));
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
        /// 获取总条数
        /// </summary>
        /// <param name="context"></param>
        public void GetSenceCount(HttpContext context)
        {
            string userName = HttpContext.Current.Request.Form["userName"];
            string senceName = HttpContext.Current.Request.Form["senceName"];
            string Code = HttpContext.Current.Request.Form["Code"];
            string isModel = HttpContext.Current.Request.Form["isModel"];
            string SenceType = HttpContext.Current.Request.Form["SenceType"];
            string State = HttpContext.Current.Request.Form["State"];
            sceneBll bll = new sceneBll();
            int count = bll.GTetUserCenceInt(userName, senceName, Code, isModel, SenceType, State, "");
            context.Response.Write("{\"status\":\"" + count + "\"}");
        }
        /// <summary>
        /// 获取网站总条数
        /// </summary>
        /// <param name="context"></param>
        public void GetWebSenceCount(HttpContext context)
        {
            string userName = HttpContext.Current.Request.Form["userName"];
            string senceName = HttpContext.Current.Request.Form["senceName"];
            string Code = HttpContext.Current.Request.Form["Code"];
            string isModel = HttpContext.Current.Request.Form["isModel"];
            string SenceType = HttpContext.Current.Request.Form["SenceType"];
            string State = HttpContext.Current.Request.Form["State"];
            sceneBll bll = new sceneBll();
            int count = bll.GTetUserCenceInt(userName, senceName, Code, isModel, SenceType, State, "1");
            context.Response.Write("{\"status\":\"" + count + "\"}");
        }

        /// <summary>
        /// 用户场景生成网站场景
        /// </summary>
        /// <param name="context"></param>
        public void SetModel(HttpContext context)
        {
            string code = HttpContext.Current.Request.Form["code"];
            sceneBll bll = new sceneBll();
            bll.AddWebSence(code);
            context.Response.Write("{\"status\":\"0\"}");
        }
        /// <summary>
        /// 获取单个场景信息
        /// </summary>
        /// <param name="context"></param>
        public void GetSenceModel(HttpContext context)
        {
            string code = HttpContext.Current.Request.Form["code"];
            sceneBll bll = new sceneBll();
            DataTable dt = bll.GetModelByCode(code);
            if (dt != null)
            {
                context.Response.Write("{\"status\":\"0\",\"scene_name\":\"" + dt.Rows[0]["scene_name"].ToString() + "\",\"addtime\":\"" + dt.Rows[0]["addtime"].ToString() + "\",\"state_code_id\":\"" + dt.Rows[0]["state_code_id"].ToString() + "\",\"scene_custom_id\":\"" + dt.Rows[0]["scene_custom_id"].ToString() + "\",\"des\":\"" + dt.Rows[0]["des"].ToString() + "\"}");
            }
            else
            {
                context.Response.Write("{\"status\":\"-1\"}");
            }
        }
        /// <summary>
        /// 修改场景信息
        /// </summary>
        /// <param name="context"></param>
        public void UpdateSence(HttpContext context)
        {
            string senceCode = HttpContext.Current.Request.Form["senceCode"];
            string scene_name = HttpContext.Current.Request.Form["scene_name"];
            string addtime = HttpContext.Current.Request.Form["addtime"];
            string state_code_id = HttpContext.Current.Request.Form["state_code_id"];
            string scene_custom_id = HttpContext.Current.Request.Form["scene_custom_id"];
            string des = HttpContext.Current.Request.Form["des"];
            sceneBll bll = new sceneBll();
            bll.UpdateSence(senceCode, scene_name, addtime, state_code_id, scene_custom_id, des);
            context.Response.Write("{\"status\":\"0\"}");
        }
        /// <summary>
        /// 获取网站场景列表
        /// </summary>
        /// <param name="context"></param>
        public void GetWebSencelist(HttpContext context)
        {
            string userName = HttpContext.Current.Request.Form["userName"];
            string senceName = HttpContext.Current.Request.Form["senceName"];
            string Code = HttpContext.Current.Request.Form["Code"];
            string isModel = HttpContext.Current.Request.Form["isModel"];
            string SenceType = HttpContext.Current.Request.Form["SenceType"];
            string State = HttpContext.Current.Request.Form["State"];
            string pageNum = HttpContext.Current.Request.Form["pageNum"];
            string RowCount = HttpContext.Current.Request.Form["RowCount"];

            sceneBll bll = new sceneBll();
            DataTable dt = bll.GetWebCenceAll(userName, senceName, Code, isModel, SenceType, State, int.Parse(pageNum), int.Parse(RowCount));
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
        /// 设置为模板
        /// </summary>
        /// <param name="context"></param>
        public void webModel(HttpContext context)
        {
            string code = HttpContext.Current.Request.Form["code"];
            string sence = HttpContext.Current.Request.Form["sence"];
            sceneBll bll = new sceneBll();
            bll.AddTempBySence(code, 0, sence);
            context.Response.Write("{\"status\":\"0\"}");
        }
        /// <summary>
        /// 审核场景
        /// </summary>
        /// <param name="context"></param>
        public void shSence(HttpContext context)
        {
            string code = HttpContext.Current.Request.Form["code"];
            string b = HttpContext.Current.Request.Form["b"];
            sceneBll bll = new sceneBll();
            bll.shSence(code, bool.Parse(b));
            context.Response.Write("{\"status\":\"0\"}");
        }
        /// <summary>
        /// 后台查询模板
        /// </summary>
        /// <param name="context"></param>
        public void GetTempByAdmin(HttpContext context)
        {
            string modelName = HttpContext.Current.Request.Form["modelName"];
            string modelCode = HttpContext.Current.Request.Form["modelCode"];
            string modelStatus = HttpContext.Current.Request.Form["modelStatus"];
            string modelHy = HttpContext.Current.Request.Form["modelHy"];
            string modelCj = HttpContext.Current.Request.Form["modelCj"];
            string pageNum = HttpContext.Current.Request.Form["pageNum"];
            string RowCount = HttpContext.Current.Request.Form["RowCount"];
            TempsBll tbll = new TempsBll();
            DataTable dt = tbll.GetTableModel(modelName, modelCode, modelStatus, modelHy, modelCj, int.Parse(pageNum), int.Parse(RowCount));
            if (dt == null)
            {
                context.Response.Write("{\"status\":\"-1\"}");
                return;
            }
            string json = f.ToJson(dt);
            json = json.Replace("\"", "\\\"");
            context.Response.Write("{\"status\":\"" + json + "\"}");
        }
        /// <summary>
        /// 查询后台模板数量
        /// </summary>
        /// <param name="context"></param>
        public void GetTempByAdminCount(HttpContext context)
        {
            string modelName = HttpContext.Current.Request.Form["modelName"];
            string modelCode = HttpContext.Current.Request.Form["modelCode"];
            string modelStatus = HttpContext.Current.Request.Form["modelStatus"];
            string modelHy = HttpContext.Current.Request.Form["modelHy"];
            string modelCj = HttpContext.Current.Request.Form["modelCj"];
            TempsBll tbll = new TempsBll();
            int count = tbll.GetModelCount(modelName, modelCode, modelStatus, modelHy, modelCj);
            context.Response.Write("{\"status\":\"" + count + "\"}");
        }
        /// <summary>
        /// 删除模板
        /// </summary>
        /// <param name="context"></param>
        public void DeleteTemp(HttpContext context)
        {
            string code = HttpContext.Current.Request.Form["code"];
            sceneBll tbll = new sceneBll();
            tbll.DeleteTemp(code);
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