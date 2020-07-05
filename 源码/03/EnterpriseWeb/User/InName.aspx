<%@ Page Language="C#" MasterPageFile="~/Common/MasterPage.master" AutoEventWireup="true" CodeFile="InName.aspx.cs" Inherits="User_InName" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="505" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" background="../images/diyibu.gif">&nbsp;</td>
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
                          <td width="78" height="28" class="wenzi2">用户名：</td>
                          <td colspan="3"><label>
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>&nbsp;</label></td>
                          <td width="89"><label>
                              &nbsp;<asp:Button ID="btnNext" runat="server" OnClick="btnNext_Click" Text="下一步" /></label></td>
                        </tr>
                        <tr>
                          <td class="wenzi2" style="height: 305px" colspan="5" rowspan="15"></td>
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

