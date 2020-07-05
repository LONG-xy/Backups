<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderPrint.aspx.cs" Inherits="Manage_OrderPrint" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>订单打印</title>
     <SCRIPT language="JavaScript">
		function printPage() 
		{
			eval("printOrder" + ".style.display=\"none\";");
			window.print(); 
		}
	</SCRIPT>
    <script type="text/javascript" src="../Scripts/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../Content/assets/font-awesome.css" rel="stylesheet" type="text/css"/>
</head>
<body>    
    <div class="container">
        <h3>修改订单</h3>
        <div class="row custom-list-row">
            <div class="col-xs-2 col-sm-2 col-md-2">
                订单号码：
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10">
                <%=order.OrderNo%>
            </div>
        </div>
        <div class="row custom-list-row">
            <div class="col-xs-2 col-sm-2 col-md-2">
                下单日期：
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10">
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
            <div class="col-xs-2 col-sm-2 col-md-2">
                定单状态：
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10">
                <%=GetStatus(Convert.ToInt32((order.OrderNo).ToString()))%>
            </div>
        </div>
        <div class="row custom-list-row">
            <div class="col-xs-2 col-sm-2 col-md-2">
                配送方式：
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10">
                <%=order.ShipType%>
            </div>
        </div>
        <div class="row custom-list-row">
            <div class="col-xs-2 col-sm-2 col-md-2">
                商品总金额：
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10">
                <%=string.Format("{0:f}",order.ProductPrice)%>￥ 
            </div>
        </div>
        <div class="row custom-list-row">
            <div class="col-xs-2 col-sm-2 col-md-2">
                商品运费：
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10">
                <%=string.Format("{0:f}",order.ShipPrice)%>￥
            </div>
        </div>
        <div class="row custom-list-row">
            <div class="col-xs-2 col-sm-2 col-md-2">
                订单总金额：
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10">
                <%=string.Format("{0:f}",order.TotalPrice)%>￥
            </div>
        </div>
         <div class="row custom-list-row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                收货人信息
                <hr />
            </div>
        </div>
        <div class="row custom-list-row">
            <div class="col-xs-2 col-sm-2 col-md-2">
                收货人姓名：
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10">
                <%=order.ReceiverName%>
            </div>
        </div>
        <div class="row custom-list-row">
            <div class="col-xs-2 col-sm-2 col-md-2">
                联系电话：
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10">
                <%=order.ReceiverPhone%>
            </div>
        </div>
        <div class="row custom-list-row">
            <div class="col-xs-2 col-sm-2 col-md-2">
                Email地址：
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10">
                <%=order.ReceiverEmail%>
            </div>
        </div>
        <div class="row custom-list-row">
            <div class="col-xs-2 col-sm-2 col-md-2">
                收货人地址：
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10">
                <%=order.ReceiverAddress%>
            </div>
        </div>
        <div class="row custom-list-row">
            <div class="col-xs-2 col-sm-2 col-md-2">
                邮政编码：
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10">
                <%=order.ReceiverPostcode%>
            </div>
        </div>
        <div class="row custom-list-row">
            <div class="col-xs-12 col-sm-12 col-md-12">
                修改订单状态
                <hr />
            </div>
        </div>
        <div class="row custom-list-row">
            <div class="col-xs-2 col-sm-2 col-md-2">
          
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10">
                <input type="button" onclick="printPage()" value="打 印" style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; WIDTH: 69px; BORDER-BOTTOM: #000000 1px solid; HEIGHT: 22px" id="Button1">
            </div>
        </div>
    </div>
</body>
</html>