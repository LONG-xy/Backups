<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="InfoAdd.aspx.cs" Inherits="InfoAdd" Title="供求信息---信息免费发布" %>
<%@ Register Src="UserControl/RecommendInfo.ascx" TagName="RecommendInfo" TagPrefix="uc2" %>
<asp:Content runat="server" ID="head1" ContentPlaceHolderID="head">
    <link href="../css/infoAdd.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row custom-add-row">
        <div class="col-md-2 text-center custom-add-title"><label class="control-label" for = "name">信息类别</label> </div>
        <div class="col-md-6">
            <div class = "input-group">
                <asp:DropDownList ID="DropDownList1" runat="server" Width="121px" CssClass="form-control">
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
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
    <div class="row custom-add-row">
        <div class="col-md-2 text-center custom-add-title"><label class="control-label" for = "tel">信息标题</label> </div>
        <div class="col-md-6"> 
            <div class = "input-group">                 
                <asp:TextBox ID="txtTitle" CssClass="form-control" runat="server" Width="337px"></asp:TextBox>                
            </div>             
        </div> 
        <div class="col-md-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="* 必填项"></asp:RequiredFieldValidator></div>
    </div>
    <div class="row custom-add-row">
        <div class="col-md-2 text-center custom-add-title"><label class="control-label" for = "idCard">信息内容</label> </div>
        <div class="col-md-6"> 
            <div class = "input-group"> 
                <asp:TextBox ID="txtInfo" CssClass="form-control" runat="server" Height="147px" TextMode="MultiLine" Width="360px"></asp:TextBox>                
            </div>             
        </div> 
        <div class="col-md-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtInfo" ErrorMessage="* 必填项"></asp:RequiredFieldValidator></div>
    </div>
    <div class="row custom-add-row">
        <div class="col-md-2 text-center custom-add-title"><label class="control-label" for = "profession">联系人</label> </div>
        <div class="col-md-6"> 
            <div class = "input-group">                 
                <asp:TextBox ID="txtLinkMan" CssClass="form-control" runat="server"></asp:TextBox>                
            </div>             
        </div>
        <div class="col-md-3"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLinkMan" ErrorMessage="* 必填项"></asp:RequiredFieldValidator></div>
    </div>
    <div class="row custom-add-row">
        <div class="col-md-2 text-center custom-add-title"><label class="control-label" for = "profession">联系电话</label> </div>
        <div class="col-md-6"> 
            <div class = "input-group">                 
                <asp:TextBox ID="txtTel" CssClass="form-control" runat="server"></asp:TextBox>                
            </div>           
        </div>
        <div class="col-md-3">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTel" ErrorMessage="格式：(3/4位)-（7/8位）" ValidationExpression="(\(\d{3,4}\)|\d{3,4}-)?\d{7,8}"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTel" ErrorMessage="* 必填项"></asp:RequiredFieldValidator></div>
    </div>
    <div class="row form-group custom-add-row"> 
        <div class="col-sm-2 col-sm-offset-2"> 
            <asp:ImageButton ID="imgBtnAdd" runat="server" AlternateText="发布信息" Height="46px"
                    OnClick="imgBtnAdd_Click" Width="145px" ImageUrl="images/kaishifa.jpg" />
        </div>    
    </div> 
</asp:Content>
