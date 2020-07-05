using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Dal;
using System.Data;

namespace Bll
{
    public class Code_groupBll
    {
        Code_groupDal dal = new Code_groupDal();
        //获取字典分组列表
        public DataTable GetTable()
        {
            return dal.GetTable();
        }
    }
}
