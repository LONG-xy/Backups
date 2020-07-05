<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeaguerInfo.aspx.cs" Inherits="BackGround_LeaguerInfo" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <script type="text/javascript" src="../Scripts/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .row {
            margin-top:20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <div class="container">
                <div class="row">
                    <div class="col-xs-2 text-center custom-add-title"><label class="control-label">信息类别</label> </div>
                    <div class="col-xs-6">
                        <div class = "input-group">
                            <asp:DropDownList ID="ddlType" runat="server" Width="151px" CssClass="form-control">
                                <asp:ListItem>招聘信息</asp:ListItem>
                                <asp:ListItem>求职信息</asp:ListItem>
                                <asp:ListItem>培训信息</asp:ListItem>
                                <asp:ListItem>家教信息</asp:ListItem>
                                <asp:ListItem>公寓信息</asp:ListItem>
                                <asp:ListItem>物品求购</asp:ListItem>
                                <asp:ListItem>物品出售</asp:ListItem>
                                <asp:ListItem>求兑出兑</asp:ListItem>
                                <asp:ListItem>车辆信息</asp:ListItem>
                                <asp:ListItem>寻求合作</asp:ListItem>
                                <asp:ListItem>企业广告</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="chkRecommend" runat="server" Text="是否为推荐信息" />
                        </div>
                    </div>
                    <div class="col-xs-3"></div>
                </div>
                <div class="row">
                    <div class="col-xs-2 text-center custom-add-title"><label class="control-label">信息标题</label></div>
                    <div class="col-xs-6"> 
                        <div class = "input-group">
                            <asp:TextBox ID="txtTitle" runat="server" Width="390px" CssClass="form-control"></asp:TextBox>
                        </div>             
                    </div> 
                    <div class="col-xs-3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtTitle" ErrorMessage="* 必填项"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-2 text-center custom-add-title"><label class="control-label">信息内容</label> </div>
                    <div class="col-xs-6"> 
                        <div class = "input-group">
                            <asp:TextBox ID="txtInfo" runat="server" Height="138px" TextMode="MultiLine" Width="391px" CssClass="form-control"></asp:TextBox>
                        </div>             
                    </div> 
                    <div class="col-xs-3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtInfo" ErrorMessage="* 必填项"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-2 text-center custom-add-title"><label class="control-label">联系人</label></div>
                    <div class="col-xs-6"> 
                        <div class = "input-group"><asp:TextBox ID="txtLinkMan" runat="server" CssClass="form-control"></asp:TextBox></div>             
                    </div>
                    <div class="col-xs-3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtLinkMan" ErrorMessage="* 必填项"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-2 text-center custom-add-title"><label class="control-label">联系电话</label> </div>
                    <div class="col-xs-6"> 
                        <div class = "input-group"><asp:TextBox ID="txtTel" runat="server" CssClass="form-control"></asp:TextBox></div>           
                    </div>
                    <div class="col-xs-3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTel" ErrorMessage="* 必填项"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-2 text-center custom-add-title"><label class="control-label">有效天数</label> </div>
                    <div class="col-xs-6"> 
                        <div class = "input-group">
                            <asp:TextBox ID="txtDay" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>           
                    </div>
                    <div class="col-xs-3">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtDay" ErrorMessage="* 必填项"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtDay" ErrorMessage="(只能输入整数)" MaximumValue="100" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </div>
                </div>
                <div class="row form-group"> 
                <div class="col-sm-2 col-sm-offset-2 text-center"> 
                    <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="发布信息" Height="46px" OnClick="imgBtnAdd_Click" Width="145px" ImageUrl="images/kaishifa.jpg" />
                </div> 
            </div> 
        </div>
    </form>
</body>
</html>
