<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="manage_grUser.aspx.cs" Inherits="Manage_manage_grUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <h2 class="title">普通用户管理</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            &nbsp;
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:GridView ID="gvGrUser" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvGrUser_RowDataBound" OnRowDeleting="gvGrUser_RowDeleting" 
                                OnSelectedIndexChanging="gvGrUser_SelectedIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="90%" CssClass="grid">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField HeaderText="用户名" DataField="Name" />
                                    <asp:BoundField DataField="Linkman" HeaderText="联系人" />
                                    <asp:BoundField HeaderText="状态" DataField="Lock" />
                                    <asp:BoundField DataField="Phone" HeaderText="联系电话" />
                                    <asp:BoundField DataField="Address" HeaderText="所在地址" />
                                    <asp:CommandField HeaderText="操作" SelectText="锁定/解锁" ShowSelectButton="True" />
                                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Height="40px" HorizontalAlign="Center" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" Height="30px" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>