﻿using System;
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
public partial class teacher_TAddExamination : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["teacher"] == null)
        {
            Response.Redirect("../Login.aspx");
        }
        lblkmname.Text = Session["KCname"].ToString();
    }
    protected void btnconfirm_Click(object sender, EventArgs e)
    {
        //判断信息填写是否完整
        if (txtsubject.Text == "" || txtAnsA.Text == "" || txtAnsB.Text == "" || txtAnsC.Text == "" || txtAnsD.Text == "")
        {
            MessageBox.Show("请将信息填写完整");//弹出提示信息
            return;
        }
        else
        {
            string isfb = "";//建立变量
            if (cbFB.Checked == true)//判断是否选择
                isfb = "1";//如果选择赋值为1
            else
                isfb = "0";//否则赋值为0
            string str = "insert into tb_test(testContent,testAns1,testAns2,testAns3,testAns4,rightAns,pub,testCourse) values('" + txtsubject.Text.Trim() + "','" + txtAnsA.Text.Trim() + "','" + txtAnsB.Text.Trim() + "','" + txtAnsC.Text.Trim() + "','" + txtAnsD.Text.Trim() + "','" + rblRightAns.SelectedValue.ToString() + "','" + isfb + "','" + Session["KCname"].ToString() + "')";
            BaseClass.OperateData(str);//将数据插入数据库
            btnconcel_Click(sender, e);//清空所有输入的信息
        }
    }
    protected void btnconcel_Click(object sender, EventArgs e)
    {
        txtsubject.Text = "";
        txtAnsD.Text = "";
        txtAnsC.Text = "";
        txtAnsB.Text = "";
        txtAnsA.Text = "";
    }
}
