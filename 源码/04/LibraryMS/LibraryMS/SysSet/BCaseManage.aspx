<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMasterPage.master" AutoEventWireup="true" CodeFile="BCaseManage.aspx.cs" Inherits="SysSet_BCaseManage" Title="Untitled Page" EnableEventValidation="false"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .s1 {
            background-image:url('../images/shujiaguanli.gif');
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="custom-col-content-img-s s1">
                <img src="../images/tianjia tubiao.gif" width="19" height="18">
                <asp:HyperLink ID="hpLinkAddBCase" runat="server" NavigateUrl="~/SysSet/AddBCase.aspx" ForeColor="Black">添加书架信息</asp:HyperLink>
            </div>        
            <div class="custom-col-content-s">
                <div class="custom-col-content-s-list">
                    <asp:GridView ID="gvBCaseInfo" runat="server" AllowPaging="True" CellPadding="4" ForeColor="Black" PageSize="5" AutoGenerateColumns="False" Font-Size="9pt" OnPageIndexChanging="gvBCaseInfo_PageIndexChanging" OnRowCancelingEdit="gvBCaseInfo_RowCancelingEdit" OnRowDeleting="gvBCaseInfo_RowDeleting" OnRowEditing="gvBCaseInfo_RowEditing" OnRowUpdating="gvBCaseInfo_RowUpdating" Width="90%" HorizontalAlign="Center" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal" CssClass="custom-list-control">
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Height="30px" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="书架编号" ReadOnly="True" />
                            <asp:BoundField DataField="name" HeaderText="书架名称" />
                            <asp:CommandField EditText="修改" HeaderText="修改" ShowEditButton="True" />
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                        </Columns>
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

