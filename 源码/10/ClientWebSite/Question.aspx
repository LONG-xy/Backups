<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Question.aspx.cs" Inherits="Question" %>

<%@ Register src="UC_Header.ascx" tagname="UC_Header" tagprefix="uc1" %>
<%@ Register src="UC_Search.ascx" tagname="UC_Search" tagprefix="uc2" %>
<%@ Register src="UC_Navigation.ascx" tagname="UC_Navigation" tagprefix="uc3" %>
<%@ Register src="UC_Footer.ascx" tagname="UC_Footer" tagprefix="uc4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <form id="form1" runat="server" defaultbutton="ibtnPostQuestion">
    
        <uc1:UC_Header ID="UC_Header1" runat="server" />
        <uc2:UC_Search ID="UC_Search1" runat="server" />
        <uc3:UC_Navigation ID="UC_Navigation1" runat="server" />
    
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="4"><img src="images/left011.gif" width="4" height="33" /></td>
            <td background="images/left022.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td class="danhuang">&nbsp;&nbsp;问题回答 </td>
                  <td>&nbsp;</td>
                </tr>
            </table></td>
            <td width="4"><img src="images/left033.gif" width="4" height="33" /></td>
          </tr>
        </table>
        <table width="100%" border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#527800">
          <tr>
            <td height="20" bgcolor="#FFFFFF"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td><span class="henhong">主题：</span><br />
                    <asp:TextBox ID="txtTitle" runat="server" Width="218px"></asp:TextBox><br />
                    <span class="huise1">请在上述文本框中输入主题<br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                        runat="server" ControlToValidate="txtTitle" Display="Dynamic" 
                        ErrorMessage="请输入主题"></asp:RequiredFieldValidator><br /></span>
                        
                    <span class="henhong">类别：</span><br />
                    <asp:DropDownList ID="ddlCatalogCode" runat="server" Width="150px"></asp:DropDownList><br />
                    <span class="huise1">请选择主题所属的板块<br /></span>                        
                        
                    <span class="henhong">内容：</span><br />
                    <asp:TextBox ID="txtText" runat="server" Height="204px" TextMode="MultiLine" Width="800px"></asp:TextBox><br />
                    <span class="huise1">请在上述编辑器中输入要提问的问题内容<br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                        runat="server" ControlToValidate="txtText" Display="Dynamic" 
                        ErrorMessage="请输入要发表的内容"></asp:RequiredFieldValidator><br /></span>

                    <span class="henhong">悬赏分数：</span><br />
                    <asp:TextBox ID="txtMark" runat="server"></asp:TextBox><br />
                    <span class="huise1">请输入悬赏的分数<br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToValidate="txtMark" Display="Dynamic" ErrorMessage="请输入有效的悬赏分数" 
                        Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator><br /></span>

                    <span class="henhong">验证码：</span><br />
                    <table>
                        <tr><td><asp:TextBox ID="txtCheckCode" runat="server"></asp:TextBox></td>
                            <td><cc1:validatecode ID="ValidateCode1" runat="server" /></td>
                        </tr>
                    </table>
                    <span class="huise1">请将图中所显示的内容输入到上述文本框中<br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                        runat="server" ControlToValidate="txtCheckCode" Display="Dynamic" 
                        ErrorMessage="请输入验证码"></asp:RequiredFieldValidator><br /></span>
                    <br />
                    <span class="huise1">
                        <asp:ImageButton ID="ibtnPostQuestion" runat="server"  Width="107px" Height="28px"
                            ImageUrl="~/images/ite.gif" onclick="ibtnPostQuestion_Click" />
                        <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label>
                    </span>
                    </td>
                </tr>
              </table></td>
            </tr>
        </table>

    
        <uc4:UC_Footer ID="UC_Footer1" runat="server" />
    
    </div>
    </form>
</body>
</html>
