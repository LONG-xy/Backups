using Dal;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Bll
{
    public class TempsBll
    {
        TempsDal dal = new TempsDal();
        /// <summary>
        /// 查找模板
        /// </summary>
        /// <param name="H">行业</param>
        /// <param name="C">场景</param>
        /// <param name="orderByFree">免费还是全部 全部为0 免费为1</param>
        /// <param name="OrderByNew">最新发布还是最受欢迎 1为最新发布 0为最受欢迎</param>
        /// <returns></returns>
        public DataTable GetTable(int H, int C, int orderByFree, int OrderByNew,int PageInt,int CountRow,string SerachStr)
        {
            return dal.GetTable(H, C, orderByFree, OrderByNew, PageInt, CountRow, SerachStr);
        }
        /// <summary>
        /// 增加模板查看次数
        /// </summary>
        /// <param name="id"></param>
        public void AddNum(string id)
        {
            dal.AddNum(id);
        }
        /// <summary>
        /// 根据id获取模板信息
        /// </summary>
        /// <param name="tempid"></param>
        /// <returns></returns>
        public temp GetModel(string tempid)
        {
            return dal.GetModel(tempid);
        }
        /// <summary>
        /// 使用模板
        /// </summary>
        /// <param name="temp_code"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        public string CopeTemp(string temp_code, string userId)
        {
            return dal.CopeTemp(temp_code, userId);
        }
        /// <summary>
        /// 获取模板信息
        /// </summary>
        /// <param name="sence_code"></param>
        /// <returns></returns>
        public Model.temp GetModelTemp(string temp_code)
        {
            return dal.GetModelTemp(temp_code);
        }
        /// <summary>
        /// 根据模板编码获取分页信息
        /// </summary>
        /// <param name="SceneCode"></param>
        /// <returns></returns>
        public List<Model.temp_pag> GetPageListByTempCode(string temp_code)
        {
            return dal.GetPageListByTempCode(temp_code);
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
            return dal.GetTableModel(modelName, modelCode, modelStatus, modelHy, modelCj, PageInt, CountRow);
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
            return dal.GetModelCount(modelName, modelCode, modelStatus, modelHy, modelCj);
        }
    }
}
