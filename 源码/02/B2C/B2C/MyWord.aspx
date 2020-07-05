<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyWord.aspx.cs" Inherits="MyWord" Title="我的留言" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 custom-body-main-content-list">
            <h4><a>我的留言</a></h4>
            <asp:DataList ID="dlMyWord" runat="server" OnDeleteCommand="dlMyWord_DeleteCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="99%" >
                <ItemTemplate>
                    <table style="font-size:9pt;">
                        <tr>
                            <td style="width: 80px"><span style="font-size: 9pt">留言主题</span></td>
                            <td colspan="2" style="width: 382px; text-align: left">
                                <%#DataBinder.Eval(Container,"DataItem.Subject") %>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size: 9pt">留 言 人</td>
                            <td colspan="2" style="width: 382px; text-align: left">
                                <%#DataBinder.Eval(Container,"DataItem.Uid") %>
                            </td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 9pt">留言时间</span></td>
                            <td colspan="2" style="width: 382px; text-align: left">
                                <%#DataBinder.Eval(Container,"DataItem.DateTime") %>
                            </td>
                        </tr>
                        <tr>
                            <td><span style="font-size: 9pt">留言内容</span></td>
                            <td colspan="2" rowspan="2" style="width: 382px; text-align:left;" valign =middle >
                                <%#DataBinder.Eval(Container,"DataItem.Content") %>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2" style="font-size: 9pt; width: 382px; text-align: right">
                                <a href='LeaveWordBack.aspx?ID=<%#DataBinder.Eval(Container,"DataItem.ID") %>'>
                                    <span class="btn-link">回复留言</span>
                                </a>
                                <a href='leaveWordView.aspx?ID=<%#DataBinder.Eval(Container,"DataItem.ID") %>'>
                                    <span class="btn-link">查看回复</span>
                                </a>
                                <asp:LinkButton ID="lnkbtnDelete" runat="server" CommandName="delete" CssClass="btn-link">删除留言</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <HeaderTemplate>
                    <span style="font-size: 16pt"></span>
                </HeaderTemplate>
                <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <p>
                <span style="font-size: 9pt">当前第</span>
                <asp:Label ID="labNowPage" runat="server" Font-Size="9pt" ForeColor="Red">1</asp:Label>
                <span style="font-size: 9pt; vertical-align: bottom;text-align: center">页</span>,
                <span style="font-size: 9pt">共</span>
                <asp:Label ID="labCount" runat="server" Font-Size="9pt" ForeColor="Red"></asp:Label>
                <span style="font-size: 9pt; vertical-align: bottom;text-align: center">页</span>
                <asp:LinkButton ID="lnkbtnTop" runat="server" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnTop_Click">首页</asp:LinkButton>
                <asp:LinkButton ID="lnkbtnPrve" runat="server" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnPrve_Click">上一页</asp:LinkButton>
                <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>
                <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Overline="False" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnLast_Click">尾页</asp:LinkButton>
            </p>
        </div>
    </div>
</asp:Content>
