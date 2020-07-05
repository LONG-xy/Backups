<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DelphiProduct.ascx.cs" Inherits="Common_DelphiProduct" %>
<table width="258" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="10" height="21">&nbsp;</td>
                    <td width="186" height="21" background="../images/fenlei1.gif"><table width="186" height="19" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="16">&nbsp;</td>
                          <td width="108" class="wenzi3">Delphi</td>
                          <td width="62">&nbsp;</td>
                        </tr>
                    </table></td>
                    <td width="46" height="21"><img src="../images/fenlei2.gif" width="46" height="21" border="0" usemap="#Map7MapMapMap"></td>
                    <td width="16" height="21">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="19">&nbsp;</td>
                    <td height="19" colspan="2">&nbsp;</td>
                    <td height="19">&nbsp;</td>
                  </tr>
                  <tr>
                    <td style="height: 95px">&nbsp;</td>
                    <td colspan="2" rowspan="3"><asp:DataList ID="dlDelphiPro" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" Width="224px">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td style="text-align: center">
                                <a title="<%# Eval("Name")%>" href="../User/Sort.aspx?DelphiID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"
                                            style="font-size: 9pt;text-decoration:none; color:Black;">
                                            <asp:Image ID="imgPhoto" runat="server" Height="119px" Width="107px" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"Photo") %>'/></td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                            <a title="<%# Eval("Name")%>" href="../User/Sort.aspx?DelphiID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"
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
                    <td style="height: 95px">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="7">&nbsp;</td>
                    <td height="7">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="31">&nbsp;</td>
                    <td height="31">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="20">&nbsp;</td>
                    <td height="20" colspan="2">&nbsp;</td>
                    <td height="20">&nbsp;</td>
                  </tr>

                </table>
                  <map name="Map7MapMapMap">
                    <area shape="rect" coords="0,4,35,17" href="../User/Sort.aspx?PID=5">
                    <area shape="rect" coords="21,17,24,26" href="../User/Sort.aspx?PID=5">
                  </map>