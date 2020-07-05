<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newPass.aspx.cs" Inherits="newPass" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <script src="Scripts/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="css/issuance.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container issuance-right">
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">原始密码：</div>
                <div class="col-sm-6 col-xs-6">
                    <asp:TextBox ID="txtOldPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>                    
                </div>
                <div class="col-sm-3 col-xs-3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                    ErrorMessage="*" ControlToValidate="txtOldPass"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">新密码：</div>
                <div class="col-sm-6 col-xs-6">
                    <asp:TextBox ID="txtNewPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>                    
                </div>
                <div class="col-sm-3 col-xs-3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPass"
                    Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">确认密码：</div>
                <div class="col-sm-6 col-xs-6">
                    <asp:TextBox ID="txtQNewPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>                    
                </div>
                <div class="col-sm-3 col-xs-3">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass"
                    ControlToValidate="txtQNewPass" Display="Dynamic" ErrorMessage="两次密码不一致"></asp:CompareValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center"></div>
                <div class="col-sm-8 col-xs-8">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="修　改" Width="100px" CssClass="form-control btn-danger"/>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>              
        </div>       
    </form>
</body>
</html>
