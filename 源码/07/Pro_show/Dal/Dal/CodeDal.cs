using factory;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Dal
{
    public class CodeDal
    {
        /// <summary>
        /// 根据分组id获取字典集合
        /// </summary>
        /// <param name="groupId">分组id</param>
        /// <param name="state">0可用 1不可用</param>
        /// <returns></returns>
        public DataTable GetTableByGroup(string groupId, int state)
        {
            string sql = "SELECT code_id,msg from tb_code WHERE group_id=?group_id AND state=?state";
            MySqlParameter[] para = {
                new MySqlParameter("?group_id",groupId),
                new MySqlParameter("?state",state)
            };
            try
            {
                DataTable dt = DbHelperMySQL.Query(sql, para).Tables[0];
                return dt;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("根据分组id获取字典集合:" + sql, ex);
                return null;
            }
        }
        /// <summary>
        /// 获取汉字描述
        /// </summary>
        /// <param name="group">分组id</param>
        /// <param name="codeid">字典id</param>
        /// <returns></returns>
        public string GetStrByGroupCode(string group, string codeid)
        {
            string sql = "SELECT msg FROM tb_code WHERE group_id=?group_id AND code_id=?code_id";
            MySqlParameter[] para = {
                new MySqlParameter("?group_id",group),
                new MySqlParameter("?code_id",codeid)
            };
            try
            {
                object o = DbHelperMySQL.GetSingle(sql, para);
                if (o != null)
                {
                    return o.ToString();
                }
                return "";
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("获取汉字描述:" + sql, ex);
                return null;
            }
        }

        /// <summary>
        /// 查询Code信息
        /// </summary>
        /// <param name="CodeType"></param>
        /// <returns></returns>
        public DataTable GetCode(string CodeType, int pageNo, int pageSize)
        {
            int start = pageNo * pageSize - (pageSize - 1);//开始行数
            int end = pageNo * pageSize;//结束行数
            string where = "";
            if (CodeType != "-1")
            {
                where = "and tb_code_group.group_id='" + CodeType + "'";
            }
            string sql = "set @rowNum=0; select * from (SELECT * FROM (SELECT *,(@rowNum:=@rowNum+1) AS RowNum FROM(select tb_code.code_id,tb_code.msg,tb_code.state,tb_code_group.group_msg,tb_code.group_id from tb_code,tb_code_group where tb_code_group.group_id=tb_code.group_id " + where + ") as c) as a) as b where RowNum>=" + start + " and RowNum<=" + end + " ";
            try
            {
                return DbHelperMySQL.Query(sql).Tables[0];
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("查询Code信息:" + sql, ex);
                return null;
            }
        }
        /// <summary>
        /// 查询Code信息总数
        /// </summary>
        /// <param name="CodeType"></param>
        /// <returns></returns>
        public int GetCodeCount(string CodeType)
        {
            string where = "";
            if (CodeType != "-1")
            {
                where = "and tb_code_group.group_id='" + CodeType + "'";
            }
            string sql = "select count(1) from tb_code,tb_code_group where tb_code_group.group_id=tb_code.group_id " + where + "";
            try
            {
                object o = DbHelperMySQL.GetSingle(sql);
                if (o != null)
                {
                    return int.Parse(o.ToString());
                }
                return 0;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("查询Code信息:" + sql, ex);
                return 0;
            }
        }
        /// <summary>
        /// 查询字典类型
        /// </summary>
        /// <returns></returns>
        public DataTable GetGroung()
        {
            string sql = "select group_msg,group_id from tb_code_group";
            try
            {
                return DbHelperMySQL.Query(sql).Tables[0];
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("查询字典类型:" + sql, ex);
                return null;
            }
        }
        /// <summary>
        /// 设置字典项是停用，还是启用
        /// </summary>
        /// <param name="codeid"></param>
        /// <param name="groupid"></param>
        /// <param name="status"></param>
        public void SetStatus(string codeid, string groupid, string status)
        {
            string sql = "update tb_code set state='"+ status + "' where code_id='"+ codeid + "' and group_id='"+ groupid + "'";
            try
            {
                DbHelperMySQL.ExecuteSql(sql);
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("设置字典项是停用，还是启用:" + sql, ex);
            }
        }
        /// <summary>
        /// 修改字典项
        /// </summary>
        /// <param name="codeid"></param>
        /// <param name="groupid"></param>
        /// <param name="msg"></param>
        public void UpdateCode(string codeid, string groupid, string msg)
        {
            string sql = "update tb_code set msg='"+ msg + "' where code_id='" + codeid + "' and group_id='" + groupid + "'";
            try
            {
                DbHelperMySQL.ExecuteSql(sql);
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("修改字典项:" + sql, ex);
            }
        }
        /// <summary>
        /// 添加字典项
        /// </summary>
        /// <param name="groupid"></param>
        /// <param name="msg"></param>
        public void AddCode(string groupid, string msg)
        {
            string sql = "insert into tb_code(group_id,state,msg) values('"+ groupid + "','0','"+ msg + "')";
            try
            {
                DbHelperMySQL.ExecuteSql(sql);
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("添加字典项:" + sql, ex);
            }
        }
    }
}
