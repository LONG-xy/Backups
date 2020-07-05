using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class QuestionCatalog : System.Web.UI.Page
{
    DataClassesDataContext DC = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadData(1);
        }
    }
    
    /// <summary>
    /// 加载DataList数据
    /// </summary>
    /// <param name="CurrentPageIndex"></param>
    private void LoadData(int CurrentPageIndex)
    {
        var query = DC.vw_QuestionCatalog.Select(itm => itm);
        DataList1.DataSource = query;
        DataList1.DataBind();
    }

}
