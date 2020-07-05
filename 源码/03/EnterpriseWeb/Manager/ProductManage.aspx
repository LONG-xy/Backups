<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manager/MasterPage.master" CodeFile="ProductManage.aspx.cs" Inherits="Manager_ProductManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h3>产品信息管理</h3>
     <div class="container container-row-control1">
        <div class="row">
	        <div class="col-sm-3 text-center">产品名称：</div>
	        <div class="col-sm-8">
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control1" placeholder="请输入产品名称"></asp:TextBox>
	        </div>
	        <div class="col-sm-1">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">图&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片：</div>
	        <div class="col-sm-8"><asp:Image ID="imgPhoto" runat="server" Height="110px" Width="99px" AlternateText="请上传图片"/>                
                <asp:FileUpload ID="uploadPhoto" runat="server"/>
                <asp:Button ID="btnShow" runat="server" OnClick="btnShow_Click" Text="显示"  CssClass="form-control1 form-control1-line" Width="80px"/>
	        </div>
	        <div class="col-sm-1">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">版&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本：</div>
	        <div class="col-sm-8"><asp:TextBox ID="txtEdition" runat="server" CssClass="form-control1" placeholder="请输入版本"></asp:TextBox></div>
	        <div class="col-sm-1">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：</div>
	        <div class="col-sm-8"><asp:TextBox ID="txtPrice" runat="server" CssClass="form-control1" placeholder="请输入价格"></asp:TextBox></div>
	        <div class="col-sm-1">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</div>
	        <div class="col-sm-8">
                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control1 form-control1-line">
                    <asp:ListItem>C#+ASP.NET</asp:ListItem>
                    <asp:ListItem>Java+JSP</asp:ListItem>
                    <asp:ListItem>ASP+PHP</asp:ListItem>
                    <asp:ListItem>VC++</asp:ListItem>
                    <asp:ListItem>VB</asp:ListItem>
                    <asp:ListItem>Delphi</asp:ListItem>
                </asp:DropDownList>
	        </div>
	        <div class="col-sm-1">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">运行环境：</div>
	        <div class="col-sm-8"><asp:TextBox ID="txtEnvironment" runat="server" CssClass="form-control1" placeholder="请输入运行环境"></asp:TextBox></div>
	        <div class="col-sm-1">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">介&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;绍：</div>
	        <div class="col-sm-8"><asp:TextBox ID="txtIntroduce" runat="server" TextMode="MultiLine" CssClass="form-control1" placeholder="请输入介绍信息"></asp:TextBox></div>
	        <div class="col-sm-1">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</div>
	        <div class="col-sm-8"><asp:TextBox ID="txtRemark" runat="server" TextMode="MultiLine" CssClass="form-control1" placeholder="请输入备注"></asp:TextBox></div>
	        <div class="col-sm-1">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center"></div>
	        <div class="col-sm-8 text-center">
                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="添加" CssClass="form-control1" Width="100"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="修改" CssClass="form-control1" Width="100"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="重置" CssClass="form-control1" Width="100"/>
	        </div>
	        <div class="col-sm-1">
		        <p class="help-block"></p>
	        </div>
        </div>        
    </div>
    <div class="panel-body">
        <div class="gv-search">
            <asp:TextBox ID="txtCondition" runat="server" CssClass="form-control1 form-control1-line" placeholder="请输入要查询的产品" Width="200"></asp:TextBox>
            <asp:Button ID="btnQuery" runat="server" Text="查询" OnClick="btnQuery_Click" CssClass="form-control1 form-control1-line"  Width="100"/>	        
        </div>
        <asp:GridView ID="gvPInfo" runat="server" CellPadding="4" Font-Size="9pt" ForeColor="#333333"
                        GridLines="None" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gvPInfo_PageIndexChanging" OnRowDeleting="gvPInfo_RowDeleting" 
            Width="80%" OnSelectedIndexChanged="gvPInfo_SelectedIndexChanged" HorizontalAlign="Center">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" Height="30px" />
            <EditRowStyle BackColor="#7C6F57" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#1C5E55" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Height="40px" HorizontalAlign="Center" />
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="产品名称" />
                <asp:BoundField DataField="Edition" HeaderText="版本" />
                <asp:BoundField DataField="Price" HeaderText="价格" />
                <asp:BoundField DataField="Introduce" HeaderText="介绍" />
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
