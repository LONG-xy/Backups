<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMasterPage.master" AutoEventWireup="true" CodeFile="ChanagePwd.aspx.cs" Inherits="Common_ChanagePwd" Title="Untitled Page" EnableEventValidation="false"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .s1 {
            background-image:url('../images/tianjiaxiugaitushuxinxi.gif');
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="custom-col-content-img-s s1"></div>        
            <div class="custom-col-content-s">
                <div class="custom-col-content-s-list">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">管理员名称：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtName" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">原密码：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtYPwd" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">新密码：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtXPwd" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">确认新密码：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtSXPwd" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtXPwd"
                                    ControlToValidate="txtSXPwd" ErrorMessage="密码输入不一致" Font-Size="9pt"></asp:CompareValidator></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right"></div>
                            <div class="col-sm-6 col-md-6">
                                <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" CssClass="form-control custom-btn"/>
                                 &nbsp;
                                <asp:Button ID="btnCancel" runat="server" Text="重置" OnClick="btnCancel_Click" CausesValidation="False" CssClass="form-control custom-btn"/></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

