<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMasterPage.master" AutoEventWireup="true" CodeFile="LibraryInfo.aspx.cs" Inherits="SysSet_LibraryInfo" Title="Untitled Page" EnableEventValidation="false"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .s1 {
            background-image:url('../images/tushuguanxinxi.gif');
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
                            <div class="col-sm-3 col-md-2 text-right">图书馆名称：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtLibName" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">馆&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;长：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtCurator" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtTel" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">网&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtUrl" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">建&nbsp;馆&nbsp;时&nbsp;间：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtCDate" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4">（格式为2018-01-01）</div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtIntroduce" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2"></div>
                            <div class="col-sm-6 col-md-6">
                                <asp:Button ID="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" CssClass="form-control custom-btn"/>
                                &nbsp;&nbsp;
                                <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click" CausesValidation="False" CssClass="form-control custom-btn"/></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="custom-col-foot-bg-s"></div>
        </div>
    </div>
</asp:Content>

