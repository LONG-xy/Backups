<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PwdEmail.aspx.cs" Inherits="web.PwdEmail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/css.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script>

        function respBtn()
        {
            var p1 = $('#rpwd1').val();
            var p2 = $('#rpwd2').val();
            if (p1 != p2) {
                alert('两次输入的密码不同');
            }
            else {
                var UserName = $('#phone').val();
                var phoneCode = $('#yzm').val();
                var code = $('#codeText').val();
                var pd = { "t": "10","pwd": p1 };
                $.ajax({
                    type: "post",
                    url: "Tools/User.ashx",
                    data: pd,
                    dataType: "json",
                    success: function (data) {
                        if (data.status == "0") {
                            alert('设置成功，请到首页进行登录');
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="respwd" runat="server" >
            <input id="rpwd1" type="text" placeholder="请输入密码" style="margin-top:10px; width:150px; height:30px; font-size:14px; " /><br />
            <input id="rpwd2" type="text" placeholder="确认密码" style="margin-top:10px; width:150px; height:30px; font-size:14px; " /><br /><br />
            <input type="button" id="yzmBtn" onclick="respBtn()" value="确定" style="height:37px; width:106px; color:white; background-color:#f39800; border:none; clear:both;" />
        </div>
    </div>
    </form>
</body>
</html>
