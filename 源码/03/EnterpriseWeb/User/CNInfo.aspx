<%@ Page Language="C#" MasterPageFile="~/Common/MasterPage.master" AutoEventWireup="true" CodeFile="CNInfo.aspx.cs" Inherits="User_CNInfo" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="505" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" background="../images/gonggaojixinwenxinxi.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="661" valign="top" background="../images/chanpin2.gif"><label></label>
              <table width="505" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="40" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                  <td width="48" height="507">&nbsp;</td>
                  <td width="405" valign="top"><table width="405" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="503" align="center"><table height="496" border="0" cellpadding="0" cellspacing="0" style="width: 473px">
                        <tr>
                          <td class="wenzi2" style="text-align:center" colspan="4" rowspan="2">
    <asp:Label ID="labTitle" runat="server" Font-Bold="True" Font-Size="12pt"></asp:Label>
                              </td>
                        </tr>
                        <tr>
                        </tr>
                          <tr>
                              <td class="wenzi2" colspan="4" rowspan="1" style="text-align: left">
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="labDate" runat="server"></asp:Label></td>
                          </tr>
                          <tr>
                              <td class="wenzi2" colspan="4" rowspan="1" style="text-align: left">
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="labContent" runat="server"></asp:Label></td>
                          </tr>
                        <tr>
                          <td class="wenzi2" style="height: 25px;" colspan="4">
    <asp:HyperLink ID="hpLinkBack" runat="server" ForeColor="Black" NavigateUrl="~/Default.aspx" Font-Size="10pt">返回</asp:HyperLink></td>
                        </tr>
                        <tr>
                          <td style="height: 292px" colspan="4"></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
                  <td width="52">&nbsp;</td>
                </tr>
                <tr>
                  <td height="91" colspan="3">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="6" valign="top" background="../images/dibuzhong.gif"></td>
          </tr>
        </table>
</asp:Content>

