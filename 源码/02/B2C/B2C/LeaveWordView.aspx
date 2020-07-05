<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LeaveWordView.aspx.cs" Inherits="LeaveWordView"Title="查看回复" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 custom-body-main-content-list">
            <h4><a>回复留言</a></h4>
            <asp:DataList ID="DataList1" runat="server" OnDeleteCommand="DataList1_DeleteCommand" Width="99%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td style="width: 148px">
                                                回 复 人</td>
                                            <td colspan="2" style="width: 382px; text-align: left">
                                            <%#DataBinder.Eval(Container,"DataItem.UName") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 148px">
                                                <span style="font-size: 9pt">回复时间</span></td>
                                            <td colspan="2" style="width: 382px; text-align: left">
                                            <%#DataBinder.Eval(Container,"DataItem.DateTime") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 148px">
                                                <span style="font-size: 9pt">回复内容</span></td>
                                            <td colspan="2" rowspan="2" style="width: 382px; text-align: left">
                                            <%#DataBinder.Eval(Container,"DataItem.Content") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 148px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 148px">
                                            </td>
                                            <td colspan="2" rowspan="1" style="width: 382px; text-align: right">
                                           
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="delete" Font-Underline="False">删除回复</asp:LinkButton>&nbsp;
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
                 <span style="font-size: 9pt">共有</span>
                 <asp:Label ID="labCount" runat="server" Font-Size="9pt" ForeColor="#FF3300"></asp:Label>
                 <span style="font-size:9pt;vertical-align:bottom;text-align:center">页</span>
                 <span style="font-size: 9pt">当前第</span>
                 <asp:Label ID="labNowPage" runat="server" Font-Size="9pt" ForeColor="Red">1</asp:Label>
                 <span style="font-size: 9pt;vertical-align:bottom;text-align:center">页</span>
                 <asp:LinkButton ID="lnkbtnTop" runat="server" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnTop_Click">首页</asp:LinkButton>
                 <asp:LinkButton ID="lnkbtnPrve" runat="server" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnPrve_Click">上一页</asp:LinkButton>
                 <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>
                 <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Overline="False" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnLast_Click">尾页</asp:LinkButton>
            </p>
            <p><asp:Button ID="btnBack" runat="server" Text="返回" OnClick="btnBack_Click" CssClass="form-control btn-info" Width="80"/></p>
        </div>
    </div>
</asp:Content>