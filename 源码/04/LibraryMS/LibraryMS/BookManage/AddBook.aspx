<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMasterPage.master" AutoEventWireup="true" CodeFile="AddBook.aspx.cs" Inherits="BookManage_AddBook" Title="Untitled Page" EnableEventValidation="false"%>
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
                            <div class="col-sm-3 col-md-2 text-right">条&nbsp;&nbsp;形&nbsp;&nbsp;码：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtBCode" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">图书名称：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtBName" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">图书类型：</div>
                            <div class="col-sm-6 col-md-6"><asp:DropDownList ID="ddlBType" runat="server" CssClass="form-control"></asp:DropDownList></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtAuthor" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">译&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtTranslator" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">出&nbsp;&nbsp;版&nbsp;&nbsp;社：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtPub" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtPage" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">书&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;架：</div>
                            <div class="col-sm-6 col-md-6"><asp:DropDownList ID="ddlBCase" runat="server" CssClass="form-control"></asp:DropDownList></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">库存数量：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtStorage" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">入馆时间：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtInTime" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4">（格式为2016-01-01）</div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">操&nbsp;&nbsp;作&nbsp;&nbsp;员：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtOper" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right"></div>
                            <div class="col-sm-6 col-md-6">
                                <asp:Button ID="btnAdd" runat="server" Enabled="False" OnClick="btnAdd_Click" Text="添加" CssClass="form-control custom-btn"/>
                                &nbsp;
                                <asp:Button ID="btnSave" runat="server" Text="修改" OnClick="btnSave_Click" Enabled="False" CssClass="form-control custom-btn"/>
                                &nbsp;
                                <asp:Button ID="btnCancel" runat="server" Text="取消" OnClick="btnCancel_Click" CssClass="form-control custom-btn"/></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="custom-col-foot-bg-s"></div>
        </div>
    </div>
</asp:Content>

