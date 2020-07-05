<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manager/MasterPage.master" CodeFile="LinkManage.aspx.cs" Inherits="Manager_LinkManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>友情链接管理</h3>
    <div class="container container-row-control1">
        <div class="row">
	        <div class="col-sm-3 text-center">公司名称：</div>
	        <div class="col-sm-6"><asp:TextBox ID="txtName" runat="server" CssClass="form-control1" placeholder="请输入名称"></asp:TextBox></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">公司网址：</div>
	        <div class="col-sm-6"><asp:TextBox ID="txtLAddress" runat="server" CssClass="form-control1" placeholder="请输入名称"></asp:TextBox></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">公司图标：</div>
	        <div class="col-sm-6">
                <asp:Image ID="imgPhoto" runat="server" Height="35px" Width="92px" AlternateText="请上传图片"/>
                &nbsp; &nbsp;&nbsp;
                <asp:FileUpload ID="uploadPhoto" runat="server" Width="205px" />
                &nbsp;
                <asp:Button ID="btnShow" runat="server" OnClick="btnShow_Click" Text="显示" CssClass="form-control1" Width="100"/>
	        </div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center"></div>
	        <div class="col-sm-6">
                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="添加" CssClass="form-control1" Width="100"/>
                <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="修改" CssClass="form-control1" Width="100"/>
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="重置" CssClass="form-control1" Width="100"/>
	        </div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="gv-search">
            <asp:DropDownList ID="ddlCondition" runat="server" CssClass="form-control1 form-control1-line" Width="180">
                <asp:ListItem>公司名称</asp:ListItem>
                <asp:ListItem>公司网址</asp:ListItem>
            </asp:DropDownList>
            &nbsp; &nbsp; 输入查询关键字：<asp:TextBox ID="txtConditon" runat="server" CssClass="form-control1" placeholder="请输入名称" Width="200"></asp:TextBox>
            <asp:Button ID="btnQuery" runat="server" Text="查询" OnClick="btnQuery_Click" CssClass="form-control1 form-control1-line" Width="100"/>
        </div>
        <asp:GridView ID="gvLinkInfo" runat="server" CellPadding="4" Font-Size="9pt" ForeColor="#333333"
            GridLines="None" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gvPInfo_PageIndexChanging" OnRowDeleting="gvPInfo_RowDeleting" Width="80%" OnSelectedIndexChanged="gvPInfo_SelectedIndexChanged" HorizontalAlign="Center">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" Height="30px" />
            <EditRowStyle BackColor="#7C6F57" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#1C5E55" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Height="40px" HorizontalAlign="Center" />
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="公司名称" />
                <asp:BoundField DataField="LAddress" HeaderText="公司网址" />
                <asp:TemplateField HeaderText="选择">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnSelect" runat="server" CommandName="select" Font-Underline="False"
                            ForeColor="Black">选择</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

