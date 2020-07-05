<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMasterPage.master" AutoEventWireup="true" CodeFile="AddReader.aspx.cs" Inherits="ReaderManage_AddReader" Title="Untitled Page" EnableEventValidation="false"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .s1 {
            background-image:url('../images/tianjiaxiugaiduzhexinxi.gif');
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
                            <div class="col-sm-3 col-md-2 text-right">读者编号：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtReaderID" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtReader" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</div>
                            <div class="col-sm-6 col-md-6">  
                                <asp:DropDownList ID="ddlSex" runat="server" CssClass="form-control">
                                    <asp:ListItem>男</asp:ListItem>
                                    <asp:ListItem>女</asp:ListItem>
                                </asp:DropDownList></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">读者类型：</div>
                            <div class="col-sm-6 col-md-6"><asp:DropDownList ID="ddlRType" runat="server" CssClass="form-control"></asp:DropDownList></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">出生日期：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtBirthday" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4">（格式为2018-01-01）</div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">证件类型：</div>
                            <div class="col-sm-6 col-md-6">
                                <asp:DropDownList ID="ddlPaperType" runat="server" CssClass="form-control">
                                    <asp:ListItem>身份证</asp:ListItem>
                                    <asp:ListItem>学生证</asp:ListItem>
                                    <asp:ListItem>军官证</asp:ListItem>
                                    <asp:ListItem>工作证</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">证件号码：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtPaperNum" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtTel" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">注册日期：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtDate" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4">（格式为2018-01-01）</div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">操&nbsp;&nbsp;作&nbsp;&nbsp;员：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtOper" runat="server" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</div>
                            <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></div>
                            <div class="col-sm-3 col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3 col-md-2 text-right"></div>
                            <div class="col-sm-6 col-md-6">
                                <asp:Button ID="btnAdd" runat="server" Enabled="False" OnClick="btnAdd_Click" Text="添加" CssClass="form-control custom-btn"/>
                                &nbsp;
                                <asp:Button ID="btnSave" runat="server" Text="修改" OnClick="btnSave_Click" Enabled="False" CssClass="form-control custom-btn"/>
                                &nbsp;
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

