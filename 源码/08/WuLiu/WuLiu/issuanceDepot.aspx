<%@ Page Language="C#" AutoEventWireup="true" CodeFile="issuanceDepot.aspx.cs" Inherits="issuanceDepot" %>
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
                <div class="col-sm-3 col-xs-3 text-center">仓储类别：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:DropDownList ID="ddlDepotType" runat="server" CssClass="form-control">
                        <asp:ListItem>普通</asp:ListItem>
                        <asp:ListItem>冷藏</asp:ListItem>
                        <asp:ListItem>液体</asp:ListItem>
                        <asp:ListItem>暖库</asp:ListItem>
                        <asp:ListItem>危险品</asp:ListItem>
                        <asp:ListItem>其它</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">所在城市：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:DropDownList ID="ddldSf" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddldSf_SelectedIndexChanged" Width="120px" CssClass="form-control form-control-clear"></asp:DropDownList> 
                    &nbsp;<asp:DropDownList ID="ddldCs" runat="server" Width="150px" CssClass="form-control form-control-clear"><asp:ListItem>选择城市</asp:ListItem></asp:DropDownList>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">仓库地点：</div>
                <div class="col-sm-6 col-xs-6">
                    <asp:TextBox ID="txtDepotSite" runat="server" CssClass="form-control"></asp:TextBox>                    
                </div>
                <div class="col-sm-3 col-xs-3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*仓库地点不能为空" ControlToValidate="txtDepotSite"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">面积：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:TextBox ID="txtDepotAcreage" runat="server" CssClass="form-control form-control-clear"></asp:TextBox>&nbsp;平方米
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">数量：</div>
                <div class="col-sm-6 col-xs-6">
                    <asp:TextBox ID="txtDepotSum" runat="server" CssClass="form-control form-control-clear"></asp:TextBox>&nbsp;间
                </div>
                <div class="col-sm-3 col-xs-3">
                    <asp:CompareValidator ID="CompareValidatorDepotSum" runat="server" ControlToValidate="txtDepotSum"
                        ErrorMessage="只能输入数字" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">价格：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:TextBox ID="txtDepotPrice" runat="server" CssClass="form-control form-control-clear"></asp:TextBox>&nbsp;元/间
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">配套服务</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:CheckBox ID="ckbLoading" runat="server" Text="装卸" width="90"/>
                    <asp:CheckBox ID="ckbPacking" runat="server" Text="包装" width="90"/>
                    <asp:CheckBox ID="ckbSend" runat="server" Text="配送" width="90"/>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">联系人：</div>
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
                <div class="col-sm-3 col-xs-3 text-center">有效日期：</div>
                <div class="col-sm-6 col-xs-6">
                    <asp:TextBox ID="txtTerm" runat="server" CssClass="form-control"></asp:TextBox>                    
                </div>
                <div class="col-sm-3 col-xs-3">
                    <asp:CompareValidator ID="CompareValidatorTerm" runat="server" ErrorMessage="*日期格式不正确"
                        Operator="DataTypeCheck" Type="Date" ControlToValidate="txtTerm"></asp:CompareValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">备注：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:TextBox ID="txtContent" runat="server" Height="146px" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                </div>
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
