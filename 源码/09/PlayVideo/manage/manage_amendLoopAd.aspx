<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/manage/MasterPage.master" CodeFile="manage_amendLoopAd.aspx.cs" Inherits="manage_amendLoopAd" %>
<asp:Content  ContentPlaceHolderID="head" ID="HeadHoder" runat="server">
    <style>
        .grid {
            margin-top:10px;
            margin-bottom:10px;
        }
    </style>
    <link href="../css/pages/plans.css" rel="stylesheet" /> 
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="BodyHoder" runat="server">
    <h1 class="page-title">
		<i class="icon-home"></i>
		当前位置：修改循环广告					
	</h1>
    <div class="widget widget-table">										
		<div class="widget-header">
			<i class="icon-th-list"></i>
			<h3>信息列表</h3>
		</div> <!-- /widget-header -->					
		<div class="widget-content">
            <asp:GridView ID="gvImg" runat="server" AutoGenerateColumns="False" CssClass="grid"
                Width="95%" AllowPaging="True" OnPageIndexChanging="gvImg_PageIndexChanging" PageSize="3" OnSelectedIndexChanging="gvImg_SelectedIndexChanging" 
                CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="图片">
                        <ItemTemplate>
                            <img align="middle" border="1"  src='../<%#Eval("videoPicture") %>' style="height: 127px;" width="150" />
                        </ItemTemplate>
                        <ItemStyle Width="150px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="图片名">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="48px">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField HeaderText="保存" SelectText="保存" ShowSelectButton="True" />
                </Columns>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                       
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                       
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
