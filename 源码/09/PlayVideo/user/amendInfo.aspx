<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="amendInfo.aspx.cs" Inherits="user_amendInfo" Title="Untitled Page" %>
<%@ Register Src="~/webUser/UserNav.ascx" TagName="UserNav" TagPrefix="uc1" %>
<asp:Content  ContentPlaceHolderID="head" ID="HeadHoder" runat="server">
    <style type="text/css">
        .edit tr {
            height:40px;
        }
        .td-child1 {
            width:150px;
            text-align:center;
        }
        .td-child2 {
            width:300px;
            text-align:left;
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UserNav ID="UserNav" runat="server" />
    <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2>修改个人信息</h2></center>
			</div>
		</div>
		<div class="row">
			<div class="col-4-1">
				<div class="wrap-col">
					<div class="post">
                        <table class="edit">
                            <tr>
                                <td class="td-child1">昵称：</td>
                                <td class="td-child2"><asp:TextBox ID="txtNickname" runat="server"></asp:TextBox></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="td-child1">性别：</td>
                                <td class="td-child2">
                                    <asp:RadioButtonList ID="rbtnlsSex" runat="server" RepeatDirection="Horizontal" Width="80">
                                        <asp:ListItem Selected="True">男</asp:ListItem>
                                        <asp:ListItem>女</asp:ListItem>
                                    </asp:RadioButtonList></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="td-child1">头像：</td>
                                <td class="td-child2">
                                    <table>
                                        <tr>
                                            <td><asp:Image ID="ImageHead" runat="server" Height="100px" Width="100px" AlternateText="请上传头像"/></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:FileUpload ID="fupImg" runat="server" Width="160"/>
                                                <asp:Button ID="btnUp" runat="server" Text="上传" OnClick="btnUp_Click" Width="100" Height="30"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="td-child1">所在城市：</td>
                                <td class="td-child2"><asp:TextBox ID="txtCity" runat="server"></asp:TextBox></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="td-child1">QQ：</td>
                                <td class="td-child2"><asp:TextBox ID="txtQQ" runat="server"></asp:TextBox></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="td-child1">个性留言：</td>
                                <td class="td-child2"><asp:TextBox ID="txtSpeak" runat="server" Height="80px" TextMode="MultiLine" Width="249px"></asp:TextBox></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><asp:Button ID="btnAmend" runat="server" Text="修改" OnClick="btnAmend_Click" Width="160" Height="30"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="Status" runat="server" />
</asp:Content>

