<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Manager_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>企业门户网——后台登录</title>
    <link href="../CSS.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
     body{background-color: #80B6E0;}
     </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="665" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3" height="150"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="665" height="381" valign="top" background="../images/houtaidenglu.gif"><table width="665" height="353" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="197" colspan="3">&nbsp;</td>
      </tr>
      <tr>
        <td width="173" height="90">&nbsp;</td>
        <td width="346" height="123" align="center" valign="top"><table width="288" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="29" class="wenzi2" style="width: 68px">登录名称：</td>
            <td colspan="2"><label>
              <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </label></td>
            <td width="45">&nbsp;</td>
          </tr>
          <tr>
            <td height="27" class="wenzi2" style="width: 68px">登录密码：</td>
            <td colspan="2"><asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="149px"></asp:TextBox></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td height="25" class="wenzi2" style="width: 68px">验证码：</td>
            <td colspan="2"><asp:TextBox ID="txtCode" runat="server"></asp:TextBox></td>
            <td><asp:Image ID="imgCode" runat="server" ImageUrl="~/Common/checkcode.aspx"/></td>
          </tr>
          <tr>
            <td height="36" style="width: 68px">&nbsp;</td>
              <td colspan="2">
                  &nbsp;<asp:Button ID="btnLogin" runat="server" Text="登录" OnClick="btnLogin_Click" />
              <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click" />
              </td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
        <td width="146">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3">&nbsp;</td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>
        </div>
    </form>
</body>
</html>
