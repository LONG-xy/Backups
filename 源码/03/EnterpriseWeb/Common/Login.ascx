<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="Common_Login" %>
<table width="243" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="64" background="../images/denglu.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="133" valign="top" background="../images/denglu_1.gif">
            <asp:Panel ID="Panel1" runat="server">
            <table width="243" height="133" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="18">&nbsp;</td>
                <td width="54">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td width="26">&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="wenzi2">用户名：</td>
                <td colspan="2"><label>
                  <asp:TextBox ID="txtName" runat="server" Width="131px"></asp:TextBox>
                </label></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="wenzi2">密码：</td>
                <td colspan="2"><asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="131px"></asp:TextBox></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td class="wenzi2">验证码：</td>
                <td width="88"><asp:TextBox ID="txtCode" runat="server" Width="79px"></asp:TextBox></td>
                <td width="57" align="center"><asp:Image ID="imgCode" runat="server" ImageUrl="~/Common/checkcode.aspx"/></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td colspan="2" align="center"><label>
                  <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="注册" />
                  &nbsp;
                  <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="登录" />
                </label></td>
                <td colspan="2"><asp:HyperLink ID="hpLinkFPwd" runat="server" Font-Size="9pt" Font-Underline="False" ForeColor="Black" NavigateUrl="~/User/InName.aspx">忘记密码？</asp:HyperLink>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td colspan="2">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="False">
                &nbsp;&nbsp;欢迎<asp:Label ID="labName" runat="server"></asp:Label>光临本网站！<br />
                <asp:LinkButton
                    ID="lbtnEdit" runat="server" OnClick="lbtnEdit_Click" Font-Size="9pt" Font-Underline="False" ForeColor="Black">修改信息</asp:LinkButton>
                <asp:LinkButton ID="lbtnCancel" runat="server" OnClick="lbtnCancel_Click" Font-Size="9pt" Font-Underline="False" ForeColor="Black">注销</asp:LinkButton></asp:Panel>
            </td>
          </tr>
          <tr>
            <td height="6" background="../images/denglu2.gif"></td>
          </tr>
        </table>