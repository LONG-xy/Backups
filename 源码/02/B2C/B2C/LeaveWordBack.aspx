<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LeaveWordBack.aspx.cs" Inherits="LeaveWordBack" Title="回复留言"%>
<asp:Content id="head1" ContentPlaceHolderID="HeadPlaceHolder1"  runat="server">
   <style type="text/css">
       .custom-cart-feedback 
       {
           margin-top:10px;
       }
       .custom-btn {
           display:table-cell;
       }
   </style> 
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 custom-body-main-content-list">
            <h4><a>回复留言</a></h4>
            <div class="row custom-cart-feedback">
                <div class="col-xs-3 col-sm-3 col-md-2">
                    <span>回复主题</span>
                </div>
                <div class="col-xs-6 col-sm-5 col-md-5">
                    <asp:TextBox ID="txtSubject" runat="server" Font-Size="9pt" MaxLength="50" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3">

                </div>
            </div>
            <div class="row custom-cart-feedback">
                <div class="col-xs-3 col-sm-3 col-md-2">
                    <span>回 复 人</span>
                </div>
                <div class="col-xs-6 col-sm-5 col-md-5">
                    <asp:TextBox ID="txtUid" runat="server" Font-Size="9pt" MaxLength="50" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUid" ErrorMessage="姓名不能为空">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row custom-cart-feedback">
                <div class="col-xs-3 col-sm-3 col-md-2">
                    <span>回复内容</span>
                </div>
                <div class="col-xs-6 col-sm-5 col-md-5">
                    <asp:TextBox ID="FreeTextBox1" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3">

                </div>
            </div>
            <div class="row custom-cart-feedback">
                <div class="col-xs-3 col-sm-3 col-md-2">
                    <span></span>
                </div>
                <div class="col-xs-6 col-sm-5 col-md-5">
                     <asp:Button ID="btnOK" runat="server" Font-Size="9pt"  Width="80" OnClick="btnOK_Click" Text="提交" CssClass="custom-btn form-control"/>&nbsp;
                     <asp:Button ID="btnReset" runat="server" Font-Size="9pt" Width="80" OnClick="btnReset_Click" Text="重置" CausesValidation="False" CssClass="custom-btn form-control"/>&nbsp;
                     <asp:Button ID="btnBack" runat="server" Font-Size="9pt" Width="80" OnClick="btnBack_Click" Text="返回" CausesValidation="False" CssClass="custom-btn form-control"/>&nbsp;
                </div>
            </div>
        </div>
    </div>
</asp:Content>
