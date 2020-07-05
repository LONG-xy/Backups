<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/admin.master" AutoEventWireup="true" CodeFile="OrderList.aspx.cs" Inherits="Manage_OrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>订单管理</title>
    <style>
        .custom-orderlist-search-row {
            margin-top:10px;
        }
        .custom-control-cell {
            display:table-cell;
        }
        th {
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>订单管理-<asp:Label id="labTitleInfo" runat="server"></asp:Label></h3>
    <div class="row custom-orderlist-search-row">
        <div class="col-sm-2 col-md-2 text-right">
             订单号：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:textbox id="txtKeyword" runat="server" CssClass="form-control"></asp:textbox>                                    
        </div>
        <div class="col-sm-3 col-md-3">
            <asp:RegularExpressionValidator ID="revInt" runat="server" ControlToValidate="txtKeyword" ErrorMessage="请输入整数" ValidationExpression="[0-9]*$"></asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="row custom-orderlist-search-row">
        <div class="col-sm-2 col-md-2 text-right">
            收货人：
        </div>
        <div class="col-sm-4  col-md-4">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>

    <div class="row custom-orderlist-search-row">
        <div class="col-sm-2 col-md-2 text-right">
            订单状态：
        </div>
        <div class="col-sm-4  col-md-4">
            <asp:dropdownlist id="ddlConfirmed" Runat="server" CssClass="form-control custom-control-cell" Width="120">
				<asp:ListItem Value="0">未确认</asp:ListItem>
				<asp:ListItem Value="1">已确认</asp:ListItem>
			</asp:dropdownlist>&nbsp;
            <asp:dropdownlist id="ddlShipped" Runat="server" CssClass="form-control custom-control-cell" Width="120">
				<asp:ListItem Value="0">未发货</asp:ListItem>
				<asp:ListItem Value="1">已发货</asp:ListItem>
			</asp:dropdownlist>&nbsp;
            <asp:dropdownlist id="ddlFinished" Runat="server" CssClass="form-control custom-control-cell" Width="120">
				<asp:ListItem Value="0">未归档</asp:ListItem>
				<asp:ListItem Value="1">已归档</asp:ListItem>
			</asp:dropdownlist>
        </div>
        <div class="col-sm-3 col-md-3">
            
        </div>
    </div>
    <div class="row custom-orderlist-search-row">
        <div class="col-md-2">
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:button id="btnSearch" runat="server" Text="搜索" OnClick="btnSearch_Click" CssClass="form-control" Width="100"></asp:button>
        </div>
    </div>
    <div class="row custom-orderlist-search-row">
        <div class="col-md-12">
            <asp:GridView ID="gvOrderList" runat="server" HorizontalAlign =Center  Width ="99%" DataKeyNames ="OrderID" AutoGenerateColumns =False PageSize="5" AllowPaging="True" OnPageIndexChanging="gvOrderList_PageIndexChanging" OnRowDeleting="gvOrderList_RowDeleting" Font-Size =10pt CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                <HeaderStyle Font-Bold =True Font-Size =Small BackColor="#333333" ForeColor="White" Height="30px" HorizontalAlign="Center"  />                        
                <Columns >
        <asp:TemplateField  HeaderText ="跟单员">
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
			<ItemStyle HorizontalAlign="Center" ></ItemStyle>
			<ItemTemplate>
				<%#GetAdminName(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "OrderID").ToString())) %>
			</ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="OrderID" HeaderText="单号">
            <ItemStyle HorizontalAlign="Center" />
            <HeaderStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:TemplateField  HeaderText ="下订时间">
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
			<ItemStyle HorizontalAlign="Center"></ItemStyle>
			<ItemTemplate>
				<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "OrderDate").ToString()).ToLongDateString()%>
			</ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="货品总额">
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
			<ItemStyle HorizontalAlign="Center" ></ItemStyle>
			<ItemTemplate>
				<%#GetVarGF(DataBinder.Eval(Container.DataItem, "BooksFee").ToString()) %>
			</ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="运费">
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
			<ItemStyle HorizontalAlign="Center" ></ItemStyle>
			<ItemTemplate>
				<%# GetVarSF(DataBinder.Eval(Container.DataItem, "ShipFee").ToString()) %>
			</ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="总金额">
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
			<ItemStyle HorizontalAlign="Center" ></ItemStyle>
			<ItemTemplate>
				<%# GetVarTP(DataBinder.Eval(Container.DataItem, "TotalPrice").ToString()) %>
			</ItemTemplate>                         
        </asp:TemplateField>
        <asp:BoundField DataField="ShipType" HeaderText="配送方式">
            <ItemStyle HorizontalAlign="Center" />
            <HeaderStyle HorizontalAlign="Center" />
        </asp:BoundField>  
        <asp:BoundField DataField="ReceiverName" HeaderText="收货人">
            <ItemStyle HorizontalAlign="Center" />
            <HeaderStyle HorizontalAlign="Center" />
        </asp:BoundField>                 
        <asp:BoundField DataField="ReceiverPhone" HeaderText="联系电话">
            <ItemStyle HorizontalAlign="Center" />
            <HeaderStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="订单状态">
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
			<ItemStyle HorizontalAlign="Center" ></ItemStyle>
			<ItemTemplate>
				<%# GetStatus(Convert.ToInt32(DataBinder.Eval(Container.DataItem, "OrderID").ToString()))%>
			</ItemTemplate>                
        </asp:TemplateField >
        <asp:TemplateField HeaderText="管理">
            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
			<ItemStyle HorizontalAlign="Center" ></ItemStyle>
			<ItemTemplate>
				<a href='OrderModify.aspx?OrderID=<%# DataBinder.Eval(Container.DataItem, "OrderID")%>&menu=<%=menu %>'>
				管理</a>
			</ItemTemplate>            
        </asp:TemplateField>
        <asp:CommandField ShowDeleteButton="True"  HeaderText="删除" />                        
                </Columns>
                <EditRowStyle Font-Size="Small" />
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <RowStyle HorizontalAlign="Center"/>
                <SelectedRowStyle BackColor="#CC3333" ForeColor="White" Font-Bold="True" />
                <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>