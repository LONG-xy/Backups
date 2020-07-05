<%@ Page Language="C#" AutoEventWireup="true" CodeFile="manageEntry.aspx.cs" Inherits="manageEntry" %>
<!DOCTYPE >
<html>
<head runat="server">
    <title>后台登录</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="css/manageEntry.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
				</div> 
				<div class="modal-body login-page "><!-- login-page -->     
					<div class="login-top sign-top">
						<div class="agileits-login">
						<h5>登录</h5>
                            <asp:TextBox ID="txtName" runat="server" placeholder="用户名" required=""></asp:TextBox>                                
                            <asp:TextBox ID="txtPass" runat="server" CssClass="password" required="" TextMode="Password" placeholder="密码"></asp:TextBox> 
							<div class="w3ls-submit">	
                                <asp:Button ID="btnLanding" runat="server" OnClick="Button1_Click" Text="登录"/>
							</div>
						</div>  
					</div>
				</div>  
			</div> <!-- //login-page -->
		</div>
    </form>
</body>
</html>
