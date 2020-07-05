<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manage/admin.master" CodeFile="Member.aspx.cs" Inherits="Manage_Member" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>管理管理员</title>
    <style>
        th,td {
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>管理管理员</h3>
    <div class="row custom-list-row">
        <div class="col-sm-12 col-md-12">
            <asp:GridView ID="gvAdminList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            PageSize="5" DataKeyNames ="AdminID"  Width="99%" HorizontalAlign="Center" CellPadding =4
							HeaderStyle-CssClass="summary-title" OnPageIndexChanging="gvAdminList_PageIndexChanging"  OnRowDeleting="gvAdminList_RowDeleting" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal" >
				<HeaderStyle Font-Bold="True" CssClass="summary-title" BackColor="#333333" ForeColor="White" Height="30px"></HeaderStyle>
                <Columns>
                    <asp:BoundField DataField="AdminID" HeaderText="代号" ReadOnly="True" >
                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="AdminName" HeaderText="用户名称" >
                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="密码" >
                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="RealName" HeaderText="真实名" >
                        <ItemStyle HorizontalAlign="Center" Width="15%" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email">
                        <ItemStyle HorizontalAlign="Center" Width="20%"  />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                        <asp:TemplateField  HeaderText="加入日期">
                    <HeaderStyle HorizontalAlign =Center />
                    <ItemStyle HorizontalAlign =Center Width="15%" />
                    <ItemTemplate>
                    <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "LoadDate").ToString()).ToLongDateString()%>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" HeaderText="操作" >
                        <ItemStyle HorizontalAlign="Center" Width="10%" />
                    </asp:CommandField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <RowStyle Height="30px" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>