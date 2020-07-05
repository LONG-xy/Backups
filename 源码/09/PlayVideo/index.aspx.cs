using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

        bindNew();          //调用自定义方法显示最新视频!
        bindHumour();       //调用自定义方法显示搞笑视频!
        bindCartoon();      //调用自定义方法显示动漫视频!
        bindFilm();         //调用自定义方法显示电影视频!
        bindSport();        //调用自定义方法显示体育视频!
        

    }
   
    //绑定今日视频！！
    protected void bindNew()
    {
        string sqlSel = "select top 6 * from videoInfo where Auditing=1 ORDER BY videoDate desc";
        dlNewVideo.DataSource = operateData.getRows(sqlSel).DefaultView;
        dlNewVideo.DataBind();

    }

    //绑定搞笑视频！！
    protected void bindHumour()
    {
        string sqlSel = "select top 10 * from videoInfo where videoType='搞笑' and Auditing=1 order by videoDate desc";
        dlHumour.DataSource = operateData.getRows(sqlSel).DefaultView;
        dlHumour.DataBind();
    }
    //绑定动漫视频！！
    protected void bindCartoon()
    {
        string sqlSel = "select top 10 * from videoInfo where videoType='动漫' and Auditing=1 order by videoDate desc";
        dlCartoon.DataSource = operateData.getRows(sqlSel).DefaultView;
        dlCartoon.DataBind();
    }
    //绑定体育视频！！
    protected void bindSport()
    {
        string sqlSel = "select top 10 * from videoInfo where videoType='体育' and Auditing=1 order by videoDate desc";
        dlSport.DataSource = operateData.getRows(sqlSel).DefaultView;
        dlSport.DataBind();
    }
    //绑定电影视频！！
    protected void bindFilm()
    {
        string sqlSel = "select top 10 * from videoInfo where videoType='电影' and Auditing=1 order by videoDate desc";
        dlFilm.DataSource = operateData.getRows(sqlSel).DefaultView;
        dlFilm.DataBind();
    }
 
   
}
