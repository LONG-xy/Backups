<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manager/MasterPage.master" CodeFile="AdminManage.aspx.cs" Inherits="Manager_AdminManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h3>管理员信息管理</h3>
     <div class="container container-row-control1">
        <div class="row">
	        <div class="col-sm-3 text-center">管理员名称：</div>
	        <div class="col-sm-6"><asp:TextBox ID="txtName" runat="server" CssClass="form-control1" placeholder="请输入管理员名称"></asp:TextBox></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
         <div class="row">
	        <div class="col-sm-3 text-center">密 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</div>
	        <div class="col-sm-6"><asp:TextBox ID="txtPwd" runat="server" TextMode="Password" CssClass="form-control1" placeholder="请输入密码"></asp:TextBox></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
         <div class="row">
	        <div class="col-sm-3 text-center">确&nbsp;&nbsp;认&nbsp;&nbsp;密&nbsp;&nbsp;码：</div>
	        <div class="col-sm-6"><asp:TextBox ID="txtSPwd" runat="server" TextMode="Password" CssClass="form-control1" placeholder="请输入确认密码"></asp:TextBox></div>
	        <div class="col-sm-3">
		        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPwd"
                        ControlToValidate="txtSPwd" ErrorMessage="输入的密码不一致"></asp:CompareValidator>
	        </div>
        </div>
         <div class="row">
	        <div class="col-sm-3 text-center"></div>
	        <div class="col-sm-6">
                <asp:Button ID="btnAdd" runat="server" Text="添加" OnClick="btnAdd_Click" CssClass="form-control1" Width="100"/>
                <asp:Button ID="btnCancel" runat="server" Text="重置" OnClick="btnCancel_Click" CssClass="form-control1" Width="100"/>
	        </div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="gv-search">
             <asp:TextBox ID="txtCondition" runat="server" CssClass="form-control1 form-control1-line"  Width="200" placeholder="请输入要查询的名称"></asp:TextBox>
             <asp:Button ID="btnQuery" runat="server" OnClick="btnQuery_Click" Text="查询" CssClass="form-control1 form-control1-line"  Width="100"/>
        </div>
        <asp:GridView ID="gvUserInfo" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" Font-Size="9pt" ForeColor="#333333" GridLines="None" PageSize="15" OnPageIndexChanging="gvUserInfo_PageIndexChanging" OnRowCancelingEdit="gvUserInfo_RowCancelingEdit" OnRowDeleting="gvUserInfo_RowDeleting" OnRowEditing="gvUserInfo_RowEditing" OnRowUpdating="gvUserInfo_RowUpdating" HorizontalAlign="Center" Width="80%">
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="名称" ReadOnly="True" />
                    <asp:BoundField DataField="Pwd" HeaderText="密码" />
                    <asp:CommandField HeaderText="编辑" ShowEditButton="True" />
                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                </Columns>
                <RowStyle BackColor="#E3EAEB" Height="30px" />
                <EditRowStyle BackColor="#7C6F57" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#1C5E55" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Height="40px" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
    </div>
</asp:Content>
