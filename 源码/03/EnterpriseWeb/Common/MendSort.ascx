<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MendSort.ascx.cs" Inherits="Common_MendSort" %>
<table width="232" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="../images/budingxiazaipaihang.gif" width="232" height="34" border="0" usemap="#Map4"></td>
            </tr>
            <tr>
              <td height="207" valign="top" background="../images/jiaodianxinwen2.gif"><asp:DataList ID="dlMendSort" runat="server" RepeatColumns="1" Width="225px">
                <ItemTemplate>
                    &nbsp;&nbsp;<a class="daohanglianjie" title="<%# Eval("Name")%>" href="../User/Sort.aspx?MID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"
                                            style="font-size: 9pt;text-decoration:none; color:Black;">
                                            <%# new DataOperate().SubStr(Eval("Name").ToString(), 12)%>
                                            </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a class="daohanglianjie"><%#DataBinder.Eval(Container.DataItem, "LoadNum")%></a>
                </ItemTemplate>
                <HeaderTemplate>
                    &nbsp;&nbsp;补丁名称 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下载次数
                </HeaderTemplate>
                  <HeaderStyle Font-Size="11pt" HorizontalAlign="Center" />
            </asp:DataList></td>
            </tr>
            <tr>
              <td height="3" background="../images/jiaodianxinwen3.gif"></td>
            </tr>
          </table>
<map name="Map4">
<area shape="rect" coords="178,5,229,25" href="../User/Sort.aspx?SortID=1">
</map>