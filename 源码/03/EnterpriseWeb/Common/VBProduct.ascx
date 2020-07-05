<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VBProduct.ascx.cs" Inherits="Common_VBProduct" %>
<table width="247" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="15" height="21" valign="top">&nbsp;</td>
                    <td width="186" height="21" background="../images/fenlei1.gif"><table width="186" height="19" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="16">&nbsp;</td>
                          <td width="108" class="wenzi3">VB</td>
                          <td width="62">&nbsp;</td>
                        </tr>
                    </table></td>
                    <td width="46"><img src="../images/fenlei2.gif" width="46" height="21" border="0" usemap="#Map6MapMapMapMap"></td>
                  </tr>
                  <tr>
                    <td width="15">&nbsp;</td>
                    <td height="19" colspan="2">&nbsp;</td>
                  </tr>
                  <tr>
                    <td width="15" height="95">&nbsp;</td>
                    <td colspan="2" valign="top" rowspan="3"><asp:DataList ID="dlVBPro" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" Width="229px">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td style="text-align: center">
                                <a title="<%# Eval("Name")%>" href="../User/Sort.aspx?VBID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"
                                            style="font-size: 9pt;text-decoration:none; color:Black;">
                                            <asp:Image ID="imgPhoto" runat="server" Height="119px" Width="107px" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"Photo") %>'/></td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                            <a title="<%# Eval("Name")%>" href="../User/Sort.aspx?VBID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"
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
                    <td width="15" height="7">&nbsp;</td>
                  </tr>
                  <tr>
                    <td width="15" height="31">&nbsp;</td>
                  </tr>
                  <tr>
                    <td width="15" height="20">&nbsp;</td>
                    <td height="20" colspan="2">&nbsp;</td>
                  </tr>
                </table>
                  <map name="Map6MapMapMapMap">
                    <area shape="rect" coords="0,3,43,18" href="../User/Sort.aspx?PID=4">
                  </map>