<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manager/MasterPage.master" CodeFile="UserInfo.aspx.cs" Inherits="Manager_UserInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>用户详细信息</h3>
    <div class="container container-row-control1">
        <div class="row">
            <div class="col-sm-3">用户名：</div>
            <div class="col-sm-6"><asp:Label ID="txtName" runat="server"></asp:Label></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3">密保问题：</div>
            <div class="col-sm-6">
                <asp:Label ID="ddlQuestion" runat="server"></asp:Label>
            </div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3">密保答案：</div>
            <div class="col-sm-6"><asp:Label ID="txtResult" runat="server"></asp:Label></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3">头像：</div>
            <div class="col-sm-6"><asp:Image id="imgPhoto" runat="server"></asp:Image> </div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3">性别：</div>
            <div class="col-sm-6">
                <asp:Label ID="ddlSex" runat="server"></asp:Label>
            </div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3">年龄：</div>
            <div class="col-sm-6"><asp:Label ID="txtAge" runat="server"></asp:Label></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3">联系电话：</div>
            <div class="col-sm-6"><asp:Label ID="txtTel" runat="server" ReadOnly="True"></asp:Label></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3">手机：</div>
            <div class="col-sm-6"><asp:Label ID="txtMobile" runat="server"></asp:Label></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3">QQ号：</div>
            <div class="col-sm-6"><asp:Label ID="txtQQ" runat="server"></asp:Label></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3">Email：</div>
            <div class="col-sm-6"><asp:Label ID="txtEmail" runat="server"></asp:Label></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3">家庭住址：</div>
            <div class="col-sm-6"><asp:Label ID="txtAddress" runat="server"></asp:Label></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3">个人首页：</div>
            <div class="col-sm-6"><asp:Label ID="txtIndex" runat="server"></asp:Label></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3">备注：</div>
            <div class="col-sm-6"><asp:Label ID="txtRemark" runat="server"></asp:Label></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6"><asp:Button ID="btnBack" runat="server" Text="返回" OnClick="btnBack_Click" CausesValidation="False" CssClass="form-control1" Width="100"/></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row"><div class="col-sm-3"></div></div>
    </div>
</asp:Content>