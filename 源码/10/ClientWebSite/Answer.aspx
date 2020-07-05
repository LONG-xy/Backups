<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Answer.aspx.cs" Inherits="Answer" %>

<%@ Register src="UC_Header.ascx" tagname="UC_Header" tagprefix="uc1" %>
<%@ Register src="UC_Search.ascx" tagname="UC_Search" tagprefix="uc2" %>
<%@ Register src="UC_Navigation.ascx" tagname="UC_Navigation" tagprefix="uc3" %>
<%@ Register src="UC_Footer.ascx" tagname="UC_Footer" tagprefix="uc4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>����֪��-�������ȵ�IT������������</title>
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
    <form id="form1" runat="server" defaultbutton="ibtnPostAnswer" defaultfocus="txtTitle">
    <div>
        <uc1:UC_Header ID="UC_Header1" runat="server" />
        <uc2:UC_Search ID="UC_Search1" runat="server" />
        <uc3:UC_Navigation ID="UC_Navigation1" runat="server" />
        
<table width="95%" height="56" border="0" align="center">
  <tr>
    <td><table width="100%" height="92" align="center" class="table">
      <tbody>
        <tr>
          <td class="left" valign="top">
            
        <asp:DataList ID="dlQuestion" runat="server" DataKeyField="Code" Width="100%" 
                  onitemcommand="dlQuestion_ItemCommand" 
                  onitemdatabound="dlQuestion_ItemDataBound">
            <ItemTemplate>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><a href="Index.aspx" target="_blank" class="hong"><strong>����֪��</strong></a> &gt;&gt; <a href="QuestionCatalog.aspx" target="_blank" class="hong"><strong>�������</strong></a> &gt;&gt; <a href="QuestionList.aspx?CatalogCode=<%#Eval("CatalogCode") %>" target="_blank" class="hong"><strong><%#Eval("CatalogName")%></strong></a>&gt;&gt; <a href="QuestionAnswer.aspx?QuestionCode=<%#Eval("Code") %>" target="_self" class="hong"><%#Eval("Title") %></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                  <td width="4"><img src="images/left011.gif" width="4" height="33" /></td>
                  <td background="images/left022.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="danhuang">&nbsp;&nbsp;<%#Eval("Title") %>   </td>
                      <td>&nbsp;</td>
                      </tr>
                </table></td>
                  <td width="4"><img src="images/left033.gif" width="4" height="33" /></td>
                </tr>
              </table>
            <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#527800">
              <tr>
                <td height="100" bgcolor="#FFFFFF">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19%" rowspan="3" bgcolor="#F2F7E6">
                    <table width="140" height="44" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="160"><img src="images/unface.gif" width="120" height="120" /></td>
                      </tr>
                    </table>
                      <table width="140" height="44" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="160" class="huise1">�û���<%#Eval("UserCode") %><br />
                            ���֣�<span class="chengse"><%#Eval("Mark") %></span><br />
                            �����Ѵ�����<span class="chengse"><%#Eval("AAcceptCount") %></span> <br />
                            ע�᣺<span class="henhong"><%#Eval("CreatedDate") %></span></td>
                        </tr>
                      </table></td>
                    <td width="81%" bgcolor="#EEEEEE" class="huise1">
                    <table width="197" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="24" align="center"><img src="images/mark_time.gif" width="16" height="16" /></td>
                        <td width="173" class="huise1">����ڣ�<%#Eval("PostDatetime")%></td>
                      </tr>
                    </table> 
                      </td>
                  </tr>
                  <tr>
                    <td height="200" valign="top"><br />
                      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td class="huise1"><strong><%#Eval("Text")%></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="20" bgcolor="#EEEEEE">
                        <asp:LinkButton ID="lbtnCloseQuestion" runat="server" CommandName="CloseQuestion" Font-Size="X-Small" ForeColor="#669900">�ر�����</asp:LinkButton>
                    </td>
                  </tr>
                </table></td>
              </tr>
            </table>
            <table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="25%" height="45">
                    <table>
                        <tr>
                            <td><a href="Question.aspx"><img src="images/tw.gif" width="129" height="39" border="0" /></a>&nbsp;&nbsp;</td>
                            <td><asp:ImageButton ID="ibtnAnswer" runat="server" CommandName="Answer" ImageUrl="images/hd.gif" Width="129" Height="39" BorderStyle="None" /></td>
                        </tr>
                    </table>

                </td>
                <td width="75%" height="45" align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
              </tr>
            </table>
            </ItemTemplate>
        </asp:DataList>            
        
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="4"><img src="images/left011.gif" width="4" height="33" /></td>
                <td background="images/left022.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="danhuang">&nbsp;&nbsp;����ش� </td>
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
                      <td><span class="henhong">�ظ����⣺</span><br />
                        <asp:TextBox ID="txtTitle" runat="server" Width="218px"></asp:TextBox><br />
                        <span class="huise1">���������ı���������ظ�����<br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                            runat="server" ControlToValidate="txtTitle" Display="Dynamic" 
                            ErrorMessage="������ش������"></asp:RequiredFieldValidator><br /></span>
                            
                        <span class="henhong">�ظ����ݣ�</span><br />
                        <asp:TextBox ID="txtText" runat="server" Height="204px" TextMode="MultiLine" Width="800px"></asp:TextBox><br />
                        <span class="huise1">���������༭��������Ҫ�ظ�������<br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                            runat="server" ControlToValidate="txtText" Display="Dynamic" 
                            ErrorMessage="������Ҫ�ش������"></asp:RequiredFieldValidator><br /></span>

                        <span class="henhong">��֤�룺</span><br />
                        <table>
                            <tr>
                                <td><asp:TextBox ID="txtCheckCode" runat="server"></asp:TextBox></td>
                                <td><cc1:validatecode ID="ValidateCode1" runat="server" /></td>
                            </tr>
                        </table>
                        <span class="huise1">�뽫ͼ������ʾ���������뵽�����ı�����<br /></span>
                        <br />
                        <span class="huise1">
                            <asp:ImageButton ID="ibtnPostAnswer" runat="server" Width="107px" Height="28px"
                                ImageUrl="~/images/ite.gif" onclick="ibtnPostAnswer_Click" />
                            <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label>
                        </span>
                        </td>
                    </tr>
                  </table></td>
                </tr>
            </table>
        
        
        
        
        <asp:DataList ID="dlAnswer" runat="server" DataKeyField="Code" Width="100%" 
            onitemcommand="dlAnswer_ItemCommand" onitemdatabound="dlAnswer_ItemDataBound">
            <ItemTemplate>
            
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                  <td width="4"><img src="images/left011.gif" width="4" height="33" /></td>
                  <td background="images/left022.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td class="danhuang">&nbsp;&nbsp;<%#Eval("Title") %> </td>
                      <td>&nbsp;</td>
                      </tr>
                </table></td>
                  <td width="4"><img src="images/left033.gif" width="4" height="33" /></td>
                </tr>
              </table>
            <table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#527800">
              <tr>
                <td height="100" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="19%" rowspan="3" bgcolor="#F2F7E6"><table width="140" height="44" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="160"><img src="images/unface.gif" width="120" height="120" /></td>
                      </tr>
                    </table>
                      <table width="140" height="44" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="160" class="huise1">�û���<%#Eval("UserCode") %><br />
                            ���֣�<span class="chengse"><%#Eval("Mark") %></span><br />
                            �����Ѵ�����<span class="chengse"><%#Eval("AAcceptCount") %></span> <br />
                            ע�᣺<span class="henhong"><%#Eval("CreatedDate") %></span></td>
                        </tr>
                      </table></td>
                    <td width="81%" bgcolor="#EEEEEE" class="huise1"><table width="197" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="24" align="center"><img src="images/mark_time.gif" width="16" height="16" /></td>
                        <td width="173" class="huise1">�ظ��ڣ�<%#Eval("PostDatetime") %></td>
                      </tr>
                    </table> 
                      </td>
                  </tr>
                  <tr>
                    <td height="200" valign="top"><br />
                      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td class="huise1"><%#Eval("Text") %></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="20" bgcolor="#EEEEEE">
                        <asp:LinkButton ID="lbtnUpdate" runat="server" CommandName="Edi" Font-Size="X-Small" ForeColor="#669900">�޸�</asp:LinkButton>
                        <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="Del" OnClientClick="return confirm('ȷ��ɾ��?');" Font-Size="X-Small" ForeColor="#669900">ɾ��</asp:LinkButton>
                        <asp:LinkButton ID="lbtnBestAnswer" runat="server" CommandName="BestAnswer" Font-Size="X-Small" ForeColor="#669900">��Ϊ��Ѵ�</asp:LinkButton>
                    </td>
                  </tr>
                </table></td>
              </tr>
            </table>            
            
            </ItemTemplate>
        </asp:DataList>        
            </td>
        </tr>
      </tbody>
    </table></td>
  </tr>
</table>        
        
        <uc4:UC_Footer ID="UC_Footer1" runat="server" />
    </div>
    </form>
</body>
</html>

