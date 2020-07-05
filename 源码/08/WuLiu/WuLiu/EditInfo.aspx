<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditInfo.aspx.cs" Inherits="EditInfo" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="Scripts/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="css/issuance.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container issuance-right">
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">联系人：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtLinkman" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">企业名称：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">公司性质：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:DropDownList ID="ddlKind" Width="70%" runat="server" CssClass="form-control">
                        <asp:ListItem>私企</asp:ListItem>
                        <asp:ListItem>国企</asp:ListItem>
                        <asp:ListItem>外资</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">所属行业：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtCalling" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">营业执照号：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtLicenceNumber" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">公司地址：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">联系电话：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">传真：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtFax" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">E-mail：</div>
                <div class="col-sm-6 col-xs-6"><asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-3 col-xs-3">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                            Display="Dynamic" ErrorMessage="*E-mail格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">公司网址：</div>
                <div class="col-sm-6 col-xs-6"><asp:TextBox ID="txtNetworkIP" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-3 col-xs-3">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtNetworkIP"
                            Display="Dynamic" ErrorMessage="*网址格式不正确" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?"
                            Width="127px"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">公司介绍：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center"></div>
                <div class="col-sm-8 col-xs-8"><asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="修  改" Width="100px" CssClass="form-control btn-danger"/></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
        </div>
    </form>
</body>
</html>
