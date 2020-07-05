<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/manage/MasterPage.master" CodeFile="manage_user.aspx.cs" Inherits="manage_manage_user" %>
<asp:Content  ContentPlaceHolderID="head" ID="HeadHoder" runat="server">
    <style>
        .grid {
            margin-top:10px;
            margin-bottom:10px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="BodyHoder" runat="server">
    <h1 class="page-title">
		<i class="icon-home"></i>
		当前位置：用户管理					
	</h1>
    <div class="widget widget-table">										
		<div class="widget-header">
			<i class="icon-th-list"></i>
			<h3>用户列表</h3>
		</div> <!-- /widget-header -->					
		<div class="widget-content">
            <asp:GridView ID="gvUser" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gvUser_PageIndexChanging" OnRowDataBound="gvUser_RowDataBound" CssClass="grid"
                OnRowDeleting="gvUser_RowDeleting" OnSelectedIndexChanging="gvUser_SelectedIndexChanging" Width="95%" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="userName" HeaderText="用户名" />
                <asp:BoundField DataField="nickName" HeaderText="昵称" />
                <asp:BoundField DataField="sumMark" HeaderText="积分" />
                <asp:BoundField DataField="registerDate" HeaderText="注册日期" />
                <asp:BoundField DataField="lock" HeaderText="状态" />
                <asp:TemplateField HeaderText="详细信息">
                    <ItemTemplate>
                        <a href ='../userInfo.aspx?userName=<%#Eval("userName") %>' target="_blank"   >查看</a>
                        
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="操作" SelectText="锁定/解锁" ShowSelectButton="True" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" HorizontalAlign="Center" />
                        <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" CssClass="hongcu" Font-Bold="True" ForeColor="White" Height="40px" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        </div> <!-- /widget-content -->					
	</div> <!-- /widget -->
</asp:Content>