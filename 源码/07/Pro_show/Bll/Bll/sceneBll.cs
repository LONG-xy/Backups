using Dal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Bll
{
    public class sceneBll
    {
        sceneDal dal = new sceneDal();
        /// <summary>
        /// 更改场景状态
        /// </summary>
        /// <param name="SenceCode"></param>
        public void SetSenceStatus(string SenceCode)
        {
            dal.SetSenceStatus(SenceCode);
        }
        /// <summary>
        /// 更改用户状态和场景状态
        /// </summary>
        /// <param name="SenceCode"></param>
        public void SetUserAndStatus(string SenceCode)
        {
            dal.SetUserAndStatus(SenceCode);
        }
        /// <summary>
        /// 根据场景标识查询状态
        /// </summary>
        /// <param name="SenceCode"></param>
        public string GetStatus(string SenceCode)
        {
            return dal.GetStatus(SenceCode);
        }
        /// <summary>
        /// 创建场景默认
        /// </summary>
        /// <param name="Userid">用户id</param>
        /// <param name="hyid">场景类型</param>
        /// <param name="sceneCode">场景编号</param>
        public void DefaultScene(string Userid, string hyid, string sceneCode)
        {
            dal.DefaultScene(Userid, hyid, sceneCode);
        }
        /// <summary>
        /// 创建默认页
        /// </summary>
        /// <param name="sceneCode"></param>
        public void DefaultScenePage(string sceneCode)
        {
            dal.DefaultScenePage(sceneCode);
        }
        /// <summary>
        /// 根据场景编码获取分页信息
        /// </summary>
        /// <param name="SceneCode"></param>
        /// <returns></returns>
        public List<Model.scene_pag> GetPageListBySceneCode(string SceneCode)
        {
            return dal.GetPageListBySceneCode(SceneCode);
        }
        /// <summary>
        /// 根据页面id获取页面信息
        /// </summary>
        /// <param name="pageID"></param>
        /// <returns></returns>
        public Model.scene_pag GetpageModel(string pageID)
        {
            return dal.GetpageModel(pageID);
        }
        /// <summary>
        /// 根据场景编码获取场景信息
        /// </summary>
        /// <param name="scene_code"></param>
        /// <returns></returns>
        public Model.scene GetModel(string scene_code)
        {
            return dal.GetModel(scene_code);
        }
        /// <summary>
        /// 保存页面信息
        /// </summary>
        /// <param name="sp"></param>
        public bool SavePage(Model.scene_pag sp)
        {
            return dal.SavePage(sp);
        }
        /// <summary>
        /// 修改页面信息手机
        /// </summary>
        /// <param name="ele"></param>
        /// <param name="num"></param>
        /// <param name="sencecode"></param>
        /// <returns></returns>
        public bool UpdatePageByPhone(string ele, string num, string sencecode)
        {
            return dal.UpdatePageByPhone(ele, num, sencecode);
        }
        /// <summary>
        /// 修改页面名称
        /// </summary>
        /// <param name="pageid"></param>
        /// <param name="scenceCode"></param>
        /// <param name="name"></param>
        /// <returns></returns>
        public bool UpdatePageName(string pageid, string name)
        {
            return dal.UpdatePageName(pageid, name);
        }
        /// <summary>
        /// 调整页面顺序
        /// </summary>
        /// <param name="pageid"></param>
        /// <param name="num"></param>
        /// <returns></returns>
        public bool UpdateSize(int pageid, int num)
        {
            return dal.UpdateSize(pageid, num);
        }
        /// <summary>
        /// 添加页面进行排序
        /// </summary>
        /// <param name="pageid">在哪个页面下面添加页面</param>
        /// <returns></returns>
        public string AddUpdate(string pageid)
        {
            return dal.AddUpdate(pageid);
        }

        /// <summary>
        /// 删除页面
        /// </summary>
        /// <param name="pageid"></param>
        /// <returns></returns>
        public string DeletePage(string pageid)
        {
            return dal.DeletePage(pageid);
        }

        /// <summary>
        /// 复制页面
        /// </summary>
        /// <param name="pageid"></param>
        /// <returns></returns>
        public string CopyPage(string pageid)
        {
            return dal.CopyPage(pageid);
        }

        /// <summary>
        /// 查找文件列表
        /// </summary>
        /// <param name="pageNo"></param>
        /// <param name="pageSize"></param>
        /// <param name="fileType"></param>
        /// <returns></returns>
        public List<Model.file> GetFileList(int pageNo, int pageSize, int fileType, string userId)
        {
            return dal.GetFileList(pageNo, pageSize, fileType, userId);
        }

        /// <summary>
        /// 添加文件
        /// </summary>
        /// <param name="fileName">文件名称</param>
        /// <param name="filePath">文件路径</param>
        /// <param name="userId">用户id</param>
        /// <param name="fileType">文件类型 0背景图片1音乐2图片类型</param>
        /// <returns></returns>
        public string AddFile(string fileName, string filePath, string userId, string fileType, string fileUserName)
        {
            return dal.AddFile(fileName, filePath, userId, fileType, fileUserName);
        }
        /// <summary>
        /// 删除文件
        /// </summary>
        /// <param name="fileid"></param>
        /// <returns></returns>
        public string DeleteFile(string fileid)
        {
            return dal.DeleteFile(fileid);
        }
        /// <summary>
        /// 发布场景
        /// </summary>
        /// <param name="id">场景id</param>
        /// <param name="name">场景名称</param>
        /// <param name="createUser">创建人</param>
        /// <param name="type">场景类型</param>
        /// <param name="createTime">创建时间</param>
        /// <param name="cover">缩略图</param>
        /// <param name="code">场景id</param>
        /// <param name="description">说明</param>
        /// <returns></returns>
        public string publish(string id, string name, string createUser, string type, string createTime, string cover, string code, string description)
        {
            return dal.publish(id, name, createUser, type, createTime, cover, code, description);
        }

        /// <summary>
        /// 根据用户id获取场景列表
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public DataTable GetSenceByUserId(string userId, string selectStr, string hnagye, int PageInt, int CountRow)
        {
            return dal.GetSenceByUserId(userId, selectStr, hnagye, PageInt, CountRow);
        }
        /// <summary>
        /// 获取文件总数
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="fileType"></param>
        /// <returns></returns>
        public int GetFileCount(string userId, int fileType)
        {
            return dal.GetFileCount(userId, fileType);
        }
        /// <summary>
        /// 设置封面
        /// </summary>
        /// <param name="src"></param>
        /// <param name="fileType"></param>
        /// <param name="x"></param>
        /// <param name="y"></param>
        /// <param name="w"></param>
        /// <param name="h"></param>
        /// <returns></returns>
        public bool UpdateCover(string src, string fileType, int x, int y, int w, int h, string scene_code)
        {
            return dal.UpdateCover(src, fileType, x, y, w, h, scene_code);
        }
        /// <summary>
        /// 删除场景
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeleteSence(string id)
        {
            return dal.DeleteSence(id);
        }
        /// <summary>
        /// 复制场景
        /// </summary>
        /// <param name="id"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public bool CopeSence(string id, string userId)
        {
            return dal.CopeSence(id, userId);
        }
        /// <summary>
        /// 查询此人的拥有的场景总数
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public int GetSenceCount(string userId)
        {
            return dal.GetSenceCount(userId);
        }

        /// <summary>
        /// 用户场景查询所有
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="senceName"></param>
        /// <param name="Code"></param>
        /// <param name="isModel"></param>
        /// <param name="SenceType"></param>
        /// <param name="State"></param>
        /// <returns></returns>
        public DataTable GetUserCenceAll(string userName, string senceName, string Code, string isModel, string SenceType, string State, int pageNum, int RowCount)
        {
            return dal.GetUserCenceAll(userName, senceName, Code, isModel, SenceType, State, pageNum, RowCount,"");
        }
        /// <summary>
        /// 网站场景查询所有
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="senceName"></param>
        /// <param name="Code"></param>
        /// <param name="isModel"></param>
        /// <param name="SenceType"></param>
        /// <param name="State"></param>
        /// <returns></returns>
        public DataTable GetWebCenceAll(string userName, string senceName, string Code, string isModel, string SenceType, string State, int pageNum, int RowCount)
        {
            return dal.GetUserCenceAll(userName, senceName, Code, isModel, SenceType, State, pageNum, RowCount, "web");
        }
        /// <summary>
        /// 获取场景总数
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="senceName"></param>
        /// <param name="Code"></param>
        /// <param name="isModel"></param>
        /// <param name="SenceType"></param>
        /// <param name="State"></param>
        /// <returns></returns>
        public int GTetUserCenceInt(string userName, string senceName, string Code, string isModel, string SenceType, string State,string user)
        {
            return dal.GTetUserCenceInt(userName, senceName, Code, isModel, SenceType, State, user);
        }
        /// <summary>
        /// 生成模板
        /// </summary>
        /// <param name="cenceCode"></param>
        /// <returns></returns>
        public bool AddTempBySence(string cenceCode, float Money, string sence_code_id)
        {
            return dal.AddTempBySence(cenceCode, Money, sence_code_id);
        }
        /// <summary>
        /// 用户场景生成网站场景
        /// </summary>
        /// <param name="cenceCode"></param>
        /// <returns></returns>
        public bool AddWebSence(string cenceCode)
        {
            return dal.AddWebSence(cenceCode);
        }
        /// <summary>
        /// 根据code查询场景信息
        /// </summary>
        /// <param name="senceCode"></param>
        /// <returns></returns>
        public DataTable GetModelByCode(string senceCode)
        {
            return dal.GetModelByCode(senceCode);
        }
        /// <summary>
        /// 修改场景
        /// </summary>
        /// <param name="senceCode"></param>
        /// <returns></returns>
        public bool UpdateSence(string senceCode, string scene_name, string addtime, string state_code_id, string scene_custom_id, string des)
        {
            return dal.UpdateSence(senceCode, scene_name, addtime, state_code_id, scene_custom_id, des);
        }
        /// <summary>
        /// 审核场景
        /// </summary>
        /// <param name="senceCode"></param>
        /// <param name="b">true 通过审核 false 没有通过审核</param>
        /// <returns></returns>
        public bool shSence(string senceCode, bool b)
        {
            return dal.shSence(senceCode, b);
        }
        /// <summary>
        /// 删除模板
        /// </summary>
        /// <param name="tempCode"></param>
        /// <returns></returns>
        public bool DeleteTemp(string tempCode)
        {
            return dal.DeleteTemp(tempCode);
        }
        /// <summary>
        /// 查询场景的分页内容
        /// </summary>
        /// <param name="senceId"></param>
        /// <param name="num"></param>
        /// <returns></returns>
        public string GetPageContent(string senceId, string num)
        {
            return dal.GetPageContent(senceId, num);
        }
    }
}
