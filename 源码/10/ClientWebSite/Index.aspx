<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<head runat="server">
    <title>明日知道-国内领先的IT技术搜素引擎</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
    
</head>
<body onload="MM_preloadImages('images/top2_02.gif','images/top2_03.gif','images/top2_04.gif','images/top2_05.gif','images/top2_06.gif','images/top2_07.gif','images/top2_08.gif','images/top2_09.gif')">
    <form id="form1" runat="server">
    <input id="hidCatalog" type="hidden" value="" runat="server"/>
    <div>
        <table width="1002" height="610" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="center"><table width="97%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="50" align="right" valign="top"><span class="hong"><a href="Login.aspx" class="hong">登录</a>　</span><span class="henhong">|</span><span class="hong">　<a href="Register.aspx" class="hong">注册</a></span> </td>
              </tr>
            </table>
            <table width="676" height="222" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="100" align="center"><img src="images/logo.gif" width="226" height="62" /></td>
              </tr>
              <tr>
                <td><table width="100" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="35"><table id="__01" width="732" height="35" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td><img src="images/top_01.gif" width="19" height="35" alt="" /></td>
                        <td><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='1';"><img src="images/top_02.gif" alt="" width="79" height="35" border="0" id="Image1" onmouseover="MM_swapImage('Image1','','images/top2_02.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                        <td><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='2';"><img src="images/top_03.gif" alt="" width="98" height="35" border="0" id="Image2" onmouseover="MM_swapImage('Image2','','images/top2_03.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                        <td><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='3';"><img src="images/top_04.gif" alt="" width="65" height="35" border="0" id="Image3" onmouseover="MM_swapImage('Image3','','images/top2_04.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                        <td><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='4';"><img src="images/top_05.gif" alt="" width="98" height="35" border="0" id="Image4" onmouseover="MM_swapImage('Image4','','images/top2_05.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                        <td><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='5';"><img src="images/top_06.gif" alt="" width="113" height="35" border="0" id="Image5" onmouseover="MM_swapImage('Image5','','images/top2_06.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                        <td><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='6';"><img src="images/top_07.gif" alt="" width="113" height="35" border="0" id="Image6" onmouseover="MM_swapImage('Image6','','images/top2_07.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                        <td><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='7';"><img src="images/top_08.gif" alt="" width="65" height="35" border="0" id="Image7" onmouseover="MM_swapImage('Image7','','images/top2_08.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                        <td><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='8';"><img src="images/top_09.gif" alt="" width="65" height="35" border="0" id="Image8" onmouseover="MM_swapImage('Image8','','images/top2_09.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                        <td><img src="images/top_10.gif" width="17" height="35" alt="" /></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="70" background="images/bg.gif">
                      <table>
                        <tr>
                            <td>
                              <table width="480" border="0" align="center" cellpadding="0" cellspacing="0">
                              <tr>
                                <td width="378" height="35"><table width="359" height="35" border="0" cellpadding="0" cellspacing="0" background="images/text.gif">
                                  <tr>
                                    <td align="center"><asp:TextBox ID="txtSearch" runat="server" Font-Size="Larger" Width="100%"></asp:TextBox></td>
                                  </tr>
                                </table></td>
                                <td width="113"><asp:ImageButton ID="ibtnSearch" ImageUrl="~/Images/so.gif" 
                                        Width="109px" Height="35px" runat="server" onclick="ibtnSearch_Click" /></td>
                              </tr>
                              
                            </table>
                              <table width="480" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td><span class="danhuang02">明日知道热门搜索：</span> <span class="cubai"><a href="#">c#</a> &nbsp; &nbsp;<a href="#">java编程词典</a> &nbsp; &nbsp;<a href="#">java   web</a> &nbsp; &nbsp;<a href="#">java</a> &nbsp; &nbsp;<a href="#">java从入门到精通</a> &nbsp; ...</span></td>
                                </tr>
                              </table>
                            </td>
                            <td class="black14"> <span class="blacklin">&nbsp;<a href="Question.aspx" class="blacklin">我要提问</a><br />
                            &nbsp;<a href="QuestionCatalog.aspx" class="blacklin">我要回答</a></span></td>
                        </tr>
                      </table>
                      
                    </td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td align="center"><p><a href="http://www.mingribook.com" target="_blank" class="hong"><br />
                  <br />
                  明日图书</a>　<span class="henhong">|</span>　<a href="http://www.mingrisoft.com" target="_blank" class="hong">明日软件</a>　<span class="henhong">|</span>　<a href="http://www.mrbccd.com" target="_blank" class="hong">编程词典</a></p>
                  <p class="huise1">技术服务热线：400-675-1066X　传真：0431-84939777X　企业邮箱：mingrisoft@mingrisoft.com<br />
                    公司地址：吉林省长春市二道区东盛大街89号亚泰广场C座　吉ICP备07500273X号<br />
                    Copyright&copy;www.mingribook.com   All Rights Reserved!          </p>
                  <div></div></td>
              </tr>
            </table></td>
          </tr>
        </table>    
    </div>
    </form>
</body>
</html>
