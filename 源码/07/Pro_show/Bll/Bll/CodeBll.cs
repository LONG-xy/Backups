using Dal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Bll
{
    public class CodeBll
    {
        CodeDal dal = new CodeDal();
        /// <summary>
        /// 根据分组id获取字典集合
        /// </summary>
        /// <param name="groupId">分组id</param>
        /// <param name="state">0可用 1不可用</param>
        /// <returns></returns>
        public DataTable GetTableByGroup(string groupId, int state)
        {
            return dal.GetTableByGroup(groupId, state);
        }
        /// <summary>
        /// 获取汉字描述
        /// </summary>
        /// <param name="group">分组id</param>
        /// <param name="codeid">字典id</param>
        /// <returns></returns>
        public string GetStrByGroupCode(string group, string codeid)
        {
            return dal.GetStrByGroupCode(group, codeid);
        }
        /// <summary>
        /// 查询字典类型
        /// </summary>
        /// <returns></returns>
        public DataTable GetGroung()
        {
            return dal.GetGroung();
        }
        /// <summary>
        /// 查询Code信息
        /// </summary>
        /// <param name="CodeType"></param>
        /// <returns></returns>
        public DataTable GetCode(string CodeType, int pageNo, int pageSize)
        {
            return dal.GetCode(CodeType, pageNo, pageSize);
        }
        /// <summary>
        /// 查询Code信息总数
        /// </summary>
        /// <param name="CodeType"></param>
        /// <returns></returns>
        public int GetCodeCount(string CodeType)
        {
            return dal.GetCodeCount(CodeType);
        }
        /// <summary>
        /// 设置字典项是停用，还是启用
        /// </summary>
        /// <param name="codeid"></param>
        /// <param name="groupid"></param>
        /// <param name="status"></param>
        public void SetStatus(string codeid, string groupid, string status)
        {
            dal.SetStatus(codeid, groupid, status);
        }
        /// <summary>
        /// 修改字典项
        /// </summary>
        /// <param name="codeid"></param>
        /// <param name="groupid"></param>
        /// <param name="msg"></param>
        public void UpdateCode(string codeid, string groupid, string msg)
        {
            dal.UpdateCode(codeid, groupid, msg);
        }
        /// <summary>
        /// 添加字典项
        /// </summary>
        /// <param name="groupid"></param>
        /// <param name="msg"></param>
        public void AddCode(string groupid, string msg)
        {
            dal.AddCode(groupid, msg);
        }
    }
}
