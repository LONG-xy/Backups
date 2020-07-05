<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMasterPage.master" AutoEventWireup="true" CodeFile="ReaderManage.aspx.cs" Inherits="ReaderManage_ReaderManage" Title="Untitled Page" EnableEventValidation="false"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .s1 {
            background-image:url('../images/duzhedanganguanli.gif');
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="custom-col-content-img-s s1">
                <img src="../images/tianjia tubiao.gif" width="19" height="18">
                <asp:HyperLink ID="hpLinkAddReader" runat="server" NavigateUrl="~/ReaderManage/AddReader.aspx" ForeColor="Black">添加读者信息</asp:HyperLink>
            </div>        
            <div class="custom-col-content-s">
                <div class="custom-col-content-s-list">
                    <asp:GridView ID="gvReaderInfo" runat="server" AllowPaging="True" CellPadding="4" ForeColor="Black" PageSize="5" AutoGenerateColumns="False" Font-Size="9pt" OnPageIndexChanging="gvReaderInfo_PageIndexChanging" OnRowDeleting="gvReaderInfo_RowDeleting"  Width="90%" HorizontalAlign="Center" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Height="30px" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="读者编号" ReadOnly="True" />
                            <asp:BoundField DataField="name" HeaderText="姓名" />
                            <asp:BoundField DataField="type" HeaderText="读者类型" />
                            <asp:BoundField DataField="paperType" HeaderText="证件类型" />
                            <asp:BoundField DataField="paperNum" HeaderText="证件号码" />
                            <asp:BoundField DataField="tel" HeaderText="电话" />
                            <asp:BoundField DataField="email" HeaderText="Email" />
                            <asp:HyperLinkField DataNavigateUrlFormatString="AddReader.aspx?readerid={0}" HeaderText="详情"
                                Text="详情" DataNavigateUrlFields="id" >
                                <ControlStyle ForeColor="Black" />
                                <ItemStyle ForeColor="Black" />
                                <HeaderStyle ForeColor="White" />
                            </asp:HyperLinkField>
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
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
            <div class="custom-col-foot-bg-s"></div>
        </div>
    </div>
</asp:Content>

