<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ToolsSort.ascx.cs" Inherits="Common_ToolsSort" %>
<table width="232" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="../images/gognjuxiazaipaihang.gif" width="232" height="34" border="0" usemap="#Map3"></td>
            </tr>
            <tr>
              <td height="184" valign="top" background="../images/jiaodianxinwen2.gif"><asp:DataList ID="dlMendSort" runat="server" RepeatColumns="1" Width="224px">
                <ItemTemplate>
                   &nbsp;&nbsp; <a class="daohanglianjie" title="<%# Eval("Name")%>" href="../User/Sort.aspx?TID=<%# DataBinder.Eval(Container.DataItem,"ID") %>">
                                            <%# new DataOperate().SubStr(Eval("Name").ToString(), 12)%>
                                            </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a class="daohanglianjie"><%#DataBinder.Eval(Container.DataItem, "LoadNum")%></a>
                </ItemTemplate>
                <HeaderTemplate>
                    &nbsp;&nbsp;工具名称 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下载次数
                </HeaderTemplate>
                  <HeaderStyle Font-Size="11pt" HorizontalAlign="Center" />
            </asp:DataList></td>
            </tr>
            <tr>
              <td height="3" background="../images/jiaodianxinwen3.gif"></td>
            </tr>
          </table>
<map name="Map3">
<area shape="rect" coords="178,5,225,23" href="../User/Sort.aspx?SortID=0">
</map>