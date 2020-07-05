<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manager/MasterPage.master" CodeFile="LWordManage.aspx.cs" Inherits="Manager_LWordManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>留言簿信息管理</h3>
    <div class="panel-body">
        <div class="gv-search">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control1" placeholder="请输入名称" Width="200"></asp:TextBox>
            <asp:Button ID="btnFind" runat="server" OnClick="btnFind_Click" Text="查找" CssClass="form-control1" Width="100"/>
        </div>
        <asp:GridView ID="gvLWordInfo" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="gvLWordInfo_PageIndexChanging"
            OnRowDeleting="gvLWordInfo_RowDeleting" OnRowCommand="gvLWordInfo_RowCommand" Font-Size="9pt" HorizontalAlign="Center" Width="80%">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="留言编号" />
                <asp:BoundField DataField="Title" HeaderText="留言标题" />
                <asp:BoundField DataField="LeaveTime" HeaderText="留言时间" />
                <asp:BoundField DataField="Host" HeaderText="留言人" />
                <asp:ButtonField CommandName="Update" HeaderText="详情" Text="详情" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>
            <RowStyle BackColor="#E3EAEB" Height="30px" HorizontalAlign="Center" />
            <EditRowStyle BackColor="#7C6F57" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#1C5E55" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Height="40px" HorizontalAlign="Center" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </div>
</asp:Content>