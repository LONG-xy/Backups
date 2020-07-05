<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manage/admin.master" CodeFile="ShowWord.aspx.cs" Inherits="Manage_ShowWord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>查看回复</title>
    <style>
        th,td {
            text-align:center;
        }
        .custom-show-row {
            margin-top:10px;
        }
        .custom-control-cell {
            display:table-cell;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>查看回复</h3>
    <div class="row custom-show-row">
        <div class="col-sm-2 col-md-2 text-right">
            留言主题
        </div>
        <div class="col-sm-6 col-md-6">
                <%=ShowSubject %>
        </div>
        <div class="col-sm-3 col-md-3">

        </div>
    </div>  
    <div class="row custom-show-row">
        <div class="col-sm-2 col-md-2 text-right">
            留 言 人
        </div>
        <div class="col-sm-6 col-md-6">
                <%=ShowName %>
        </div>
        <div class="col-sm-3 col-md-3">

        </div>
    </div>  
    <div class="row custom-show-row">
        <div class="col-sm-2 col-md-2 text-right">
            留言时间
        </div>
        <div class="col-sm-6 col-md-6">
                <%=ShowTime %>
        </div>
        <div class="col-sm-3 col-md-3">

        </div>
    </div>  
    <div class="row custom-show-row">
        <div class="col-sm-2 col-md-2 text-right">
            留言内容
        </div>
        <div class="col-sm-6 col-md-6">
                <%=ShowContent %>
        </div>
        <div class="col-sm-3 col-md-3">

        </div>
    </div>  
    <div class="row custom-show-row">
        <div class="col-sm-2 col-md-2 text-right">                
        </div>
        <div class="col-sm-6 col-md-6">
            <asp:LinkButton ID="lnkbtnFeedBack" runat="server" OnClick="lnkbtnFeedBack_Click" Font-Underline="False">我要回复</asp:LinkButton>&nbsp;&nbsp;                
        </div>
        <div class="col-sm-3 col-md-3">                
        </div>
    </div>    
    <div class="row custom-show-row">
        <div class="col-sm-2 col-md-2">                 
        </div>
        <div class="col-sm-6 col-md-6">
            <asp:DataList ID="dlReplyWord" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="90%">
                <ItemTemplate>
                    <table>
                        <tr height="30">
                            <td style="width: 80px">
                                <span style="font-size: 9pt">回 复 人</span></td>
                            <td colspan="2" style="width: 382px; text-align: left">
                                <%#DataBinder.Eval(Container,"DataItem.UName") %>
                            </td>
                        </tr>
                        <tr height="30">
                            <td>
                                <span style="font-size: 9pt">回复时间</span></td>
                            <td colspan="2" style="width: 382px; text-align: left">
                                <%#DataBinder.Eval(Container,"DataItem.DateTime") %>
                            </td>
                        </tr>
                        <tr height="30">
                            <td>
                                <span style="font-size: 9pt">回复内容</span></td>
                            <td colspan="2" style="width: 382px; text-align: left">
                                <%#DataBinder.Eval(Container,"DataItem.Content") %>
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
    </div>
    <div class="row custom-show-row">
            <div class="col-sm-2 col-md-2">                 
            </div>
            <div class="col-sm-6 col-md-6">
                    <span style="font-size: 9pt">共有</span>
                    <asp:Label ID="labCount" runat="server" Font-Size="9pt" ForeColor="Red"></asp:Label>
                    <span style="font-size: 9pt; vertical-align: bottom;text-align: center">页</span>
                    <span style="font-size: 9pt">当前第</span><asp:Label ID="labNowPage" runat="server" Font-Size="9pt" ForeColor="Red">1</asp:Label>
                    <span style="font-size: 9pt; vertical-align: bottom;text-align: center">页</span>                                                                
                    <asp:LinkButton ID="lnkbtnTop" runat="server" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnTop_Click">首页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnPrve" runat="server" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnPrve_Click">上一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>
                    <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Overline="False" Font-Size="9pt" Font-Underline="False" ForeColor="Black" OnClick="lnkbtnLast_Click">尾页</asp:LinkButton>
            </div>   
        </div>
</asp:Content>