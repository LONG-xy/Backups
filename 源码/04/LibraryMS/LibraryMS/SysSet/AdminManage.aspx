<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMasterPage.master" AutoEventWireup="true" CodeFile="AdminManage.aspx.cs" Inherits="SysSet_AdminManage" Title="Untitled Page" EnableEventValidation="false"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .s1 {
            background-image:url('../images/guanliyuanshezhi.gif');
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="custom-col-content-img-s s1">
                <img src="../images/tianjia tubiao.gif" width="19" height="18">
                <asp:HyperLink ID="hpLinkAddAdmin" runat="server" NavigateUrl="~/SysSet/AddAdmin.aspx" ForeColor="Black">添加管理员</asp:HyperLink>
            </div>        
            <div class="custom-col-content-s">
                <div class="custom-col-content-s-list">
                    <asp:GridView ID="gvAdminPurview" runat="server" AllowPaging="True" CellPadding="4" ForeColor="Black" PageSize="5" AutoGenerateColumns="False" Font-Size="9pt" 
                        OnPageIndexChanging="gvAdminPurview_PageIndexChanging" OnRowCancelingEdit="gvAdminPurview_RowCancelingEdit" OnRowDeleting="gvAdminPurview_RowDeleting" 
                        OnRowEditing="gvAdminPurview_RowEditing" OnRowUpdating="gvAdminPurview_RowUpdating" Width="90%" HorizontalAlign="Center"
                        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Height="30px" />
                        <Columns>
                            <asp:BoundField DataField="name" HeaderText="管理员名称" ReadOnly="True" />
                            <asp:CheckBoxField DataField="sysset" HeaderText="系统设置" />
                            <asp:CheckBoxField DataField="readset" HeaderText="读者管理" />
                            <asp:CheckBoxField DataField="bookset" HeaderText="图书管理" />
                            <asp:CheckBoxField DataField="borrowback" HeaderText="图书借还" />
                            <asp:CheckBoxField DataField="sysquery" HeaderText="系统查询" />
                            <asp:CommandField EditText="权限设置" HeaderText="权限设置" ShowEditButton="True" UpdateText="设置" />
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                        </Columns>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle Height="28px" HorizontalAlign="Center"/>
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

