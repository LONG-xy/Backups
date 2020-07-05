using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class depotInfo : System.Web.UI.Page
{
    protected string DepotType, DepotCity, DepotSite, DepotAcreage, DepotSum, DepotPrice, AppendServer, Linkman, Phone, Term, Content, FBDate;
    protected void Page_Load(object sender, EventArgs e)
    {
        bindDepot();
    }
    //绑定仓储详细信息
    protected void bindDepot()
    {
        string sql = "select * from tb_Depot where ID=" + Request.QueryString["ID"].ToString();
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();
        DepotType = sdr["DepotType"].ToString();
        DepotCity = sdr["DepotCity"].ToString();
        DepotSite = sdr["DepotSite"].ToString();
        DepotAcreage = sdr["DepotAcreage"].ToString() + "平方米";
        DepotSum = sdr["DepotSum"].ToString() + "间";
        DepotPrice = sdr["DepotPrice"] + "元/间";
        string appendServer = "";
        if (Convert.ToBoolean(sdr["Loading"]))
        {
            appendServer = appendServer + "装卸";
        }

        if (Convert.ToBoolean(sdr["Packing"]))
        {
            appendServer = appendServer + "包装";
        }

        if (Convert.ToBoolean(sdr["Send"]))
        {
            appendServer = appendServer + "配送";
        }
        AppendServer = appendServer;
        Linkman = sdr["Linkman"].ToString();
        Phone = sdr["Phone"].ToString();
        Term = Convert.ToDateTime(sdr["Term"]).ToLongDateString();
        Content = sdr["Content"].ToString();
        FBDate = Convert.ToDateTime(sdr["FBDate"]).ToLongDateString();
    }
}
