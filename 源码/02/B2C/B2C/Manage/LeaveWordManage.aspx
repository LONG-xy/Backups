<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manage/admin.master" CodeFile="LeaveWordManage.aspx.cs" Inherits="Manage_LeaveWordManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>留言管理</title>
    <style>
        th,td {
            text-align:center;
        }
        h3 {
            margin-bottom:30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>留言管理</h3>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            </div>
        <div class="col-sm-8 col-md-8">
             <asp:DataList ID="dlManage" runat="server" OnItemCommand="dlManage_ItemCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="50%">
                <ItemTemplate>
                    <table>
                        <tr height="30">
                            <td style="width: 80px">
                                <span style="font-size: 9pt">留言主题:</span>
                            </td>
                            <td colspan="2" style="width: 382px; text-align: left">
                                <%#DataBinder.Eval(Container,"DataItem.Subject") %>
                            </td>
                        </tr>
                        <tr height="30">
                            <td>留 言 人:</td>
                            <td colspan="2" style="width: 382px; text-align: left">
                                <%#DataBinder.Eval(Container,"DataItem.Uid") %>
                            </td>
                        </tr>
                        <tr height="30">
                            <td>
                                <span style="font-size: 9pt">留言时间:</span>
                            </td>
                            <td colspan="2" style="width: 382px; text-align: left">
                                <%#DataBinder.Eval(Container,"DataItem.DateTime") %>
                            </td>
                        </tr>
                        <tr height="30">
                            <td>
                                <span style="font-size: 9pt">留言内容:</span>
                            </td>
                            <td colspan="2" rowspan="2" style="width: 382px; text-align: left">
                                <%#DataBinder.Eval(Container,"DataItem.Content") %>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr height="30">
                            <td>
                            </td>
                            <td colspan="2" style="font-size: 9pt; width: 382px; text-align: right">
                                <a href='LeaveWordBack.aspx?ID=<%#DataBinder.Eval(Container,"DataItem.ID")%>&menu=12' style="color: #0000ff;
                                    text-decoration: none"><span style="color: #000000">回复留言</span></a> <a href='ShowWord.aspx?ID=<%#DataBinder.Eval(Container,"DataItem.ID") %>&menu=12'
                                        style="font-size: 9pt; color: #0000ff; text-decoration: none"><span style="color: #000000">
                                            查看回复</span></a> <asp:LinkButton ID="lnkbtnDelete" runat="server" CommandName="delete" CommandArgument =<%#DataBinder.Eval(Container,"DataItem.ID") %>
                                                Font-Size="9pt" Font-Underline="False" ForeColor="Black">删除留言</asp:LinkButton>
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
        </div>
        <div class="col-sm-2 col-md-2">
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            </div>
        <div class="col-sm-8 col-md-8">
              <span style="font-size: 9pt">共有</span>
              <asp:Label ID="labCount" runat="server" Font-Size="9pt" ForeColor="Red"></asp:Label>
              <span style="font-size: 9pt; vertical-align: bottom;text-align: center">页</span>            
              <span style="font-size: 9pt">当前第</span>
              <asp:Label ID="labNowPage" runat="server" Font-Size="9pt" ForeColor="Red">1</asp:Label>
              <span style="font-size: 9pt; vertical-align: bottom;text-align: center">页</span>
              <asp:LinkButton ID="lnkbtnTop" runat="server" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnTop_Click">首页</asp:LinkButton>
              <asp:LinkButton ID="lnkbtnPrve" runat="server" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnPrve_Click">上一页</asp:LinkButton>
              <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>
              <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Overline="False" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnLast_Click">尾页</asp:LinkButton>
        </div>
        <div class="col-sm-2 col-md-2">
            </div>
    </div>
</asp:Content>