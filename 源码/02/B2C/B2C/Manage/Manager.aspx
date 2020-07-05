<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manage/admin.master" CodeFile="Manager.aspx.cs" Inherits="Manger_Manager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>管理会员</title>
    <style>
        th,td {
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>管理会员</h3>
    <div class="row custom-list-row">
        <div class="col-sm-12 col-md-12">
            <asp:GridView ID="gvMemberList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            PageSize="5" DataKeyNames ="MemberID"  Width="100%" HorizontalAlign="Center"
							HeaderStyle-CssClass="summary-title" OnPageIndexChanging="gvMemberList_PageIndexChanging" OnRowDeleting="gvMemberList_RowDeleting" BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BorderStyle="None">
				<HeaderStyle Font-Bold="True" CssClass="summary-title" BackColor="#333333" ForeColor="White" Height="30px"></HeaderStyle>
                <Columns>
                    <asp:BoundField DataField="MemberID" HeaderText="代号" ReadOnly="True" >
                        <ItemStyle HorizontalAlign="Center" Width="8%" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="RealName" HeaderText="真实姓名" >
                        <ItemStyle HorizontalAlign="Center"  Width="12%"/>
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Phonecode" HeaderText="电话号码" >
                        <ItemStyle HorizontalAlign="Center" Width="10%"/>
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="会员Email" >
                        <ItemStyle HorizontalAlign="Center"  Width="15%"/>
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Address" HeaderText="详细地址" >
                        <ItemStyle HorizontalAlign="Center"  Width="20%" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PostCode" HeaderText="邮编号码">
                        <ItemStyle HorizontalAlign="Center"  Width="10%"/>
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField  HeaderText="加入日期">
                    <HeaderStyle HorizontalAlign =Center />
                    <ItemStyle HorizontalAlign =Center Width="15%"/>
                    <ItemTemplate>
                    <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "LoadDate").ToString()).ToLongDateString()%>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" HeaderText="操作"/>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <RowStyle Height="30px" />
                <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>