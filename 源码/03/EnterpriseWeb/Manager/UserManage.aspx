<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manager/MasterPage.master" CodeFile="UserManage.aspx.cs" Inherits="Manager_UserManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h3>用户信息管理</h3>
    <div class="panel-body">
        <div class="gv-search">
            <asp:TextBox ID="txtCondition" runat="server" CssClass="form-control1 form-control1-line" Width="200" placeholder="请输入要查询的名称"></asp:TextBox>
            <asp:Button ID="btnQuery" runat="server" OnClick="btnQuery_Click" Text="查询" CssClass="form-control1 form-control1-line"  Width="100"/>
        </div>
        <asp:GridView ID="gvUserInfo" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" Font-Size="9pt" ForeColor="#333333" 
            GridLines="None" PageSize="15" OnPageIndexChanging="gvUserInfo_PageIndexChanging" OnRowDeleting="gvUserInfo_RowDeleting" OnRowCommand="gvUserInfo_RowCommand" 
            HorizontalAlign="Center" Width="80%">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="名称" ReadOnly="True" />
                <asp:BoundField DataField="Pwd" HeaderText="密码" />
                <asp:ImageField DataImageUrlField="Photo" HeaderText="头像" ReadOnly="True">
                </asp:ImageField>
                <asp:BoundField DataField="Sex" HeaderText="性别" ReadOnly="True" />
                <asp:BoundField DataField="Age" HeaderText="年龄" ReadOnly="True" />
                <asp:BoundField DataField="Tel" HeaderText="电话" ReadOnly="True" />
                <asp:ButtonField CommandName="Update" HeaderText="详情" Text="详情" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>
            <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" Height="30px" />
            <EditRowStyle BackColor="#7C6F57" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#1C5E55" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Height="40px" HorizontalAlign="Center" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </div>
</asp:Content>