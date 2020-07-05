<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manage/admin.master" CodeFile="OrderModify.aspx.cs" Inherits="Manger_OrderModify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>修改订单</title>
    <style>
        th,td {
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>修改订单</h3>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            订单号码：
        </div>
        <div class="col-sm-6 col-md-6">
            <%=order.OrderNo%>
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            下单日期：
        </div>
        <div class="col-sm-6 col-md-6">
            <%=order.OrderTime%>
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-12 col-md-12">
            订单信息
            <hr />
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-12 col-md-12">
             <table class="table">
               <thead>
                   <tr>
                        <th>商品代号</th><th>商品名称</th><th>数量</th><th>热门价</th><th>小计</th><th>备注</th>
                   </tr>
               </thead>
                <tbody>
                    <%if (OrderItems != null) {
                       foreach (System.Data.DataRow dr in OrderItems) {
                    %>            
                        <tr>
                           <td><%=dr["BookID"] %></td><td><%=dr["BookName"] %></td><td><%=dr["Num"] %></td>
                           <td><%=dr["HotPrice"] %>￥</td><td><%=dr["TotailPrice"] %>￥</td><td><%=dr["Remark"]%></td>
                        </tr>
                    <%
                        }
                    } 
                    %>
               </tbody>
           </table>
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            定单状态：
        </div>
        <div class="col-sm-6 col-md-6">
            <%=GetStatus(Convert.ToInt32((order.OrderNo).ToString()))%>
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            配送方式：
        </div>
        <div class="col-sm-6 col-md-6">
            <%=order.ShipType%>
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            商品总金额：
        </div>
        <div class="col-sm-6 col-md-6">
            <%=string.Format("{0:f}",order.ProductPrice)%>￥ 
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            商品运费：
        </div>
        <div class="col-sm-6 col-md-6">
            <%=string.Format("{0:f}",order.ShipPrice)%>￥
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            订单总金额：
        </div>
        <div class="col-sm-6 col-md-6">
            <%=string.Format("{0:f}",order.TotalPrice)%>￥
        </div>
    </div>
     <div class="row custom-list-row">
        <div class="col-sm-12 col-md-12">
            收货人信息
            <hr />
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            收货人姓名：
        </div>
        <div class="col-sm-6 col-md-6">
            <%=order.ReceiverName%>
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            联系电话：
        </div>
        <div class="col-sm-6 col-md-6">
            <%=order.ReceiverPhone%>
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            Email地址：
        </div>
        <div class="col-sm-6 col-md-6">
            <%=order.ReceiverEmail%>
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            收货人地址：
        </div>
        <div class="col-sm-6 col-md-6">
            <%=order.ReceiverAddress%>
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            邮政编码：
        </div>
        <div class="col-sm-6 col-md-6">
            <%=order.ReceiverPostcode%>
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-12 col-md-12">
            修改订单状态
            <hr />
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            <asp:CheckBox ID="chkConfirm" runat="server" Text="是否已确认" AutoPostBack="True"/>
            <asp:CheckBox ID="chkConsignment" runat="server" Text="是否已发货" AutoPostBack="True" />
            <asp:CheckBox ID="chkPigeonhole" runat="server"  Text="是否已归档" AutoPostBack="True"/>
        </div>
        <div class="col-sm-6 col-md-6">

        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">

        </div>
        <div class="col-sm-6 col-md-6">
            <asp:Button ID="btnSave" Runat="server" Text="修 改" Width="80" OnClick="btnSave_Click"></asp:Button>
            <input type="button" onclick='printOrder(<%=Request.QueryString["OrderID"]%>)' value="打 印" id="Button1">
            <script type="text/javascript">
				function printOrder(oid)
				{
					temp=window.open('OrderPrint.aspx?OrderID='+oid,'Order','width=700,height=650,scrollbars=yes');
					temp.focus();
				}
			</script>
        </div>
    </div>
</asp:Content>