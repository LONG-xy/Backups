<%@ Page Language="C#" MasterPageFile="~/Common/MasterPage.master" AutoEventWireup="true" CodeFile="Sort.aspx.cs" Inherits="User_Sort" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="505" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="30" background="../images/chanpinxinxi.gif">&nbsp;</td>
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
    <asp:DataList ID="dlInfo" runat="server" Width="466px" OnUpdateCommand="dlInfo_UpdateCommand">
        <ItemTemplate>
            <table style="width: 466px">
                                <tr>
                                    <td style="width: 63px">
                                        <span style="font-size: 9pt"><asp:Label ID="Label1" runat="server" Text="产品名称："></asp:Label></span></td>
                                    <td>
                                        <asp:Label ID="labName" runat="server" Font-Size="9pt" ><%# DataBinder.Eval(Container.DataItem,"Name") %></asp:Label></td>
                                    <td rowspan="8" style="text-align: center;">
                                        <asp:Image ID="ImgSoft" runat="server" Height="188px" Width="252px" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"Photo") %>'/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 63px">
                                        <span style="font-size: 9pt"><asp:Label ID="Label2" runat="server" Text="产品版本："></asp:Label></span></td>
                                    <td>
                                        <asp:Label ID="labEdition" runat="server" Font-Size="9pt"><%# DataBinder.Eval(Container.DataItem,"Edition") %></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 63px">
                                        <span style="font-size: 9pt"><asp:Label ID="Label3" runat="server" Text="运行环境："></asp:Label></span></td>
                                    <td>
                                        <asp:Label ID="labEnvironment" runat="server" Font-Size="9pt"><%# DataBinder.Eval(Container.DataItem,"Environment") %></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 63px">
                                        <span style="font-size: 9pt"><asp:Label ID="Label4" runat="server" Text="产品价格："></asp:Label></span></td>
                                    <td>
                                        <asp:Label ID="labPrice" runat="server" Font-Size="9pt"><%# Convert.ToInt32(DataBinder.Eval(Container.DataItem, "Price")).ToString("￥#,###.00")%></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 63px">
                                        <span style="font-size: 9pt"><asp:Label ID="Label5" runat="server" Text="推荐指数："></asp:Label></span></td>
                                    <td style="font-size: 9pt;">
                                        <asp:Label ID="labCommend" runat="server" Font-Size="9pt"><%# DataBinder.Eval(Container.DataItem,"Commend") %></asp:Label>星级</td>
                                </tr>
                                <tr>
                                    <td style="width: 63px">
                                        <span style="font-size: 9pt"><asp:Label ID="Label6" runat="server" Text="产品类别："></asp:Label></span></td>
                                    <td>
                                        <asp:Label ID="labType" runat="server" Font-Size="9pt"><%# DataBinder.Eval(Container.DataItem,"Type") %></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 63px">
                                        <span style="font-size: 9pt"><asp:Label ID="Label7" runat="server" Text="文件大小："></asp:Label></span></td>
                                    <td style="font-size: 9pt;">
                                        <asp:Label ID="labSize" runat="server" Font-Size="9pt"><%# DataBinder.Eval(Container.DataItem,"FileSize") %></asp:Label>KB</td>
                                </tr>
                                <tr>
                                    <td style="width: 63px">
                                        <span style="font-size: 9pt"><asp:Label ID="Label8" runat="server" Text="下载次数："></asp:Label></span></td>
                                    <td>
                                        <asp:Label ID="labLoadNum" runat="server" Font-Size="9pt"><%# DataBinder.Eval(Container.DataItem,"LoadNum") %></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 63px">
                                        <span style="font-size: 9pt"><asp:Label ID="Label9" runat="server" Text="上传时间："></asp:Label></span></td>
                                    <td>
                                        <asp:Label ID="labTime" runat="server" Font-Size="9pt"><%# DataBinder.Eval(Container.DataItem,"UpTime") %></asp:Label></td>
                                    <td>
                                       </td>
                                </tr>
                                <tr>
                                    <td style="width: 63px">
                                        <span style="font-size: 9pt"><asp:Label ID="Label10" runat="server" Text="其他说明："></asp:Label></span></td>
                                    <td colspan="2">
                                        <asp:Label ID="labIntroduce" runat="server" Font-Size="9pt" Height="49px"
                                            Width="372px"><%# DataBinder.Eval(Container.DataItem,"Introduce") %></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="width: 63px">
                                        <span style="font-size: 9pt"><asp:Label ID="Label11" runat="server" Text="点击下载："></asp:Label></span></td>
                                    <td>
                                        <asp:LinkButton ID="lbtnDownload" runat="server" CommandName="Update" Font-Size="9pt"
                                            ToolTip="点击下载">点击下载</asp:LinkButton></td>
                                    <td>
                                        </td>
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
                    </table></td>
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

