<%@ Control Language="C#" AutoEventWireup="true" CodeFile="entry.ascx.cs" Inherits="entry" %>
<link href="css/login.css" rel="stylesheet" />
<div class="login" id="login" runat="server">
    <p><span>请输入用户名</span><span><asp:TextBox ID="txtName" runat="server" ></asp:TextBox></span></p>
    <p class="login-pwd"><span>请输入密码</span><span><asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox></span></p>
    <p class="login-btn">
        <asp:RadioButton ID="rdibtnGr" runat="server" Text="个人" Checked="True" GroupName="type" />
        <asp:RadioButton ID="rdibtnQy" runat="server" Text="企业" GroupName="type"/>&nbsp;&nbsp;
        <asp:Button ID="btnLanding" runat="server" OnClick="Button1_Click" Text="登录"/>
        <asp:LinkButton ID="lnkbtnNew" runat="server" CausesValidation="False" PostBackUrl="~/login.aspx">注册</asp:LinkButton>
    </p>
</div>
<div class="loginInfo" id="loginInfo" runat="server">
    <p>欢迎您 <asp:Label ID="Label1" runat="server" Text="Label" Width="96px"></asp:Label></p>
    <p>今天是 <%=DateTime.Now.ToString("yyyy年MM月dd日")+"&nbsp;"+ System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.GetDayName(DateTime.Now.DayOfWeek) %></p>
    <p><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ForeColor="White">[退出登录]</asp:LinkButton></p>
</div>