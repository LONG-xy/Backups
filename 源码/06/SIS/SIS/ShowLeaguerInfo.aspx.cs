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

public partial class ShowLeaguerInfo : System.Web.UI.Page
{
    Operation operation = new Operation();
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = null;
        if ((id = Request.QueryString["id"]) != null)
        {
            DataSet ds = operation.SelectLeaguerInfo(id);
            txtType.InnerText = ds.Tables[0].Rows[0][1].ToString();
            txtTitle.InnerText = ds.Tables[0].Rows[0][2].ToString();
            txtInfo.InnerText = ds.Tables[0].Rows[0][3].ToString();
            txtLinkMan.InnerText = ds.Tables[0].Rows[0][4].ToString();
            txtTel.InnerText = ds.Tables[0].Rows[0][5].ToString();
        }
    }
}
