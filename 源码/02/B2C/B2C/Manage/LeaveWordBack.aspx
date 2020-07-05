<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manage/admin.master" CodeFile="LeaveWordBack.aspx.cs" Inherits="Manage_LeaveWordBack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>回复留言</title>
    <style>
        th,td {
            text-align:center;
        }
        .custom-add-row {
            margin-top:10px;
        }
        .custom-control-cell {
            display:table-cell;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>回复留言</h3>
    <div class="row custom-add-row">
        <div class="col-sm-2 col-md-2 text-right">
            回复主题
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:TextBox ID="txtSubject" runat="server" Font-Size="9pt" MaxLength="50" ReadOnly="True" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>    
    <div class="row custom-add-row">
        <div class="col-sm-2 col-md-2 text-right">
            回 复 人
        </div>
        <div class="col-sm-4 col-md-4">
             <asp:TextBox ID="txtUid" runat="server" Font-Size="9pt" MaxLength="50" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-3 col-md-3">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUid" ErrorMessage="姓名不能为空">*</asp:RequiredFieldValidator>
        </div>
    </div> 
    <div class="row custom-add-row">
        <div class="col-sm-2 col-md-2 text-right">
            回复内容
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:TextBox ID="FreeTextBox1" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div> 
    <div class="row custom-add-row">
        <div class="col-sm-2 col-md-2 text-right">
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:Button ID="btnOK" runat="server" Font-Size="9pt" OnClick="btnOK_Click" Text="提交" CssClass="form-control custom-control-cell" Width="80"/>&nbsp;
            <asp:Button ID="btnReset" runat="server" Font-Size="9pt" OnClick="btnReset_Click" Text="重置" CssClass="form-control custom-control-cell" Width="80"/>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div> 
</asp:Content>