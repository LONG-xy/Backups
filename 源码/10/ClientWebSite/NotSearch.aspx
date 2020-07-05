<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NotSearch.aspx.cs" Inherits="NotSearch" %>

<%@ Register src="UC_Header.ascx" tagname="UC_Header" tagprefix="uc1" %>
<%@ Register src="UC_Search.ascx" tagname="UC_Search" tagprefix="uc2" %>
<%@ Register src="UC_Navigation.ascx" tagname="UC_Navigation" tagprefix="uc3" %>
<%@ Register src="UC_Footer.ascx" tagname="UC_Footer" tagprefix="uc4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

    <title>明日知道-国内领先的IT技术搜素引擎</title>
    <style type="text/css">
        .style2
        {
            text-align: left;
        }
    </style>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<SCRIPT src="css/jquery.js" type=text/javascript></SCRIPT>
    <script language="JavaScript" type="text/javascript">
        //打开关闭右侧导航
        function openCloseRightNav() {
            if ($("#rightNav").css("display") == "none") {
                $("#openCloseRightNavBtn").attr("src", "/known/public_html/img/wait_close.gif");
                $("#openCloseRightNavAlert").html("关闭右导航");
                $("#rightNav").slideDown("normal", function() {
                    $("#openCloseRightNavBtn").attr("src", "/known/public_html/img/bbs_btn_close1.gif");
                });
            } else {
                $("#openCloseRightNavBtn").attr("src", "/known/public_html/img/wait_open.gif");
                $("#openCloseRightNavAlert").html("展开右导航");
                $("#rightNav").slideUp("normal", function() {
                    $("#openCloseRightNavBtn").attr("src", "/known/public_html/img/bbs_btn_open1.gif");
                });
            }
        }
        //更改行背景色
        function changeRowColor(x, y) {
            if (y == 0) {
                $("#" + x).css("background-color", "#FFFFFF");
            } else {
                $("#" + x).css("background-color", "#fbfff4");
            }
        }
        //更改验证码的值
        function changeValidateCode() {
            $("#vcodeImg").attr("src", "/known/public_html/common/vcode/w/60/h/22/f/1/rand/" + Math.random() + "");
        }
        //更改主题选项卡
        function changeTitleTab(x, y, z) {
            $("#" + x).css("border-bottom", "1px solid #FFFFFF");
            $("#" + x).css("background-color", "#FFFFFF");
            $("#" + x + "_content").css("display", "block");

            $("#" + y).css("border-bottom", "1px solid #9DB3C5");
            $("#" + y).css("background-color", "#fbfff4");
            $("#" + y + "_content").css("display", "none");

            $("#" + z).css("border-bottom", "1px solid #9DB3C5");
            $("#" + z).css("background-color", "#fbfff4");
            $("#" + z + "_content").css("display", "none");
        }
        //显示或隐藏子类
        function showHidden(x) {
            $("#" + x).slideToggle("fast");
            if ($.trim($("#btn_" + x).html()) == "-") {
                $("#btn_" + x).html("+");
            } else {
                $("#btn_" + x).html("-");
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    
        <uc1:UC_Header ID="UC_Header1" runat="server" />
        <uc2:UC_Search ID="UC_Search1" runat="server" />
        <uc3:UC_Navigation ID="UC_Navigation1" runat="server" />
    
<table width="95%" height="56" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="55%" height="62" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="197" class="huise1"><img src="images/mark_unsearch.gif" width="156" height="123" />&nbsp;&nbsp;&nbsp;</td>
        <td width="432" class="huise1">&nbsp;&nbsp;<span class="shenlvcu">没有查找到您要找的内容！</span><br />          
          <span class="chengse">&nbsp;&nbsp;温馨提示：</span><br />
&nbsp;&nbsp;(1) 多个关键字之间请用空格分开<br />
&nbsp;&nbsp;(2) 请确定所要查找内容的类别与您所选择的类别相一致</td>
      </tr>
      
    </table></td>
  </tr>
</table>
    
        <uc4:UC_Footer ID="UC_Footer1" runat="server" />
    
    </div>
    </form>
</body>
</html>