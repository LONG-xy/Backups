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

public partial class BackGround_DetailInfo : System.Web.UI.Page
{
    Operation operation = new Operation();
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = 0;
        if (int.TryParse(Request.QueryString["id"], out id))
        {
            DataSet ds = operation.SelectInfo(Convert.ToInt32(id.ToString()));
            txtType.InnerText = ds.Tables[0].Rows[0][1].ToString();
            txtTitle.InnerText = ds.Tables[0].Rows[0][2].ToString();
            txtInfo.InnerText = ds.Tables[0].Rows[0][3].ToString();
            txtLinkMan.InnerText = ds.Tables[0].Rows[0][4].ToString();
            txtTel.InnerText = ds.Tables[0].Rows[0][5].ToString();
        }
    }
}
