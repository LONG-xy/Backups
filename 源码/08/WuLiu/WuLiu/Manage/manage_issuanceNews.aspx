<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="MasterPage.master" CodeFile="manage_issuanceNews.aspx.cs" Inherits="Manage_manage_issuanceNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <h2 class="title">发布新闻信息</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            &nbsp;
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="row">
                                <div class="col-sm-3 col-md-2 text-center">新闻标题</div>
                                <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtNewsTitle" CssClass="form-control" runat="server"></asp:TextBox></div>
                                <div class="col-sm-3 col-md-4"></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 col-md-2 text-center">新闻内容</div>
                                <div class="col-sm-6 col-md-6"><asp:TextBox ID="txtNewsContent" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></div>
                                <div class="col-sm-3 col-md-4"></div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 col-md-2 text-center"></div>
                                <div class="col-sm-6 col-md-6"><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发　布" CssClass="btn btn-primary" Width="100"/></div>
                                <div class="col-sm-3 col-md-4"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>