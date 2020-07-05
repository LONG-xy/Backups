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

public partial class Common_ToolsSort : System.Web.UI.UserControl
{
    ProductOperate productoperate = new ProductOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = null;
            productoperate.Type = "工具";
            ds = productoperate.FindTopProductByType(10, "tb_Product");
            if (ds.Tables[0].Rows.Count > 0)
            {
                dlMendSort.DataSource = ds;
                dlMendSort.DataKeyField = "ID";
                dlMendSort.DataBind();
            }
        }
    }
}
