<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manager/MasterPage.master" CodeFile="BoardAndNewManage.aspx.cs" Inherits="Manager_BoardAndNewManage" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3><asp:Label ID="labTitle" runat="server"></asp:Label></h3>    
    <div class="container container-row-control1">
        <div class="row">
	        <div class="col-sm-3 text-center">标题：</div>
	        <div class="col-sm-6"><asp:TextBox ID="txtTitle" runat="server" CssClass="form-control1" placeholder="请输入标题"></asp:TextBox></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">内容：</div>
	        <div class="col-sm-6">
                <FTB:FreeTextBox id="FreeTextBox1" runat="Server" Language="zh-cn"  SupportFolder="../aspnet_client/FreeTextBox/" Height="190px" Width="635px" HtmlModeDefaultsToMonoSpaceFont="True" DownLevelCols="50" DownLevelRows="10" ButtonDownImage="False" GutterBackColor="LightSteelBlue" ToolbarBackgroundImage="True" ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu|Bold,Italic,Underline,Strikethrough;Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage,InsertRule|Cut,Copy,Paste;Undo,Redo,Print" ToolbarStyleConfiguration="NotSet" />
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
            <asp:TextBox ID="txtCondition" runat="server" CssClass="form-control1 form-control1-line" Width="200" placeholder="请输入要查询的名称"></asp:TextBox>
            <asp:Button ID="btnQuery" runat="server" OnClick="btnQuery_Click" Text="查询" CssClass="form-control1 form-control1-line"  Width="100"/>
        </div>
        <asp:GridView ID="gvBNInfo" runat="server" CellPadding="4" Font-Size="9pt" ForeColor="#333333"
                GridLines="None" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gvBNInfo_PageIndexChanging" OnRowDeleting="gvBNInfo_RowDeleting" Width="80%" OnSelectedIndexChanged="gvBNInfo_SelectedIndexChanged" HorizontalAlign="Center">
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" Height="30px" />
                <EditRowStyle BackColor="#7C6F57" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#1C5E55" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Height="40px" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="标题" />
                    <asp:BoundField DataField="DeliverTime" HeaderText="发布时间" />
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
