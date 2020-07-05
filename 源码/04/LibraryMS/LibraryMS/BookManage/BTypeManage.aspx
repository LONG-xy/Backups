<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMasterPage.master" AutoEventWireup="true" CodeFile="BTypeManage.aspx.cs" Inherits="BookManage_BTypeManage" Title="Untitled Page" EnableEventValidation="false"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .s1 {
            background-image:url('../images/tushuleixingguanli.gif');
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="custom-col-content-img-s s1">
                <img src="../images/tianjia tubiao.gif" width="19" height="18">
                <asp:HyperLink ID="hpLinkAddBType" runat="server" NavigateUrl="~/BookManage/AddBType.aspx" ForeColor="Black">添加图书类型信息</asp:HyperLink>
            </div>        
            <div class="custom-col-content-s">
                <div class="custom-col-content-s-list">
                    <asp:GridView ID="gvBTypeInfo" runat="server" AllowPaging="True" CellPadding="4" ForeColor="Black" PageSize="5" AutoGenerateColumns="False" Font-Size="9pt" 
                        OnPageIndexChanging="gvBTypeInfo_PageIndexChanging" OnRowCancelingEdit="gvBTypeInfo_RowCancelingEdit" OnRowDeleting="gvBTypeInfo_RowDeleting" 
                        OnRowEditing="gvBTypeInfo_RowEditing" OnRowUpdating="gvBTypeInfo_RowUpdating" Width="90%" HorizontalAlign="Center" CssClass="custom-list-control" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Height="30px" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="图书类型编号" ReadOnly="True" />
                            <asp:BoundField DataField="typename" HeaderText="图书类型名称" />
                            <asp:BoundField DataField="days" HeaderText="可借天数" />
                            <asp:CommandField EditText="修改" HeaderText="修改" ShowEditButton="True" />
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

