<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="goodsList.aspx.cs" Inherits="goodsList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 custom-body-main-content-list">
            <h4><a><asp:Label ID="labTitle" runat="server" Text="Label"></asp:Label></a></h4>
            <asp:DataList ID="dLGoodsList" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="dLGoodsList_ItemCommand" CellPadding="4" ForeColor="#333333">
                <ItemTemplate>
                    <table style="vertical-align:top;height:120px;">
                        <tr>
                            <td rowspan="5" style="width: 29px">
                                <asp:Image ID="imageIcon" runat="server" ImageUrl=<%#DataBinder.Eval(Container.DataItem,"BookUrl")%>/>
                            </td>
                            <td colspan="2">
                            <asp:LinkButton ID="lnkbtnName" runat="server" CommandName="detailSee"  Font-Underline=false  CommandArgument =<%#DataBinder.Eval(Container.DataItem, "BookID")%>>
                            <%#DataBinder.Eval(Container.DataItem, "BookName")%>
                            </asp:LinkButton>
                            </td>
                                
                        </tr>
                        <tr>
                            <td>
                                市场价：
                            </td>
                            <td>
                                <%#GetVarMKP(DataBinder.Eval(Container.DataItem, "MarketPrice").ToString())%>￥
                            </td>
                        </tr>
                        <tr>
                            <td>
                                热卖价：</td>
                            <td>
                                <%#GetVarHot(DataBinder.Eval(Container.DataItem, "HotPrice").ToString())%>￥
                            </td>
                        </tr>
                            <tr>
                            <td colspan="2">
                                <asp:ImageButton ID="imagebtnBuy" runat="server" CommandName="buy" CommandArgument =<%#DataBinder.Eval(Container.DataItem, "BookID")%> ImageUrl="~/images/购买.jpg" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <AlternatingItemStyle BackColor="White" />
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <ItemStyle BackColor="#EFF3FB" CssClass="custo-left50"/>
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <asp:Label ID="labCP" runat="server" Text="当前为第"></asp:Label><asp:Label ID="labPage" runat="server" Text="1"></asp:Label>页，
            <asp:Label ID="labTP" runat="server" Text="共"></asp:Label><asp:Label ID="labBackPage" runat="server"></asp:Label>页，
            <asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnOne_Click">第一页</asp:LinkButton>
            <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnUp_Click">上一页</asp:LinkButton> 
            <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
            <asp:LinkButton ID="lnkbtnBack" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnBack_Click">最后一页</asp:LinkButton> &nbsp; &nbsp;
        </div>
    </div>
</asp:Content>