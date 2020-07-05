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

public partial class User_Register : System.Web.UI.Page
{
    DataOperate dataoperate = new DataOperate();
    UserOperate useroperate = new UserOperate();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "企业门户网——用户注册";
        if (!IsPostBack)
        {
            if (Request["mark"] == null)
            {
                btnReg.Enabled = true;
                btnEdit.Enabled = false;
            }
            if (Convert.ToInt32(Request["mark"]) == 1)
            {
                btnReg.Enabled = false;
                btnEdit.Enabled = true;
                txtName.ReadOnly = true;
                DataSet ds = null;
                useroperate.Name = Session["Name"].ToString();
                ds = useroperate.FindUserByName("tb_User");
                txtName.Text = Session["Name"].ToString();
                txtPwd.TextMode = TextBoxMode.SingleLine;
                txtPwd.Text = ds.Tables[0].Rows[0][2].ToString();
                ddlQuestion.Text = ds.Tables[0].Rows[0][3].ToString();
                txtResult.Text = ds.Tables[0].Rows[0][4].ToString();
                imgPhoto.ImageUrl = ds.Tables[0].Rows[0][5].ToString();
                ddlSex.SelectedValue = ds.Tables[0].Rows[0][6].ToString();
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
    }
    protected void btnTest_Click(object sender, EventArgs e)
    {
        if (txtName.Text == string.Empty)
        {
            Response.Write("<script language=javascript>alert('用户名不能为空！')</script>");
        }
        else
        {
            useroperate.Name = txtName.Text;
            DataSet ds = useroperate.FindUserByName("tb_User");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Write("<script language=javascript>alert('该用户已经存在！')</script>");
                txtName.Text = string.Empty;
                txtName.Focus();
            }
            else
                Response.Write("<script language=javascript>alert('您可以使用该用户名进行注册！')</script>");
        }
    }
    protected void btnUp_Click(object sender, EventArgs e)
    {
        if (uploadPhoto.PostedFile.FileName == "")
        {
            Response.Write("<script language=javascript>alert('请选择头像！')</script>");
        }
        else
        {
            dataoperate.UpPhoto(uploadPhoto, imgPhoto, Server.MapPath(@"..\images\Photo\"));
        }
    }
    protected void btnReg_Click(object sender, EventArgs e)
    {
        if (txtName.Text == string.Empty)
        {
            Response.Write("<script language=javascript>alert('用户名不能为空！')</script>");
        }
        else
        {
            useroperate.Name = txtName.Text;
            DataSet ds = useroperate.FindUserByName("tb_User");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Response.Write("<script language=javascript>alert('该用户已经存在！')</script>");
                txtName.Text = string.Empty;
                txtName.Focus();
            }
            else
            {
                ds = null;
                ds = useroperate.GetAllUser("tb_User");
                useroperate.ID = dataoperate.getID("tb_User", ds);
                useroperate.Name = txtName.Text;
                useroperate.Pwd = txtPwd.Text;
                useroperate.Question = ddlQuestion.Text;
                useroperate.Result = txtResult.Text;
                useroperate.Photo = imgPhoto.ImageUrl;
                useroperate.Sex = ddlSex.SelectedValue;
                useroperate.Age = Int32.Parse(txtAge.Text);
                useroperate.Tel = txtTel.Text;
                useroperate.Mobile = txtMobile.Text;
                useroperate.Email = txtEmail.Text;
                useroperate.QQ = txtQQ.Text;
                useroperate.Address = txtAddress.Text;
                useroperate.NAddress = txtIndex.Text;
                useroperate.Remark = txtRemark.Text;
                useroperate.AddUser();
                Response.Write("<script language=javascript>alert('用户注册成功！')</script>");
                clearData();
            }
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        useroperate.Name = txtName.Text;
        useroperate.Pwd = txtPwd.Text;
        useroperate.Question = ddlQuestion.Text;
        useroperate.Result = txtResult.Text;
        useroperate.Photo = imgPhoto.ImageUrl;
        useroperate.Sex = ddlSex.SelectedValue;
        useroperate.Age = Int32.Parse(txtAge.Text);
        useroperate.Tel = txtTel.Text;
        useroperate.Mobile = txtMobile.Text;
        useroperate.Email = txtEmail.Text;
        useroperate.QQ = txtQQ.Text;
        useroperate.Address = txtAddress.Text;
        useroperate.NAddress = txtIndex.Text;
        useroperate.Remark = txtRemark.Text;
        useroperate.UpdateUser();
        Response.Write("<script language=javascript>alert('用户信息修改成功！')</script>");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clearData();
    }
    public void clearData()
    {
        txtName.Text = txtPwd.Text = txtSPwd.Text = txtResult.Text = txtAge.Text = txtTel.Text
           = txtMobile.Text = txtQQ.Text = txtEmail.Text = txtAddress.Text = txtIndex.Text = txtRemark.Text = string.Empty;
    }
}
