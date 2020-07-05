<%@ Page Language="C#" MasterPageFile="~/Common/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="User_Register" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="505" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" background="../images/zhuce.gif">&nbsp;</td>
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
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                          </label></td>
                          <td width="89"><label>
                            <asp:Button ID="btnTest" runat="server" Text="检测用户名" OnClick="btnTest_Click" CausesValidation="False" />
                          </label></td>
                        </tr>
                        <tr>
                          <td height="24" class="wenzi2">用户密码：</td>
                          <td colspan="3"><asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="149px"></asp:TextBox></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td class="wenzi2">确认密码：</td>
                          <td colspan="3"><asp:TextBox ID="txtSPwd" runat="server" TextMode="Password" Width="149px"></asp:TextBox></td>
                          <td><asp:CompareValidator ID="cvPwd" runat="server" ControlToCompare="txtPwd"
                        ControlToValidate="txtSPwd" ErrorMessage="密码输入不一致" Font-Size="9pt"></asp:CompareValidator></td>
                        </tr>
                        <tr>
                          <td height="24" class="wenzi2">密保问题：</td>
                          <td colspan="3"><label>
                            <asp:DropDownList ID="ddlQuestion" runat="server" Width="153px">
                    <asp:ListItem>你的生日？</asp:ListItem>
                    <asp:ListItem>你最尊敬的人？</asp:ListItem>
                    <asp:ListItem>你父亲的生日？</asp:ListItem>
                    <asp:ListItem>你母亲的生日？</asp:ListItem>
                </asp:DropDownList>
                          </label></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td class="wenzi2">密保答案：</td>
                          <td colspan="3"><asp:TextBox ID="txtResult" runat="server"></asp:TextBox></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td class="wenzi2">头像：</td>
                          <td colspan="3"><asp:Image id="imgPhoto" runat="server" Height="55px" Width="54px"></asp:Image></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="24">&nbsp;</td>
                            <td colspan="4">
                                <asp:FileUpload id="uploadPhoto" runat="server" Width="214px"></asp:FileUpload>
                                <asp:Button id="btnUp" onclick="btnUp_Click" runat="server" Text="显示" CausesValidation="False"></asp:Button></td>
                        </tr>
                        <tr>
                          <td height="24" class="wenzi2">性别：</td>
                          <td colspan="3"><asp:DropDownList ID="ddlSex" runat="server" Width="153px">
                <asp:ListItem>男</asp:ListItem>
                <asp:ListItem>女</asp:ListItem>
            </asp:DropDownList></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="21" class="wenzi2">年龄：</td>
                          <td colspan="3"><asp:TextBox ID="txtAge" runat="server"></asp:TextBox></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="23" class="wenzi2">联系电话：</td>
                          <td colspan="3"><asp:TextBox ID="txtTel" runat="server"></asp:TextBox></td>
                          <td><asp:RegularExpressionValidator ID="revTel" runat="server" ErrorMessage="*" ControlToValidate="txtTel" ValidationExpression="^(\d{3,4}-)?\d{6,8}$"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                          <td height="20" class="wenzi2">手机：</td>
                          <td colspan="3"><asp:TextBox ID="txtMobile" runat="server"></asp:TextBox></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="19" class="wenzi2">QQ号：</td>
                          <td colspan="3"><asp:TextBox ID="txtQQ" runat="server"></asp:TextBox></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="20" class="wenzi2">E-mail:</td>
                          <td colspan="3"><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
                          <td><asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="*" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                          <td height="20" class="wenzi2">家庭地址：</td>
                          <td colspan="3"><asp:TextBox ID="txtAddress" runat="server"></asp:TextBox></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="21" class="wenzi2">个人首页：</td>
                          <td colspan="3"><asp:TextBox ID="txtIndex" runat="server"></asp:TextBox></td>
                          <td><asp:RegularExpressionValidator ID="revIndex" runat="server" ErrorMessage="*" ControlToValidate="txtIndex" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr>
                          <td height="78" class="wenzi2">备注：</td>
                          <td colspan="3"><label>
                            <asp:TextBox ID="txtRemark" runat="server" Height="102px" TextMode="MultiLine" Width="162px"></asp:TextBox>
                          </label></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                          <td>&nbsp;</td>
                          <td width="42"><asp:Button ID="btnReg" runat="server" Text="注册" OnClick="btnReg_Click" /></td>
                          <td width="89"><asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="修改" /></td>
                          <td width="42"><asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click" CausesValidation="False" /></td>
                          <td>&nbsp;</td>
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

