<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manage/admin.master"  CodeFile="ProductAdd.aspx.cs" Inherits="Manger_ProductAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>�����Ʒ</title>
    <style>
        .custom-orderlist-search-row {
            margin-top:10px;
        }
        .custom-control-cell {
            display:table-cell;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>��Ʒ���</h3>
    <div class="row custom-orderlist-search-row">
        <div class="col-sm-2 col-md-2 text-right">
            �������
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:DropDownList id="ddlCategory" runat="server" AutoPostBack="True" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row custom-orderlist-search-row">
        <div class="col-sm-2 col-md-2 text-right">
            ��Ʒ���ƣ�
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:textbox id="txtName" runat="server" CssClass="form-control"></asp:textbox>
        </div>
        <div class="col-sm-3 col-md-3">
            <FONT color="red">
                *<asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" Font-Size="9pt"></asp:RequiredFieldValidator>
            </FONT>
        </div>
    </div>
    <div class="row custom-orderlist-search-row">
        <div class="col-sm-2 col-md-2 text-right">
            ��ע��
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:textbox id="txtAuthor" runat="server" CssClass="form-control"></asp:textbox>
        </div>
        <div class="col-sm-3 col-md-3">
            <FONT color="red">
                *<asp:RequiredFieldValidator ID="rfvAuthor" runat="server" ControlToValidate="txtAuthor" Font-Size="9pt"></asp:RequiredFieldValidator>
            </FONT>
        </div>
    </div>
    <div class="row custom-orderlist-search-row">
        <div class="col-sm-2 col-md-2 text-right">
            �̳ǣ�
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:textbox id="txtCompany" runat="server" CssClass="form-control"></asp:textbox>
        </div>
        <div class="col-sm-3 col-md-3">
            <FONT color="red">
                *<asp:RequiredFieldValidator ID="rfvCompany" runat="server" ControlToValidate="txtCompany" Font-Size="9pt"></asp:RequiredFieldValidator>
            </FONT>
        </div>
    </div>
    <div class="row custom-orderlist-search-row">
        <div class="col-sm-2 col-md-2 text-right">
            �г��۸�
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:textbox id="txtMarketPrice" runat="server" CssClass="form-control">0</asp:textbox>
        </div>
        <div class="col-sm-3 col-md-3">
            <FONT color="red">
                *<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMarketPrice" ErrorMessage="����ȷ���루��ʽ��1.00��" ValidationExpression="^[0-9]+(.[0-9]{2})?$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txtMarketPrice" Font-Size="9pt"></asp:RequiredFieldValidator>
            </FONT>
        </div>
    </div>
    <div class="row custom-orderlist-search-row">
        <div class="col-sm-2 col-md-2 text-right">
            ���żۣ�
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:textbox id="txtHotPrice" runat="server" CssClass="form-control">0</asp:textbox>
        </div>
        <div class="col-sm-3 col-md-3">
            <FONT color="red">
                *<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtHotPrice" ErrorMessage="����ȷ���루��ʽ��1.00��" ValidationExpression="^[0-9]+(.[0-9]{2})?$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfvHotPrice" runat="server" ControlToValidate="txtHotPrice" Font-Size="9pt"></asp:RequiredFieldValidator>
            </FONT>
        </div>
    </div>
    <div class="row custom-orderlist-search-row">
        <div class="col-sm-2 col-md-2 text-right">
            ͼ��
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:DropDownList ID="ddlUrl" runat="server" OnSelectedIndexChanged="ddlUrl_SelectedIndexChanged" AutoPostBack="True" CssClass="form-control"></asp:DropDownList>
            <asp:ImageMap ID="ImageMapPhoto" runat="server" > </asp:ImageMap>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row custom-orderlist-search-row">
        <div class="col-sm-2 col-md-2 text-right">
            �Ƿ�Ϊ�Ƽ���
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:checkbox id="cbxCommend" runat="server" Checked="True" AutoPostBack="True"></asp:checkbox>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row custom-orderlist-search-row">
        <div class="col-sm-2 col-md-2 text-right">
            �Ƿ�Ϊ���ţ�
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:checkbox id="cbxHot" runat="server" Checked="True" AutoPostBack="True"></asp:checkbox>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row custom-orderlist-search-row">
        <div class="col-sm-2 col-md-2 text-right">
            �Ƿ�Ϊ���£�
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:checkbox id="cbxDiscount" runat="server" Checked="True" AutoPostBack="True"></asp:checkbox>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row custom-orderlist-search-row">
        <div class="col-sm-2 col-md-2 text-right">
            ��������
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:textbox id="txtShortDesc" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:textbox>
        </div>
        <div class="col-sm-3 col-md-3">
             <span style="color: #ff0000">
                 *<asp:RequiredFieldValidator ID="rfvShortDesc" runat="server" ControlToValidate="txtShortDesc" Font-Size="9pt"></asp:RequiredFieldValidator>
             </span>
        </div>
    </div>
    <div class="row custom-orderlist-search-row">
        <div class="col-sm-2 col-md-2">            
        </div>
        <div class="col-sm-4 col-md-4">
            <asp:button id="btnSave" runat="server" Text="����" OnClick="btnSave_Click" CssClass="form-control custom-control-cell" Width="80"></asp:button>&nbsp;&nbsp;
			<asp:button id="btnReset" runat="server" Text="����"  OnClick="btnReset_Click" CssClass="form-control custom-control-cell" Width="80"></asp:button>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
</asp:Content>