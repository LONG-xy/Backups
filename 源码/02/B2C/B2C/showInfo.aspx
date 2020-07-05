<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="showInfo.aspx.cs" Inherits="showInfo" Title="详细信息页" %>
<asp:Content id="head1" ContentPlaceHolderID="HeadPlaceHolder1"  runat="server">
   <style type="text/css">
       .custom-procuct-show
       {
           margin-top:10px;
       }
    </style> 
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 custom-body-main-content-list">
            <h4><a>商品详细信息</a></h4>
            <div class="row custom-procuct-show">
                <div class="col-xs-4 col-sm-4 col-md-4 text-center">
                    所属类别：
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <asp:Label ID="txtCategory" runat="server"></asp:Label>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-4 col-sm-4 col-md-4 text-center">
                    商品名称：
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <asp:Label id="txtName" runat="server"></asp:Label>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-4 col-sm-4 col-md-4 text-center">
                    备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <asp:Label id="txtAuthor" runat="server"></asp:Label>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-4 col-sm-4 col-md-4 text-center">
                    商&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;城：
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <asp:Label id="txtCompany" runat="server"></asp:Label>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-4 col-sm-4 col-md-4 text-center">
                    市场价格：
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <asp:Label id="txtMarketPrice" runat="server"></asp:Label>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-4 col-sm-4 col-md-4 text-center">
                    热&nbsp;&nbsp;门&nbsp;&nbsp;价：
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <asp:Label id="txtHotPrice" runat="server"></asp:Label>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-4 col-sm-4 col-md-4 text-center">
                    图&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像：
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <asp:ImageMap ID="ImageMapPhoto" runat="server" ImageUrl=""></asp:ImageMap>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-4 col-sm-4 col-md-4 text-center">
                    是否为推荐：
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <asp:checkbox id="cbxCommend" runat="server" Checked="True" AutoPostBack="True" Enabled="false"></asp:checkbox>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-4 col-sm-4 col-md-4 text-center">
                    是否为热门：
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <asp:checkbox id="cbxHot" runat="server" Checked="True" AutoPostBack="True" Enabled="false"></asp:checkbox>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-4 col-sm-4 col-md-4 text-center">
                    是否为最新：
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <asp:checkbox id="cbxDiscount" runat="server" Checked="True" AutoPostBack="True" Enabled="false"></asp:checkbox>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-4 col-sm-4 col-md-4 text-center">
                    简单描述：
                </div>
                <div class="col-xs-8 col-sm-8 col-md-8">
                    <asp:Label id="txtShortDesc" runat="server" Width="307px" Height="89px" TextMode="MultiLine"></asp:Label>
                </div>
            </div>
            <div class="row custom-procuct-show">
                <div class="col-xs-4 col-sm-4 col-md-4">
                    <asp:button id="btnBack" runat="server" Text="返回" OnClick="btnBack_Click" CssClass="form-control" Width="80"></asp:button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

