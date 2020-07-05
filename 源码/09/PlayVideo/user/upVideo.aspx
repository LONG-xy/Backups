<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="upVideo.aspx.cs" Inherits="user_upVideo" Title="视频上传" %>
<%@ Register Src="~/webUser/UserNav.ascx" TagName="UserNav" TagPrefix="uc1" %>
<asp:Content  ContentPlaceHolderID="head" ID="HeadHoder" runat="server">
    <style type="text/css">
        .edit tr td{
            text-align:left;
        }
        .edit tr {
            height:40px;
        }
        .td-child1 {
            width:150px;
            text-align:center;
        }
        .td-child2 {
            width:300px;
        }
        .edit tr td input[type=text]{
            width:95%;
            height:30px;
        }
        .edit tr td textarea {
            width:90%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UserNav ID="UserNav" runat="server" />
    <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2>视频上传</h2></center>
			</div>
		</div>
		<div class="row">
			<div class="col-4-1">
				<div class="wrap-col">
					<div class="post">
                         <table class="edit">
                            <tr>
                                <td class="td-child1">视频标题：</td>
                                <td class="td-child2"><asp:TextBox ID="txtTitle" runat="server"></asp:TextBox></td>
                                <td><span style="color: #ff0000">*</span></td>
                            </tr>
                            <tr>
                                <td class="td-child1">视频内容：</td>
                                <td class="td-child2"><asp:TextBox ID="txtContent" runat="server" Height="104px" TextMode="MultiLine"></asp:TextBox></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="td-child1">上传视频：</td>
                                <td class="td-child2"><asp:FileUpload ID="fileupVideo" runat="server" /></td>
                                <td><span style="color: #fff">只能上传.flv .avi.wmv</span></td>
                            </tr>
                            <tr>
                                <td class="td-child1">视频类型：</td>
                                <td class="td-child2">
                                    <asp:RadioButtonList ID="radBtnListType" runat="server" Height="21px" RepeatDirection="Horizontal" Width="240">
                                        <asp:ListItem Selected="True">搞笑</asp:ListItem>
                                        <asp:ListItem>体育</asp:ListItem>
                                        <asp:ListItem>电影</asp:ListItem>
                                        <asp:ListItem>动漫</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Button ID="btnUpVideo" runat="server" OnClick="btnUpVideo_Click" Text="上传" width="100" Height="30"/>
                                    <asp:Button ID="btnReturn" runat="server" Text="返回" PostBackUrl="~/user/userIndex.aspx" width="100" Height="30"/>
                                </td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>