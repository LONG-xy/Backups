<%@ Page Language="C#" AutoEventWireup="true" CodeFile="issuanceSpecial.aspx.cs" Inherits="issuanceSpecial" %>
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
                <div class="col-sm-3 col-xs-3 text-center">出发地：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:DropDownList ID="ddlcSf" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlcSf_SelectedIndexChanged" Width="120px" CssClass="form-control form-control-clear"></asp:DropDownList>
                    &nbsp;<asp:DropDownList ID="ddlcCs" runat="server" Width="150px" CssClass="form-control form-control-clear"><asp:ListItem>选择城市</asp:ListItem></asp:DropDownList>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">到达地：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:DropDownList ID="ddldSf" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddldSf_SelectedIndexChanged" Width="120px" CssClass="form-control form-control-clear"></asp:DropDownList>
                    &nbsp;<asp:DropDownList ID="ddldCs" runat="server" Width="150px" CssClass="form-control form-control-clear"><asp:ListItem>选择城市</asp:ListItem></asp:DropDownList>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">线路描述：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtBewrite" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">车型：</div>
                <div class="col-sm-8 col-xs-8">                     
                    <asp:DropDownList ID="ddlTruckType" runat="server" CssClass="form-control">
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
                <div class="col-sm-3 col-xs-3 text-center">车长：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtTruckLong" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">载重：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtLoad" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">专线报价：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtSpecialPrice" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">联系人：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtLinkman" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">联系电话：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">有效时间：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtTerm" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">备注：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center"></div>
                <div class="col-sm-8 col-xs-8">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发 布" Width="100px" CssClass="form-control btn-danger"/>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
        </div>
    </form>
</body>
</html>
