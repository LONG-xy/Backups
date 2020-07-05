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

public partial class Manager_UserInfo : System.Web.UI.Page
{
    DataOperate dataoperate = new DataOperate();
    UserOperate useroperate = new UserOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds = null;
            useroperate.Name = Request["UserName"].ToString();
            ds = useroperate.FindUserByName("tb_User");
            txtName.Text = Request["UserName"].ToString();
            //txtPwd.Text = ds.Tables[0].Rows[0][2].ToString();
            ddlQuestion.Text = ds.Tables[0].Rows[0][3].ToString();
            txtResult.Text = ds.Tables[0].Rows[0][4].ToString();
            imgPhoto.ImageUrl = ds.Tables[0].Rows[0][5].ToString();
            ddlSex.Text = ds.Tables[0].Rows[0][6].ToString();
            txtAge.Text = ds.Tables[0].Rows[0][7].ToString();
            txtTel.Text = ds.Tables[0].Rows[0][8].ToString();
            txtMobile.Text = ds.Tables[0].Rows[0][9].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0][10].ToString();
            txtQQ.Text = ds.Tables[0].Rows[0][11].ToString();
            txtAddress.Text = ds.Tables[0].Rows[0][13].ToString();
            txtIndex.Text = ds.Tables[0].Rows[0][14].ToString();
            txtRemark.Text = ds.Tables[0].Rows[0][15].ToString();
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserManage.aspx");
    }
}
