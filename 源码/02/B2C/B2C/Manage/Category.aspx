<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manage/admin.master" CodeFile="Category.aspx.cs" Inherits="Manger_Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>商品类别管理</title>
    <style>
        th,td {
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>商品类别管理</h3>
    <div class="row custom-list-row">
        <div class="col-sm-12 col-md-12">
            <asp:GridView ID="gvCategoryList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            PageSize="5"  Width="100%" HorizontalAlign="Center"
							HeaderStyle-CssClass="summary-title" OnPageIndexChanging="gvCategoryList_PageIndexChanging" OnRowDeleting="gvCategoryList_RowDeleting" BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" CellPadding="4" GridLines="Horizontal" ForeColor="Black" BorderStyle="None">
				<HeaderStyle Font-Bold="True" BackColor="#333333" CssClass="summary-title" ForeColor="White" Height="30px"></HeaderStyle>
                <Columns>
                    <asp:BoundField DataField="ClassID" HeaderText="类别号ID" >
                        <ItemStyle HorizontalAlign="Center" Width="20%" />
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ClassName" HeaderText="类别名称" >
                        <ItemStyle HorizontalAlign="Center" Width="60%" />
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>  
                    <asp:CommandField ShowDeleteButton="True" HeaderText="操作" >
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:CommandField>
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