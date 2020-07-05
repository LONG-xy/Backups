using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using factory;
using MySql.Data.MySqlClient;
using Model;

namespace Dal
{
    public class TempsDal
    {
        /// <summary>
        /// 查找模板
        /// </summary>
        /// <param name="H">行业</param>
        /// <param name="C">场景</param>
        /// <param name="orderByFree">免费还是全部 全部为0 免费为1</param>
        /// <param name="OrderByNew">最新发布还是最受欢迎 1为最新发布 0为最受欢迎</param>
        /// <param name="PageInt">当前页数</param>
        /// <param name="CountRow">一次返回多少数据</param>
        /// <param name="SerachStr">查询信息</param>
        /// <returns></returns>
        public DataTable GetTable(int H, int C, int orderByFree, int OrderByNew, int PageInt, int CountRow, string SerachStr)
        {
            int start = PageInt * CountRow - (CountRow - 1);//开始行数
            int end = PageInt * CountRow;//结束行数
            string orderBy = (OrderByNew == 0 ? " ORDER BY MouseClick DESC" : " ORDER BY addtime DESC");
            string sql = "set @rowNum=0; SELECT * FROM (SELECT *,(@rowNum:=@rowNum+1) AS RowNum FROM(SELECT temp_id,temp_name,cover,MouseClick,Money,addtime,type_code_id,sence_code_id,qrCode,temp_code FROM ts_temps WHERE state_code_id=0 AND temp_name LIKE '%" + SerachStr + "%'  ";
            string where = "";
            where += (H == 0 ? "" : " AND type_code_id=" + H.ToString());
            where += (C == 0 ? "" : " AND sence_code_id=" + C.ToString());
            where += (orderByFree == 1 ? " AND (Money=0 or Money is null)" : "");
            sql = sql + where + orderBy + ") AS TEMP) AS t2 WHERE 1=1 AND RowNum>=" + start + " AND RowNum<=" + end + "";
            try
            {
                DataTable dt = DbHelperMySQL.Query(sql).Tables[0];
                return dt;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("查找模板:" + sql, ex);
                return null;
            }
        }
        /// <summary>
        /// 后台查询模板
        /// </summary>
        /// <param name="modelName">模板名称</param>
        /// <param name="modelCode">模板编号</param>
        /// <param name="modelStatus">模板状态</param>
        /// <param name="modelHy">模板行业</param>
        /// <param name="modelCj">模板场景</param>
        /// <returns></returns>
        public DataTable GetTableModel(string modelName, string modelCode, string modelStatus, string modelHy, string modelCj, int PageInt, int CountRow)
        {
            int start = PageInt * CountRow - (CountRow - 1);//开始行数
            int end = PageInt * CountRow;//结束行数
            string sql = "set @rowNum=0; SELECT * FROM (SELECT *,(@rowNum:=@rowNum+1) AS RowNum FROM(SELECT tb_show_user.user_name,ts_temps.temp_code,ts_temps.temp_name,ts_temps.addtime,(select msg from tb_code where group_id=3 and code_id=sence_code_id) as senceName,tb_code.msg,MouseClick,ts_temps.state_code_id FROM ts_temps,tb_show_user,tb_code WHERE tb_show_user.user_id=ts_temps.author and tb_code.group_id=2 and tb_code.code_id=ts_temps.type_code_id  ";
            string where = "";
            where += " and temp_name like '%" + modelName + "%' ";
            where += " and temp_code like '%" + modelCode + "%' ";
            if (modelStatus != "-1")
            {
                where += " and state_code_id ='" + modelStatus + "' ";
            }
            where += (modelHy == "-1" ? "" : " AND type_code_id=" + modelHy.ToString());
            where += (modelCj == "-1" ? "" : " AND sence_code_id=" + modelCj.ToString());
            sql = sql + where + " ORDER BY  ts_temps.addtime DESC" + ") AS TEMP) AS t2 WHERE 1=1 AND RowNum>=" + start + " AND RowNum<=" + end + "";
            try
            {
                DataTable dt = DbHelperMySQL.Query(sql).Tables[0];
                return dt;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("后台查询模板:" + sql, ex);
                return null;
            }
        }
        /// <summary>
        /// 后台查询模板数量
        /// </summary>
        /// <param name="modelName"></param>
        /// <param name="modelCode"></param>
        /// <param name="modelStatus"></param>
        /// <param name="modelHy"></param>
        /// <param name="modelCj"></param>
        /// <returns></returns>
        public int GetModelCount(string modelName, string modelCode, string modelStatus, string modelHy, string modelCj)
        {
            string sql = "SELECT count(1) FROM ts_temps WHERE 1=1";
            string where = "";
            where += " and temp_name like '%" + modelName + "%' ";
            where += " and temp_code like '%" + modelCode + "%' ";
            if (modelStatus != "-1")
            {
                where += " and state_code_id ='" + modelStatus + "' ";
            }
            where += (modelHy == "-1" ? "" : " AND type_code_id=" + modelHy.ToString());
            where += (modelCj == "-1" ? "" : " AND sence_code_id=" + modelCj.ToString());
            sql = sql + where;
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
                LogHelper.Instance.Info("后台查询模板数量:" + sql, ex);
                return 0;
            }
        }
        /// <summary>
        /// 增加模板查看次数
        /// </summary>
        /// <param name="id"></param>
        public void AddNum(string id)
        {
            string sql = "UPDATE ts_temps SET MouseClick=MouseClick+1 WHERE temp_code=?temp_code";
            MySqlParameter[] para = {
                new MySqlParameter("?temp_code",id)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("增加模板查看次数:" + sql, ex);
            }
        }
        /// <summary>
        /// 根据id获取模板信息
        /// </summary>
        /// <param name="tempid"></param>
        /// <returns></returns>
        public temp GetModel(string temp_code)
        {
            temp t = new temp();
            string sql = "SELECT cover,des,author,(SELECT user_name FROM tb_show_user WHERE tb_show_user.user_id=ts_temps.author) AS authorName,MouseClick,Money FROM ts_temps WHERE temp_code=?temp_code";
            MySqlParameter[] para = {
                new MySqlParameter("?temp_code",temp_code)
            };
            try
            {
                MySqlDataReader dr = DbHelperMySQL.ExecuteReader(sql, para);
                while (dr.Read())
                {
                    t.cover = dr["cover"].ToString();
                    t.des = dr["des"].ToString();
                    t.author = dr["author"].ToString();
                    t.authorName = dr["authorName"].ToString();
                    t.MouseClick = dr["MouseClick"].ToString();
                    t.Money = dr["Money"].ToString();
                }
                dr.Close();
                return t;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("根据ip获取模板信息:" + sql, ex);
                return null;
            }
        }
        /// <summary>
        /// 使用模板
        /// </summary>
        /// <param name="temp_code"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public string CopeTemp(string temp_code, string userId)
        {
            string nuwCode = Guid.NewGuid().ToString();
            Model.temp m = new temp();
            string sql = "select temp_name,use_num,addtime,type_code_id,des,state_code_id,cover,js_file_id,css_file_id,Money,sh,movietype,musicUrl,videoUrl,tj,author,qrCode,userNum,MouseClick,sence_code_id,fileType,x,y,w,h,scene_custom_id,scene_typeid from ts_temps where temp_code=?temp_code";
            MySqlParameter[] para = {
                new MySqlParameter("?temp_code",temp_code)
            };
            MySqlDataReader dr = DbHelperMySQL.ExecuteReader(sql, para);
            while (dr.Read())
            {
                m.temp_name = dr["temp_name"].ToString();
                m.use_num = "0";
                m.addtime = DateTime.Now.ToString();
                m.type_code_id = dr["type_code_id"].ToString();
                m.des = dr["des"].ToString();
                m.state_code_id = "0";
                m.cover = dr["cover"].ToString();
                m.js_file_id = dr["js_file_id"].ToString();
                m.css_file_id = dr["css_file_id"].ToString();
                m.Money = dr["Money"].ToString();
                m.sh = "1";
                m.movietype = dr["movietype"].ToString();
                m.musicUrl = dr["musicUrl"].ToString();
                m.videoUrl = dr["videoUrl"].ToString();
                m.tj = "1";
                m.author = userId;
                m.qrCode = dr["qrCode"].ToString();
                m.userNum = "0";
                m.MouseClick = "0";
                m.sence_code_id = dr["sence_code_id"].ToString();
                m.fileType = dr["fileType"].ToString();
                m.x = dr["x"].ToString();
                m.y = dr["y"].ToString();
                m.w = dr["w"].ToString();
                m.h = dr["h"].ToString();
                m.scene_custom_id = dr["scene_custom_id"].ToString();
            }
            dr.Close();
            string sqlInsertSence = "insert into tb_scene(scene_code,scene_name,addtime,state_code_id,visit_num,use_num,dic_code_id,cover,scene_custom_id,scene_typeid,js_file_id,css_file_id,sh,movietype,musicUrl,videoUrl,tj,author,qrCode,userNum,des,Modeled,fileType,x,y,w,h,MouseClick) values(?scene_code,?scene_name,?addtime,?state_code_id,?visit_num,?use_num,?dic_code_id,?cover,?scene_custom_id,?scene_typeid,?js_file_id,?css_file_id,?sh,?movietype,?musicUrl,?videoUrl,?tj,?author,?qrCode,?userNum,?des,?Modeled,?fileType,?x,?y,?w,?h,?MouseClick)";
            MySqlParameter[] paraInsertSence = {
                new MySqlParameter("?scene_code",nuwCode),
                new MySqlParameter("?scene_name",m.temp_name),
                new MySqlParameter("?addtime",m.addtime),
                new MySqlParameter("?state_code_id",m.state_code_id),
                new MySqlParameter("?visit_num","0"),
                new MySqlParameter("?use_num","0"),
                new MySqlParameter("?dic_code_id","0"),
                new MySqlParameter("?cover",m.cover),
                new MySqlParameter("?scene_custom_id",m.scene_custom_id),
                 new MySqlParameter("?scene_typeid",m.scene_typeid),
                 new MySqlParameter("?js_file_id",m.js_file_id),
                 new MySqlParameter("?css_file_id",m.css_file_id),
                 new MySqlParameter("?sh",m.sh),
                 new MySqlParameter("?movietype",m.movietype),
                 new MySqlParameter("?musicUrl",m.musicUrl),
                 new MySqlParameter("?videoUrl",m.videoUrl),
                 new MySqlParameter("?tj",m.tj),
                 new MySqlParameter("?author",m.author),
                 new MySqlParameter("?qrCode",m.qrCode),
                 new MySqlParameter("?userNum",m.userNum),
                 new MySqlParameter("?des",m.des),
                 new MySqlParameter("?Modeled","0"),
                 new MySqlParameter("?fileType",m.fileType),
                 new MySqlParameter("?x",m.x==""?null:m.x),
                 new MySqlParameter("?y",m.y==""?null:m.y),
                  new MySqlParameter("?w",m.w==""?null:m.w),
                   new MySqlParameter("?h",m.h==""?null:m.h),
                   new MySqlParameter("?MouseClick","0")
            };

            string sqlpage = "select content_text,temp_code,num,type_code_id,pageName from ts_temp_pag where temp_code=?temp_code";
            MySqlParameter[] parapage = {
                new MySqlParameter("?temp_code",temp_code)
            };
            List<Model.temp_pag> tlist = new List<temp_pag>();
            MySqlDataReader drpage = DbHelperMySQL.ExecuteReader(sqlpage, parapage);
            while (drpage.Read())
            {
                Model.temp_pag mtm = new temp_pag();
                mtm.content_text = drpage["content_text"].ToString();
                mtm.temp_code = drpage["temp_code"].ToString();
                mtm.num = drpage["num"].ToString();
                mtm.type_code_id = drpage["type_code_id"].ToString();
                mtm.pageName = drpage["pageName"].ToString();
                tlist.Add(mtm);
            }
            drpage.Close();
            string sqlpageInsert = "insert into tb_scene_pag(content_text,scene_code,flip_code_id,pageName,num) values(?content_text,?scene_code,?flip_code_id,?pageName,?num)";
            try
            {
                DbHelperMySQL.ExecuteSql(sqlInsertSence, paraInsertSence);
                foreach (Model.temp_pag ftm in tlist)
                {
                    MySqlParameter[] paratmpinsert = {
                        new MySqlParameter("?content_text",ftm.content_text),
                        new MySqlParameter("?scene_code",nuwCode),
                        new MySqlParameter("?flip_code_id",null),
                        new MySqlParameter("?pageName",ftm.pageName),
                        new MySqlParameter("?num",ftm.num),
                    };
                    DbHelperMySQL.ExecuteSql(sqlpageInsert, paratmpinsert);
                }
                return nuwCode;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("使用模板:" + sql, ex);
                return "";
            }
        }

        /// <summary>
        /// 获取模板信息
        /// </summary>
        /// <param name="sence_code"></param>
        /// <returns></returns>
        public Model.temp GetModelTemp(string temp_code)
        {
            Model.temp m = new Model.temp();
            string sql = "select temp_name,addtime,state_code_id,use_num,cover,scene_custom_id,sh,tj,musicUrl,videoUrl,movietype,qrCode,author,userNum,MouseClick,js_file_id,scene_typeid,css_file_id,des from ts_temps where temp_code=?temp_code";
            MySqlParameter[] para = {
                new MySqlParameter("?temp_code",temp_code)
            };
            try
            {
                MySqlDataReader dr = DbHelperMySQL.ExecuteReader(sql, para);
                while (dr.Read())
                {
                    m.temp_name = dr["temp_name"].ToString();
                    m.addtime = dr["addtime"].ToString();
                    m.state_code_id = dr["state_code_id"].ToString();
                    m.use_num = dr["use_num"].ToString();
                    m.cover = dr["cover"].ToString();
                    m.scene_custom_id = dr["scene_custom_id"].ToString();
                    m.sh = dr["sh"].ToString();
                    m.tj = dr["tj"].ToString();
                    m.musicUrl = dr["musicUrl"].ToString();
                    m.videoUrl = dr["videoUrl"].ToString();
                    m.movietype = dr["movietype"].ToString();
                    m.qrCode = dr["qrCode"].ToString();
                    m.author = dr["author"].ToString();
                    m.userNum = dr["userNum"].ToString();
                    m.MouseClick = dr["MouseClick"].ToString();
                    m.js_file_id = dr["js_file_id"].ToString();
                    m.scene_typeid = dr["scene_typeid"].ToString();
                    m.css_file_id = dr["css_file_id"].ToString();
                    m.des = dr["des"].ToString();
                }
                dr.Close();
                return m;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("获取模板信息:" + sql, ex);
                return null;
            }
        }

        /// <summary>
        /// 根据模板编码获取分页信息
        /// </summary>
        /// <param name="SceneCode"></param>
        /// <returns></returns>
        public List<Model.temp_pag> GetPageListByTempCode(string temp_code)
        {
            List<Model.temp_pag> list = new List<Model.temp_pag>();
            string sql = "select content_text,num,pageName,pag_id from ts_temp_pag where temp_code=?temp_code order by num";
            MySqlParameter[] para = {
                new MySqlParameter("?temp_code",temp_code)
            };
            try
            {
                MySqlDataReader dr = DbHelperMySQL.ExecuteReader(sql, para);
                while (dr.Read())
                {
                    Model.temp_pag mp = new Model.temp_pag();
                    mp.pag_id = dr["pag_id"].ToString();
                    mp.content_text = dr["content_text"].ToString();
                    mp.num = dr["num"].ToString();
                    mp.pageName = dr["pageName"].ToString();
                    list.Add(mp);
                }
                dr.Close();
                return list;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("根据模板编码获取分页信息:" + sql, ex);
                return null;
            }
        }

    }
}
