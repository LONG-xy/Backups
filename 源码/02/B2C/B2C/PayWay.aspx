<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PayWay.aspx.cs" Inherits="PayWay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <style >
        body{margin-top:0px}
        .custom-bg {
            width:633px;
            height:396px;
            padding-top:20px;
            margin:0px auto;
            background-image: url(images/背景.jpg);
        }
        .custom-bg p{            
            padding-left:430px;
            padding-top:10px;
        }
    </style>
    <script type="text/javascript" src="Scripts/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />   
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-md-12">
                <div class="custom-bg">
                    <p><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/中国工商银行.jpg" OnClick="ImageButton1_Click" /></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/images/中国农业银行.jpg" OnClick="ImageButton3_Click" /></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/images/交通银行.jpg" OnClick="ImageButton4_Click" /></p>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/中国建设银行.jpg" OnClick="ImageButton2_Click" /></p>
                    <p><asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/images/上海普东银行.jpg" OnClick="ImageButton5_Click" /></p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
