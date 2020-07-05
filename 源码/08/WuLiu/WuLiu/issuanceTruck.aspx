<%@ Page Language="C#" AutoEventWireup="true" CodeFile="issuanceTruck.aspx.cs" Inherits="issuanceTruck" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <script src="Scripts/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="css/issuance.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container issuance-right">
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">出&nbsp;&nbsp;发&nbsp;&nbsp;地：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:DropDownList ID="ddlcSf" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlcSf_SelectedIndexChanged" CssClass="form-control form-control-clear" Width="120"></asp:DropDownList>
                    &nbsp;<asp:DropDownList ID="ddlcCs" runat="server" CssClass="form-control form-control-clear" Width="150"><asp:ListItem>选择城市</asp:ListItem></asp:DropDownList>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">到&nbsp;&nbsp;达&nbsp;&nbsp;地：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:DropDownList ID="ddldSf" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddldSf_SelectedIndexChanged" CssClass="form-control form-control-clear" Width="120"></asp:DropDownList>
                    &nbsp;<asp:DropDownList ID="ddldCs" runat="server" CssClass="form-control form-control-clear" Width="150"><asp:ListItem>选择城市</asp:ListItem></asp:DropDownList>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:DropDownList ID="ddlTruckType" runat="server" CssClass="form-control" Width="150">
                        <asp:ListItem>普通</asp:ListItem>
                        <asp:ListItem>高栏</asp:ListItem>
                        <asp:ListItem>箱式</asp:ListItem>
                        <asp:ListItem>拖挂</asp:ListItem>
                        <asp:ListItem>平板</asp:ListItem>
                        <asp:ListItem>冷藏</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;长：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:TextBox ID="txtTruckLong" runat="server" CssClass="form-control form-control-clear"></asp:TextBox> 米
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">载&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;重：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:TextBox ID="txtLoad" runat="server" CssClass="form-control form-control-clear"></asp:TextBox> 吨
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">联&nbsp;&nbsp;系&nbsp;&nbsp;人：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:TextBox ID="txtLinkman" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">联系电话：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">有效时间：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:TextBox ID="txtTerm" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:TextBox ID="txtContent" runat="server" Height="146px" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3"></div>
                <div class="col-sm-8 col-xs-8">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发 布" CssClass="form-control btn-danger" Width="100"/>
                </div>
                <div class="col-sm-1 col-md-1"></div>
            </div>
        </div>
    </form>
</body>
</html>
