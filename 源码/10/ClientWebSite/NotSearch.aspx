<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NotSearch.aspx.cs" Inherits="NotSearch" %>

<%@ Register src="UC_Header.ascx" tagname="UC_Header" tagprefix="uc1" %>
<%@ Register src="UC_Search.ascx" tagname="UC_Search" tagprefix="uc2" %>
<%@ Register src="UC_Navigation.ascx" tagname="UC_Navigation" tagprefix="uc3" %>
<%@ Register src="UC_Footer.ascx" tagname="UC_Footer" tagprefix="uc4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

    <title>����֪��-�������ȵ�IT������������</title>
    <style type="text/css">
        .style2
        {
            text-align: left;
        }
    </style>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<SCRIPT src="css/jquery.js" type=text/javascript></SCRIPT>
    <script language="JavaScript" type="text/javascript">
        //�򿪹ر��Ҳർ��
        function openCloseRightNav() {
            if ($("#rightNav").css("display") == "none") {
                $("#openCloseRightNavBtn").attr("src", "/known/public_html/img/wait_close.gif");
                $("#openCloseRightNavAlert").html("�ر��ҵ���");
                $("#rightNav").slideDown("normal", function() {
                    $("#openCloseRightNavBtn").attr("src", "/known/public_html/img/bbs_btn_close1.gif");
                });
            } else {
                $("#openCloseRightNavBtn").attr("src", "/known/public_html/img/wait_open.gif");
                $("#openCloseRightNavAlert").html("չ���ҵ���");
                $("#rightNav").slideUp("normal", function() {
                    $("#openCloseRightNavBtn").attr("src", "/known/public_html/img/bbs_btn_open1.gif");
                });
            }
        }
        //�����б���ɫ
        function changeRowColor(x, y) {
            if (y == 0) {
                $("#" + x).css("background-color", "#FFFFFF");
            } else {
                $("#" + x).css("background-color", "#fbfff4");
            }
        }
        //������֤���ֵ
        function changeValidateCode() {
            $("#vcodeImg").attr("src", "/known/public_html/common/vcode/w/60/h/22/f/1/rand/" + Math.random() + "");
        }
        //��������ѡ�
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
        //��ʾ����������
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
        <td width="432" class="huise1">&nbsp;&nbsp;<span class="shenlvcu">û�в��ҵ���Ҫ�ҵ����ݣ�</span><br />          
          <span class="chengse">&nbsp;&nbsp;��ܰ��ʾ��</span><br />
&nbsp;&nbsp;(1) ����ؼ���֮�����ÿո�ֿ�<br />
&nbsp;&nbsp;(2) ��ȷ����Ҫ�������ݵ����������ѡ��������һ��</td>
      </tr>
      
    </table></td>
  </tr>
</table>
    
        <uc4:UC_Footer ID="UC_Footer1" runat="server" />
    
    </div>
    </form>
</body>
</html>