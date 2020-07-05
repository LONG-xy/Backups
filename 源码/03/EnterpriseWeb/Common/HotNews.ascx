<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HotNews.ascx.cs" Inherits="Common_HotNews" %>
<table width="232" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="../images/jiaodianxinwen.gif" width="232" height="34" border="0" usemap="#Map2"></td>
          </tr>
          <tr>
            <td height="192" valign="top" background="../images/jiaodianxinwen2.gif"><br /><asp:DataList ID="dlHotNews" runat="server" RepeatColumns="1">
                <ItemTemplate>&nbsp;&nbsp;&nbsp;&nbsp;
                   ·<a class="daohanglianjie" title="<%# Eval("Title")%>" href="../User/CNInfo.aspx?NewsID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"
                                            style="font-size: 9pt;text-decoration:none; color:Black;">
                                            <%# new DataOperate().SubStr(Eval("Title").ToString(), 15)%>
                                            </a>
                </ItemTemplate>
            </asp:DataList></td>
          </tr>
          <tr>
            <td height="3" background="../images/jiaodianxinwen3.gif"></td>
          </tr>
        </table>
<map name="Map2">
<area shape="rect" coords="178,5,223,23" href="../User/CallBoardAndNews.aspx?CBID=1">
</map>