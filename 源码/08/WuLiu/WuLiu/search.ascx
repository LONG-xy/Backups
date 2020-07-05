<%@ Control Language="C#" AutoEventWireup="true" CodeFile="search.ascx.cs" Inherits="search" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/search.css" rel="stylesheet" />
<div class="onsearch">
    <p>
        <span>信息类型</span>
        <span><asp:DropDownList ID="ddlSearchType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSearchType_SelectedIndexChanged"></asp:DropDownList></span>
    </p>
    <p>
        <span>搜索类型</span>
        <span><asp:DropDownList ID="ddlKeyType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlKeyType_SelectedIndexChanged"></asp:DropDownList></span>
    </p>
    <p id="pTerminal" runat="server" visible="false">
        <span><asp:Label ID="labTerminal" runat="server" Text="到达地方" Visible="False"></asp:Label></span>
        <span><asp:TextBox ID="txtTerminal" runat="server" Visible="False"></asp:TextBox></span>
    </p>
    <p>
        <span>&nbsp;关&nbsp;键&nbsp;字</span>
        <span><asp:TextBox ID="txtKey" runat="server"></asp:TextBox>&nbsp;<asp:Button ID="btnSearch" runat="server" Text="搜索" OnClick="Button1_Click" /></span>        
    </p>
</div>