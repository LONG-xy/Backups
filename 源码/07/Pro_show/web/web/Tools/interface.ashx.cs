using Bll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using factory;

namespace web.Tools
{
    /// <summary>
    /// _interface 的摘要说明
    /// </summary>
    public class _interface : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        //用户未登录 返回-1
        public void ProcessRequest(HttpContext context)
        {
            try
            {
                string t = HttpContext.Current.Request["t"];//干什么用的

                if (t == "preview" || t == "userAuthor" || t == "reLogin")
                {
                    if (t == "preview")
                    {
                        //预览场景
                        preview(context);
                    }
                    if (t == "userAuthor")
                    {
                        //查询session是否正常
                        userAuthor(context);
                    }
                    if (t == "reLogin")
                    {
                        //用户登录
                        reLogin(context);
                    }
                }
                else
                {
                    HttpContext.Current.Session.Timeout = 3000;
                    if (HttpContext.Current.Session["userID"] == null)
                    {
                        context.Response.Write("{\"status\":\"-1\"}");
                        return;
                    }
                    switch (t)
                    {
                        case "pageList":
                            //获取场景页面基本信息
                            pageList(context);
                            break;
                        case "design":
                            //获取场景基本信息
                            design(context);
                            break;
                        case "savePage":
                            //保存页面
                            savePage(context);
                            break;
                        case "savePageName":
                            //保存页面名称
                            savePageName(context);
                            break;
                        case "pageSort":
                            //调整页面顺序
                            pageSort(context);
                            break;
                        case "createPage":
                            //创建页面
                            createPage(context);
                            break;
                        case "delPage":
                            //删除页面
                            delPage(context);
                            break;
                        case "copyPage":
                            //复制页面
                            copyPage(context);
                            break;
                        case "getFileList":
                            //获取文件列表
                            getFileList(context);
                            break;
                        case "delFile":
                            //删除文件
                            delFile(context);
                            break;
                        case "getSceneSetting":
                            //获取场景基本配置
                            getSceneSetting(context);
                            break;
                        case "publish":
                            //发布场景
                            publish(context);
                            break;
                        case "uploadCoverImg":
                            //设置封面
                            uploadCoverImg(context);
                            break;
                        case "typeList":
                            //获取类别
                            typeList(context);
                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("接口:", ex);
            }
        }
        /// <summary>
        /// 整理json
        /// </summary>
        /// <param name="str"></param>
        public string MentStr(string str)
        {
            //替换代码
            return str.Replace("'", "\"").Replace("\r\n", "");
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
            //获取场景数据
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
        /// 获取场景页面属性
        /// </summary>
        /// <param name="context"></param>
        public void design(HttpContext context)
        {
            //页面id
            string pageID = HttpContext.Current.Request["pageID"];
            sceneBll sbll = new sceneBll();
            //获取场景属性
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
        /// 保存页面信息
        /// </summary>
        /// <param name="context"></param>
        public void savePage(HttpContext context)
        {
            string msg = "";
            //获取页面id
            string id = HttpContext.Current.Request["id"];
            //获取页面内容
            string content_text = HttpContext.Current.Request["elements"];
            //获取场景id
            string scene_code = HttpContext.Current.Request["sceneId"];
            //获取页面名称
            string pageName = HttpContext.Current.Request["name"];
            //获取页面页码
            string num = HttpContext.Current.Request["num"];
            //获取背景音乐
            string bgAudio = HttpContext.Current.Request["bgAudio"];

            sceneBll bll = new sceneBll();

            Model.scene_pag mp = new Model.scene_pag();
            //设置id
            mp.scene_pag_id = id;
            //设置页面内容
            mp.content_text = content_text;
            //设置场景id
            mp.scene_code = scene_code;
            //设置页面内容
            mp.pageName = pageName;
            //设置页面页码
            mp.num = num;
            //设置背景音乐
            mp.bgAudio = bgAudio;
            if (bll.SavePage(mp))
            {
                msg = @"
                {
                    'success': true, 
                    'code': '200', 
                    'msg': 'success', 
                    'obj': null, 
                    'map': null, 
                    'list': null}";
            }
            else
            {
                msg = @"{
                    'success': false,
                    'code': '403',
                    'msg': '保存失败',
                    'obj': null,
                    'map': null,
                    'list': null
                }";
            }
            context.Response.Write(MentStr(msg));
        }

        /// <summary>
        /// 修改页面名称
        /// </summary>
        /// <param name="context"></param>
        public void savePageName(HttpContext context)
        {
            sceneBll bll = new sceneBll();
            //获取页面id
            string id = HttpContext.Current.Request["id"];
            //获取页面名称
            string name = HttpContext.Current.Request["name"];
            //修改页面名称
            if (bll.UpdatePageName(id, name))
            {
                string sucStr = @"{
                    'success': true, 
                    'code': '200', 
                    'msg': '操作成功', 
                    'obj': null, 
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
                    'msg': '页面名称保存失败',
                    'obj': null,
                    'map': null,
                    'list': null
                }";
                context.Response.Write(MentStr(failStr));
            }
        }

        /// <summary>
        /// 调整页面顺序
        /// </summary>
        /// <param name="context"></param>
        public void pageSort(HttpContext context)
        {
            //获取页面id
            string pageid = HttpContext.Current.Request["pageid"];
            //获取页面顺序
            string num = HttpContext.Current.Request["num"];
            sceneBll bll = new sceneBll();
            //修改页面顺序
            if (bll.UpdateSize(int.Parse(pageid), int.Parse(num)))
            {
                string sucStr = @" {
                    'success': true, 
                    'code': '200', 
                    'msg': '操作成功', 
                    'obj': null, 
                    'map': null, 
                    'list': null
                 }";
                context.Response.Write(MentStr(sucStr));
            }
            else
            {
                string failStr = @"  {
                    'success': false,
                    'code': '403',
                    'msg': '页面顺序调整失败',
                    'obj': null,
                    'map': null,
                    'list': null
                }";
                context.Response.Write(MentStr(failStr));
            }

        }

        /// <summary>
        /// 创建页面
        /// </summary>
        /// <param name="context"></param>
        public void createPage(HttpContext context)
        {
            string id = HttpContext.Current.Request["id"];
            sceneBll bll = new sceneBll();
            string sceneCode = bll.AddUpdate(id);//获取场景编码
            Model.scene sm = bll.GetModel(sceneCode.Split('|')[0]);//获取场景信息
            if (sceneCode != "")
            {
                string sucStr = @"{
                    'success': true,
                    'code': '200',
                    'msg': 'success',
                    'obj': {
                        'id': " + id + @",
                        'sceneId': '" + sceneCode.Split('|')[0] + @"',
                        'num': '" + sceneCode.Split('|')[1] + @"',
                        'name': null,
                        'properties': null,
                        'elements': null,
                        'scene': {
                            'id': '" + sceneCode.Split('|')[0] + @"',
                            'name': '" + sm.scene_name + @"',
                            'createUser': '" + sm.author + @"',
                            'createTime': '" + sm.addtime + @"',
                            'type': '" + sm.scene_typeid + @"',
                            'pageMode': '" + sm.movietype + @"',
                            'isTpl': '0',
                            'isPromotion': '0',
                            'status': '1',
                            'openLimit': '0',
                            'submitLimit': '0',
                            'startDate': null,
                            'endDate': null,
                            'accessCode': null,
                            'thirdCode': null,
                            'updateTime': '1426039827000',
                            'publishTime': '1426039827000',
                            'applyTemplate': '0',
                            'applyPromotion': '0',
                            'sourceId': null,
                            'code': 'U705UCE43R',
                            'description': '',
                            'sort': '0',
                            'pageCount': '0',
                            'dataCount': '0',
                            'showCount': '0',
                            'userLoginName': null,
                            'userName': null
                        }
                    },
                    'map': null,
                    'list': null,
                    'iscopy':'false'
                }";
                context.Response.Write(MentStr(sucStr));
            }
            else
            {
                string failStr = @" {
                    'success': false,
                    'code': '403',
                    'msg': '创建新页面失败',
                    'obj': null,
                    'map': null,
                    'list': null
                }";
                context.Response.Write(MentStr(failStr));
            }

        }

        /// <summary>
        /// 删除页面
        /// </summary>
        /// <param name="context"></param>
        public void delPage(HttpContext context)
        {
            string id = HttpContext.Current.Request["id"];
            sceneBll bll = new sceneBll();
            string sceneCode = bll.DeletePage(id);//获取场景编码
            if (sceneCode != "")
            {
                string msg = @"{
                'success': true, 
                'code': '200', 
                'msg': '删除成功', 
                'obj': null, 
                'map': null, 
                'list': null}";
                context.Response.Write(MentStr(msg));
            }
            else
            {
                string msg = @"{
                    'success': false,
                    'code': '403',
                    'msg': '创建新页面失败',
                    'obj': null,
                    'map': null,
                    'list': null
                }";
                context.Response.Write(MentStr(msg));
            }
        }

        /// <summary>
        /// 复制页面
        /// </summary>
        /// <param name="context"></param>
        public void copyPage(HttpContext context)
        {
            string id = HttpContext.Current.Request["id"];
            sceneBll bll = new sceneBll();
            string sceneCode = bll.CopyPage(id);
            Model.scene sm = bll.GetModel(sceneCode.Split('|')[0]);//获取场景信息
            if (sceneCode != "")
            {
                string msg = @"{
                    'success': true,
                    'code': '200',
                    'msg': 'success',
                    'obj': {
                        'id': '" + id + @"',
                        'sceneId': '" + sceneCode.Split('|')[0] + @"',
                        'num': '" + sceneCode.Split('|')[1] + @"',
                        'name': '" + sceneCode.Split('|')[2] + @"',
                        'properties': null,
                        'elements': null,
                        'scene': {
                            'id': '" + sceneCode.Split('|')[0] + @"',
                            'name': '" + sm.scene_name + @"',
                            'createUser': '" + sm.author + @"',
                           'createTime': '" + sm.addtime + @"',
                            'type': '" + sm.scene_typeid + @"',
                            'pageMode': '" + sm.movietype + @"',
                            'isTpl': '0',
                            'isPromotion': '0',
                            'status': '1',
                            'openLimit': '0',
                            'submitLimit': '0',
                            'startDate': null,
                            'endDate': null,
                            'accessCode': null,
                            'thirdCode': null,
                            'updateTime': '1426039827000',
                            'publishTime': '1426039827000',
                            'applyTemplate': '0',
                            'applyPromotion': '0',
                            'sourceId': null,
                            'code': 'U705UCE43R',
                            'description': '',
                            'sort': '0',
                            'pageCount': '0',
                            'dataCount': '0',
                            'showCount': '0',
                            'userLoginName': null,
                            'userName': null
                        }
                    },
                    'map': null,
                    'list': null,
                    'iscopy':'true'
                }";
                context.Response.Write(MentStr(msg));
            }
            else
            {
                string msg = @"{
                    'success': false,
                    'code': '403',
                    'msg': '创建新页面失败',
                    'obj': null,
                    'map': null,
                    'list': null
                }";
                context.Response.Write(MentStr(msg));
            }
        }

        /// <summary>
        /// 获取文件列表
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        public void getFileList(HttpContext context)
        {
            //获取页面编号
            string pageNo = HttpContext.Current.Request["pageNo"];
            //获取文件大小
            string pageSize = HttpContext.Current.Request["pageSize"];
            //获取文件类型
            string fileType = HttpContext.Current.Request["fileType"];
            //获取用户id
            string userId = HttpContext.Current.Session["userID"].ToString();
            sceneBll bll = new sceneBll();
            try
            {
                //查询文件列表
                List<Model.file> list = bll.GetFileList(int.Parse(pageNo), int.Parse(pageSize), int.Parse(fileType), userId);
                StringBuilder lstr = new StringBuilder();
                foreach (Model.file m in list)
                {
                    lstr.Append(@"{
                            'id': '" + m.Fileid + @"',
                            'name': '" + m.fileUserName + @"',
                            'extName': '" + m.extName + @"',
                            'fileType': '" + m.fileType + @"',
                            'bizType': '101',
                            'path': '" + m.path + @"',
                            'tmbPath': '" + m.path + @"',
                            'createTime': '" + m.addtime + @"',
                            'createUser': '" + m.userid + @"',
                            'sort': '0',
                            'size': '26',
                            'status': '1'
                        },");

                }
                //count总数
                string msg = @"{
                    'success': true, 
                    'code': '200', 
                    'msg': 'success', 
                    'obj': null, 
                    'map': {
                        'count': '" + bll.GetFileCount(userId, int.Parse(fileType)).ToString() + @"',
                        'pageNo': '" + pageNo + @"', 
                        'pageSize': '" + pageSize + @"'
                    }, 
                    'list': [
                        " + lstr.ToString().Trim(',') + @" 
                    ]
    }";
                context.Response.Write(MentStr(msg));
            }
            catch (Exception ex)
            {
                string msg = @"{
                    'success': false,
                    'code': '403',
                    'msg': '获取文件失败',
                    'obj': null,
                    'map': null,
                    'list': null
                }";
                context.Response.Write(MentStr(msg));
            }
        }

        /// <summary>
        /// 删除文件（文件删除）
        /// </summary>
        /// <param name="context"></param>
        public void delFile(HttpContext context)
        {
            string delid = "";
            //文件id
            string fileid = HttpContext.Current.Request["fileid"];
            string[] fileidlist = fileid.Split(',');
            foreach (string str in fileidlist)
            {
                delid += "'" + str + "',";
            }
            sceneBll bll = new sceneBll();
            if (bll.DeleteFile(delid.Trim(',')) != "")
            {
                string msg = @"{
                        'success': true, 
                        'code': '200', 
                        'msg': 'success', 
                        'obj': null, 
                        'map': null, 
                        'list': null
                    }
                ";
                context.Response.Write(MentStr(msg));
            }
            else
            {
                string msg = @"{
                    'success': false,
                    'code': '403',
                    'msg': '删除文件失败',
                    'obj': null,
                    'map': null,
                    'list': null
                }";
                context.Response.Write(MentStr(msg));
            }
        }

        /// <summary>
        /// 获取场景基本配置
        /// </summary>
        /// <param name="context"></param>
        public void getSceneSetting(HttpContext context)
        {
            //获取场景id
            string sceneId = HttpContext.Current.Request["sceneId"];
            sceneBll bll = new sceneBll();
            //获取场景配置
            Model.scene m = bll.GetModel(sceneId);
            if (m != null)
            {
                string msg = @"{               
                    'success': true,            
		            'code': '200',            
                    'msg': 'success',            
                    'obj': {'id': '" + sceneId + @"', 
                            'name': '" + m.scene_name + @"', 
                            'createUser': '" + m.author + @"', 
                            'type': '" + m.scene_custom_id + @"', 
                            'createTime': '" + m.addtime + @"', 
                            'cover': '" + m.cover + @"', 
                             'code': '" + m.qrCode + @"', 
                             'description':'" + m.des + @"', 
                            'isTpl': '0', 
                            'isShow': '0', 
                            'updateTime': '" + m.addtime + @"',           
                            'publishTime': '" + m.addtime + @"'
                            },'map': null,
                             'list': null
                   }";
                context.Response.Write(MentStr(msg));
            }
            else
            {
                string msg = @"{
                        'success': false,
                        'code': '403',
                        'msg': '获取场景基本配置失败',
                        'obj': null,
                        'map': null,
                        'list': null
                    }
                        ";
                context.Response.Write(MentStr(msg));
            }
        }

        /// <summary>
        /// 发布场景
        /// </summary>
        /// <param name="context"></param>
        public void publish(HttpContext context)
        {
            string id = HttpContext.Current.Request["id"];//场景id
            string name = HttpContext.Current.Request["name"];//场景名称
            string createUser = HttpContext.Current.Request["createUser"];//创建人
            string type = HttpContext.Current.Request["type"];//场景类型
            string createTime = HttpContext.Current.Request["createTime"];//创建时间
            string cover = HttpContext.Current.Request["cover"];//封面
            string code = HttpContext.Current.Request["code"];//场景编号
            string description = HttpContext.Current.Request["description"];//说明
            sceneBll bll = new sceneBll();
            //发布场景
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
        /// 预览场景
        /// </summary>
        /// <param name="context"></param>
        public void preview(HttpContext context)
        {
            //获取场景id
            string id = HttpContext.Current.Request["id"];
            sceneBll bll = new sceneBll();
            Model.scene sm = bll.GetModel(id);//场景信息
            if (sm.author != null)
            {
                List<Model.scene_pag> mplist = bll.GetPageListBySceneCode(id);//场景页面
                StringBuilder pStr = new StringBuilder();
                foreach (Model.scene_pag m in mplist)
                {
                    //添加场景内容
                    pStr.Append(@"{'id': " + m.scene_pag_id + @", 
                    'sceneId': '" + id + @"',
                    'num': '" + m.num + @"',
                    'name': '" + m.pageName + @"',
                    'properties': null,
                    'elements': " + (m.content_text == "" ? "[]" : m.content_text) + @" , 
                    'scene': null},");
                }
                //检查是否可以预览的状态
                string status = bll.GetStatus(id);
                if (status == "" || status == "2")
                {
                    //添加失败内容
                    string Statusmsg = @" {
                            'success': false,
                            'code': '403',
                            'msg': '预览失败',
                            'obj': null,
                            'map': null,
                            'list': null
                        }";
                    context.Response.Write(MentStr(Statusmsg));
                    return;
                }
                //检查是否有敏感词
                CodeBll cbll = new CodeBll();
                //一级敏感词
                DataTable dt1 = cbll.GetTableByGroup("9", 0);
                //二级敏感词
                DataTable dt2 = cbll.GetTableByGroup("10", 0);
                //查询有没有二级敏感词
                foreach (DataRow dr in dt2.Rows)
                {
                    string gjc = dr["msg"].ToString();//敏感词
                    string checkStr = pStr.ToString();//待检测的字符串
                    if (checkStr.Contains(gjc))
                    {
                        //存在敏感词
                        //停用账户，更改状态
                        bll.SetUserAndStatus(id);
                        break;
                    }
                }
                //查询有没有一级敏感词
                foreach (DataRow dr in dt1.Rows)
                {
                    string gjc = dr["msg"].ToString();//敏感词
                    string checkStr = pStr.ToString();//待检测的字符串
                    if (checkStr.Contains(gjc))
                    {
                        //存在敏感词
                        //停用账户，更改状态
                        bll.SetSenceStatus(id);
                        break;
                    }
                }
                //操作成功
                string msg = @"{
                'success': true, 
                'code': '200', 
                'msg': '操作成功', 
                'obj': { 
                    'id': '" + id + @"', 
                    'name': '" + sm.scene_name + @"', 
                    'createUser': '" + sm.author + @"', 
                    'type':'" + sm.scene_custom_id + @"', 
                    'pageMode': '" + sm.movietype + @"', 
                    'cover': '" + sm.cover + @"', 
                    'bgAudio':" + (sm.musicUrl == "" ? "''" : sm.musicUrl) + @",
                    'code': '" + id + @"', 
                    'description': '" + sm.des + @"', 
                    'updateTime': '" + sm.addtime + @"', 
                    'createTime': '" + sm.addtime + @"', 
                    'publishTime': '" + sm.addtime + @"',
                    'property':{'triggerLoop':true,'eqAdType':1,'hideEqAd':false}
                }, 
                'map': null, 
                'list': [
                    " + pStr.ToString().Trim(',') + @"
                ]
                }";
                context.Response.Write(MentStr(msg));
            }
            else
            {
                TempsBll tbll = new TempsBll();
                Model.temp tmodel = tbll.GetModelTemp(id);//模板信息

                if (tmodel.author == null)
                {
                    string msg = @" {
                            'success': false,
                            'code': '403',
                            'msg': '预览失败',
                            'obj': null,
                            'map': null,
                            'list': null
                        }";
                    context.Response.Write(MentStr(msg));
                }
                else
                {
                    /////////////////////////////////////////////////////////
                    List<Model.temp_pag> mplist = tbll.GetPageListByTempCode(id);//场景页面
                    StringBuilder pStr = new StringBuilder();
                    foreach (Model.temp_pag m in mplist)
                    {
                        pStr.Append(@"{'id': " + m.pag_id + @", 
                                'sceneId': '" + id + @"',
                                'num': '" + m.num + @"',
                                'name': '" + m.pageName + @"',
                                'properties': null,
                                'elements': " + (m.content_text == "" ? "[]" : m.content_text) + @" , 
                                'scene': null},");
                    }
                    string msg = @"{
                            'success': true, 
                            'code': '200', 
                            'msg': '操作成功', 
                            'obj': { 
                                'id': '" + id + @"', 
                                'name': '" + tmodel.temp_name + @"', 
                                'createUser': '" + tmodel.author + @"', 
                                'type':'" + tmodel.scene_custom_id + @"', 
                                'pageMode': '" + tmodel.movietype + @"', 
                                'cover': '" + tmodel.cover + @"', 
                                'bgAudio':" + (tmodel.musicUrl == "" ? "''" : tmodel.musicUrl) + @",
                                'code': '" + id + @"', 
                                'description': '" + tmodel.des + @"', 
                                'updateTime': '" + tmodel.addtime + @"', 
                                'createTime': '" + tmodel.addtime + @"', 
                                'publishTime': '" + tmodel.addtime + @"',
                                'property':{'triggerLoop':true,'eqAdType':1,'hideEqAd':false}
                            }, 
                            'map': null, 
                            'list': [
                                " + pStr.ToString().Trim(',') + @"
                            ]
                            }";
                    context.Response.Write(MentStr(msg));
                }
            }
        }

        /// <summary>
        /// 设置封面
        /// </summary>
        /// <param name="context"></param>
        public void uploadCoverImg(HttpContext context)
        {
            string src = HttpContext.Current.Request["src"];//图片路径
            string fileType = HttpContext.Current.Request["fileType"];//图片类型
            string x = HttpContext.Current.Request["x"];//截图X坐标
            string y = HttpContext.Current.Request["y"];//截图Y坐标
            string w = HttpContext.Current.Request["w"];//截图宽度
            string h = HttpContext.Current.Request["h"];//截图高度
            string id = HttpContext.Current.Request["id"];//图片id
            sceneBll bll = new sceneBll();
            //修改封面
            if (bll.UpdateCover(src, fileType, int.Parse(x), int.Parse(y), int.Parse(w), int.Parse(h), id))
            {
                string msg = @"{
                    'success':true,
                    'code':200,
                    'msg':'操作成功',
                    'obj':'" + src + @"',
		            'map': {
                        'id':25467357,
				        'path':'" + src + @"',
				        'src':'" + src + @"',
				        'y':'" + y + @"',
				        'w':'" + w + @"',
				        'h':'" + h + @"',
				        'x':'" + x + @"',
				        'index':'',
				        'fileType':'" + fileType + @"'
                    },
                    'list':null
                }";
                context.Response.Write(MentStr(msg));
            }
            else
            {
                string msg = @"{
                    'success': false, 
                    'code': 403, 
                    'msg': '上传缩略图失败', 
                    'obj': null, 
                    'map': null, 
                    'list': null
                    }";
                context.Response.Write(MentStr(msg));
            }
        }

        /// <summary>
        /// 获取类别
        /// </summary>
        /// <param name="context"></param>
        public void typeList(HttpContext context)
        {
            CodeBll bll = new CodeBll();
            DataTable dt = bll.GetTableByGroup("2", 0);//获取类型
            string l = "";
            if (dt != null)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    l += "{'id':'" + dr["code_id"] + "','name':'" + dr["msg"] + "','value':'" + dr["code_id"] + "','type':'scene_type','sort':1,'status':1,'remark':null},";
                }
                string msg = @"{
                     'success':true,
                     'code':200,
                     'msg':'success',
                     'obj':null, 
                     'map':null, 
                      'list':[
                                " + l.ToString().Trim(',') + @"
                             ]
                }";
                context.Response.Write(MentStr(msg));
            }
            else
            {
                string msg = @"{
                        'success': false, 
                        'code': 403, 
                        'msg': '获取场景类型失败', 
                        'obj': null, 
                        'map': null, 
                        'list': null
                    }";
                context.Response.Write(MentStr(msg));
            }
        }

        /// <summary>
        /// 查询session是否存在
        /// </summary>
        /// <param name="context"></param>
        public void userAuthor(HttpContext context)
        {
            //验证用户是否登录
            if (HttpContext.Current.Session["userID"] == null)
            {
                //返回没有登录
                context.Response.Status = "401 Unauthorized";
                string msg = @"{ 
                    'success':false,
                     'code':1001,
                     'msg':'请先登录', 
                     'obj':null,
                     'map':null,
                     'list':null
                    }
                                ";
                context.Response.Write(MentStr(msg));
            }
            else
            {
                //返回登录成功
                string msg = @"{ 
                       'success':true,
                       'code':200,
                       'msg':'操作成功', 
                       'obj':100,
                       'map':'',
                       'list':null
                    }
                                ";
                context.Response.Write(MentStr(msg));
            }
        }

        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="context"></param>
        public void reLogin(HttpContext context)
        {
            string username = HttpContext.Current.Request["username"];//获取用户名
            string password = HttpContext.Current.Request["password"];//获取密码

            show_userBll bll = new show_userBll();
            string userID = bll.SelectUserByNamePwd(username, password);//验证用户名密码
            if (userID != "")
            {
                HttpContext.Current.Session["userID"] = userID;//设置用户id
                HttpContext.Current.Session["UserName"] = username;//设置用户名
                string msg = @"{
                           'success':true,
                           'code':200,
                           'msg':'success',
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
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}