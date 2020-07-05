<%@ Page Language="C#" AutoEventWireup="true" CodeFile="issuanceFreight.aspx.cs" Inherits="issuanceFreight" %>
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
                    <asp:DropDownList ID="ddldSf" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddldSf_SelectedIndexChanged" CssClass="form-control form-control-clear" Width="120px"></asp:DropDownList>
                    &nbsp;<asp:DropDownList ID="ddldCs" runat="server" CssClass="form-control form-control-clear" Width="150px"><asp:ListItem>选择城市</asp:ListItem></asp:DropDownList>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">货物种类：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtFreightType" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">货物重量：</div>
                <div class="col-sm-5 col-xs-5">
                    <asp:TextBox ID="txtFreightWeight" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-4 col-xs-4">
                    <asp:RadioButton ID="rdibtnDun" runat="server" Text="吨" CssClass="form-control-radio" Checked="True" GroupName="weight" Width="50"/>
                    &nbsp;<asp:RadioButton ID="rdibtnFan" runat="server" Text="方" CssClass="form-control-radio" GroupName="weight" Width="50"/>
                    &nbsp;<asp:RadioButton ID="rdibtnJian" runat="server" Text="件" CssClass="form-control-radio" GroupName="weight" Width="50"/>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">联&nbsp;&nbsp;系&nbsp;&nbsp;人：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtLinkman" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">联系电话：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">有效日期：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtTerm" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</div>
                <div class="col-sm-8 col-xs-8">                   
                    <asp:TextBox ID="txtContent" runat="server" Height="146px" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3"></div>
                <div class="col-sm-8 col-xs-8"><asp:Button ID="btnIssuance" runat="server" Text="发 布" Width="100px" OnClick="btnIssuance_Click" CssClass="form-control btn-danger"/></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
        </div>
    </form>
</body>
</html>
