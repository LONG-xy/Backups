using factory;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Dal
{
    public class sceneDal
    {
        /// <summary>
        /// 更改场景状态
        /// </summary>
        /// <param name="SenceCode"></param>
        public void SetSenceStatus(string SenceCode)
        {
            string sql = "update tb_scene set state_code_id=1 where scene_code=?scene_code";
            MySqlParameter[] para = {
                new MySqlParameter("?scene_code",SenceCode)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("更改场景状态:" + sql, ex);
            }
        }
        /// <summary>
        /// 更改用户状态和场景状态
        /// </summary>
        /// <param name="SenceCode"></param>
        public void SetUserAndStatus(string SenceCode)
        {
            string sql1 = "update tb_scene set state_code_id=2 where scene_code=?scene_code";
            string sql2 = "update tb_show_user set state_code_id=99 where user_id=(select author from tb_scene where scene_code=?scene_code)";
            MySqlParameter[] para = {
                new MySqlParameter("?scene_code",SenceCode)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql1, para);
                DbHelperMySQL.ExecuteSql(sql2, para);
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("更改用户状态和场景状态:" + sql2, ex);
            }
        }
        /// <summary>
        /// 根据场景标识查询状态
        /// </summary>
        /// <param name="SenceCode"></param>
        public string GetStatus(string SenceCode)
        {
            string sql = "select state_code_id from tb_scene where  scene_code=?scene_code";
            MySqlParameter[] para = {
                new MySqlParameter("?scene_code",SenceCode)
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
                LogHelper.Instance.Info("根据场景标识查询状态:" + sql, ex);
                return "";
            }
        }
        /// <summary>
        /// 创建场景默认
        /// </summary>
        /// <param name="Userid">用户id</param>
        /// <param name="hyid">场景类型</param>
        /// <param name="sceneCode">场景编号</param>
        public void DefaultScene(string Userid, string hyid, string sceneCode)
        {
            DateTime time = new DateTime();
            string sql = "INSERT INTO tb_scene(scene_code,scene_name,addtime,state_code_id,visit_num,use_num,dic_code_id,cover,scene_custom_id,js_file_id,css_file_id,sh,movietype,musicUrl,videoUrl,tj,author,qrCode,userNum,MouseClick) ";
            sql += " VALUES('" + sceneCode + "','默认名称','" + time.ToString() + "','0','0','0','12','default_thum.jpg',?hyid,'0','0','1','0','','','1',?Userid,'','0','0')";
            MySqlParameter[] para = {
                new MySqlParameter("?hyid",hyid),
                new MySqlParameter("?Userid",Userid)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("根据分组id获取字典集合:" + sql, ex);
            }
        }
        /// <summary>
        /// 创建默认页
        /// </summary>
        /// <param name="sceneCode"></param>
        public void DefaultScenePage(string sceneCode)
        {
            string sql = "INSERT INTO tb_scene_pag(content_text,scene_code,num,pageName) VALUES('',?sceneCode,1,'')";
            MySqlParameter[] para = {
                new MySqlParameter("?sceneCode",sceneCode)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("创建默认页:" + sql, ex);
            }
        }

        /// <summary>
        /// 根据场景编码获取场景信息
        /// </summary>
        /// <param name="scene_code"></param>
        /// <returns></returns>
        public Model.scene GetModel(string scene_code)
        {
            Model.scene m = new Model.scene();
            string sql = "select scene_name,addtime,state_code_id,visit_num,use_num,dic_code_id,cover,scene_custom_id,sh,tj,musicUrl,videoUrl,movietype,qrCode,author,userNum,MouseClick,js_file_id,scene_typeid,css_file_id,des from tb_scene where scene_code=?scene_code";
            MySqlParameter[] para = {
                new MySqlParameter("?scene_code",scene_code)
            };
            try
            {
                MySqlDataReader dr = DbHelperMySQL.ExecuteReader(sql, para);
                while (dr.Read())
                {
                    m.scene_name = dr["scene_name"].ToString();
                    m.addtime = dr["addtime"].ToString();
                    m.state_code_id = dr["state_code_id"].ToString();
                    m.visit_num = dr["visit_num"].ToString();
                    m.use_num = dr["use_num"].ToString();
                    m.dic_code_id = dr["dic_code_id"].ToString();
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
                LogHelper.Instance.Info("根据场景编码获取场景信息:" + sql, ex);
                return null;
            }
        }


        /// <summary>
        /// 根据场景编码获取分页信息
        /// </summary>
        /// <param name="SceneCode"></param>
        /// <returns></returns>
        public List<Model.scene_pag> GetPageListBySceneCode(string SceneCode)
        {
            List<Model.scene_pag> list = new List<Model.scene_pag>();
            string sql = "select content_text,num,pageName,scene_pag_id from tb_scene_pag where scene_code=?scene_code order by num";
            MySqlParameter[] para = {
                new MySqlParameter("?scene_code",SceneCode)
            };
            try
            {
                MySqlDataReader dr = DbHelperMySQL.ExecuteReader(sql, para);
                while (dr.Read())
                {
                    Model.scene_pag mp = new Model.scene_pag();
                    mp.content_text = dr["content_text"].ToString();
                    mp.num = dr["num"].ToString();
                    mp.pageName = dr["pageName"].ToString();
                    mp.scene_pag_id = dr["scene_pag_id"].ToString();
                    list.Add(mp);
                }
                dr.Close();
                return list;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("根据场景编码获取分页信息:" + sql, ex);
                return null;
            }
        }



        /// <summary>
        /// 根据页面id获取页面信息
        /// </summary>
        /// <param name="pageID"></param>
        /// <returns></returns>
        public Model.scene_pag GetpageModel(string pageID)
        {
            Model.scene_pag model = new Model.scene_pag();
            string sql = "select content_text,scene_code,flip_code_id,pageName,num from tb_scene_pag where scene_pag_id=?scene_pag_id";
            MySqlParameter[] para = {
                new MySqlParameter("?scene_pag_id",pageID)
            };
            try
            {
                MySqlDataReader dr = DbHelperMySQL.ExecuteReader(sql, para);
                while (dr.Read())
                {
                    model.content_text = dr["content_text"].ToString();
                    model.scene_code = dr["scene_code"].ToString();
                    model.flip_code_id = dr["flip_code_id"].ToString();
                    model.pageName = dr["pageName"].ToString();
                    model.num = dr["num"].ToString();
                }
                dr.Close();
                return model;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("根据页面id获取页面信息:" + sql, ex);
                return null;
            }
        }

        /// <summary>
        /// 保存页面信息
        /// </summary>
        /// <param name="sp"></param>
        public bool SavePage(Model.scene_pag sp)
        {
            string sql = "update tb_scene_pag set content_text=?content_text,scene_code=?scene_code,pageName=?pageName,num=?num  where scene_pag_id=?scene_pag_id";
            MySqlParameter[] para = {
                new MySqlParameter("content_text",sp.content_text),
                new MySqlParameter("scene_code",sp.scene_code),
                new MySqlParameter("pageName",sp.pageName),
                new MySqlParameter("num",sp.num),
                new MySqlParameter("scene_pag_id",sp.scene_pag_id)
            };
            string sqlsence = "update tb_scene set musicUrl=?musicUrl where scene_code=?scene_code";
            MySqlParameter[] parasence = {
                new MySqlParameter("?musicUrl",sp.bgAudio),
                new MySqlParameter("?scene_code",sp.scene_code)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
                DbHelperMySQL.ExecuteSql(sqlsence, parasence);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("保存页面信息:" + sql, ex);
                return false;
            }
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
            string sql = "update tb_scene_pag set content_text='" + ele + "' where scene_code='" + sencecode + "' and num='" + num + "'";
            try
            {
                DbHelperMySQL.ExecuteSql(sql);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("修改页面信息手机:" + sql, ex);
                return false;
            }
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
            string sql = "update tb_scene_pag set pageName=?pageName where scene_pag_id=?scene_pag_id";
            MySqlParameter[] para = {
                new MySqlParameter("?pageName",name),
                new MySqlParameter("?scene_pag_id",pageid)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("修改页面名称:" + sql, ex);
                return false;
            }
        }

        /// <summary>
        /// 调整页面顺序
        /// </summary>
        /// <param name="pageid"></param>
        /// <param name="num"></param>
        /// <returns></returns>
        public bool UpdateSize(int pageid, int num)
        {
            string sql = "";
            string zidhen = "";
            //获取场景id
            string scenceCode = "select scene_code from tb_scene_pag where scene_pag_id=" + pageid + "";
            object o = DbHelperMySQL.GetSingle(scenceCode);//场景id
            //获取自身页码
            string numsql = "select num from tb_scene_pag where scene_pag_id=" + pageid + "";
            object numPage = DbHelperMySQL.GetSingle(numsql);//自身页码
            //自身页码小于要到的页码
            if (int.Parse(numPage.ToString()) < num)
            {
                sql = "update tb_scene_pag set num=num-1 where scene_code='" + o.ToString() + "' and num>" + numPage.ToString() + " and num<=" + num + ""; ;
                zidhen = "update tb_scene_pag set num=" + num + " where scene_pag_id=" + pageid + "";
            }
            else
            {
                sql = "update tb_scene_pag set num=num+1 where scene_code='" + o.ToString() + "' and num<" + numPage.ToString() + " and num>=" + num + ""; ;
                zidhen = "update tb_scene_pag set num=" + num + " where scene_pag_id=" + pageid + "";
            }
            try
            {
                DbHelperMySQL.ExecuteSql(sql);
                DbHelperMySQL.ExecuteSql(zidhen);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("调整页面顺序:" + sql, ex);
                return false;
            }
        }
        /// <summary>
        /// 添加页面进行排序
        /// </summary>
        /// <param name="pageid">在哪个页面下面添加页面</param>
        /// <returns></returns>
        public string AddUpdate(string pageid)
        {
            //获取场景id
            string scenceCode = "select scene_code from tb_scene_pag where scene_pag_id=" + pageid + "";
            object o = DbHelperMySQL.GetSingle(scenceCode);//场景id
            //获取自身页码
            string numsql = "select num from tb_scene_pag where scene_pag_id=" + pageid + "";
            object numPage = DbHelperMySQL.GetSingle(numsql);//自身页码

            int TagNum = int.Parse(numPage.ToString()) + 1;//标志性页码

            string sqlxiaoyu = "update tb_scene_pag set num=num+1 where scene_code='" + o.ToString() + "' and num>=" + TagNum.ToString();
            string sqlInsert = "insert into tb_scene_pag(content_text,scene_code,pageName,num) values('','" + o.ToString() + "',''," + TagNum.ToString() + ")";
            try
            {
                DbHelperMySQL.ExecuteSql(sqlxiaoyu);
                DbHelperMySQL.ExecuteSql(sqlInsert);
                return o.ToString() + "|" + TagNum.ToString();
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("添加页面进行排序:" + sqlxiaoyu, ex);
                return "";
            }
        }

        /// <summary>
        /// 删除页面
        /// </summary>
        /// <param name="pageid"></param>
        /// <returns></returns>
        public string DeletePage(string pageid)
        {
            string scenceCode = "";
            string sqlxiaoyu = "";
            try
            {
                //获取场景id
                scenceCode = "select scene_code from tb_scene_pag where scene_pag_id=" + pageid + "";
                object o = DbHelperMySQL.GetSingle(scenceCode);//场景id

                string numsql = "select num from tb_scene_pag where scene_pag_id=" + pageid + "";
                object numPage = DbHelperMySQL.GetSingle(numsql);//自身页码

                string sqlDelete = "delete from tb_scene_pag where scene_pag_id=" + pageid + "";
                sqlxiaoyu = "update tb_scene_pag set num=num-1 where scene_code='" + o.ToString() + "' and num>=" + numPage.ToString();
                DbHelperMySQL.ExecuteSql(sqlDelete);
                DbHelperMySQL.ExecuteSql(sqlxiaoyu);
                return o.ToString();
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("删除页面:" + sqlxiaoyu, ex);
                return "";
            }
        }

        /// <summary>
        /// 复制页面
        /// </summary>
        /// <param name="pageid"></param>
        /// <returns></returns>
        public string CopyPage(string pageid)
        {
            //获取场景id
            string scenceCode = "select scene_code from tb_scene_pag where scene_pag_id=" + pageid + "";
            object o = DbHelperMySQL.GetSingle(scenceCode);//场景id
            //获取自身页码
            string numsql = "select num from tb_scene_pag where scene_pag_id=" + pageid + "";
            object numPage = DbHelperMySQL.GetSingle(numsql);//自身页码

            string sqlxiaoyu = "update tb_scene_pag set num=num+1 where scene_code='" + o.ToString() + "' and num>" + numPage.ToString();
            string sql = "insert into tb_scene_pag(content_text,scene_code,pageName,num) values(?content_text,?scene_code,?pageName,?num)";

            Model.scene_pag m = GetpageModel(pageid);//获取分页详细信息
            MySqlParameter[] para = {
                new MySqlParameter("?content_text",m.content_text),
                new MySqlParameter("?scene_code",m.scene_code),
                new MySqlParameter("?pageName",m.pageName),
                new MySqlParameter("?num",int.Parse(numPage.ToString())+1)
            };

            try
            {
                DbHelperMySQL.ExecuteSql(sqlxiaoyu);
                DbHelperMySQL.ExecuteSql(sql, para);
                return o.ToString() + "|" + (int.Parse(numPage.ToString()) + 1).ToString() + "|" + m.pageName;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("复制页面:" + sqlxiaoyu, ex);
                return "";
            }
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
            int start = pageNo * pageSize - (pageSize - 1);//开始行数
            int end = pageNo * pageSize;//结束行数

            List<Model.file> list = new List<Model.file>();
            string sql = "set @rowNum=0; select * from (SELECT * FROM (SELECT *,(@rowNum:=@rowNum+1) AS RowNum FROM(select Fileid,extName,fileType,path,addtime,userid,fileName,fileUserName from tb_File where fileType=" + fileType + " and userId='" + userId + "') as c) as a) as b where RowNum>=" + start + " and RowNum<=" + end + " ";
            try
            {
                MySqlDataReader dr = DbHelperMySQL.ExecuteReader(sql);
                while (dr.Read())
                {
                    Model.file m = new Model.file();
                    m.Fileid = dr["Fileid"].ToString();
                    m.extName = dr["extName"].ToString();
                    m.fileType = dr["fileType"].ToString();
                    m.path = dr["path"].ToString();
                    m.addtime = dr["addtime"].ToString();
                    m.userid = dr["userid"].ToString();
                    m.fileName = dr["fileName"].ToString();
                    m.fileUserName = dr["fileUserName"].ToString();
                    list.Add(m);
                }
                dr.Close();
                return list;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("查找文件列表:" + sql, ex);
                return null;
            }
        }

        /// <summary>
        /// 获取文件总数
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="fileType"></param>
        /// <returns></returns>
        public int GetFileCount(string userId, int fileType)
        {
            string sql = "select count(1) from tb_File where fileType='" + fileType + "' and userId='" + userId + "'";
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
                LogHelper.Instance.Info("获取文件总数:" + sql, ex);
                return 0;
            }
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
            string id = Guid.NewGuid().ToString().Replace("-", "");
            string sql = "insert into tb_File(fileid,extName,fileType,path,addtime,fileName,userid,fileUserName) values('" + id + "',?extName,?fileType,?path,?addtime,?fileName,?userid,?fileUserName)";
            MySqlParameter[] para = {
                new MySqlParameter("?extName",fileName.Split('.')[1]),
                new MySqlParameter("?fileType",fileType),
                new MySqlParameter("?path",filePath),
                new MySqlParameter("?addtime",DateTime.Now.ToString()),
                new MySqlParameter("?fileName",fileName),
                new MySqlParameter("?userid",userId),
                new MySqlParameter("?fileUserName",fileUserName)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
                return id;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("添加文件:" + sql, ex);
                return "";
            }
        }

        /// <summary>
        /// 删除文件
        /// </summary>
        /// <param name="fileid"></param>
        /// <returns></returns>
        public string DeleteFile(string fileid)
        {
            string sql = "delete from tb_File where fileid in (" + fileid + ")";
            try
            {
                DbHelperMySQL.ExecuteSql(sql);
                return "0";
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("删除文件:" + sql, ex);
                return "";
            }
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
            string sql = "update tb_scene set scene_name=?scene_name,author=?author,scene_custom_id=?scene_custom_id,addtime=?addtime,cover=?cover,des=?des where scene_code=?scene_id";
            MySqlParameter[] para = {
                new MySqlParameter("?scene_name",name),
                new MySqlParameter("?author",createUser),
                new MySqlParameter("?scene_custom_id",type),
                new MySqlParameter("?addtime",createTime),
                new MySqlParameter("?cover",cover),
                new MySqlParameter("?des",description),
                new MySqlParameter("?scene_id",id)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
                return "0";
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("发布场景:" + sql, ex);
                return "";
            }
        }

        /// <summary>
        /// 根据用户id获取场景列表
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public DataTable GetSenceByUserId(string userId, string selectStr, string hnagye, int PageInt, int CountRow)
        {
            int start = PageInt * CountRow - (CountRow - 1);//开始行数
            int end = PageInt * CountRow;//结束行数
            string sql = "set @rowNum=0; select * from (select *,(@rowNum:=@rowNum+1) AS RowNum from (select scene_id,scene_code,scene_name,addtime,visit_num,use_num,cover,qrCode from tb_scene where author=?author and scene_name like '%" + selectStr + "%' and (scene_custom_id=?scene_custom_id or ?scene_custom_id='0')) as f1) as f2 where RowNum>=" + start + " AND RowNum<=" + end + "";
            MySqlParameter[] para = {
                new MySqlParameter("?author",userId),
                new MySqlParameter("?scene_custom_id",hnagye)
            };
            try
            {
                DataTable dt = DbHelperMySQL.Query(sql, para).Tables[0];
                return dt;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("根据用户id获取场景列表:" + sql, ex);
                return null;
            }
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
            string sql = "update tb_scene set cover=?cover,fileType=?fileType,x=?x,y=?y,w=?w,h=?h where scene_code=?scene_code";
            MySqlParameter[] para = {
                new MySqlParameter("?cover",src),
                new MySqlParameter("?fileType",fileType),
                new MySqlParameter("?x",x),
                new MySqlParameter("?y",y),
                new MySqlParameter("?w",w),
                new MySqlParameter("?h",h),
                 new MySqlParameter("?scene_code",scene_code)
            };

            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("根据用户id获取场景列表:" + sql, ex);
                return false;
            }
        }
        /// <summary>
        /// 删除场景
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool DeleteSence(string id)
        {
            string sql = "delete from tb_scene where scene_code=?scene_code";
            MySqlParameter[] para = {
                new MySqlParameter("?scene_code",id)
            };
            string sql2 = "delete from tb_scene_pag where scene_code=?scene_code";
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
                DbHelperMySQL.ExecuteSql(sql2, para);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("删除场景:" + sql, ex);
                return false;
            }
        }
        /// <summary>
        /// 复制场景
        /// </summary>
        /// <param name="id"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public bool CopeSence(string id, string userId)
        {
            string newSenceCode = Guid.NewGuid().ToString();
            //复制场景
            Model.scene m = new Model.scene();
            string sql = "select scene_name,addtime,state_code_id,visit_num,use_num,dic_code_id,cover,scene_custom_id,scene_typeid,js_file_id,css_file_id,sh,movietype,musicUrl,videoUrl,tj,author,qrCode,userNum,des,Modeled,fileType,x,y,w,h,MouseClick from tb_scene where scene_code=?scene_code";
            MySqlParameter[] para = {
                new MySqlParameter("?scene_code",id)
            };
            MySqlDataReader dr = DbHelperMySQL.ExecuteReader(sql, para);
            while (dr.Read())
            {
                m.scene_name = dr["scene_name"].ToString();
                m.addtime = DateTime.Now.ToString();
                m.state_code_id = "1";
                m.visit_num = "0";
                m.use_num = "0";
                m.dic_code_id = dr["dic_code_id"].ToString();
                m.cover = dr["cover"].ToString();
                m.scene_custom_id = dr["scene_custom_id"].ToString();
                m.scene_typeid = dr["scene_typeid"].ToString() == "" ? null : dr["scene_typeid"].ToString();
                m.js_file_id = dr["js_file_id"].ToString();
                m.css_file_id = dr["css_file_id"].ToString();
                m.sh = dr["sh"].ToString();
                m.movietype = dr["movietype"].ToString();
                m.musicUrl = dr["musicUrl"].ToString();
                m.videoUrl = dr["videoUrl"].ToString();
                m.tj = "1";
                m.author = userId;
                m.qrCode = dr["qrCode"].ToString();
                m.userNum = "0";
                m.des = dr["des"].ToString();
                m.Modeled = dr["Modeled"].ToString();
                m.fileType = dr["fileType"].ToString();
                m.x = dr["x"].ToString();
                m.y = dr["x"].ToString();
                m.w = dr["x"].ToString();
                m.h = dr["x"].ToString();
                m.MouseClick = dr["MouseClick"].ToString();
            }
            dr.Close();
            //复制页面
            List<Model.scene_pag> pageList = new List<Model.scene_pag>();
            string sqlPage = "select content_text,flip_code_id,pageName,num from tb_scene_pag where scene_code=?scene_code";
            MySqlDataReader drpage = DbHelperMySQL.ExecuteReader(sqlPage, para);
            while (drpage.Read())
            {
                Model.scene_pag pm = new Model.scene_pag();
                pm.content_text = drpage["content_text"].ToString();
                pm.flip_code_id = drpage["flip_code_id"].ToString();
                pm.pageName = drpage["pageName"].ToString();
                pm.num = drpage["num"].ToString();
                pageList.Add(pm);
            }
            drpage.Close();

            string sqlInsert = "insert into tb_scene(scene_code,scene_name,addtime,state_code_id,visit_num,use_num,dic_code_id,cover,scene_custom_id,scene_typeid,js_file_id,css_file_id,sh,movietype,musicUrl,videoUrl,tj,author,qrCode,userNum,des,Modeled,fileType,x,y,w,h,MouseClick) values(?scene_code,?scene_name,?addtime,?state_code_id,?visit_num,?use_num,?dic_code_id,?cover,?scene_custom_id,?scene_typeid,?js_file_id,?css_file_id,?sh,?movietype,?musicUrl,?videoUrl,?tj,?author,?qrCode,?userNum,?des,?Modeled,?fileType,?x,?y,?w,?h,?MouseClick)";
            MySqlParameter[] paraInsert = {
                new MySqlParameter("?scene_code",newSenceCode),
                new MySqlParameter("?scene_name",m.scene_name),
                new MySqlParameter("?addtime",m.addtime),
                new MySqlParameter("?state_code_id",m.state_code_id),
                new MySqlParameter("?visit_num",m.visit_num),
                new MySqlParameter("?use_num",m.use_num),
                new MySqlParameter("?dic_code_id",m.dic_code_id),
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
                new MySqlParameter("?Modeled",m.Modeled== "" ? null : m.Modeled),
                new MySqlParameter("?fileType",m.fileType),
                new MySqlParameter("?x",m.x== "" ? null : m.x),
                new MySqlParameter("?y",m.y== "" ? null : m.y),
                new MySqlParameter("?w",m.w== "" ? null : m.w),
                new MySqlParameter("?h",m.h== "" ? null : m.h),
                new MySqlParameter("?MouseClick",m.MouseClick)
            };

            string sqlPageInsert = "insert into tb_scene_pag(content_text,scene_code,flip_code_id,pageName,num) values(?content_text,?scene_code,?flip_code_id,?pageName,?num)";

            try
            {
                DbHelperMySQL.ExecuteSql(sqlInsert, paraInsert);
                foreach (Model.scene_pag fm in pageList)
                {
                    MySqlParameter[] fmp = {
                        new MySqlParameter("?content_text",fm.content_text),
                        new MySqlParameter("?scene_code",newSenceCode),
                        new MySqlParameter("?flip_code_id",fm.flip_code_id==""?null:fm.flip_code_id),
                        new MySqlParameter("?pageName",fm.pageName),
                        new MySqlParameter("?num",fm.num)
                    };
                    DbHelperMySQL.ExecuteSql(sqlPageInsert, fmp);
                }
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("复制场景:" + sql, ex);
                return false;
            }
        }

        /// <summary>
        /// 查询此人的拥有的场景总数
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public int GetSenceCount(string userId)
        {
            string sql = "select count(1) from tb_scene where author=?author";
            MySqlParameter[] para = {
                new MySqlParameter("?author",userId)
            };
            try
            {
                object o = DbHelperMySQL.GetSingle(sql, para);
                if (o != null)
                {
                    return int.Parse(o.ToString());
                }
                return 0;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("查询此人的拥有的场景总数:" + sql, ex);
                return 0;
            }
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
        public DataTable GetUserCenceAll(string userName, string senceName, string Code, string isModel, string SenceType, string State, int pageNum, int RowCount, string user)
        {
            int start = pageNum * RowCount - (RowCount - 1);//开始行数
            int end = pageNum * RowCount;//结束行数
            string sql = "select author,tb_show_user.user_name,scene_code,scene_name,tb_scene.addtime,scene_custom_id,tb_code.msg,Modeled,MouseClick,tb_scene.state_code_id,sh from tb_scene,tb_show_user,tb_code where tb_show_user.user_id=tb_scene.author and tb_code.group_id=2 and tb_code.code_id=tb_scene.scene_custom_id and  ";
            if (user == "")
            {
                sql += "author<>'fb7e2fb3212443b1b9c954e98a0c8c26' ";
            }
            else
            {
                sql += "author='fb7e2fb3212443b1b9c954e98a0c8c26' ";
            }
            string whereStr = "";
            if (userName != "")
            {
                whereStr += " and tb_show_user.user_name like '%" + userName + "%' ";
            }
            if (senceName != "")
            {
                whereStr += " and scene_name like '%" + senceName + "%' ";
            }
            if (Code != "")
            {
                whereStr += " and scene_code like '%" + Code + "%' ";
            }
            if (isModel != "-1")
            {
                whereStr += " and Modeled='" + isModel + "' ";
            }
            if (SenceType != "-1")
            {
                whereStr += " and scene_custom_id='" + SenceType + "' ";
            }
            if (State != "-1")
            {
                whereStr += " and tb_scene.state_code_id='" + State + "' ";
            }
            string orderby = " order by sh desc ";
            if (user != "")
            {
                orderby = " order by Modeled asc ";
            }
            try
            {
                DataTable dt = DbHelperMySQL.Query("set @rowNum=0; select * from(select *,(@rowNum:=@rowNum+1) AS RowNum from(" + sql + whereStr + orderby + ") as f1 ) as f2 where RowNum>=" + start + " AND RowNum<=" + end + "").Tables[0];
                return dt;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("用户场景查询所有:" + sql, ex);
                return null;
            }
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
        public int GTetUserCenceInt(string userName, string senceName, string Code, string isModel, string SenceType, string State, string user)
        {
            string sql = "select count(1) from tb_scene,tb_show_user,tb_code where tb_show_user.user_id=tb_scene.author and tb_code.group_id=2 and tb_code.code_id=tb_scene.scene_custom_id and ";
            if (user == "")
            {
                sql += "author<>'fb7e2fb3212443b1b9c954e98a0c8c26' ";
            }
            else
            {
                sql += "author='fb7e2fb3212443b1b9c954e98a0c8c26' ";
            }
            string whereStr = "";
            if (userName != "")
            {
                whereStr += " and tb_show_user.user_name like '%" + userName + "%' ";
            }
            if (senceName != "")
            {
                whereStr += " and scene_name like '%" + senceName + "%' ";
            }
            if (Code != "")
            {
                whereStr += " and scene_code like '%" + Code + "%' ";
            }
            if (isModel != "-1")
            {
                whereStr += " and Modeled='" + isModel + "' ";
            }
            if (SenceType != "-1")
            {
                whereStr += " and scene_custom_id='" + SenceType + "' ";
            }
            if (State != "-1")
            {
                whereStr += " and tb_scene.state_code_id='" + State + "' ";
            }
            try
            {
                object o = DbHelperMySQL.GetSingle(sql + whereStr);
                if (o != null)
                {
                    return int.Parse(o.ToString());
                }
                return 0;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("获取场景总数:" + sql, ex);
                return 0;
            }
        }

        /// <summary>
        /// 生成模板
        /// </summary>
        /// <param name="cenceCode"></param>
        /// <returns></returns>
        public bool AddTempBySence(string cenceCode, float Money, string sence_code_id)
        {
            string newCode = Guid.NewGuid().ToString();
            string sql = "select * from tb_scene where scene_code='" + cenceCode + "'";
            DataTable dt = DbHelperMySQL.Query(sql).Tables[0];
            //MySqlDataReader dr = DbHelperMySQL.ExecuteReader(sql);
            string addSql = "insert into ts_temps(temp_code,temp_name,use_num,addtime,type_code_id,des,state_code_id,cover,js_file_id,css_file_id,Money,sh,movietype,musicUrl,videoUrl,tj,author,qrCode,userNum,MouseClick,sence_code_id,fileType,x,y,w,h,scene_custom_id,scene_typeid) values('" + newCode + "','" + dt.Rows[0]["scene_name"].ToString() + "','0','" + DateTime.Now.ToString() + "','" + dt.Rows[0]["scene_custom_id"].ToString() + "','" + dt.Rows[0]["des"].ToString() + "','0','" + dt.Rows[0]["cover"].ToString() + "','" + dt.Rows[0]["js_file_id"].ToString() + "','" + dt.Rows[0]["css_file_id"].ToString() + "','" + Money + "','0','" + dt.Rows[0]["movietype"].ToString() + "','" + dt.Rows[0]["musicUrl"].ToString() + "','" + dt.Rows[0]["videoUrl"].ToString() + "','1','" + dt.Rows[0]["author"].ToString() + "','" + dt.Rows[0]["qrCode"].ToString() + "','0','0','" + sence_code_id + "','" + dt.Rows[0]["fileType"].ToString() + "'," + (dt.Rows[0]["x"].ToString() == "" ? "null" : "'" + dt.Rows[0]["x"].ToString() + "'") + "," + (dt.Rows[0]["y"].ToString() == "" ? "null" : "'" + dt.Rows[0]["y"].ToString() + "'") + "," + (dt.Rows[0]["w"].ToString() == "" ? "null" : "'" + dt.Rows[0]["w"].ToString() + "'") + "," + (dt.Rows[0]["h"].ToString() == "" ? "null" : "'" + dt.Rows[0]["h"].ToString() + "'") + ",'" + dt.Rows[0]["scene_custom_id"].ToString() + "','" + dt.Rows[0]["scene_custom_id"].ToString() + "')";
            string pagesql = "";
            string selectPage = "select content_text,scene_code,pageName,num from tb_scene_pag where scene_code='" + cenceCode + "'";
            MySqlDataReader dr = DbHelperMySQL.ExecuteReader(selectPage);
            while (dr.Read())
            {
                pagesql += "insert into ts_temp_pag(addtime,content_text,temp_code,num,pageName) values('" + DateTime.Now.ToString() + "','" + dr["content_text"].ToString() + "','" + newCode + "','" + dr["num"].ToString() + "','" + dr["pageName"].ToString() + "'); ";
            }
            try
            {
                DbHelperMySQL.ExecuteSql(addSql);
                DbHelperMySQL.ExecuteSql(pagesql);
                string sqldelete = "delete from tb_scene where scene_code='" + cenceCode + "'; delete from tb_scene_pag where scene_code='" + cenceCode + "'";
                DbHelperMySQL.ExecuteSql(sqldelete);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("生成模板:" + sql, ex);
                return false;
            }
        }
        /// <summary>
        /// 用户场景生成网站场景
        /// </summary>
        /// <param name="cenceCode"></param>
        /// <returns></returns>
        public bool AddWebSence(string cenceCode)
        {
            string newCode = Guid.NewGuid().ToString();
            string sql = "select * from tb_scene where scene_code='" + cenceCode + "'";
            DataTable dt = DbHelperMySQL.Query(sql).Tables[0];
            string AddSql = "insert into tb_scene(scene_code,scene_name,addtime,state_code_id,visit_num,use_num,dic_code_id,cover,scene_custom_id,scene_typeid,js_file_id,css_file_id,sh,movietype,musicUrl,videoUrl,tj,author,qrCode,userNum,des,Modeled,fileType,x,y,w,h,MouseClick) values('" + newCode + "','" + dt.Rows[0]["scene_name"].ToString() + "','" + DateTime.Now.ToString() + "','0','0','0','99','" + dt.Rows[0]["cover"].ToString() + "','" + dt.Rows[0]["scene_custom_id"].ToString() + "'," + (dt.Rows[0]["scene_typeid"].ToString() == "" ? "NULL" : "'" + dt.Rows[0]["scene_typeid"].ToString() + "'") + ",'" + dt.Rows[0]["js_file_id"].ToString() + "','" + dt.Rows[0]["css_file_id"].ToString() + "','0','" + dt.Rows[0]["movietype"].ToString() + "','" + dt.Rows[0]["musicUrl"].ToString() + "','" + dt.Rows[0]["videoUrl"].ToString() + "','1','fb7e2fb3212443b1b9c954e98a0c8c26','" + dt.Rows[0]["qrCode"].ToString() + "','0','" + dt.Rows[0]["des"].ToString() + "','0','" + dt.Rows[0]["fileType"].ToString() + "'," + (dt.Rows[0]["x"].ToString() == "" ? "NULL" : "," + dt.Rows[0]["x"].ToString() + "'") + "," + (dt.Rows[0]["y"].ToString() == "" ? "NULL" : "'" + dt.Rows[0]["y"].ToString() + "'") + "," + (dt.Rows[0]["w"].ToString() == "" ? "NULL" : "'" + dt.Rows[0]["w"].ToString() + "'") + "," + (dt.Rows[0]["h"].ToString() == "" ? "NULL" : "'" + dt.Rows[0]["h"].ToString() + "'") + ",'0')";
            string updatesql = "update tb_scene set Modeled=1 where scene_code='" + cenceCode + "'";
            string pagesql = "select * from tb_scene_pag where scene_code='" + cenceCode + "'";
            string pagesqlLIst = "";
            MySqlDataReader dr = DbHelperMySQL.ExecuteReader(pagesql);
            while (dr.Read())
            {
                string addPage = "insert into tb_scene_pag(content_text,scene_code,flip_code_id,pageName,num) values('" + dr["content_text"].ToString() + "','" + newCode + "'," + (dr["flip_code_id"].ToString() == "" ? "NULL" : "'" + dr["flip_code_id"].ToString() + "'") + ",'" + dr["pageName"].ToString() + "','" + dr["num"].ToString() + "'); ";
                pagesqlLIst += addPage;
            }
            dr.Close();
            try
            {
                DbHelperMySQL.ExecuteSql(AddSql);
                DbHelperMySQL.ExecuteSql(updatesql);
                DbHelperMySQL.ExecuteSql(pagesqlLIst);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("用户场景生成网站场景:" + sql, ex);
                return false;
            }
        }

        /// <summary>
        /// 根据code查询场景信息
        /// </summary>
        /// <param name="senceCode"></param>
        /// <returns></returns>
        public DataTable GetModelByCode(string senceCode)
        {
            string sql = "select scene_code,scene_name,addtime,state_code_id,scene_custom_id,des from tb_scene where scene_code='" + senceCode + "'";
            try
            {
                DataTable dt = DbHelperMySQL.Query(sql).Tables[0];
                return dt;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("根据code查询场景信息:" + sql, ex);
                return null;
            }
        }
        /// <summary>
        /// 修改场景
        /// </summary>
        /// <param name="senceCode"></param>
        /// <returns></returns>
        public bool UpdateSence(string senceCode, string scene_name, string addtime, string state_code_id, string scene_custom_id, string des)
        {
            string sql = "update tb_scene set scene_name='" + scene_name + "',addtime='" + addtime + "',state_code_id='" + state_code_id + "',scene_custom_id='" + scene_custom_id + "',des='" + des + "' where scene_code='" + senceCode + "'";
            try
            {
                DbHelperMySQL.ExecuteSql(sql);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("修改场景:" + sql, ex);
                return false;
            }
        }
        /// <summary>
        /// 审核场景
        /// </summary>
        /// <param name="senceCode"></param>
        /// <param name="b">true 通过审核 false 没有通过审核</param>
        /// <returns></returns>
        public bool shSence(string senceCode, bool b)
        {
            string sql = "update tb_scene set sh='" + (b ? "0" : "1") + "' where scene_code='" + senceCode + "'";
            try
            {
                DbHelperMySQL.ExecuteSql(sql);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("审核场景:" + sql, ex);
                return false;
            }
        }
        /// <summary>
        /// 删除模板
        /// </summary>
        /// <param name="tempCode"></param>
        /// <returns></returns>
        public bool DeleteTemp(string tempCode)
        {
            string sql = "delete from ts_temps where temp_code='" + tempCode + "'; delete from ts_temp_pag where temp_code='" + tempCode + "'";
            try
            {
                DbHelperMySQL.ExecuteSql(sql);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("删除模板:" + sql, ex);
                return false;
            }
        }
        /// <summary>
        /// 查询场景的分页内容
        /// </summary>
        /// <param name="senceId"></param>
        /// <param name="num"></param>
        /// <returns></returns>
        public string GetPageContent(string senceId, string num)
        {
            string sql = "select content_text from tb_scene_pag where num='" + num + "' and scene_code='" + senceId + "'";
            try
            {
                object o = DbHelperMySQL.GetSingle(sql);
                if (o != null)
                {
                    return o.ToString();
                }
                return "";
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("查询场景的分页内容:" + sql, ex);
                return "";
            }
        }
    }
}
