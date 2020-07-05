<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GetPass.aspx.cs" Inherits="GetPass" %>
<asp:Content  ContentPlaceHolderID="head" ID="HeadHoder" runat="server">
    <style type="text/css">
        table tr td{
            height:40px;
        }
        table {
            margin:0px auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2>密码找回</h2></center>
			</div>
		</div>
		<div class="row">
			<div class="col-4-1">
				<div class="wrap-col">
					<div class="post">
                        <asp:Panel ID="PanelInputName" runat="server">
                            <p>
                                请输入需要找回密码的用户名
                            </p>
                            <p>
                                用户名：<asp:TextBox ID="txtName" runat="server" Width="190px" Height="30"></asp:TextBox>
                            </p>
                            <p>
                                <asp:Button ID="btnNext" runat="server" OnClick="btnNext_Click" Text="下一步" Width="120" Height="30"/>&nbsp;
                                <asp:Button ID="btnOReturn" runat="server" PostBackUrl="~/index.aspx" Text="返　回"  Width="120" Height="30"/>
                            </p>
                        </asp:Panel>
                        <asp:Panel ID="PanelGetPass" runat="server" Visible="False">
                            <div>
                                <table border="0" cellpadding="0" cellspacing="0" width="300" align="Center">
                                    <tr>
                                        <td>
                                            密码提示问题：</td>
                                        <td><asp:TextBox ID="txtQuestion" runat="server" ReadOnly="True" Width="190px" Height="30"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>密码提示答案：</td>
                                        <td><asp:TextBox ID="txtAnswer" runat="server" Width="190px" Height="30"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>找回的密码：</td>
                                        <td><asp:TextBox ID="txtPass" runat="server" ReadOnly="True" Width="190px" Height="30"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:Button ID="btnGet" runat="server" OnClick="btnGet_Click" Text="查　找" Width="120" Height="30"/>
                                            &nbsp;
                                            <asp:Button ID="btnReturn" runat="server" PostBackUrl="~/index.aspx" Text="返　回" Width="120" Height="30"/></td>
                                    </tr>
                                </table>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>