<%@ Page Language="C#" MasterPageFile="~/Common/MasterPage.master" AutoEventWireup="true" CodeFile="LWordInfo.aspx.cs" Inherits="User_LWordInfo" Title="Untitled Page" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <table width="505" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" background="../images/liuyanxiangxixinxi.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="660" valign="top" background="../images/chanpin2.gif"><label></label>
              <table width="505" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="8" colspan="3"></td>
                </tr>
                <tr>
                  <td width="27" height="610">&nbsp;</td>
                  <td align="center" valign="top" style="width: 442px"><table border="0" cellspacing="0" cellpadding="0" style="width: 421px">
                    <tr>
                      <td width="425" height="156" align="left" valign="top"><table height="153" border="0" cellpadding="0" cellspacing="1" bordercolor="#666666" bgcolor="#D2E5F3" style="width: 480px">
                        <tr>
                          <td colspan="2" align="left" valign="top" bgcolor="#B9D6EC" class="wenzi2" style="height: 24px"><label></label>                            <table width="425" height="24" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="10" valign="top">&nbsp;</td>
                              <td width="415" class="wenzi3">留言详细信息</td>
                              </tr>
                          </table></td>
                          </tr>
                        <tr>
                          <td width="81" height="23" align="center" bordercolor="#999999" bgcolor="#FFFFFF" class="wenzi2" style="text-align: center">留言主题：</td>
                          <td width="343" bordercolor="#999999" bgcolor="#FFFFFF" class="wenzi2">&nbsp;<asp:Label ID="labTitle" runat="server"></asp:Label></td>
                          </tr>
                        <tr>
                          <td height="22" align="center" bordercolor="#999999" bgcolor="#FFFFFF" class="wenzi2">留言人：</td>
                          <td height="22" bordercolor="#999999" bgcolor="#FFFFFF" class="wenzi2">&nbsp;<asp:Label ID="labHost" runat="server"></asp:Label></td>
                          </tr>
                        <tr>
                          <td height="23" align="center" bordercolor="#999999" bgcolor="#FFFFFF" class="wenzi2">留言时间：</td>
                          <td height="23" bordercolor="#999999" bgcolor="#FFFFFF" class="wenzi2">&nbsp;<asp:Label ID="labTime" runat="server"></asp:Label></td>
                          </tr>
                        <tr>
                          <td height="17" align="center" bordercolor="#999999" bgcolor="#FFFFFF" class="wenzi2">留方内容：</td>
                          <td height="17" valign="top" bordercolor="#999999" bgcolor="#FFFFFF" class="wenzi2">&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="23" colspan="2" bordercolor="#999999" bgcolor="#FFFFFF" class="wenzi2"> &nbsp;<asp:Label ID="labContent" runat="server"></asp:Label></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table>
                    <table border="0" cellspacing="0" cellpadding="0" style="width: 481px">
                      <tr>
                        <td width="424" height="3"></td>
                      </tr>
                    </table>
                    <table height="159" border="0" cellpadding="0" cellspacing="1" bordercolor="#666666" bgcolor="#D2E5F3" style="width: 386px">
                      <tr>
                        <td height="24" colspan="5" align="left" valign="top" bgcolor="#B9D6EC" class="wenzi2"><label></label>
                            <table width="425" height="24" border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                <td width="10" valign="top">&nbsp;</td>
                                <td width="415" class="wenzi3">回复信息</td>
                              </tr>
                          </table></td>
                      </tr>
                        <tr>
                            <td align="center" bgcolor="#ecf7ff" bordercolor="#999999" class="wenzi2" colspan="5"
                                height="25">
                                <asp:DataList ID="dlRevertInfo" runat="server" RepeatColumns="1" RepeatDirection="vertical" OnDeleteCommand="dlRevertInfo_DeleteCommand" Width="477px">
                <ItemTemplate>
                    <table>
                    <tr>
                        <td width="63" height="25" align="center" bordercolor="#999999" bgcolor="#ECF7FF" class="wenzi2">回复人：</td>
                        <td width="51" align="center" bordercolor="#999999" bgcolor="#ECF7FF" class="wenzi2"><%#DataBinder.Eval(Container.DataItem, "RevertUser")%></td>
                        <td width="86" align="center" bordercolor="#999999" bgcolor="#ECF7FF" class="wenzi2">回复时间：</td>
                        <td width="136" align="center" bordercolor="#999999" bgcolor="#ECF7FF" class="wenzi2"><%#DataBinder.Eval(Container.DataItem, "RevertTime")%></td>
                        <td width="84" align="center" bordercolor="#999999" bgcolor="#ECF7FF" class="wenzi2"><asp:LinkButton ID="lbtnDel" runat="server" CommandName="Delete" ForeColor="Black">删除</asp:LinkButton></td>
                      </tr>
                      <tr>
                        <td height="24" align="center" bordercolor="#999999" bgcolor="#FFFFFF" class="wenzi2">回复内容：</td>
                        <td height="24" colspan="4" bordercolor="#999999" bgcolor="#FFFFFF" class="wenzi2">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="24" colspan="5" bordercolor="#999999" bgcolor="#FFFFFF" class="wenzi2">&nbsp; <%#DataBinder.Eval(Container.DataItem, "Content")%>&nbsp;</td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
                            </td>
                        </tr>
                    </table>
                    <table width="424" height="319" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="5" colspan="4" class="wenzi2"></td>
                        </tr>
                      <tr>
                        <td colspan="4" align="left" valign="top">
                        <FTB:FreeTextBox id="FreeTextBox1" runat="Server" Language="zh-cn"  SupportFolder="../aspnet_client/FreeTextBox/" Height="220px" Width="480px" HtmlModeDefaultsToMonoSpaceFont="True" DownLevelCols="50" DownLevelRows="10" ButtonDownImage="False" GutterBackColor="LightSteelBlue" ToolbarBackgroundImage="True" ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu|Bold,Italic,Underline,Strikethrough;Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage,InsertRule|Cut,Copy,Paste;Undo,Redo,Print" ToolbarStyleConfiguration="NotSet" />
                        </td>
                      </tr>
                      <tr>
                        <td width="13" height="24">&nbsp;</td>
                        <td align="left" valign="middle" style="width: 25px"><label>
                          <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="回复" />
                        </label></td>
                        <td width="361" align="left"><label>
                          <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="重置" />
                        </label></td>
                        <td style="width: 11px"><label></label></td>
                        </tr>
                      <tr>
                          <td class="wenzi2" colspan="4" style="height: 58px">
                              &nbsp;&nbsp;<table cellpadding="0" cellspacing="0" style="height: 28px;">
                        <tr>
                            <td style="font-size: 9pt; text-align: right; height: 30px;">
                                <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>[
                                <asp:Label ID="labPage" runat="server" Text="1"></asp:Label>
                                ]
                                <asp:Label ID="Label6" runat="server" Text="总页码为："></asp:Label>
                                [
                                <asp:Label ID="labBackPage" runat="server"></asp:Label>
                                ]<asp:LinkButton ID="lbtnOne" runat="server" Font-Underline="False" ForeColor="Red"
                                    OnClick="lbtnOne_Click">第一页</asp:LinkButton>
                                <asp:LinkButton ID="lbtnUp" runat="server" Font-Underline="False" ForeColor="Red"
                                    OnClick="lbtnUp_Click">上一页</asp:LinkButton>
                                <asp:LinkButton ID="lbtnNext" runat="server" Font-Underline="False" ForeColor="Red"
                                    OnClick="lbtnNext_Click">下一页</asp:LinkButton>
                                <asp:LinkButton ID="lbtnBack" runat="server" Font-Underline="False" ForeColor="Red"
                                    OnClick="lbtnBack_Click">最后一页</asp:LinkButton>
                                </td>
                        </tr>
                    </table>
                     </td>
                      </tr>
                    </table></td>
                  <td width="39">&nbsp;</td>
                </tr>
                <tr>
                  <td height="13" colspan="3">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="6" valign="top" background="../images/dibuzhong.gif"></td>
          </tr>
        </table>  
</asp:Content>

