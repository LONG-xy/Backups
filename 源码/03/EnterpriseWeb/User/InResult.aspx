<%@ Page Language="C#" MasterPageFile="~/Common/MasterPage.master" AutoEventWireup="true" CodeFile="InResult.aspx.cs" Inherits="User_InResult" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <table width="505" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" background="../images/dierbu.gif">&nbsp;</td>
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
                          <td height="24" class="wenzi2">密保问题：</td>
                          <td colspan="3"><label>
                              <asp:TextBox ID="txtQuestion" runat="server" ReadOnly="True"></asp:TextBox></label></td>
                          <td style="width: 73px">&nbsp;</td>
                        </tr>
                        <tr>
                          <td class="wenzi2">密保答案：</td>
                          <td colspan="3"><asp:TextBox ID="txtResult" runat="server"></asp:TextBox></td>
                          <td style="width: 73px">&nbsp;</td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                            <td colspan="3">
    <asp:Button ID="btnNext" runat="server" OnClick="btnNext_Click" Text="下一步" />
    <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="重置" /></td>
                          <td style="width: 73px">&nbsp;</td>
                        </tr>
                          <tr>
                              <td colspan="5" style="height: 256px">
                              </td>
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

