<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpdateMember.aspx.cs" Inherits="UpdateMember" Title="Untitled Page" %>
<asp:Content id="head1" ContentPlaceHolderID="HeadPlaceHolder1"  runat="server">
   <style type="text/css">
       .custom-user-info
       {
           margin-top:10px;
       }
        .custom-btn {
           display:table-cell;
       }
    </style> 
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 custom-body-main-content-list">
            <h4><a>更新会员信息</a></h4>
             <div class="row custom-user-info">
                <div class="col-xs-2 col-sm-2 col-md-2">
                    用户名：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:textbox id="txtName" runat="server"  MaxLength="50" CssClass="form-control"></asp:textbox>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <font color="red">*</font>
                </div>
            </div>
            <div class="row custom-user-info">
                <div class="col-xs-2 col-sm-2 col-md-2">
                    密 码：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:textbox id="txtPassword" runat="server"  MaxLength="50" CssClass="form-control"></asp:textbox>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <font color="red">*</font>
                </div>
            </div>
            <div class="row custom-user-info">
                <div class="col-xs-2 col-sm-2 col-md-2">
                    性别：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:dropdownlist id="ddlSex" runat="server" CssClass="form-control">
						<asp:ListItem Value="0">女</asp:ListItem>
                        <asp:ListItem Selected="True" Value="1">男</asp:ListItem> 
                    </asp:dropdownlist>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                </div>
            </div>
            <div class="row custom-user-info">
                <div class="col-xs-2 col-sm-2 col-md-2">
                    真实姓名：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:textbox id="txtTrueName" runat="server"  MaxLength="50" CssClass="form-control"></asp:textbox>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <font color="red">*</font>
                </div>
            </div>
            <div class="row custom-user-info">
                <div class="col-xs-2 col-sm-2 col-md-2">
                    邮编：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:textbox id="txtPostCode" runat="server"  MaxLength="50" CssClass="form-control"></asp:textbox>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <font color="red">*</font>
                </div>
            </div>
            <div class="row custom-user-info">
                <div class="col-xs-2 col-sm-2 col-md-2">
                    固定电话号码：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:textbox id="txtPhone" runat="server"  MaxLength="50" CssClass="form-control"></asp:textbox>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <font color="red">*</font>
                </div>
            </div>
            <div class="row custom-user-info">
                <div class="col-xs-2 col-sm-2 col-md-2">
                    e-mail：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:textbox id="txtEmail" runat="server"  MaxLength="80" CssClass="form-control"></asp:textbox>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <font color="red">*</font>
                </div>
            </div>
            <div class="row custom-user-info">
                <div class="col-xs-2 col-sm-2 col-md-2">
                    详细住址：
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:textbox id="txtAddress" runat="server"  MaxLength="100" TextMode="MultiLine" CssClass="form-control"></asp:textbox>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <span style="color: #ff0000">*</span>
                </div>
            </div>
            <div class="row custom-user-info">
                <div class="col-xs-2 col-sm-2 col-md-2">
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <asp:button id="btnUpdate" runat="server" Text="更新" OnClick="btnUpdate_Click" Width="80" CssClass="form-control custom-btn"></asp:button>&nbsp;&nbsp;
					<asp:Button ID="btnReset" runat="server" Text="重置" OnClick="btnReset_Click" Width="80" CssClass="form-control custom-btn"></asp:button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>





