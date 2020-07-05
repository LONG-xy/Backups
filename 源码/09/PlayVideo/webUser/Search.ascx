<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="search" %>
<div style="height:50%">
    &nbsp;
</div>
<div>
    <asp:TextBox ID="txtKeys" runat="server" placeholder="请输入搜索内容..." CssClass="SearchTxt"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="搜索视频" OnClick="btnSearch_Click" CssClass="SearchBtn"/>
</div>