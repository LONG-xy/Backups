
using factory;
using Model;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
namespace Dal
{
    public class show_userDal
    {
        /// <summary>
        /// 根据用户名查询头像
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public string GetHeadImg(string userName)
        {
            string sql = "select headImg from tb_show_user where user_name=?userName";
            MySqlParameter[] para = {
                new MySqlParameter("?userName",userName)
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
                LogHelper.Instance.Info("根据用户名查询头像:" + sql, ex);
                return "";
            }
        }
        /// <summary>
        /// 修改头像
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public string UpdateHeadImg(string userName,string headImg)
        {
            string sql = "update tb_show_user set headImg='"+ headImg + "' where user_name=?userName";
            //string sql = "select headImg from tb_show_user where user_name=?userName";
            MySqlParameter[] para = {
                new MySqlParameter("?userName",userName)
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
                LogHelper.Instance.Info("根据用户名查询头像:" + sql, ex);
                return "";
            }
        }
        /// <summary>
        /// 根据用户名密码进行登录
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public string SelectUserByNamePwd(string userName, string pwd)
        {
            string sql = "SELECT user_id FROM tb_show_user WHERE user_pwd=?pwd and user_name=?userName";
            MySqlParameter[] para = {
                new MySqlParameter("?userName",userName),
                new MySqlParameter("?pwd",pwd)
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
                LogHelper.Instance.Info("根据用户名密码进行登录:" + sql, ex);
                return "";
            }
        }
        /// <summary>
        /// 获取用户状态
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public string GetUserState(string userName)
        {
            string sql = "select state_code_id from tb_show_user where user_name=?user_name";
            MySqlParameter[] para = {
                new MySqlParameter("?user_name",userName)
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
                LogHelper.Instance.Info("根据用户名密码进行登录:" + sql, ex);
                return "";
            }
        }
        /// <summary>
        /// 添加用户
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="pwd"></param>
        /// <param name="t">0手机注册 1邮箱注册</param>
        /// <returns></returns>
        public string AddUserName(string userName, string pwd, int t, string gender, string nickName, string values)
        {
            string GUID = Guid.NewGuid().ToString().Replace("-", "");
            string datatime = DateTime.Now.ToString();
            string RegType = "";
            switch (t)
            {
                case 0:
                    RegType = "Phone";
                    break;
                case 1:
                    RegType = "email";
                    break;
            }
            string sql = "INSERT INTO tb_show_user(user_id,user_name,user_pwd,nick_name," + RegType + ",gender,integral,user_type_code_id,addtime,state_code_id) VALUES('" + GUID + "',?userName,?pwd,?nickName,?values,?gender,0,10,'" + datatime + "'," + (t == 0 ? "0" : "50") + ")";
            MySqlParameter[] para = {
                new MySqlParameter("?userName",userName),
                new MySqlParameter("?pwd",pwd),
                new MySqlParameter("?nickName",nickName),
                new MySqlParameter("?values",values),
                new MySqlParameter("?gender",gender)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
                return "0";
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("添加用户:" + sql, ex);
                return null;
            }
        }
        /// <summary>
        /// 用户名是否重复
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public bool CheckUserName(string userName)
        {
            string sql = "SELECT user_id FROM tb_show_user WHERE user_name=?user_name";
            MySqlParameter[] para = {
                new MySqlParameter("?user_name",userName)
            };
            try
            {
                object o = DbHelperMySQL.GetSingle(sql, para);
                if (o != null)
                {
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("用户名是否重复:" + sql, ex);
                return false;
            }
        }
        /// <summary>
        /// 检查昵称是否重复
        /// </summary>
        /// <param name="NickName"></param>
        /// <returns></returns>
        public bool CheckUserNick(string NickName)
        {
            string sql = "SELECT user_id FROM tb_show_user WHERE nick_name=?nick_name";
            MySqlParameter[] para = {
                new MySqlParameter("?nick_name",NickName)
            };
            try
            {
                object o = DbHelperMySQL.GetSingle(sql, para);
                if (o != null)
                {
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("检查昵称是否重复:" + sql, ex);
                return false;
            }
        }
        /// <summary>
        /// 根据用户名查询用户信息
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public User GetModelByUserName(string userName)
        {
            User u = new User();
            string sql = "SELECT user_name,nick_name,Phone,email,qq,wechat,sina_blog,gender,integral,user_type_code_id,addtime,headImg FROM tb_show_user WHERE user_name=?user_name";
            MySqlParameter[] para = {
                new MySqlParameter("?user_name",userName)
            };
            try
            {
                MySqlDataReader dr = DbHelperMySQL.ExecuteReader(sql, para);
                while (dr.Read())
                {
                    u.user_name = dr["user_name"].ToString();
                    u.nick_name = dr["nick_name"].ToString();
                    u.Phone = dr["Phone"] == DBNull.Value ? "" : dr["Phone"].ToString();
                    u.email = dr["email"] == DBNull.Value ? "" : dr["email"].ToString();
                    u.qq = dr["qq"] == DBNull.Value ? "" : dr["qq"].ToString();
                    u.wechat = dr["wechat"] == DBNull.Value ? "" : dr["wechat"].ToString();
                    u.sina_blog = dr["sina_blog"] == DBNull.Value ? "" : dr["sina_blog"].ToString();
                    u.gender = dr["gender"] == DBNull.Value ? "" : dr["gender"].ToString();
                    u.integral = dr["integral"] == DBNull.Value ? "" : dr["integral"].ToString();
                    u.user_type_code_id = dr["user_type_code_id"] == DBNull.Value ? "" : dr["user_type_code_id"].ToString();
                    u.addtime = dr["addtime"] == DBNull.Value ? "" : dr["addtime"].ToString();
                    u.headImg = dr["headImg"].ToString();
                }
                dr.Close();
                return u;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("根据用户名查询用户信息:" + sql, ex);
                return null;
            }
        }

        /// <summary>
        /// 根据用户名查询用户id
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public string GetUidByuserName(string userName)
        {
            string sql = "select user_id from tb_show_user where user_name=?user_name";
            MySqlParameter[] para = {
                new MySqlParameter("?user_name",userName)
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
                LogHelper.Instance.Info("根据用户名查询用户id:" + sql, ex);
                return "";
            }
        }
        /// <summary>
        /// 将用户名和验证码插入到数据库中
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="Code"></param>
        /// <returns></returns>
        public bool AddCode(string userName, string Code)
        {
            string sqldelete = "delete from CheckCode where UserName=?UserName";
            MySqlParameter[] paradelete = {
                new MySqlParameter("?UserName",userName)
            };
            string sql = "insert into CheckCode(UserName,CODE,addtime) values(?UserName,?CODE,?addtime)";
            MySqlParameter[] para = {
                new MySqlParameter("?UserName",userName),
                new MySqlParameter("?CODE",Code),
                new MySqlParameter("?addtime",DateTime.Now.ToString())
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sqldelete, paradelete);
                DbHelperMySQL.ExecuteSql(sql, para);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("将用户名和验证码插入到数据库中:" + sql, ex);
                return false;
            }
        }
        /// <summary>
        /// 获取验证码
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public string GetCode(string userName)
        {
            string sql = "select CODE from CheckCode where UserName=?UserName";
            MySqlParameter[] para = {
                new MySqlParameter("?UserName",userName)
            };
            try
            {
                object o = DbHelperMySQL.GetSingle(sql, para);
                if (o != null)
                {
                    return o.ToString();
                }
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("获取验证码:" + sql, ex);
                return "";
            }
        }
        /// <summary>
        /// 验证用户
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="code"></param>
        /// <returns>-1 为没有此用户 -2 为验证码不正确</returns>
        public string jHUserCheck(string userName, string code)
        {
            string sql = "select user_id from tb_show_user where user_name=?user_name";
            MySqlParameter[] para = {
                new MySqlParameter("?user_name",userName)
            };
            object o = DbHelperMySQL.GetSingle(sql, para);//获取用户id
            if (o == null)
            {
                return "-1";
            }
            //验证验证码
            string sqlyzm = "select CODE from CheckCode where UserName=?UserName";
            MySqlParameter[] parayzm = {
                new MySqlParameter("?UserName",userName)
            };
            object yzm = DbHelperMySQL.GetSingle(sqlyzm, parayzm);//数据库中的验证码
            if (yzm == null)
            {
                return "-2";
            }
            if (yzm.ToString() != code)
            {
                return "-2";
            }
            return o.ToString();
        }
        /// <summary>
        /// 激活用户
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="code"></param>
        /// <returns>-1 为没有此用户 -2 为验证码不正确</returns>
        public string jHUser(string userName, string code)
        {
            string sql = "select user_id from tb_show_user where user_name=?user_name";
            MySqlParameter[] para = {
                new MySqlParameter("?user_name",userName)
            };
            object o = DbHelperMySQL.GetSingle(sql, para);//获取用户id
            if (o == null)
            {
                return "-1";
            }
            //验证验证码
            string sqlyzm = "select CODE from CheckCode where UserName=?UserName";
            MySqlParameter[] parayzm = {
                new MySqlParameter("?UserName",userName)
            };
            object yzm = DbHelperMySQL.GetSingle(sqlyzm, parayzm);//数据库中的验证码
            if (yzm == null)
            {
                return "-2";
            }
            if (yzm.ToString() != code)
            {
                return "-2";
            }
            //激活用户
            string sqldel = "delete from CheckCode where UserName=?UserName";
            DbHelperMySQL.ExecuteSql(sqldel, parayzm);//删除验证码
            string sqlUpdate = "update tb_show_user set state_code_id=0 where user_name=?user_name";
            DbHelperMySQL.ExecuteSql(sqlUpdate, para);//激活用户
            return o.ToString();
        }
        /// <summary>
        /// 重置密码
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public bool UpdatePwd(string userName, string pwd)
        {
            string sql = "update from tb_show_user set user_pwd=?user_pwd where user_name=?user_name";
            MySqlParameter[] para = {
                new MySqlParameter("?user_pwd",pwd),
                new MySqlParameter("?user_name",userName)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("重置密码:" + sql, ex);
                return false;
            }
        }

        /// <summary>
        /// 查询是否由此用户名
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public bool CheckUserNname(string userName)
        {
            string sql = "select user_id from tb_show_user where user_name=?user_name";
            MySqlParameter[] para = {
                new MySqlParameter("?user_name",userName)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("查询是否由此用户名:" + sql, ex);
                return false;
            }
        }

        /// <summary>
        /// 查找邮箱和手机是否绑定
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public List<string> GetUserBind(string userName)
        {
            List<string> list = new List<string>();
            string sql = "select Phone,email from tb_show_user where user_name=?user_name";
            MySqlParameter[] para = {
                new MySqlParameter("?user_name",userName)
            };
            try
            {
                MySqlDataReader dr = DbHelperMySQL.ExecuteReader(sql, para);
                while (dr.Read())
                {
                    list.Add(dr["Phone"].ToString());
                    list.Add(dr["email"].ToString());
                }
                dr.Close();
                return list;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("查找邮箱和手机是否绑定:" + sql, ex);
                return null;
            }
        }
        /// <summary>
        /// 修改邮箱
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="email"></param>
        /// <returns></returns>
        public bool UpdateEmail(string userName, string email)
        {
            string sql = "update tb_show_user set email=?email where user_name=?user_name";
            MySqlParameter[] para = {
                new MySqlParameter("?user_name",userName),
                new MySqlParameter("?email",email)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("修改邮箱:" + sql, ex);
                return false;
            }
        }
        /// <summary>
        /// 修改手机
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="email"></param>
        /// <returns></returns>
        public bool UpdatePhone(string userName, string Phone)
        {
            string sql = "update tb_show_user set Phone=?Phone where user_name=?user_name";
            MySqlParameter[] para = {
                new MySqlParameter("?user_name",userName),
                new MySqlParameter("?Phone",Phone)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("修改手机:" + sql, ex);
                return false;
            }
        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="email"></param>
        /// <returns></returns>
        public bool Updatepwd(string userName, string pwd)
        {
            string sql = "update tb_show_user set user_pwd=?user_pwd where user_name=?user_name";
            MySqlParameter[] para = {
                new MySqlParameter("?user_name",userName),
                new MySqlParameter("?user_pwd",pwd)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("修改手机:" + sql, ex);
                return false;
            }
        }

        /// <summary>
        /// 管理员用户登录 
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public string AdminLogin(string userName, string pwd)
        {
            string sql = "select ID from t_login where USERNAME=?USERNAME and PASSWORD=?PASSWORD";
            MySqlParameter[] para = {
                new MySqlParameter("?USERNAME",userName),
                new MySqlParameter("?PASSWORD",pwd)
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
                LogHelper.Instance.Info("管理员用户登录:" + sql, ex);
                return "";
            }
        }

        /// <summary>
        /// 查询所有用户
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="phone"></param>
        /// <param name="Email"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public DataTable GetUserList(string userName, string phone, string Email, string status, int pageNum, int RowCount)
        {
            int start = pageNum * RowCount - (RowCount - 1);//开始行数
            int end = pageNum * RowCount;//结束行数
            string sql = "select user_name,Phone,email,qq,wechat,gender,addtime,state_code_id from tb_show_user where 1=1";
            string whereStr = "";
            if (userName != "")
            {
                whereStr += " and user_name='" + userName + "' ";
            }
            if (phone != "")
            {
                whereStr += " and Phone='" + phone + "' ";
            }
            if (Email != "")
            {
                whereStr += " and email='" + Email + "' ";
            }
            if (status != "-1")
            {
                whereStr += " and state_code_id='" + status + "' ";
            }
            try
            {
                DataTable dt = DbHelperMySQL.Query("set @rowNum=0; select * from(select *,(@rowNum:=@rowNum+1) AS RowNum from(" + sql + whereStr + ") as f1 ) as f2 where RowNum>=" + start + " AND RowNum<=" + end + "").Tables[0];
                return dt;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("查询所有用户:" + sql, ex);
                return null;
            }
        }
        /// <summary>
        /// 查询一共多少条用户
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="phone"></param>
        /// <param name="Email"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public int GetUserCount(string userName, string phone, string Email, string status)
        {
            string sql = "select count(1) as con from tb_show_user where 1=1";
            string whereStr = "";
            if (userName != "")
            {
                whereStr += " and user_name='" + userName + "' ";
            }
            if (phone != "")
            {
                whereStr += " and Phone='" + phone + "' ";
            }
            if (Email != "")
            {
                whereStr += " and email='" + Email + "' ";
            }
            if (status != "-1")
            {
                whereStr += " and state_code_id='" + status + "' ";
            }
            try
            {
                object o = DbHelperMySQL.GetSingle(sql+ whereStr);
                return int.Parse(o.ToString());
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("查询一共多少条用户:" + sql, ex);
                return 0;
            }
        }

        /// <summary>
        /// 根据用户名查询用户信息
        /// </summary>
        /// <returns></returns>
        public Model.User GetModelAdminByUserName(string userName)
        {
            string sql = "select user_name,Phone,email,qq,wechat,gender,addtime,state_code_id from tb_show_user where user_name='" + userName + "'";
            try
            {
                Model.User model = new User();
                MySqlDataReader dr = DbHelperMySQL.ExecuteReader(sql);
                while (dr.Read())
                {
                    model.user_name = dr["user_name"].ToString();
                    model.Phone = dr["Phone"].ToString();
                    model.email = dr["email"].ToString();
                    model.qq = dr["qq"].ToString();
                    model.wechat = dr["wechat"].ToString();
                    model.gender = dr["gender"].ToString();
                    model.addtime = dr["addtime"].ToString();
                    model.state_code_id = dr["state_code_id"].ToString();
                }
                dr.Close();
                return model;
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("根据用户名查询用户信息:" + sql, ex);
                return null;
            }
        }
        /// <summary>
        /// 修改用户信息
        /// </summary>
        /// <param name="user"></param>
        public void UpdateUserModel(Model.User user)
        {
            string sql = "update tb_show_user set Phone=?Phone,email=?email,qq=?qq,wechat=?wechat,gender=?gender,addtime=?addtime,state_code_id=?state_code_id where user_name=?user_name";
            MySqlParameter[] para = {
                new MySqlParameter("?Phone",user.Phone),
                new MySqlParameter("?email",user.email),
                new MySqlParameter("?qq",user.qq),
                new MySqlParameter("?wechat",user.wechat),
                new MySqlParameter("?gender",user.gender),
                new MySqlParameter("?addtime",user.addtime),
                new MySqlParameter("?state_code_id",user.state_code_id),
                new MySqlParameter("?user_name",user.user_name)
            };
            try
            {
                DbHelperMySQL.ExecuteSql(sql, para);
            }
            catch (Exception ex)
            {
                LogHelper.Instance.Info("修改用户信息:" + sql, ex);
            }
        }
    }
}
