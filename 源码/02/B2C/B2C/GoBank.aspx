<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GoBank.aspx.cs" Inherits="GoBank" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>工商银行在线支付</title>
    <meta http-equiv="content-type" content="text/html;charset=GBK">
</head>
<body>
    <form id="form1" name="order" method="post" action="https://mybank.dccnet.com.cn/servlet/ICBCINBSEBusinessServlet">   
      <input type="hidden" name="interfaceName"   value="<%=bankpay.InterfaceName%>"   />   
      <input type="hidden" name="interfaceVersion"   value=<%=bankpay.InterfaceVersion%>   />   
      <input type="hidden" name="orderid"   value="<%=bankpay.Orderid%>"/>   
      <input type="hidden" name="amount"   value="<%=bankpay.Amount%>"/> 
      <input type="hidden" name="curType"   value="<%=bankpay.CurType%>"/> 
      <input type="hidden" name="merID"   value="<%=bankpay.MerID%>"   />   
      <input type="hidden" name="merAcct"   value="<%=bankpay.MerAcct%>"   />   
      <input type="hidden" name="verifyJoinFlag"   value="<%=bankpay.VerifyJoinFlag%>"/>   
      <input type="hidden" name="notifyType"   value="<%=bankpay.NotifyType%>"/> 
      <input type="hidden" name="merURL"   value="<%=bankpay.MerURL%>"/>   
      <input type="hidden" name="resultType"   value="<%=bankpay.ResultType%>"/> 
      <input type="hidden" name="orderDate"   value="<%=bankpay.OrderDate%>"/>
      <input type="hidden" name="merSignMsg"   value="<%=bankpay.MerSignMsg%>"/> 
      <input type="hidden" name="merCert"   value="<%=bankpay.MerCert%>"/> 
      <input type="hidden" name="goodsID"   value="<%=bankpay.GoodsID%>"/> 
      <input type="hidden" name="goodsName"   value="<%=bankpay.GoodsName%>"/>
      <input type="hidden" name="goodsNum"   value="<%=bankpay.GoodsNum%>"/>
      <input type="hidden" name="carriageAmt"   value="<%=bankpay.CarriageAmt%>"/>
      <input type="hidden" name="merHint"   value="<%=bankpay.MerHint%>"/> 
      <input type="hidden" name="comment1"   value="<%=bankpay.Comment1%>"   />   
      <input type="hidden" name="comment2"   value="<%=bankpay.Comment2%>"   />    
        <div style="margin-top:200px;">
            <p style="text-align:center">谢谢您的光顾！您的订单号为<%=bankpay.Orderid%></p>
            <p style="text-align:center"><input type="submit" value="立即支付！" style="border:0px;background-color:#059b1b;height:30px;width:120px;color:white;"/>
                &nbsp;&nbsp;<a href="shopCart.aspx" style="font-size:12px;color:#808080">回到购物车</a></p>
        </div>
    </form>
</body>
</html>
