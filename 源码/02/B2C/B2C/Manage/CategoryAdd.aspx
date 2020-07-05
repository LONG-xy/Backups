<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manage/admin.master" CodeFile="CategoryAdd.aspx.cs" Inherits="Manage_CategoryAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>添加商品类别</title>
    <style>
        .custom-add-row {
            margin-top:10px;
        }
        .custom-control-cell {
            display:table-cell;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>添加商品类别</h3>
    <div class="row custom-add-row">
        <div class="col-sm-2 col-md-2 text-right">
            类别名：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:TextBox id="txtName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row custom-add-row">
        <div class="col-sm-2 col-md-2 text-right">
            图像：
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:DropDownList ID="ddlUrl" runat="server" OnSelectedIndexChanged="ddlUrl_SelectedIndexChanged" AutoPostBack="True"  CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row" style="margin-top:5px;">
        <div class="col-sm-2 col-md-2 text-right">
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:ImageMap ID="ImageMapPhoto" runat="server" AlternateText="请选择商品图片"></asp:ImageMap>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row custom-add-row">
        <div class="col-sm-2 col-md-2 text-right">
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:Button id="btnSave" runat="server" Text="保存" OnClick="btnSave_Click" CssClass="form-control" Width="80"></asp:Button>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
</asp:Content>