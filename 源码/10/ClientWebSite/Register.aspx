<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="UserAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>无标题页</title>
    <style type="text/css">
        .style1
        {
            width: 60%;
        }
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
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28" valign="top" background="images/loginbg.gif">
      <table width="676" height="284" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="84" align="left">
        
        <table width="237" height="39" border="0" cellpadding="0" cellspacing="0">
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
            <td height="18" background="images/login1_02.gif"><table width="728" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="361" align="left"><table width="354" height="198" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="30" valign="top" class="henhong"><table width="350" height="40" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td class="henhong" width="350" valign="top"><span class="henhong">给自己找个登录昵称：</span><br />
                              <asp:TextBox ID="txtUserName" runat="server" Width="350px"></asp:TextBox>
                            
                            <span class="huise1">登录昵称为2-15个字符之间，用来区分注册用户，要求彼此不同</span>
                            <br />
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" 
                                Display="Dynamic" ErrorMessage="请输入登录昵称，为2-15个字符之间"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                ControlToValidate="txtUserName" Display="Dynamic" 
                                ErrorMessage="该登录昵称为2-15个字符之间" 
                                onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator3" runat="server" 
                                ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="该登陆昵称已存在" 
                                onservervalidate="CustomValidator3_ServerValidate"></asp:CustomValidator></td>
                        </tr>
                        <tr>
                          <td class="henhong" width="350" valign="top">设置一个登录密码：<br />
                          <asp:TextBox ID="txtPassword" runat="server" Width="350px" TextMode="Password"></asp:TextBox>
                            
                            <span class="huise1">登录密码为6-15个字符之间</span>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtPassword" Display="Dynamic" 
                                ErrorMessage="请输入大于6-15位的登录密码，建议包含特殊字符，如#￥%等"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" 
                                ErrorMessage="该登录密码为6-15位" 
                                onservervalidate="CustomValidator2_ServerValidate"></asp:CustomValidator></td>
                        </tr>
                        <tr>
                          <td class="henhong" width="350" valign="top">确认密码：<br />
                            <asp:TextBox ID="txtPassword2" runat="server" Width="350px" TextMode="Password"></asp:TextBox>
                            
                            <span class="huise1">再输入一次密码，确保密码正确</span>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtPassword2" Display="Dynamic" ErrorMessage="请输入确认密码"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="txtPassword" ControlToValidate="txtPassword2" 
                                Display="Dynamic" ErrorMessage="密码前后输入不一致"></asp:CompareValidator></td>
                        </tr>
                        <tr>
                          <td class="henhong" width="350" valign="top">性别：<br />
                            <asp:DropDownList ID="ddlSex" runat="server">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:DropDownList>
                        </tr>
                        <tr>
                          <td class="henhong" width="350" valign="top">E-mail：<br />
                            <asp:TextBox ID="txtEmail" runat="server" Width="350px"></asp:TextBox>
                            
                            <span class="huise1">请输入您的邮箱地址</span>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                                runat="server" ControlToValidate="txtEmail" Display="Dynamic" 
                                ErrorMessage="请输入Email地址"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                          <td class="henhong" width="350" valign="top">验证码：<br />
                              <asp:TextBox ID="txtCheckCode" runat="server"></asp:TextBox>
                              <cc1:ValidateCode ID="ValidateCode1" runat="server" />
                            <span class="huise1">请将图片中的字符填写到验证码文本框，字母不区分大小写</span><br />
                              <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label>
                            
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtCheckCode" Display="Dynamic" 
                                ErrorMessage="请输入验证码，字母不区分大小写"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        
                      </table>
                        <table width="332" height="40" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td align="center" valign="top">
                                <asp:ImageButton ID="ImageButton1" runat="server" Width="302px" Height="36px"
                                    ImageUrl="~/Images/btn_register.gif" onclick="ibtnLogin_Click" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtMemo" runat="server" Rows="8" TextMode="MultiLine" 
                                        Width="350px">欢迎您加入本站点参加交流和讨论，为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：
1、 服务条款的确认和接纳本站服务的所有权和运作权归本站所有。所提供的服务必须按照其发布的公司章程，服务条款和操作规则严格执行。
用户通过完成注册程序并点击一下&quot;我同意&quot;的按钮，这表示用户与本站达成协议并接受所有的服务条款。 
2、 服务简介：本站运用自己的操作系统通过国际互联网络为用户提供各项服务，而这种服务是免费的。用户必须：
(1) 提供设备，包括个人电脑一台、调制解调器
一个及配备上网装置。
(2) 个人上网和支付与此服务有关的电话费用。
考虑到本站产品服务的重要性，用户同意： 
(1) 提供及时、详尽及准确的个人资料。
(2) 不断更新注册资料，符合及时、详尽准确的
要求。所有原始键入的 资料将引用为注册资料。 
另外，用户可授权本站向第三方透露其注册资料，
否则本站不能公开用户的姓名、住址、出件地址、
电子邮箱、帐号。 除非：
(1) 用户要求本站或授权某人通过电子邮件服务
透露这些信息。
(2) 相应的法律、法规要求及程序服务需要本站
提供用户的个人资料。 如果用户提供的资料不
准确，不真实，不合法有效，本站保留结束用户
使用本站各项服务的权利。用户在享用本站各项
服务的同时，同意接受提供的各类信息服务。
                    　　            </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                      </td>
                  </tr>
                </table>
                  </td>
                <td width="367" align="left" valign="top"><img src="images/zhuce.jpg" width="367" height="229" /></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="39">
                <asp:ImageButton ID="ibtnLogin" runat="server" ImageUrl="~/Images/login1_03.gif" onclick="ibtnLogin_Click" /></td>
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
