<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userIndex.aspx.cs" Inherits="user_userIndex" Title="个人管理" %>
<%@ Register Src="~/webUser/UserNav.ascx" TagName="UserNav" TagPrefix="uc1" %>
<asp:Content  ContentPlaceHolderID="head" ID="HeadHoder" runat="server">
    <style type="text/css">
        table tr td a {
            color:white;
            text-decoration:underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UserNav ID="UserNav" runat="server" />
    <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2>我上传的视频</h2></center>
			</div>
		</div>
		<div class="row">
			<div class="col-4-1">
				<div class="wrap-col">
					<div class="post">
                        <asp:GridView ID="gvVideo" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="暂无上传视频" AllowPaging="True" OnPageIndexChanging="gvVideo_PageIndexChanging" OnRowDeleting="gvVideo_RowDeleting" OnSelectedIndexChanging="gvVideo_SelectedIndexChanging" HorizontalAlign="Center">
                            <Columns>
                                <asp:TemplateField HeaderText="视频名称">
                                    <ItemTemplate>
                                        <a target="_blank" href='../play.aspx?id=<%#Eval("id") %>' title='<%#Eval("videoTitle") %>'><%#Eval("videoTitle") %></a>
                                    </ItemTemplate>
                                    <ControlStyle Font-Underline="False" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="视频类型" DataField="videoType" />
                                <asp:BoundField HeaderText="发布日期" DataField="videoDate" />
                                <asp:BoundField HeaderText="人气" DataField="playSum" />
                                <asp:CommandField HeaderText="修改信息" ShowSelectButton="True">
                                    <ControlStyle Font-Underline="False" />
                                </asp:CommandField>
                                <asp:CommandField HeaderText="删除" ShowDeleteButton="True">
                                    <ControlStyle Font-Underline="False" />
                                </asp:CommandField>
                            </Columns>
                            <HeaderStyle Height="40px" HorizontalAlign="Center" />
                            <RowStyle Height="30px" HorizontalAlign="Center" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

