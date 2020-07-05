using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {

        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string name = Session["UserName"].ToString();
        string linkman = this.txtLinkman.Text;
        string companyName = this.txtCompanyName.Text;
        string ddlKind = this.ddlKind.SelectedValue;
        string calling = this.txtCalling.Text;
        string licenceNumber = this.txtLicenceNumber.Text;
        string address = this.txtAddress.Text;
        string phone = this.txtPhone.Text;
        string fax = this.txtFax.Text;
        string email = this.txtEmail.Text;
        string networkIP = this.txtNetworkIP.Text;
        string content = this.txtContent.Text;
        string sql = "update tb_User set Linkman='" + linkman + "',CompanyName='" + companyName + "',Kind='" + ddlKind + "',Calling='" + calling + "',LicenceNumber='" +
            licenceNumber + "',Address='" + address + "',Phone='" + phone + "',Fax='" + fax + "',Email='" + email + "',NetworkIP='" + networkIP + "',Content='" +
            content + "' where UserName='" + name + "'";
        if (dataOperate.execSQL(sql))
        {
            RegisterStartupScript("true", "<script>alert('修改成功！')</script>");
        }
        else
        {
            RegisterStartupScript("false", "<script>alert('修改失败！')</script>");
        }
    }
}