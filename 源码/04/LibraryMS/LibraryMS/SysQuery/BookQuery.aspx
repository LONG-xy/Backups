<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMasterPage.master" AutoEventWireup="true" CodeFile="BookQuery.aspx.cs" Inherits="SysQuery_BookQuery" Title="Untitled Page" EnableEventValidation="false"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .s1 {
            background-image:url('../images/tushudanganchaxun.gif');
        }
        .custom-search {
            padding-left:20px;
            margin-bottom:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="custom-col-content-img-s s1">
            </div>        
            <div class="custom-col-content-s">
                <div class="custom-col-content-s-list">
                    <div class="custom-search">
                        <img src="../images/chaxun tubiao.gif" width="32" height="27">请选择查询条件：
                         <asp:DropDownList ID="ddlCondition" runat="server" Width="96px" CssClass="form-control custom-txt">
                            <asp:ListItem>条形码</asp:ListItem>
                            <asp:ListItem>书名</asp:ListItem>
                            <asp:ListItem>类别</asp:ListItem>
                            <asp:ListItem>作者</asp:ListItem>
                            <asp:ListItem>出版社</asp:ListItem>
                            <asp:ListItem>书架</asp:ListItem>
                        </asp:DropDownList>&nbsp;
                        <asp:TextBox ID="txtCondition" runat="server" Width="137px" CssClass="form-control custom-txt"></asp:TextBox>&nbsp;
                        <asp:Button ID="btnQuery" runat="server" OnClick="btnQuery_Click" Text="查询" CssClass="form-control custom-btn" Width="80"/>
                    </div>
                    <div>
                        <asp:GridView ID="gvBookInfo" runat="server" AllowPaging="True" CellPadding="4" ForeColor="Black" PageSize="5" AutoGenerateColumns="False" Font-Size="9pt" OnPageIndexChanging="gvBookInfo_PageIndexChanging" Width="90%" HorizontalAlign="Center" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Height="30px" />
                            <Columns>
                                <asp:BoundField DataField="bookcode" HeaderText="条形码" ReadOnly="True" />
                                <asp:BoundField DataField="bookname" HeaderText="图书名称" />
                                <asp:BoundField DataField="type" HeaderText="图书类型" />
                                <asp:BoundField DataField="pubname" HeaderText="出版社" />
                                <asp:BoundField DataField="bcase" HeaderText="书架" />
                                <asp:BoundField DataField="storage" HeaderText="库存总数" />
                            </Columns>
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle Height="28px" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="custom-col-foot-bg-s"></div>
        </div>
    </div>
</asp:Content>

