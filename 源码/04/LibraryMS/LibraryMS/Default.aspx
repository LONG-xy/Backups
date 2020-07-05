<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .s1 {
            background-image:url('../images/tu shu pai hang.gif');
        }
        .s2 {
            background-image:url('../images/zu zhe pai hang.gif');
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="custom-col-content-img-s s1">
                <asp:HyperLink ID="hpLinkBookSort" runat="server" NavigateUrl="~/SortManage/BookBorrowSort.aspx" ImageUrl="~/images/more.gif"></asp:HyperLink>
            </div>
            <div class="custom-col-content-s">
                <div class="custom-col-content-s-list">
                    <asp:GridView ID="gvBookSort" runat="server" AutoGenerateColumns="False" Font-Size="9pt" HorizontalAlign="Center"
                        PageSize="5" Width="90%" OnRowDataBound="gvBookSort_RowDataBound" BackColor="White" BorderColor="#CCCCCC" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField HeaderText="排名" />
                            <asp:BoundField DataField="bookcode" HeaderText="图书条形码" ReadOnly="True" />
                            <asp:BoundField DataField="bookname" HeaderText="图书名称" />
                            <asp:BoundField DataField="type" HeaderText="图书类型" />
                            <asp:BoundField DataField="bcase" HeaderText="书架" />
                            <asp:BoundField DataField="pubname" HeaderText="出版社" />
                            <asp:BoundField DataField="author" HeaderText="作者" />
                            <asp:BoundField DataField="price" HeaderText="定价" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Height="30px" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle HorizontalAlign="Center" Height="28px" />
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
    <div class="row">
        <div class="col-md-12">
            <div class="custom-col-content-img-s s2">
                <asp:HyperLink ID="hpLinkReaderSort" runat="server" NavigateUrl="~/SortManage/ReaderBorrowSort.aspx" ImageUrl="~/images/more.gif"></asp:HyperLink>
            </div>
            <div class="custom-col-content-s">
                <div class="custom-col-content-s-list">
                    <asp:GridView ID="gvReaderSort" runat="server" AutoGenerateColumns="False" Font-Size="9pt" HorizontalAlign="Center"
                        PageSize="5" Width="678px" OnRowDataBound="gvReaderSort_RowDataBound" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField HeaderText="排名" />
                            <asp:BoundField DataField="id" HeaderText="读者编号" />
                            <asp:BoundField DataField="name" HeaderText="读者姓名" />
                            <asp:BoundField DataField="type" HeaderText="读者类型" />
                            <asp:BoundField DataField="paperType" HeaderText="证件类型" />
                            <asp:BoundField DataField="paperNum" HeaderText="证件号码" />
                            <asp:BoundField DataField="tel" HeaderText="电话" />
                            <asp:BoundField DataField="sex" HeaderText="性别" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Height="30px" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle HorizontalAlign="Center" Height="28px" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                </div>
                <div class="custom-col-foot-bg-s"></div>
            </div>
        </div>
    </div>
</asp:Content>

