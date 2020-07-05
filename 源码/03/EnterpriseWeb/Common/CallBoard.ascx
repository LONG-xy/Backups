<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CallBoard.ascx.cs" Inherits="Common_CallBoard" %>
<table width="243" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="../images/qiyegongao.gif" width="243" height="34" border="0" usemap="#Map"></td>
            </tr>
            <tr>
              <td height="192" valign="top" background="../images/denglu_1.gif"><br /><asp:DataList ID="dlCallBoard" runat="server" RepeatColumns="1" RepeatDirection="vertical" Font-Size="9pt">
                <ItemTemplate>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <span class="STYLE1">＞＞</span><a title="<%# Eval("Title")%>" href="../User/CNInfo.aspx?CBoardID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"
                                              class="daohanglianjie">
                                            <%# new DataOperate().SubStr(Eval("Title").ToString(), 10)%>
                                            </a>
                </ItemTemplate>
            </asp:DataList></td>
            </tr>
            <tr>
              <td height="6" background="../images/denglu2.gif"></td>
            </tr>
          </table>
<map name="Map"><area shape="rect" coords="188,7,239,25" href="../User/CallBoardAndNews.aspx?CBID=0"></map>