<%@ Page Language="C#" MasterPageFile="~/Common/MasterPage.master" AutoEventWireup="true" CodeFile="GetPwd.aspx.cs" Inherits="User_GetPwd" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="505" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" background="../images/zhaodaomima.gif">&nbsp;</td>
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
                      <td height="503" align="center"><table width="340" height="496" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td height="28" class="wenzi2" style="width: 168px; text-align: right">用户名：</td>
                          <td colspan="3" style="text-align: left; width: 146px;">
                            &nbsp;&nbsp;<asp:Label ID="labName" runat="server" Font-Size="9pt" ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                          <td height="24" class="wenzi2" style="width: 168px; text-align: right">
                              密&nbsp; 码：</td>
                          <td colspan="3" style="text-align: left; width: 146px;">&nbsp;&nbsp;<asp:Label ID="labPwd" runat="server" Font-Size="9pt" ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                          <td class="wenzi2" style="height: 25px;" colspan="4">
    <asp:HyperLink ID="hpLinkBack" runat="server" ForeColor="Black" NavigateUrl="~/Default.aspx">返回</asp:HyperLink></td>
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

