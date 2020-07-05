<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manage/admin.master" CodeFile="EditProduct.aspx.cs" Inherits="Manger_EditProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>商品详细信息</title>
    <style>
        .custom-edit-row {
            margin-top:10px;
        }
        .custom-control-cell {
            display:table-cell;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>商品详细信息</h3>
    <div class="row custom-edit-row">
        <div class="col-sm-2 col-md-2 text-right">
            所属类别：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:DropDownList id="ddlCategory" runat="server" AutoPostBack="True" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row custom-edit-row">
        <div class="col-sm-2 col-md-2 text-right">
            商品名称：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:textbox id="txtName" runat="server" CssClass="form-control"></asp:textbox>
        </div>
        <div class="col-sm-3 col-md-3">
            <FONT color="red">
                *<asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" Font-Size="9pt">请输入商品名称</asp:RequiredFieldValidator>
            </FONT>
        </div>
    </div>
    <div class="row custom-edit-row">
        <div class="col-sm-2 col-md-2 text-right">
            编注：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:textbox id="txtAuthor" runat="server" CssClass="form-control"></asp:textbox>
            
        </div>
        <div class="col-sm-3 col-md-3">
            <FONT color="red">
                *<asp:RequiredFieldValidator ID="rfvAuthor" runat="server" ControlToValidate="txtAuthor" Font-Size="9pt">请输入编注</asp:RequiredFieldValidator>
            </FONT>
        </div>
    </div>
    <div class="row custom-edit-row">
        <div class="col-sm-2 col-md-2 text-right">
            商城：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:textbox id="txtCompany" runat="server" CssClass="form-control"></asp:textbox>
        </div>
        <div class="col-sm-3 col-md-3">
            <FONT color="red">
                *<asp:RequiredFieldValidator ID="rfvCompany" runat="server" ControlToValidate="txtCompany" Font-Size="9pt">请输入商城</asp:RequiredFieldValidator>
            </FONT>
        </div>
    </div>
    <div class="row custom-edit-row">
        <div class="col-sm-2 col-md-2 text-right">
            市场价格：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:textbox id="txtMarketPrice" runat="server" CssClass="form-control">0</asp:textbox>
        </div>
        <div class="col-sm-3 col-md-3">
            <FONT color="red">
                *<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMarketPrice" ErrorMessage="请正确输入（格式：1.00）" ValidationExpression="^[0-9]+(.[0-9]{2})?$"></asp:RegularExpressionValidator>
                 <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txtMarketPrice" Font-Size="9pt">请输入市场价格</asp:RequiredFieldValidator>
            </FONT>
        </div>
    </div>
    <div class="row custom-edit-row">
        <div class="col-sm-2 col-md-2 text-right">
            热门价：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:textbox id="txtHotPrice" runat="server" CssClass="form-control">0</asp:textbox>
        </div>
        <div class="col-sm-3 col-md-3">
            <FONT color="red">
                *<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtHotPrice" ErrorMessage="请正确输入（格式：1.00）" ValidationExpression="^[0-9]+(.[0-9]{2})?$"></asp:RegularExpressionValidator>
                 <asp:RequiredFieldValidator ID="rfvHotPrice" runat="server" ControlToValidate="txtHotPrice" Font-Size="9pt">请输入热门价</asp:RequiredFieldValidator>
            </FONT>
        </div>
    </div>
    <div class="row custom-edit-row">
        <div class="col-sm-2 col-md-2 text-right">
             图像：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:DropDownList ID="ddlUrl" runat="server" OnSelectedIndexChanged="ddlUrl_SelectedIndexChanged" AutoPostBack="True" CssClass="form-control"></asp:DropDownList>
            <asp:ImageMap ID="ImageMapPhoto" runat="server" ></asp:ImageMap>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row custom-edit-row">
        <div class="col-sm-2 col-md-2 text-right">
            是否为推荐：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:checkbox id="cbxCommend" runat="server" Checked="True" AutoPostBack="True"></asp:checkbox>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row custom-edit-row">
        <div class="col-sm-2 col-md-2 text-right">
            是否为热门：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:checkbox id="cbxHot" runat="server" Checked="True" AutoPostBack="True"></asp:checkbox>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row custom-edit-row">
        <div class="col-sm-2 col-md-2 text-right">
            是否为最新：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:checkbox id="cbxDiscount" runat="server" Checked="True" AutoPostBack="True"></asp:checkbox>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row custom-edit-row">
        <div class="col-sm-2 col-md-2 text-right">
            简单描述：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:textbox id="txtShortDesc" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:textbox>
        </div>
        <div class="col-sm-3 col-md-3">
            <span style="color: #ff0000">
                *<asp:RequiredFieldValidator ID="rfvShortDesc" runat="server" ControlToValidate="txtShortDesc" Font-Size="9pt">请简单描述商品信息</asp:RequiredFieldValidator>
            </span>
        </div>
    </div>
    <div class="row custom-edit-row">
        <div class="col-sm-2 col-md-2 text-right">

        </div>
        <div class="col-sm-4 col-md-4">
             <asp:button id="btnUpdate" runat="server" Text="修改" OnClick="btnUpdate_Click" CssClass="form-control" Width="80"></asp:button>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
</asp:Content>