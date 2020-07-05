<%@ Page Language="C#" MasterPageFile="~/Common/MasterPage.master" AutoEventWireup="true" CodeFile="CallBoardAndNews.aspx.cs" Inherits="User_CallBoardAndNews" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="505" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" background="../images/gonggaojixinwenxinxi.gif">&nbsp;</td>
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
                              <td width="63" class="wenzi3">
                                  <asp:Label ID="labPageTitle" runat="server" Font-Size="10pt"></asp:Label></td>
                              <td width="349">&nbsp;</td>
                            </tr>
                          </table></td>
                          </tr>
                        <tr>
                          <td valign="top" bordercolor="#999999" bgcolor="#FFFFFF" class="wenzi2">
                          <br />
                             <asp:DataList ID="dlCallBoard" runat="server" RepeatColumns="1" RepeatDirection="vertical" Width="419px">
                <ItemTemplate>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="CNInfo.aspx?CBoardID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"
                                            style="font-size: 9pt;text-decoration:none; color:Black;">
                                            <%#DataBinder.Eval(Container.DataItem, "Title")%>
                                            </a>
                </ItemTemplate>
            </asp:DataList><br /></td>
                          </tr>
                        
                      </table></td>
                    </tr>
                  </table><table cellpadding="0" cellspacing="0" style="width: 433px; height: 28px;">
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
                                &nbsp; &nbsp;</td>
                        </tr>
                    </table>
                          <br />
                    </td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="6" valign="top" background="../images/dibuzhong.gif"></td>
          </tr>
        </table>
            
</asp:Content>

