<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" Title="新闻中心"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="top-grid">
        <div class="about-wel wel-head text-center">
			<h3><%=Title %></h3>
			<p><%=Date %></p>
		</div>
		<!---- about-grids ---->
		<div class="about-grids">
			<div class="about-grids-row1">
				<p><%=Content%></p>
			</div>
		</div>
    </div>
</asp:Content>
