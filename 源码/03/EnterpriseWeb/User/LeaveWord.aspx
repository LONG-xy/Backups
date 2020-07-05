<%@ Page Language="C#" MasterPageFile="~/Common/MasterPage.master" AutoEventWireup="true" CodeFile="LeaveWord.aspx.cs" Inherits="User_LeaveWord" Title="Untitled Page" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="505" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" background="../images/liuyanbu.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="660" valign="top" background="../images/chanpin2.gif"><label></label>
              <table width="505" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td colspan="3" style="height: 20px">&nbsp;</td>
                </tr>
                <tr>
                  <td width="27" height="610">&nbsp;</td>
                  <td width="439" align="center" valign="top"><table width="425" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="425" align="left" valign="top"><table width="424" border="0" cellpadding="0" cellspacing="1" bordercolor="#666666" bgcolor="#D2E5F3">
                        <tr>
                          <td height="24" align="left" valign="top" bgcolor="#EAF4FC" class="wenzi2"><label></label>                            <table width="425" height="24" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                              <td width="13" valign="top">&nbsp;</td>
                              <td width="63" class="wenzi3">留言主题</td>
                              <td width="349">&nbsp;</td>
                            </tr>
                          </table></td>
                          </tr>
                        <tr>
                          <td valign="top" bordercolor="#999999" bgcolor="#FFFFFF" class="wenzi2">
                          <br /><asp:DataList ID="dlLeaveWord" runat="server" RepeatColumns="1" RepeatDirection="vertical" Width="480px">
                <ItemTemplate>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp<a href="LWordInfo.aspx?LWordID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"
                                            style="font-size: 9pt;text-decoration:none; color:Black;">
                                            <%#DataBinder.Eval(Container.DataItem, "Title")%>
                                            </a>
                </ItemTemplate>
            </asp:DataList>                            
                            </td>
                          </tr>
                        
                      </table></td>
                    </tr>
                  </table><br />
                    <table width="424" height="375" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="31" colspan="2" class="wenzi2">留言主题：</td>
                        <td height="31" style="width: 384px"><asp:TextBox ID="txtTitle" runat="server" Width="398px"></asp:TextBox></td>
                        <td height="31" style="width: 7px"><label></label></td>
                        </tr>
                      <tr>
                        <td height="20" colspan="4" class="wenzi2" style="text-align: left">&nbsp;&nbsp;留言内容：</td>
                        </tr>
                      <tr>
                        <td height="270" colspan="4" align="left" valign="top">
                        <FTB:FreeTextBox id="FreeTextBox1" runat="Server" Language="zh-cn"  SupportFolder="../aspnet_client/FreeTextBox/" Height="190px" Width="480px" HtmlModeDefaultsToMonoSpaceFont="True" DownLevelCols="50" DownLevelRows="10" ButtonDownImage="False" GutterBackColor="LightSteelBlue" ToolbarBackgroundImage="True" ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu|Bold,Italic,Underline,Strikethrough;Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage,InsertRule|Cut,Copy,Paste;Undo,Redo,Print" ToolbarStyleConfiguration="NotSet" />
                        </td>
                      </tr>
                      <tr>
                        <td width="13" height="34">&nbsp;</td>
                        <td align="left" valign="middle" style="width: 73px"><label>
                          <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="留言" />
                        </label></td>
                        <td align="left" style="width: 384px"><label>
                          <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="重置" />
                        </label></td>
                        <td style="width: 7px"><label></label></td>
                        </tr>
                      <tr>
                        <td>&nbsp;</td>
                          <td class="wenzi2" colspan="2">
                              &nbsp;<table cellpadding="0" cellspacing="0" style="width: 465px; height: 28px;">
                        <tr>
                            <td style="font-size: 9pt; width: 433px; text-align: right; height: 30px;">
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
                        <td style="width: 7px">&nbsp;</td>
                      </tr>
                    </table></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="6" valign="top" background="../images/dibuzhong.gif"></td>
          </tr>
        </table>
</asp:Content>

