using Dal;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Bll
{
    public class show_userBll
    {
        show_userDal dal = new show_userDal();
        /// <summary>
        /// 根据用户名密码进行登录
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public string SelectUserByNamePwd(string userName, string pwd)
        {
            return dal.SelectUserByNamePwd(userName, pwd);
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
            return dal.AddUserName(userName, pwd, t, gender, nickName, values);
        }
        /// <summary>
        /// 用户名是否重复
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public bool CheckUserName(string userName)
        {
            return dal.CheckUserName(userName);
        }
        /// <summary>
        /// 检查昵称是否重复
        /// </summary>
        /// <param name="NickName"></param>
        /// <returns></returns>
        public bool CheckUserNick(string NickName)
        {
            return dal.CheckUserNick(NickName);
        }

        /// <summary>
        /// 根据用户名查询用户信息
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public User GetModelByUserName(string userName)
        {
            return dal.GetModelByUserName(userName);
        }
        /// <summary>
        /// 获取用户状态
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public string GetUserState(string userName)
        {
            return dal.GetUserState(userName);
        }
        /// <summary>
        /// 根据用户名查询头像
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public string GetHeadImg(string userName)
        {
            return dal.GetHeadImg(userName);
        }
        /// <summary>
        /// 根据用户名查询用户id
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public string GetUidByuserName(string userName)
        {
            return dal.GetUidByuserName(userName);
        }
        /// <summary>
        /// 将用户名和验证码插入到数据库中
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="Code"></param>
        /// <returns></returns>
        public bool AddCode(string userName, string Code)
        {
            return dal.AddCode(userName, Code);
        }
        /// <summary>
        /// 获取验证码
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public string GetCode(string userName)
        {
            return dal.GetCode(userName);
        }
        /// <summary>
        /// 激活用户
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="code"></param>
        /// <returns>-1 为没有此用户 -2 为验证码不正确</returns>
        public string jHUser(string userName, string code)
        {
            return dal.jHUser(userName, code);
        }
        /// <summary>
        /// 重置密码
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public bool UpdatePwd(string userName, string pwd)
        {
            return dal.UpdatePwd(userName, pwd);
        }
        /// <summary>
        /// 查询是否由此用户名
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public bool CheckUserNname(string userName)
        {
            return dal.CheckUserNname(userName);
        }
        /// <summary>
        /// 验证用户
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="code"></param>
        /// <returns>-1 为没有此用户 -2 为验证码不正确</returns>
        public string jHUserCheck(string userName, string code)
        {
            return dal.jHUserCheck(userName, code);
        }
        /// <summary>
        /// 查找邮箱和手机是否绑定
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public List<string> GetUserBind(string userName)
        {
            return dal.GetUserBind(userName);
        }
        /// <summary>
        /// 修改邮箱
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="email"></param>
        /// <returns></returns>
        public bool UpdateEmail(string userName, string email)
        {
            return dal.UpdateEmail(userName, email);
        }
        /// <summary>
        /// 修改手机
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="email"></param>
        /// <returns></returns>
        public bool UpdatePhone(string userName, string Phone)
        {
            return dal.UpdatePhone(userName, Phone);
        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="email"></param>
        /// <returns></returns>
        public bool Updatepwd(string userName, string pwd)
        {
            return dal.Updatepwd(userName, pwd);
        }
        /// <summary>
        /// 管理员用户登录 
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="pwd"></param>
        /// <returns></returns>
        public string AdminLogin(string userName, string pwd)
        {
            return dal.AdminLogin(userName, pwd);
        }
        /// <summary>
        /// 查询所有用户
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="phone"></param>
        /// <param name="Email"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public DataTable GetUserList(string userName, string phone, string Email, string status,int pageNum,int RowCount)
        {
            return dal.GetUserList(userName, phone, Email, status, pageNum, RowCount);
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
            return dal.GetUserCount(userName, phone, Email, status);
        }
        /// <summary>
        /// 根据用户名查询用户信息
        /// </summary>
        /// <returns></returns>
        public Model.User GetModelAdminByUserName(string userName)
        {
            return dal.GetModelAdminByUserName(userName);
        }
        /// <summary>
        /// 修改用户信息
        /// </summary>
        /// <param name="user"></param>
        public void UpdateUserModel(Model.User user)
        {
            dal.UpdateUserModel(user);
        }
        /// <summary>
        /// 修改头像
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public string UpdateHeadImg(string userName, string headImg)
        {
            return dal.UpdateHeadImg(userName, headImg);
        }
    }
}
