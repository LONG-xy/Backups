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

public partial class Common_ASPProduct : System.Web.UI.UserControl
{
    ProductOperate productoperate = new ProductOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = null;
            productoperate.Type = "ASP+PHP";
            ds = productoperate.FindTopProductByType(2, "tb_Product");
            if (ds.Tables[0].Rows.Count > 0)
            {
                dlASPPro.DataSource = ds;
                dlASPPro.DataKeyField = "ID";
                dlASPPro.DataBind();
            }
        }
    }
}
