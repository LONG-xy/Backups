using Bll;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Xml.Linq;

namespace web.Tools
{
    /// <summary>
    /// PhoneFace 的摘要说明
    /// </summary>
    public class PhoneFace : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        /// <summary>
        /// 整理json
        /// </summary>
        /// <param name="str"></param>
        public string MentStr(string str)
        {
            return str.Replace("'", "\"").Replace("\r\n", "");
        }

        public void ProcessRequest(HttpContext context)
        {
            string t = HttpContext.Current.Request["t"];//干什么用的
            switch (t)
            {
                case "GetImg":
                    //获取轮播图
                    GetImg(context);
                    break;
                case "GetCode":
                    //获取场景分类
                    GetCode(context);
                    break;
                case "GetModel":
                    //获取模板 scence:场景分类id，PageInt：第几页从1开始，CountRow：一页几条数据
                    GetModel(context);
                    break;
                case "GetUrl":
                    //获取预览url
                    GetUrl(context);
                    break;
                case "UseModel":
                    //使用模板，必须在登录的条件下 temp_code：模板id 返回值 secnceId 场景id 值为-1为没有登录
                    UseModel(context);
                    break;
                case "ImgList":
                    //获取场景图片列表 scenceId:场景id num：页数 从第一页开始
                    ImgList(context);
                    break;
                case "SetImgAndText":
                    //设置图片和文字 scenceId：场景id num:页数 Str:内容（整个json）
                    SetImgAndText(context);
                    break;
                case "publish":
                    //修改名称，缩略图，和说明
                    publish(context);
                    break;
                case "reLogin":
                    //登录 username password
                    reLogin(context);
                    break;
                case "GetSence":
                    //获取此人的发布过的场景  PageInt:第几页 CountRow：一页多少行
                    GetSence(context);
                    return;
                case "DeleteSence":
                    //删除场景 id 场景code
                    DeleteSence(context);
                    break;
                case "UpdateHeadimg":
                    //修改头像
                    UpdateHeadimg(context);
                    break;
                case "GetHeadImg":
                    //获取头像
                    GetHeadImg(context);
                    break;
                case "UpImg":
                    //上传头像
                    UpdateHeadimg(context);
                    break;
                case "SaveImg":
                    //上传文件
                    SaveImg(context);
                    break;
                case "pageList":
                    //获取场景里面有多少个页面
                    pageList(context);
                    break;
                case "design":
                    //根据pageList id
                    design(context);
                    break;
            }
        }
        /// <summary>
        /// 获取场景基本属性信息
        /// </summary>
        /// <param name="context"></param>
        public void pageList(HttpContext context)
        {
            //场景id
            string sceneCode = HttpContext.Current.Request["sceneCode"];
            sceneBll sbll = new sceneBll();
            List<Model.scene_pag> list = sbll.GetPageListBySceneCode(sceneCode);
            if (list.Count > 0)
            {
                //页面
                StringBuilder pagestr = new StringBuilder();
                foreach (Model.scene_pag m in list)
                {
                    pagestr.Append(@"{
                            'id': '" + m.scene_pag_id + @"',
                            'sceneId': '" + sceneCode + @"',
                            'num': '" + m.num + @"',
                            'name': '" + m.pageName + @"',
                            'properties': null,
                            'elements': null,
                            'scene': null
                        },");
                }
                //成功
                string sucStr = @"{
                            'success': true,
                            'code': '200',
                            'msg': 'success',
                            'obj': null,
                            'map': null,
                            'list': [
                                " + pagestr.ToString().Trim(',') + @"
                            ]
                        }
                    ";
                context.Response.Write(MentStr(sucStr));
            }
            else
            {
                //失败
                string failStr = @"{
                        'success': false,
                        'code': '403',
                        'msg': '基础数据服务器获取失败',
                        'obj': null,
                        'map': null,
                        'list': null
                    }";
                context.Response.Write(MentStr(failStr));
            }
        }
        /// <summary>
        /// 获取场景基本属性信息
        /// </summary>
        /// <param name="context"></param>
        public void design(HttpContext context)
        {
            //页面id
            string pageID = HttpContext.Current.Request["sceneid"];
            sceneBll sbll = new sceneBll();
            Model.scene_pag mp = sbll.GetpageModel(pageID);
            if (mp != null)
            {
                //获取场景信息
                Model.scene mc = sbll.GetModel(mp.scene_code);
                string sucStr = @"{
                    'success': true, 
                    'code': '200', 
                    'msg': 'success', 
                    'obj': {
                        'id': '" + pageID + @"',
                        'sceneId': '" + mp.scene_code + @"',
                        'num': '" + mp.num + @"',
                        'name': '" + mp.pageName + @"',
                        'properties': null,
                        'elements': 
                           " + (mp.content_text == "" ? "[]" : mp.content_text) + @"
                        , 
                        'scene': {
                            'id': '" + mp.scene_code + @"',
                            'name': '" + mc.scene_name + @"',
                            'createUser': '" + mc.author + @"',
                            'createTime': '" + mc.addtime + @"',
                            'type': '" + mc.scene_typeid + @"',
                            'pageMode': '" + mc.movietype + @"',
                            'bgAudio':" + (mc.musicUrl == "" ? "''" : mc.musicUrl) + @",
                            'isTpl': '0',
                            'isPromotion': '0',
                            'status': '1',
                            'openLimit': '0',
                            'submitLimit': '0',
                            'startDate': null,
                            'endDate': null,
                            'accessCode': null,
                            'thirdCode': null,
                            'updateTime': '1426038857000',
                            'publishTime': '1426038857000',
                            'applyTemplate': '0',
                            'applyPromotion': '0',
                            'sourceId': null,
                            'code': '" + mp.scene_code + @"',
                            'description': '" + mc.des + @"',
                            'sort': '0',
                            'pageCount': '0',
                            'dataCount': '0',
                            'showCount': '0',
                            'userLoginName': null,
                            'userName': null
                        }
        }, 
                    'map': null,
                    'list': null
                    }";
                context.Response.Write(MentStr(sucStr));
            }
            else
            {
                string failStr = @"{
                    'success': false,
                    'code': '403',
                    'msg': '页面基础数据服务器获取失败',
                    'obj': null,
                    'map': null,
                    'list': null
                }";
                context.Response.Write(MentStr(failStr));
            }
        }
        /// <summary>
        /// 获取轮播图
        /// </summary>
        /// <param name="context"></param>
        public void GetImg(HttpContext context)
        {
            context.Response.Write(MentStr("{'img':'PhoneImg/1.jpg,PhoneImg/2.jpg,PhoneImg/3.jpg,PhoneImg/4.jpg'}"));
        }
        /// <summary>
        /// 根据分组id获取字典信息
        /// </summary>
        /// <param name="context"></param>
        public void GetCode(HttpContext context)
        {
            string GID = "3";//分组id
            CodeBll bll = new CodeBll();
            DataTable dt = bll.GetTableByGroup(GID, 0);
            if (dt == null)
            {
                context.Response.Write("{\"status\":\"-1\"}");
                return;
            }
            string json = f.ToJson(dt);
            //json = json.Replace("\"", "\\\"");
            context.Response.Write(json);
        }
        /// <summary>
        /// 获取模板每次10个，并且按照时间进行排序
        /// </summary>
        /// <param name="context"></param>
        public void GetModel(HttpContext context)
        {
            //行业
            string H = "0";
            //场景
            string C = HttpContext.Current.Request["scence"];
            //免费还是全部 全部为0 免费为1
            string orderByFree = "0";
            //最新发布还是最受欢迎 1为最新发布 0为最受欢迎
            string OrderByNew = "1";
            string PageInt = HttpContext.Current.Request["PageInt"];
            string CountRow = HttpContext.Current.Request["CountRow"];
            //查询语句
            string SerachStr = "";
            TempsBll BLL = new TempsBll();
            DataTable dt = BLL.GetTable(int.Parse(H), int.Parse(C), int.Parse(orderByFree), int.Parse(OrderByNew), int.Parse(PageInt), int.Parse(CountRow), f.MyEncodeInputString(SerachStr));
            if (dt.Rows.Count == 0)
            {
                context.Response.Write("{\"status\":\"-1\"}");
                return;
            }
            string json = f.ToJson(dt);
            //json = json.Replace("\"", "\\\"");
            context.Response.Write("{\"status\":" + json + "}");
        }
        /// <summary>
        /// 获取预览url
        /// </summary>
        /// <param name="context"></param>
        public void GetUrl(HttpContext context)
        {
            string scenceId = HttpContext.Current.Request["scenceId"];
            string url = "senceCreate/view.html?c=view&id=" + scenceId + "&preview=preview";
            context.Response.Write("{\"url\":\"" + url + "\"}");
        }
        /// <summary>
        /// 使用模板
        /// </summary>
        /// <param name="context"></param>
        public void UseModel(HttpContext context)
        {
            string userID = HttpContext.Current.Request["userID"];
            string temp_code = HttpContext.Current.Request["temp_code"];
            string userId = userID;
            TempsBll bll = new TempsBll();
            string msg = bll.CopeTemp(temp_code, userId);
            context.Response.Write("{\"secnceId\":\"" + msg + "\"}");
        }
        /// <summary>
        /// 获取场景图片列表
        /// </summary>
        /// <param name="context"></param>
        public void ImgList(HttpContext context)
        {
            string scenceId = HttpContext.Current.Request["scenceId"];
            string num = HttpContext.Current.Request["num"];
            sceneBll bll = new sceneBll();
            string pageContent = bll.GetPageContent(scenceId, num).Replace("\"", "");
            Regex reg = new Regex("(?i)(?=src:)[^,]*(?=,)");
            var mat = reg.Matches(pageContent);
            string msg = "";
            foreach (Match item in mat)
            {
                msg += item.Value.Replace("src:", "") + ",";
            }
            context.Response.Write("{\"secnceId\":\"" + msg.Trim(',') + "\"}");
        }
        /// <summary>
        /// 设置图片和文字
        /// </summary>
        /// <param name="context"></param>
        public void SetImgAndText(HttpContext context)
        {
            string scenceId = HttpContext.Current.Request["scenceId"];
            string num = HttpContext.Current.Request["num"];
            string Str = HttpContext.Current.Request["Str"];
            sceneBll bll = new sceneBll();
            bll.UpdatePageByPhone(Str, num, scenceId);
            context.Response.Write("{\"secnceId\":\"0\"}");
         }
        /// <summary>
        /// 发布场景
        /// </summary>
        /// <param name="context"></param>
        public void publish(HttpContext context)
        {
            string id = HttpContext.Current.Request["id"];//场景code
            string name = HttpContext.Current.Request["name"];//场景名称
            string createUser = HttpContext.Current.Request["createUser"];//创建人
            string type = HttpContext.Current.Request["type"];//默认 1
            string createTime = HttpContext.Current.Request["createTime"];//创建时间
            string cover = HttpContext.Current.Request["cover"];//封面名称
            string code = HttpContext.Current.Request["code"];//场景codel
            string description = HttpContext.Current.Request["description"];//场景说明
            sceneBll bll = new sceneBll();
            if (bll.publish(id, name, createUser, type, createTime, cover, code, description) != "")
            {
                string msg = @" {
                    'success': true, 
                    'code': 200, 
                    'msg': 'success', 
                    'obj': null, 
                    'map': null, 
                    'list': null
                }";
                context.Response.Write(MentStr(msg));
            }
            else
            {
                string msg = @" {
                    'success': false,
                    'code': 403,
                    'msg': '发布失败',
                    'obj': null,
                    'map': null,
                    'list': null
                }";
                context.Response.Write(MentStr(msg));
            }

        }
        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="context"></param>
        public void reLogin(HttpContext context)
        {
            string username = HttpContext.Current.Request["username"];
            string password = HttpContext.Current.Request["password"];

            show_userBll bll = new show_userBll();
            string userID = bll.SelectUserByNamePwd(username, password);
            if (userID != "")
            {
                HttpContext.Current.Session["userID"] = userID;
                HttpContext.Current.Session["UserName"] = username;
                string msg = @"{
                           'success':true,
                           'code':200,
                           'msg':'" + userID + @"',
                            'obj':null,
                            'map':null,
                            'list':null
                        }
            ";
                context.Response.Write(MentStr(msg));
                return;
            }
            else
            {
                string msg = @"{
                                    'success':false,
                                    'code':1003,
                                    'msg':'登录失败',
                                    'map':{
                                    'isValidateCodeLogin':false
                                    }
                                }
                            ";
                context.Response.Write(MentStr(msg));
                return;
            }

        }
        /// <summary>
        /// 获取此人的场景列表
        /// </summary>
        /// <param name="context"></param>
        public void GetSence(HttpContext context)
        {
            string userId = HttpContext.Current.Request["userID"];
            string selectStr = "";
            string hnagye = "1";
            string PageInt = HttpContext.Current.Request["PageInt"];
            string CountRow = HttpContext.Current.Request["CountRow"];
            sceneBll bll = new sceneBll();
            DataTable dt = bll.GetSenceByUserId(userId, selectStr, hnagye, int.Parse(PageInt), int.Parse(CountRow));
            if (dt == null)
            {
                context.Response.Write("{\"status\":\"-1\"}");
                return;
            }
            string json = f.ToJson(dt);
            //json = json.Replace("\"", "\\\"");
            context.Response.Write("{\"status\":" + json + "}");
        }
        /// <summary>
        /// 删除场景
        /// </summary>
        /// <param name="context"></param>
        public void DeleteSence(HttpContext context)
        {
            if (HttpContext.Current.Session["userID"] != null)
            {
                string id = HttpContext.Current.Request["id"];
                sceneBll bll = new sceneBll();
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
        /// 获取用户信息
        /// </summary>
        /// <param name="context"></param>
        public void GetUserContext(HttpContext context)
        {
            show_userBll bll = new show_userBll();
            if (HttpContext.Current.Session["UserName"] != null)
            {
                string userName = HttpContext.Current.Session["UserName"].ToString();
                Model.User u = bll.GetModelByUserName(userName);
                CodeBll codebll = new CodeBll();
                string uT = codebll.GetStrByGroupCode("6", u.user_type_code_id);
                DateTime dt = DateTime.Parse(u.addtime);

                context.Response.Write("{\"userName\":\"" + u.user_name + "\",\"userType\":\"" + uT + "\",\"userTime\":\"" + dt.ToString("yyyy-mm-dd hh:mm:ss") + "\",\"headImg\":\"" + u.headImg + "\",\"status\":\"0\"}");
            }
            else
            {
                context.Response.Write("{\"status\":\"-1\"}");
            }
        }
        /// <summary>
        /// 修改头像
        /// </summary>
        /// <param name="context"></param>
        public void UpdateHeadimg(HttpContext context)
        {
            string userName = HttpContext.Current.Request["UserName"].ToString();
            string headImg = HttpContext.Current.Request["headImg"];
            string base64String = HttpContext.Current.Request["base64String"].ToString();
            string fileName = HttpContext.Current.Request["headImg"].ToString();
            fileName = HttpContext.Current.Server.MapPath("headimg\\") + "" + fileName + "";
            StringToFile(base64String, fileName);

            show_userBll userbll = new show_userBll();
            userbll.UpdateHeadImg(userName, headImg);
            context.Response.Write("{\"status\":\"0\"}");
        }
        /// <summary>
        /// 获取头像
        /// </summary>
        /// <param name="context"></param>
        public void GetHeadImg(HttpContext context)
        {
            string userName = HttpContext.Current.Request["UserName"].ToString();
            show_userBll bll = new show_userBll();
            string img = bll.GetHeadImg(userName);
            context.Response.Write("{\"status\":\"" + img + "\"}");
        }
        /// <summary>
        /// 上传图片
        /// </summary>
        /// <param name="context"></param>
        public void SaveImg(HttpContext context)
        {
            string userimgName = "";
            //if (context.Request.Files.Count > 0)
            //{
            //    XiuXiuPostImage img = new XiuXiuPostImage(context);
            //    name = img.Save();
            //    userimgName = img.FileUserName;
            //}
            //   /upload/User201653198236.png
            string base64String = HttpContext.Current.Request["base64String"].ToString();
            string fileName = HttpContext.Current.Request["headImg"].ToString();
            fileName = HttpContext.Current.Server.MapPath("..\\upload\\") + "" + fileName + "";
            StringToFile(base64String, fileName);

            string fileType = HttpContext.Current.Request["fileType"];//文件类型 0背景图片1音乐2图片类型
            string[] strArr = fileName.Split('\\');
            fileName = strArr[strArr.Length - 1];
            string filePath = fileName;
            string userId = HttpContext.Current.Request["userID"];// HttpContext.Current.Session["userID"].ToString();
            sceneBll bll = new sceneBll();
            string id = bll.AddFile(fileName, filePath, userId, fileType, userimgName);
            if (id != "")
            {
                string msg = @"{
                'success': true, 
                'code': 200, 
                'msg': 'success', 
                'obj': {
                    'id': '" + id + @"',
                    'name': '" + fileName + @"',
                    'extName': '" + fileName.Split('.')[1] + @"',
                    'fileType': " + fileType + @",
                    'path': '" + filePath + @"',
                    'tmbPath': '" + filePath + @"',
                    'createTime': '" + DateTime.Now.ToString() + @"',
                    'createUser': '" + userId + @"',
                    'bizType': 0, 
                    'sort': 0, 
                    'size': 2, 
                    'status': 1
                }, 
                'map': null, 
                'list': null}";
                context.Response.Write(MentStr(msg));
            }
            else
            {
                string msg = @"{
                    'success': false,
                    'code': 403,
                    'msg': '上传文件失败',
                    'obj': null,
                    'map': null,
                    'list': null
                }";
                context.Response.Write(MentStr(msg));
            }
        }


        public System.Drawing.Image Base64StringToImage(string strbase64)
        {
            try
            {
                byte[] arr = Convert.FromBase64String(strbase64);
                MemoryStream ms = new MemoryStream(arr);
                //Bitmap bmp = new Bitmap(ms); 
                ms.Write(arr, 0, arr.Length);
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                ms.Close();
                return image;
                //return bmp; 
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary> 
        /// 把经过base64编码的字符串保存为文件 
        /// </summary> 
        /// <param name="base64String">经base64加码后的字符串 </param> 
        /// <param name="fileName">保存文件的路径和文件名 </param> 
        /// <returns>保存文件是否成功 </returns> 
        public static bool StringToFile(string base64String, string fileName)
        {
            //string path = Path.GetDirectoryName(Assembly.GetExecutingAssembly().GetName().CodeBase) + @"/beapp/" + fileName; 
            System.IO.FileStream fs = new System.IO.FileStream(fileName, System.IO.FileMode.Create);
            System.IO.BinaryWriter bw = new System.IO.BinaryWriter(fs);
            if (!string.IsNullOrEmpty(base64String) && File.Exists(fileName))
            {
                bw.Write(Convert.FromBase64String(base64String));
            }
            bw.Close();
            fs.Close();
            return true;
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