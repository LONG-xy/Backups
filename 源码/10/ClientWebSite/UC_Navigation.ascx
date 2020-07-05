<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Navigation.ascx.cs" Inherits="UC_Navigation" %>
<%@ OutputCache Duration="30" VaryByParam="none" %>
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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="4"><img src="images/left01.gif" width="4" height="33" /></td>
    <td background="images/left02.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><span class="hong">&nbsp;&nbsp;<a href="Login.aspx" class="hong">登录</a>　</span><span class="henhong">|</span><span class="hong">　<a href="Register.aspx" class="hong">注册</a></span>
        <span class="henhong">|</span><span class="henhong">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前登陆用户：<%=UserName %></span>
        </td>
        <td align="right" class="hong"><a href="#" class="hong">软件</a> &nbsp;&nbsp;<span class="henhong">|</span>&nbsp;&nbsp;&nbsp;<a href="#" class="hong">图书</a> &nbsp;&nbsp;<span class="henhong">|</span>&nbsp;&nbsp;&nbsp;<a href="#" class="hong">词典</a> &nbsp;&nbsp;<span class="henhong">|</span>&nbsp;&nbsp;&nbsp;<a href="#" class="hong">学院</a> &nbsp;&nbsp;<span class="henhong">|</span>&nbsp;&nbsp;&nbsp;<a href="#" class="hong">书店</a>&nbsp;</td>
      </tr>
    </table></td>
    <td width="4"><img src="images/left03.gif" width="4" height="33" /></td>
  </tr>
</table>