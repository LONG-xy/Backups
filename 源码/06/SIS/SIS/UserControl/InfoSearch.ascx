<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InfoSearch.ascx.cs" Inherits="UserControl_InfoSearch" %>
<div class="custom-search">
    <div class="custom-left-title"><img src="../images/newImg/fk.png"/> 信息快速搜索</div>
    <div class="custom-search-key">&nbsp;输入关键字 : <asp:TextBox ID="txtKey" runat="server" CssClass="" Width="184px"></asp:TextBox></div>
    <div class="custom-search-btn">
        <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="开始搜索" Height="22px" Width="67px" OnClick="ImageButton1_Click" ImageUrl="~/images/anhiu1.jpg" />
        <asp:ImageButton ID="ImageButton2" runat="server" AlternateText="搜索帮助" Height="22px" Width="67px" ImageUrl="~/images/anhiu2.jpg" PostBackUrl="~/Help.aspx" />
    </div>
</div>