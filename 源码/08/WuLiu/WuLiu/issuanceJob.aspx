<%@ Page Language="C#" AutoEventWireup="true" CodeFile="issuanceJob.aspx.cs" Inherits="issuanceJob" %>
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
                <div class="col-sm-3 col-xs-3 text-center">招聘职位：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtJob" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">招聘人数：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtNumber" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">要求性别：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:DropDownList ID="ddlSex" runat="server" CssClass="form-control">
                        <asp:ListItem>不限</asp:ListItem>
                        <asp:ListItem>男</asp:ListItem>
                        <asp:ListItem>女</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">要求年龄：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtAge" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">要求学历：</div>
                <div class="col-sm-8 col-xs-8">
                    <asp:DropDownList ID="ddlKnowledge" runat="server" CssClass="form-control">
                        <asp:ListItem>不限</asp:ListItem>
                        <asp:ListItem>高中</asp:ListItem>
                        <asp:ListItem>中专</asp:ListItem>
                        <asp:ListItem>大专</asp:ListItem>
                        <asp:ListItem>本科</asp:ListItem>
                        <asp:ListItem>研究生</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">要求专业：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtSpecialty" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">工作经验：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtExperience" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">工作城市：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">月薪：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtPay" runat="server" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center">详细信息：</div>
                <div class="col-sm-8 col-xs-8"><asp:TextBox ID="txtParticularInfo" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
            <div class="row">
                <div class="col-sm-3 col-xs-3 text-center"></div>
                <div class="col-sm-8 col-xs-8"><asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="发　布" CssClass="form-control btn-danger"/></div>
                <div class="col-sm-1 col-xs-1"></div>
            </div>
        </div>
    </form>
</body>
</html>
