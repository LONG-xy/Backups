<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuestionCatalog.aspx.cs" Inherits="QuestionCatalog" %>

<%@ Register src="UC_Header.ascx" tagname="UC_Header" tagprefix="uc1" %>
<%@ Register src="UC_Search.ascx" tagname="UC_Search" tagprefix="uc2" %>
<%@ Register src="UC_Navigation.ascx" tagname="UC_Navigation" tagprefix="uc3" %>
<%@ Register src="UC_Footer.ascx" tagname="UC_Footer" tagprefix="uc4" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>明日知道-国内领先的IT技术搜素引擎</title>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <SCRIPT src="css/jquery.js" type=text/javascript></SCRIPT>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:UC_Header ID="UC_Header1" runat="server" />
        <uc2:UC_Search ID="UC_Search1" runat="server" />
        <uc3:UC_Navigation ID="UC_Navigation1" runat="server" />

<table width="95%" height="56" border="0" align="center">
  <tr>
    <td>
    <table width="100%" height="92" align="center" class="table">
      <tbody>
        <tr>
          <td class="left" valign="top"><style type="text/css">
          .bbs_index_nav {
	CLEAR: both; WIDTH: 96%; LINE-HEIGHT: 25px; HEIGHT: 35px
}
.bbs_index_titleAlert {
	CLEAR: both; WIDTH: 96%; HEIGHT: 29px
}
.bbs_index_titleAlert .left {
	FLOAT: left; WIDTH: 600px; HEIGHT: 29px
}
.bbs_index_titleAlert .right {
	FLOAT: right; WIDTH: 300px; HEIGHT: 29px
}
.bbs_index_main {
	CLEAR: both; WIDTH: 100%
}
.bbs_index_main .table {
	CLEAR: both; WIDTH: 100%; BORDER-COLLAPSE: collapse
}
.bbs_index_main .table .left {
	WIDTH: 100%
}
.bbs_index_main .table .left .type {
	CLEAR: both; BORDER-RIGHT: #a6ce6c 1px solid; BORDER-TOP: #a6ce6c 1px solid; MARGIN: 0px; BORDER-LEFT: #a6ce6c 1px solid; BACKGROUND-COLOR: #fbfff4
}
.bbs_index_main .table .left .type .table {
	CLEAR: both; DISPLAY: block; WIDTH: 100%; BORDER-COLLAPSE: collapse
}
.bbs_index_main .table .left .type .title {
	CLEAR: both; BORDER-RIGHT: #ffffff 1px solid; BORDER-TOP: #ffffff 1px solid; BACKGROUND: url(/known/public_html/img/bbs_title_bg1.gif); MARGIN: 0px; BORDER-LEFT: #ffffff 1px solid; BORDER-BOTTOM: #ffffff 1px solid; HEIGHT: 30px
}
.bbs_index_main .table .left .type .title .left {
	FLOAT: left; WIDTH: 95%; COLOR: #ffffff; LINE-HEIGHT: 30px; HEIGHT: 30px; TEXT-ALIGN: left
}
.bbs_index_main .table .left .type .title .right {
	FONT-WEIGHT: bold; FONT-SIZE: 16px; FLOAT: right; WIDTH: 3%; CURSOR: pointer; COLOR: #ffffff; LINE-HEIGHT: 30px; HEIGHT: 30px; TEXT-ALIGN: left
}
.bbs_index_main .table .left .type .table .titlePart1 {
	WIDTH: 10%; BORDER-BOTTOM: #9db3c5 1px solid; HEIGHT: 16px
}
.bbs_index_main .table .left .type .table .titlePart2 {
	WIDTH: 50%; COLOR: #006699; BORDER-BOTTOM: #9db3c5 1px solid; HEIGHT: 16px
}
.bbs_index_main .table .left .type .table .titlePart3 {
	WIDTH: 13%; COLOR: #006699; BORDER-BOTTOM: #9db3c5 1px solid; HEIGHT: 16px; TEXT-ALIGN: center
}
.bbs_index_main .table .left .type .table .titlePart4 {
	WIDTH: 27%; COLOR: #006699; BORDER-BOTTOM: #9db3c5 1px solid; HEIGHT: 16px; TEXT-ALIGN: center
}
.bbs_index_main .table .left .type .table .contentPart1 {
	WIDTH: 10%; BORDER-BOTTOM: #9db3c5 1px solid; HEIGHT: 60px; TEXT-ALIGN: center
}
.bbs_index_main .table .left .type .table .contentPart2 {
	WIDTH: 50%; LINE-HEIGHT: 16px; BORDER-BOTTOM: #9db3c5 1px solid; HEIGHT: 60px
}
.bbs_index_main .table .left .type .table .contentPart3 {
	WIDTH: 13%; BORDER-BOTTOM: #9db3c5 1px solid; HEIGHT: 60px; TEXT-ALIGN: center
}
.bbs_index_main .table .left .type .table .contentPart4 {
	WIDTH: 27%; LINE-HEIGHT: 20px; BORDER-BOTTOM: #9db3c5 1px solid; HEIGHT: 60px
}
.bbs_index_nav .li1 {
	FONT-WEIGHT: bold; FLOAT: left; WIDTH: 500px; LINE-HEIGHT: 35px; HEIGHT: 35px; TEXT-ALIGN: left
}
.bbs_index_nav .li2 {
	FLOAT: right; WIDTH: 200px; HEIGHT: 35px
}
.bbs_index_titleAlert .left .li1 {
	FONT-WEIGHT: bold; BACKGROUND: url(/known/public_html/img/bbs_btn_bg1.gif); FLOAT: left; WIDTH: 73px; CURSOR: pointer; LINE-HEIGHT: 29px; HEIGHT: 29px
}
.bbs_index_titleAlert .left .li2 {
	FONT-SIZE: 13px; FLOAT: right; WIDTH: 500px; LINE-HEIGHT: 29px; HEIGHT: 29px; TEXT-ALIGN: left
}
.bbs_index_titleAlert .right .li1 {
	FLOAT: left; WIDTH: 210px; LINE-HEIGHT: 29px; HEIGHT: 29px
}
.bbs_index_titleAlert .right .li2 {
	FONT-SIZE: 13px; FLOAT: left; WIDTH: 72px; LINE-HEIGHT: 29px; HEIGHT: 29px; TEXT-ALIGN: left
}
.bbs_index_titleAlert .right .li3 {
	FLOAT: right; WIDTH: 18px; LINE-HEIGHT: 29px; POSITION: relative; HEIGHT: 29px
}
          </style>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><span class="huise"><img src="images/home32.gif" width="25" height="25" /><a href="Index.aspx" class="hong">明日知道 </a></span><span class="huise1">&gt;&gt;</span> <a href="QuestionCatalog.aspx" class="hong">问题分类</a> </td>
                <td align="right"><a href="Question.aspx"><img src="images/tw.gif" width="129" height="39" border="0" /></a>&nbsp;&nbsp;<a href="QuestionCatalog.aspx"><img src="images/hd.gif" width="129" height="39" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="24"><span class="huise1">您可以</span><span class="henhong"><a href="Register.aspx" target="_blank" class="chengse">注册</a></span><span class="huise1">一个账户，并以此</span><span class="henhong"><a href="Login.aspx" target="_blank" class="chengse">登录</a></span><span class="huise1">，以便参与本站更多活动，与大家交流。</span></td>
              </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                  <td width="4"><img src="images/left011.gif" width="4" height="33" /></td>
                  <td background="images/left022.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      </tr>
                </table></td>
                  <td width="4"><img src="images/left033.gif" width="4" height="33" /></td>
                </tr>
              </table>
            <div class="bbs_index_main">
                <table width="100%" class="table">
                  <tbody>
                    <tr>
                      <td class="left" valign="top"><div class="type">
                      
                      
                      
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="Code" Width="100%">
                        <HeaderTemplate>
                        <table width="100%" class="table">
                            <tbody>
                              <tr class="titlePart">
                                <td class="titlePart1"></td>
                                <td align="left" class="titlePart2">分类</td>
                                <td align="left" class="titlePart3">问题/回复</td>
                                <td align="left" class="titlePart4">最后更新</td>
                              </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                              <tr id="title_row_3" onmouseover="changeRowColor('title_row_3', 0)" 
        onmouseout="changeRowColor('title_row_3', 1)">
                                <td class="contentPart1"><img src="images/topic_permit.gif" width="31" height="37" /></td>
                                <td class="contentPart2">
                                <strong>
                                <a class="hong" href="QuestionList.aspx?CatalogCode=<%#Eval("Code") %> "  
                                  target="_blank"><%#Eval("Name") %></a>
                                </strong>　<br />
                                  <span class="huise1">版块介绍 </span></td>
                                <td class="contentPart3"><font class="banhui"><%#Eval("qcnt") %></font><span class="huise1">/<%#Eval("acnt") %></span></td>
                                <td class="contentPart4"><span class="huise"><a href="QuestionAnswer.aspx?QuestionCode=<%#Eval("lastCode") %>" class="hong" target="_blank"><%#Eval("lastTitle") %></a><br />                                
                                  </span><a href="#" class="huise">jlnu_lzh</a><span class="huise">&nbsp;</span>-&nbsp;<font class="banhui" 
            style="COLOR: #0099cc">2010-03-31 02:45:36</font> </td>
                            </tr>

                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                          </table>
                        </FooterTemplate>
                    </asp:DataList>
                      
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
                      
                      
                      
                      
                          
                          
                          
                          
                          
                      </div></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </td></tr>
      </tbody>
    </table></td>
  </tr>
</table>



    </form>
</body>
</html>
