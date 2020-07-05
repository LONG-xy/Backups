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

public partial class news : System.Web.UI.Page
{
    protected string Content;
    protected string Title;
    protected string Date;
    protected void Page_Load(object sender, EventArgs e)
    {
        createNews();
    }
    public void createNews()
    {
        string id = Request.QueryString["NewsID"];
        string sql = "select * from tb_News where ID = " + id;
        SqlDataReader sda = dataOperate.getRow(sql);
        sda.Read();
        Content = sda["NewsContent"].ToString();
        Title = sda["NewsTitle"].ToString();
        Date = sda["FBDate"].ToString();

    }
}
