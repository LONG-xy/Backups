<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>图书馆管理系统登录页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../Scripts/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link href="Content/font-awesome.min.css" rel="stylesheet" />
    <link href="../Content/Login.css" rel="stylesheet" />
    <script src="Scripts/html5shiv.min.js"></script>
    <style>
        body {
            background-color:#41cbc6;
        }
        .one-row {
            margin-top:100px;
        }
        .top10 {
            margin-top:8px;
        }
    </style>
</head>
<body>
	<div class="container">
		<div class="row one-row">
		    <div class="col-md-offset-3 col-md-6">
		        <form name="form1" method="post" action="" runat="server" class="form-horizontal">
		            <span class="heading">用户登录</span>
		            <div class="form-group">
                        <asp:TextBox ID="txtAdmin" runat="server" class="form-control" placeholder="用户名或电子邮件"></asp:TextBox>
		                <i class="fa fa-user"></i>
		            </div>
		            <div class="form-group help">
                        <asp:TextBox ID="txtPwd" runat="server" class="form-control" TextMode="Password" placeholder="密　码"></asp:TextBox>
		                <i class="fa fa-lock"></i>
		                <a href="#" class="fa fa-question-circle"></a>
		            </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-4">
                                <asp:TextBox ID="txtCode" runat="server" Width="135px" class="form-control" placeholder="验证码"></asp:TextBox>
                            </div>
                            <div class="col-sm-6 text-left" style="height:40px;">
                                &nbsp;&nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="~/Common/checkcode.aspx" CssClass="top10"/>
                            </div>
                        </div>
                    </div>
		            <div class="form-group" >
                        <asp:Button ID="btnLogin" runat="server" Text="登录" OnClick="btnLogin_Click" class="btn btn-default"/>
		            </div>
		        </form>
		    </div>
		</div>
	</div>   
</body>
</html>
