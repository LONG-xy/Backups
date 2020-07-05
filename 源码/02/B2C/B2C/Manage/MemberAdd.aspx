<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manage/admin.master" CodeFile="MemberAdd.aspx.cs" Inherits="Manage_MemberAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>添加管理员</title>
    <style>
        .custom-add-row {
            margin-top:10px;
        }
        .custom-control-cell {
            display:table-cell;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>添加管理员</h3>
    <div class="row custom-add-row">
        <div class="col-sm-2 col-md-2 text-right">
            用户名：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:TextBox id="txtName" runat="server" CssClass="form-control"></asp:TextBox>									
        </div>
        <div class="col-sm-3 col-md-3">
            <font color="red">
                *<asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" Font-Size="9pt">请输入用户名</asp:RequiredFieldValidator>
            </font>
        </div>
    </div>
    <div class="row custom-add-row">
        <div class="col-sm-2 col-md-2 text-right">
            密码：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password" CssClass="form-control">请输入密码</asp:TextBox>
        </div>
        <div class="col-sm-3 col-md-3">
            <font color="red">
                *<asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPassWord" Font-Size="9pt">**</asp:RequiredFieldValidator>
            </font>
        </div>
    </div>
    <div class="row custom-add-row">
        <div class="col-sm-2 col-md-2 text-right">
            真实姓名：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:TextBox id="txtTrueName" runat="server" CssClass="form-control"></asp:TextBox>									
        </div>
        <div class="col-sm-3 col-md-3">
            <font color="red">
                *<asp:RequiredFieldValidator ID="rfvTrueName" runat="server" ControlToValidate="txtTrueName" Font-Size="9pt">请输入真实姓名</asp:RequiredFieldValidator>
            </font>
        </div>
    </div>
    <div class="row custom-add-row">
        <div class="col-sm-2 col-md-2 text-right">
            Email：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>                                   
        </div>
        <div class="col-sm-3 col-md-3">
             <font color="red">
                 *<asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" Font-Size="9pt">请输入Email</asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" Font-Size="9pt" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Email格式有误</asp:RegularExpressionValidator>
            </font>
        </div>
    </div>
    <div class="row custom-add-row">
        <div class="col-sm-2 col-md-2 text-right">

        </div>
        <div class="col-sm-4 col-md-4">
            <asp:Button id="btnSave" runat="server" Text="保存" OnClick="btnSave_Click"  CssClass="form-control custom-control-cell" Width="80"></asp:Button>&nbsp;&nbsp;
			<asp:Button id="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click" CausesValidation="False"  CssClass="form-control custom-control-cell" Width="80"></asp:Button>
        </div>
        <div class="col-sm-3 col-md-3">

        </div>
    </div>
</asp:Content>