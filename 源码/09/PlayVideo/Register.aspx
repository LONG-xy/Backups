<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Register.aspx.cs" Inherits="Register" %>
<asp:Content  ContentPlaceHolderID="head" ID="HeadHoder" runat="server">
    <style type="text/css">
        table tr td{
            height:40px;
            text-align:left;
        }
        table {
            margin:0px auto;
        }
        table tr td input{
            border:1px;
            border-style:solid;
            border-color:#ffffff;
            height:30px;
        }
        table tr td input[type=text],table tr td input[type=password] {
            width:200px;
        }
        table tr td input[type=submit] {
            width:100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2>用户注册</h2></center>
			</div>
		</div>
		<div class="row">
			<div class="col-4-1">
				<div class="wrap-col">
					<div class="post">
                        <asp:Panel ID="PanelRegister" runat="server">
                            <table>
                                <tr>
                                    <td width="130">用&nbsp;&nbsp;户&nbsp;&nbsp;名：</td>
                                    <td>
                                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox><span style="color: #ff0000">*</span>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="必填"></asp:RequiredFieldValidator>
                                        <asp:Button ID="btnSelectName" runat="server" OnClick="btnSelectName_Click" Text="检测用户名"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                                    <td><asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox><span>*</span></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><span>确认密码：</span></td>
                                    <td><asp:TextBox ID="txtValidatePass" runat="server" TextMode="Password"></asp:TextBox><span>*</span><span></span></td>
                                    <td><asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPass" ControlToValidate="txtValidatePass" ErrorMessage="两次密码不一致"></asp:CompareValidator></td>
                                </tr>
                                <tr>
                                    <td>密码提示问题：</td>
                                    <td><asp:TextBox ID="txtPassQuestion" runat="server"></asp:TextBox>
                                        <span style="color: #ff0000">*</span></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>密码提示答案：</td>
                                    <td><asp:TextBox ID="txtPassAnswer" runat="server"></asp:TextBox><span style="color: #ff0000">*</span></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>E-mail：</td>
                                    <td><asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><span style="color: #ff0000">*</span></td>
                                    <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                                            ErrorMessage="格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td colspan="2" style="text-align:left;">
                                        <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="注　册" />&nbsp;
                                        <asp:Button ID="btnRegisterReturn" runat="server" Text="返  回" PostBackUrl="~/index.aspx" CausesValidation="False" />
                                    </td>
                                </tr>
                            </table>
                            </asp:Panel>
                            <asp:Panel ID="PanelInfo" runat="server" Visible="False">
                                <table>
                                    <tr>
                                        <td width="130">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
                                        <td><asp:TextBox ID="txtNickname" runat="server"></asp:TextBox></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                                        <td style="text-align:left;">
                                            <asp:RadioButtonList ID="rbtnlsSex" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Selected="True">男</asp:ListItem>
                                                <asp:ListItem>女</asp:ListItem>
                                            </asp:RadioButtonList></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>头&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像：</td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Image ID="ImageHead" runat="server" Height="100px" Width="100px" AlternateText="请上传头像"/></td>
                                                </tr>
                                                <tr>
                                                    <td><asp:FileUpload ID="fupImg" runat="server" /><asp:Button ID="btnUp" runat="server"  Text="上　传" OnClick="btnUp_Click" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>所在城市：</td>
                                        <td><asp:TextBox ID="txtCity" runat="server"></asp:TextBox></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>QQ：</td>
                                        <td><asp:TextBox ID="txtQQ" runat="server"></asp:TextBox></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>个性留言：</td>
                                        <td><asp:TextBox ID="txtSpeak" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Button ID="btnEnd" runat="server" OnClick="btnEnd_Click" Text="完  成" />
                                            &nbsp;
                                            <asp:Button ID="btnInfoReturn" runat="server" Text="返  回" PostBackUrl="~/index.aspx" /></td>
                                    </tr>
                                </table>
                            </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>