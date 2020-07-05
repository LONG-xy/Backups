<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manage/admin.master" CodeFile="Product.aspx.cs" Inherits="Manger_Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>商品管理</title>
    <style>
        .custom-list-row {
            margin-top:10px;
        }
        .custom-control-cell {
            display:table-cell;
        }
        th,td {
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>商品管理</h3>
    <div class="row">
        <div class="col-sm-12 col-md-12">
            请输入关键字：&nbsp;
			<asp:TextBox ID="txtKey" runat="server" CssClass="form-control custom-control-cell" Width="200"></asp:TextBox>&nbsp;
			<asp:Button id="btnSearch" runat="server" Text="搜索" OnClick="btnSearch_Click" CssClass="form-control custom-control-cell" Width="100"></asp:Button>
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-12 col-md-12">
            <asp:GridView ID="gvGoodsInfo" runat="server" CellPadding="4" Width="99%" HorizontalAlign="Center" 
							HeaderStyle-CssClass="summary-title" AutoGenerateColumns="False" OnPageIndexChanging="gvGoodsInfo_PageIndexChanging" OnRowDeleting="gvGoodsInfo_RowDeleting" AllowPaging="True" PageSize="5" BackColor="White" BorderColor="#CCCCCC" BorderWidth="1px" GridLines="Horizontal" ForeColor="Black" BorderStyle="None" >
                       <HeaderStyle Font-Bold="True"  Font-Size =Small BackColor="#333333" CssClass="summary-title" ForeColor="White" Height="30px"></HeaderStyle>
                        <Columns>
                            <asp:BoundField DataField="BookID" HeaderText="商品ID"  >
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BookName" HeaderText="商品名称">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText ="所属类别">
                            <HeaderStyle HorizontalAlign =Center />
                            <ItemStyle HorizontalAlign =Center />
                            <ItemTemplate >
                            <%# GetClassName(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "ClassID").ToString())) %>
                            </ItemTemplate>
                            </asp:TemplateField> 
                            <asp:BoundField DataField="Author" HeaderText="编注">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Company" HeaderText="商城">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                             <asp:TemplateField HeaderText ="热门价">
                            <HeaderStyle HorizontalAlign =Center />
                            <ItemStyle HorizontalAlign =Center />
                            <ItemTemplate >
                            <%# GetVarStr(DataBinder.Eval(Container.DataItem, "HotPrice").ToString())%>￥
                            </ItemTemplate>
                            </asp:TemplateField> 
                            <asp:HyperLinkField HeaderText="详细信息" Text="详细信息" DataNavigateUrlFields="BookID" DataNavigateUrlFormatString="EditProduct.aspx?BookID={0}&menu=7" >
                                <ControlStyle Font-Underline="False" ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:HyperLinkField>
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" >
                                <ControlStyle Font-Underline="False" ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
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