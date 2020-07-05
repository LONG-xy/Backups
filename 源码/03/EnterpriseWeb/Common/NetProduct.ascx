<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NetProduct.ascx.cs" Inherits="Common_NetProduct" %>
<table width="247" border="0" cellpadding="0" cellspacing="0" dwcopytype="CopyTableRow">
                  <tr>
                    <td height="18">&nbsp;</td>
                    <td height="18">&nbsp;</td>
                    <td height="18">&nbsp;</td>
                  </tr>
                  <tr>
                    <td width="15" height="21">&nbsp;</td>
                    <td width="186" height="21" background="../images/fenlei1.gif"><table width="186" height="19" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="16">&nbsp;</td>
                          <td width="108" class="wenzi3">C#+ASP.NET</td>
                          <td width="62">&nbsp;</td>
                        </tr>
                    </table></td>
                    <td width="46"><img src="../images/fenlei2.gif" width="46" height="21" border="0" usemap="#Map6Map"></td>
                  </tr>
                  <tr>
                    <td width="15">&nbsp;</td>
                    <td height="19" colspan="2">&nbsp;</td>
                  </tr>
                  <tr>
                    <td width="15" height="95">&nbsp;</td>
                    <td height="95" colspan="2" valign="top"><asp:DataList ID="dlNetPro" runat="server" RepeatColumns="2" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td style="text-align: center">
                                <a title="<%# Eval("Name")%>" href="../User/Sort.aspx?NetID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"
                                            style="font-size: 9pt;text-decoration:none; color:Black;">
                                            <asp:Image ID="imgPhoto" runat="server" Height="119px" Width="107px" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"Photo") %>'/></td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                            <a title="<%# Eval("Name")%>" href="../User/Sort.aspx?NetID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"
                                            style="font-size: 9pt;text-decoration:none; color:Black;">
                                            <%# new DataOperate().SubStr(Eval("Name").ToString(), 8)%></td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                            <a style="font-size: 9pt;text-decoration:none; color:Black;">
                                            定价：<%# Convert.ToInt32(DataBinder.Eval(Container.DataItem, "Price")).ToString("￥#,###.00")%></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList></td>
                  </tr>
                  <tr>
                    <td width="15" height="13">&nbsp;</td>
                    <td height="13" colspan="2">&nbsp;</td>
                  </tr>
                </table>
                  <map name="Map6Map">
                    <area shape="rect" coords="0,3,43,18" href="../User/Sort.aspx?PID=0">
                  </map>