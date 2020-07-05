<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="issuanceInfo.aspx.cs" Inherits="issuanceInfo" Title="发布信息"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="contact-grids">
		<div class="contact-left">
			<iframe frameborder="no" name="leftFrame" scrolling="no" src="<%=url%>" height="600" width="200"></iframe>
		</div>
		<div class="contact-right">
			<iframe frameborder="no" name="rightFrame" scrolling="no" height="800" style="width:100%"></iframe>
		</div>
		<div class="clearfix"></div>
	</div>
</asp:Content>