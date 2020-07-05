<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/manage/MasterPage.master" CodeFile="manage_saveTaxis.aspx.cs" Inherits="manage_asveTaxis" %>
<asp:Content  ContentPlaceHolderID="head" ID="HeadHoder" runat="server">
    <style>
        .grid {
            margin-top:10px;
            margin-bottom:10px;
        }
        .box-save {
            padding:20px;
        }
    </style>
    <link href="../css/pages/plans.css" rel="stylesheet" /> 
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="BodyHoder" runat="server">
    <h1 class="page-title">
		<i class="icon-home"></i>
		当前位置：保存月视频排行					
	</h1>
    <div class="widget widget-table">										
		<div class="widget-header">
			<i class="icon-th-list"></i>
			<h3>月视频排行</h3>
		</div> <!-- /widget-header -->					
		<div class="widget-content">
            <br />
            <div class="box-save">
                选择视频类型：
                <asp:DropDownList ID="ddlType" runat="server">
                    <asp:ListItem Value="搞笑">搞笑视频</asp:ListItem>
                    <asp:ListItem Value="电影">电影视频</asp:ListItem>
                    <asp:ListItem Value="体育">体育视频</asp:ListItem>
                    <asp:ListItem Value="动漫">动漫视频</asp:ListItem>
                </asp:DropDownList>&nbsp;
                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="保存" Width="80" Height="30"/>
            </div>
        </div>
    </div>
</asp:Content>