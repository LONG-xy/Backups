<%@ Page Language="C#" MasterPageFile="~/Common/MasterPage.master" AutoEventWireup="true" CodeFile="EngageInfo.aspx.cs" Inherits="User_EngageInfo" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="505" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" background="../images/zhaopinxinxi.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="661" valign="top" background="../images/chanpin2.gif"><label></label>
              <table width="505" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td colspan="3" style="height: 32px">&nbsp;</td>
                </tr>
                <tr>
                  <td width="40" height="507">&nbsp;</td>
                  <td width="405" valign="top"><table width="405" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="503" valign="top">
                          <asp:DataList ID="dlInfo" runat="server" Width="483px">
        <ItemTemplate>
            <table>
                                <tr>
                                    <td>
                                        <span style="font-size: 9pt">招聘职位：</span></td>
                                    <td style="font-size: 9pt;">
                                        <%# DataBinder.Eval(Container.DataItem,"EPosition") %></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span style="font-size: 9pt">职位描述：</span></td>
                                    <td style="font-size: 9pt;">
                                        <%# DataBinder.Eval(Container.DataItem,"PIntroduce") %></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span style="font-size: 9pt">职位要求：</span></td>
                                    <td style="font-size: 9pt;">
                                        <%# DataBinder.Eval(Container.DataItem,"PRequest") %></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span style="font-size: 9pt">工作部门：</span></td>
                                    <td style="font-size: 9pt;">
                                        <%# DataBinder.Eval(Container.DataItem,"Department") %></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span style="font-size: 9pt">工作地点：</span></td>
                                    <td style="font-size: 9pt;">
                                        <%# DataBinder.Eval(Container.DataItem,"Place") %></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span style="font-size: 9pt">要求学历：</span></td>
                                    <td style="font-size: 9pt;">
                                        <%# DataBinder.Eval(Container.DataItem,"SchoolAge") %></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span style="font-size: 9pt">人    数：</span></td>
                                    <td style="font-size: 9pt;">
                                        <%# DataBinder.Eval(Container.DataItem,"Num") %></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span style="font-size: 9pt">发布日期：</span></td>
                                    <td style="font-size: 9pt;">
                                        <%# DataBinder.Eval(Container.DataItem,"PutTime") %></td>
                                </tr>
                                <tr>
                                    <td>
                                        <span style="font-size: 9pt">联系邮件：</span></td>
                                    <td style="font-size: 9pt;">
                                        <%# DataBinder.Eval(Container.DataItem,"Email") %></td>
                                </tr>
                            </table><br />
        </ItemTemplate>
    </asp:DataList>
    <table cellpadding="0" cellspacing="0" style="width: 433px; height: 28px;">
                        <tr>
                            <td style="font-size: 9pt; width: 433px; text-align: right; height: 30px;">
                                <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>
                                <asp:Label ID="labPage" runat="server" Text="1"></asp:Label>
                                <asp:Label ID="Label6" runat="server" Text="总页码为："></asp:Label>
                                <asp:Label ID="labBackPage" runat="server"></asp:Label>
                                <asp:LinkButton ID="lbtnOne" runat="server" Font-Underline="False" ForeColor="Red"
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
</td>
                    </tr>
                  </table></td>
                  <td width="52">&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td height="6" valign="top" background="../images/dibuzhong.gif"></td>
          </tr>
        </table>
</asp:Content>

