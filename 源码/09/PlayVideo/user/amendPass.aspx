<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="amendPass.aspx.cs" Inherits="user_amendPass" Title="Untitled Page" %>
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
        .edit tr td input[type=password]{
            width:95%;
            height:30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UserNav ID="UserNav" runat="server" />
    <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2>修改个人密码</h2></center>
			</div>
		</div>
		<div class="row">
			<div class="col-4-1">
				<div class="wrap-col">
					<div class="post">
                        <table class="edit">
                            <tr>
                                <td class="td-child1">原密码：</td>
                                <td class="td-child2"><asp:TextBox ID="txtOldPass" runat="server" TextMode="Password"></asp:TextBox></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="td-child1">新密码：</td>
                                <td class="td-child2"><asp:TextBox ID="txtNewPass" runat="server" TextMode="Password"></asp:TextBox></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="td-child1">确认密码：</td>
                                <td class="td-child2"><asp:TextBox ID="txtNewQ" runat="server" TextMode="Password"></asp:TextBox></td>
                                <td><asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass"
                                        ControlToValidate="txtNewQ" ErrorMessage="两次密码不一致"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Button ID="btnAmend" runat="server" Text="修改" OnClick="btnAmend_Click" Width="100" Height="30"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

