using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class User
    {
        public string user_name { get; set; }//用户名
        public string nick_name { get; set; }//昵称
        public string Phone { get; set; }//手机号、
        public string email { get; set; }//邮箱
        public string qq { get; set; }//qq
        public string wechat { get; set; }//微信
        public string sina_blog { get; set; }//新浪微博
        public string gender { get; set; }//性别
        public string integral { get; set; }//积分
        public string user_type_code_id { get; set; }//用户类型
        public string addtime { get; set; }//添加时间
        public string state_code_id { get; set; }
        public string headImg { get; set; }
    }
}
