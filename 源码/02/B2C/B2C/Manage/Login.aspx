<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Manage_Login" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理员登录</title>
    <script type="text/javascript" src="../Scripts/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />   
    <style type="text/css">
        .custom-login-bg {
            width:546px;
            height:294px;
            margin:0px auto;
            background-image: url(../images/电子商务后台登录页面.jpg);
            margin-top:170px;
            padding-top:130px;
        }
        .custom-btn {
            display:table-cell;
        }
        .custom-login-row {
            margin-top:5px;
        }
        .custom-login-labCode {
            padding-left:0px;
        }
   </style> 
</head>
<body style="text-align: left;">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <div class="custom-login-bg">
                        <div class="row custom-login-content">
                            <div class="col-sm-3 col-md-3">
                            </div>
                            <div class="col-sm-9 col-md-9">
                                <div class="row custom-login-row">
                                    <div class="col-xs-4 col-sm-4 col-md-4 text-center">
                                        管理员ID：
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <asp:TextBox ID="txtAdminName" runat="server" CssClass="form-control" Height="30"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                    </div>
                                </div>
                                <div class="row custom-login-row">
                                    <div class="col-xs-4 col-sm-4 col-md-4 text-center">
                                        管理员密码：
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <asp:TextBox ID="txtAdminPwd" runat="server" TextMode="Password" CssClass="form-control" Height="30"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                    </div>
                                </div>
                                <div class="row custom-login-row">
                                    <div class="col-xs-4 col-sm-4 col-md-4 text-center">
                                        验&nbsp;&nbsp;&nbsp;&nbsp;证&nbsp;&nbsp;&nbsp;&nbsp;码：
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <asp:TextBox ID="txtAdminCode" runat="server" CssClass="form-control" Height="30"></asp:TextBox>
                                    </div>
                                    <div class="col-xs-2 col-sm-2 col-md-2 custom-login-labCode">
                                        <asp:Label ID="labCode" runat="server"  BackColor="Silver">8888</asp:Label>
                                    </div>
                                </div>
                                <div class="row custom-login-row">
                                    <div class="col-xs-4 col-sm-4 col-md-4">
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <asp:Button ID="btnLogin" runat="server" Text="登录" OnClick="btnLogin_Click" CssClass="form-control custom-btn" Width="80" Height="30"/>&nbsp;
                                        <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click" CausesValidation="False" CssClass="form-control custom-btn" Width="80" Height="30"/>
                                    </div>
                                    <div class="col-xs-2 col-sm-2 col-md-2">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
