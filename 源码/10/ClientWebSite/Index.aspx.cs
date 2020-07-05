using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ibtnSearch_Click(object sender, ImageClickEventArgs e)
    {
        if (txtSearch.Text.Trim() != "")
        {
            Session["SearchContent"] = txtSearch.Text;
            Session["SearchCatalog"] = hidCatalog.Value;
            Response.Redirect("QuestionList2.aspx");
        }
    }
}
