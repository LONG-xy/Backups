<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMasterPage.master" AutoEventWireup="true" CodeFile="ReaderBorrowSort.aspx.cs" Inherits="SortManage_ReaderBorrowSort" Title="Untitled Page" EnableEventValidation="false"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .s1 {
            background-image:url('../images/zu zhe pai hang.gif');
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
                    <asp:GridView ID="gvReaderSort" runat="server" AutoGenerateColumns="False"
                        CellPadding="4" Font-Size="9pt" ForeColor="Black" HorizontalAlign="Center" Width="678px" OnRowDataBound="gvReaderSort_RowDataBound" AllowPaging="True" OnPageIndexChanging="gvReaderSort_PageIndexChanging" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
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
                        <RowStyle Height="30px" />
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

