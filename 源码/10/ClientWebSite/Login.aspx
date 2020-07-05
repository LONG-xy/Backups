<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>无标题页</title>
    <style type="text/css">
        .style2
        {
            text-align: left;
        }
    </style>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	left:225px;
	top:11px;
	width:154px;
	height:54px;
	z-index:1;
}
body {
	margin-left: 00px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
<table width="100%" height="610%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28" valign="top" background="images/loginbg.gif"><table width="676" height="284" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="84" align="left"><table width="237" height="39" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" bgcolor="#FFFFFF"><img src="images/logo.gif" width="226" height="62" /></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><table id="__01" width="785" height="125" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30"><img src="images/login1_01.gif" width="785" height="30" alt="" /></td>
          </tr>
          <tr>
            <td height="18" background="images/login1_02.gif"><table width="776" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="401" align="center"><img src="images/login.jpg" width="368" height="236" /></td>
                <td width="375"><table width="332" height="198" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="30" valign="top" class="henhong"><table width="332" height="40" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="top">用户名：     
                          <asp:TextBox ID="txtUserName" runat="server" Width="185px"></asp:TextBox>
                          <br />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="请输入登陆昵称" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                      </tr>
                    </table>
                      <table width="332" height="40" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td valign="top">密 &nbsp;&nbsp;码：
                            <asp:TextBox ID="txtPassword" runat="server" Width="185px" TextMode="Password"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                              ErrorMessage="请输入登陆密码" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                      </table>
                      <table width="332" height="40" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="141" valign="top">验证码：
                            <asp:TextBox ID="txtCheckCode" runat="server" Width="60px"></asp:TextBox></td>
                          <td width="191" valign="top" class="chengse"> <cc1:validatecode ID="ValidateCode1" runat="server" /></td>
                        </tr>
                      </table>
                      <table width="320" height="34" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td>
                            <asp:ImageButton ID="ibtnLogin" runat="server"  Width="127px" Height="38px"
                                ImageUrl="~/Images/loginb.gif" onclick="ibtnLogin_Click" />
                            <br />
                            <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label>                          
                          </td>
                          
                          
                        </tr>
                      </table>
                      <table width="320" height="34" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td class="shenlvcu"><a href="Register.aspx">不是会员，立即注册</a></td>
                        </tr>
                      </table></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="39"><img src="images/login1_03.gif" width="785" height="39" alt="" /></td>
          </tr>
          <tr>
            <td height="38" background="images/login1_04.gif"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="huise1">(C)　1999-2010吉林省明日科技有限公司</span> </td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="center">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
    
    </div>
    </form>
</body>
</html>
