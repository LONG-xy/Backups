using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using factory;
using MySql.Data.MySqlClient;

namespace Dal
{
    public class Code_groupDal
    {
        /// <summary>
        /// 获取字典分组列表
        /// </summary>
        /// <returns></returns>
        public DataTable GetTable()
        {
            string sql = "SELECT group_id,group_msg FROM tb_code_group";
            try
            {
                DataTable dt= DbHelperMySQL.Query(sql).Tables[0];
                return dt;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("获取字典分组列表:"+ sql, ex);
                return null;
            }
        }

       
    }
}
