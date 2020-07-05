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

public partial class jobInfo : System.Web.UI.Page
{
    protected string Job, Number, Sex, Age, Knowledge, Specialty, Experience, City, Pay, ParticularInfo, FBDate, CompanyName, Linkman, CompanyPhone, CompanyContent;
    protected void Page_Load(object sender, EventArgs e)
    {
        bindJobInfo();
    }
    protected void bindJobInfo()
    {
        string sql = "select * from tb_Job as a Join tb_User as b on a.UserName=b.UserName where jobID=" + Request.QueryString["ID"].ToString();
        SqlDataReader sdr = dataOperate.getRow(sql);
        sdr.Read();
        Job = sdr["Job"].ToString();
        Number = sdr["Number"].ToString();
        Sex = sdr["Sex"].ToString();
        Age = sdr["Age"].ToString();
        Knowledge = sdr["Knowledge"].ToString();

        Specialty = sdr["Specialty"].ToString();
        Experience = sdr["Experience"].ToString();
        City = sdr["City"].ToString();
        Pay = sdr["Pay"].ToString();
        ParticularInfo = sdr["ParticularInfo"].ToString();
        FBDate = sdr["FBDate"].ToString();
        CompanyName = sdr["CompanyName"].ToString();
        Linkman = sdr["Linkman"].ToString();
        CompanyPhone = sdr["Phone"].ToString();
        CompanyContent = sdr["Content"].ToString();


    }
}
