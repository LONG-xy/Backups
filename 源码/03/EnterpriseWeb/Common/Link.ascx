<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Link.ascx.cs" Inherits="Common_Link" %>
<table width="243" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="../images/youqinglianjie.gif" width="243" height="34"></td>
            </tr>
            <tr>
              <td height="221" valign="top" background="../images/denglu_1.gif"><asp:DataList ID="dlLinkInfo" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" Width="236px">
                <ItemTemplate>
                    <table style="width: 93px; height: 70px">
                        <tr>
                            <td style="height: 40px; text-align: center; width: 101px;">
                                <a target="_blank" title="<%# Eval("Name")%>" href="<%# DataBinder.Eval(Container.DataItem,"LAddress") %>"
                                            style="font-size: 9pt;text-decoration:none; color:Black;">
                                            <asp:Image ID="imgPhoto" runat="server" Height="41px" Width="104px" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"Photo") %>'/></td>
                        </tr>
                        <tr>
                            <td style="text-align: center; width: 101px;">
                            <a target="_blank" title="<%# Eval("Name")%>" href="<%# DataBinder.Eval(Container.DataItem,"LAddress") %>"
                                            style="font-size: 9pt;text-decoration:none; color:Black;">
                                            <%# new DataOperate().SubStr(Eval("Name").ToString(),8)%></td>
                        </tr>
                    </table>            
                </ItemTemplate>
            </asp:DataList></td>
            </tr>
            <tr>
              <td height="6" background="../images/denglu2.gif"></td>
            </tr>
          </table>