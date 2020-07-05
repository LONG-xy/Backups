<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMasterPage.master" AutoEventWireup="true" CodeFile="BookManage.aspx.cs" Inherits="BookManage_BookManage" Title="Untitled Page" EnableEventValidation="false"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .s1 {
            background-image:url('../images/danganguanli.gif');
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="custom-col-content-img-s s1">
                <img src="../images/tianjia tubiao.gif" width="19" height="18">
                <asp:HyperLink ID="hpLinkAddBook" runat="server" NavigateUrl="~/BookManage/AddBook.aspx" ForeColor="Black">添加图书信息</asp:HyperLink>
            </div>        
            <div class="custom-col-content-s">
                <div class="custom-col-content-s-list">
                    <asp:GridView ID="gvBookInfo" runat="server" AllowPaging="True" PageSize="5" AutoGenerateColumns="False" Font-Size="9pt" OnPageIndexChanging="gvBookInfo_PageIndexChanging" OnRowDeleting="gvBookInfo_RowDeleting"  Width="90%" HorizontalAlign="Center" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle HorizontalAlign="Center" Height="28px" />
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Height="30px" />
                        <Columns>
                            <asp:BoundField DataField="bookcode" HeaderText="条形码" ReadOnly="True" />
                            <asp:BoundField DataField="bookname" HeaderText="图书名称" />
                            <asp:BoundField DataField="type" HeaderText="图书类型" />
                            <asp:BoundField DataField="pubname" HeaderText="出版社" />
                            <asp:BoundField DataField="bcase" HeaderText="书架" />
                            <asp:BoundField DataField="storage" HeaderText="库存总数" />
                            <asp:HyperLinkField DataNavigateUrlFormatString="AddBook.aspx?bookcode={0}" HeaderText="详情"
                                Text="详情" DataNavigateUrlFields="bookcode" >
                                <ControlStyle ForeColor="Black" />
                                <ItemStyle ForeColor="Black" />
                                <HeaderStyle ForeColor="white" />
                            </asp:HyperLinkField>
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" >
                                <HeaderStyle ForeColor="white" />
                                <ItemStyle ForeColor="Black" />
                                <ControlStyle ForeColor="Black" />
                            </asp:CommandField>
                        </Columns>
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                </div>
            </div>
            <div class="custom-col-foot-bg-s"></div>
        </div>
    </div>
</asp:Content>

