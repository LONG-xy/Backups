<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>供求信息－－－后台登录</title>
    <script type="text/javascript" src="Scripts/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Css/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6 custom-login-top"></div>  
                <div class="col-md-3"></div>              
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6 custom-login-middle">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-2">管理员：</div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txtUser" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="* 必填项"></asp:RequiredFieldValidator></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-2">密&nbsp; 码：</div>
                            <div class="col-md-6"><asp:TextBox ID="txtPwd" runat="server" class="form-control" TextMode="Password"></asp:TextBox></div>
                            <div class="col-md-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd" ErrorMessage="* 必填项"></asp:RequiredFieldValidator></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-2">验证码：</div>
                            <div class="col-md-6"><asp:TextBox ID="txtCheckCode" class="form-control" Width="150" runat="server"></asp:TextBox></div>
                            <div class="col-md-3"><asp:Label ID="lblCheckCode" runat="server" Text="1234" Font-Size="12pt" Width="46px"></asp:Label></div>
                        </div>
                    </div>
                    <div class="form-group text-center custom-login-btn">
                        <asp:ImageButton ID="ImageButton1" runat="server" class="btn btn-success" OnClick="ImageButton1_Click" AlternateText="登录"/>
                        &nbsp;&nbsp;
                        <asp:ImageButton ID="ImageButton2" runat="server" class="btn btn-success" AlternateText="重置"/> &nbsp;&nbsp;&nbsp;         
                        <asp:HyperLink ID="HyperLink1" runat="server" class="btn-link" NavigateUrl="~/Default.aspx">[返回首页]</asp:HyperLink>              
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6 custom-login-bottom"></div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </form>
</body>
</html>
