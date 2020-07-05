<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/manage/MasterPage.master" CodeFile="manage_film.aspx.cs" Inherits="manage_manage_film" %>
<asp:Content  ContentPlaceHolderID="head" ID="HeadHoder" runat="server">
    <style>
        .grid {
            margin-top:10px;
            margin-bottom:10px;
        }
        .RadioButtonList tr td {
            padding:20px 20px 0;
        }
        .RadioButtonList tr td label {
            padding-bottom:2px;
        }
        .RadioButtonList tr td input,.RadioButtonList tr td label{
            float:left;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="BodyHoder" runat="server">
    <h1 class="page-title">
		<i class="icon-home"></i>
		当前位置：电影视频管理					
	</h1>
    <div class="widget widget-table">										
		<div class="widget-header">
			<i class="icon-th-list"></i>
			<h3>视频列表</h3>
		</div> <!-- /widget-header -->					
		<div class="widget-content">
            <div>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                    RepeatDirection="Horizontal" CssClass="RadioButtonList">
                    <asp:ListItem Selected="True" Value="0">所有视频</asp:ListItem>
                    <asp:ListItem Value="1">未审核视频</asp:ListItem>
                    <asp:ListItem Value="2">已审核视频</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <asp:GridView ID="gvVideo" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvVideo_RowDataBound" OnRowDeleting="gvVideo_RowDeleting" 
                OnSelectedIndexChanging="gvVideo_SelectedIndexChanging" AllowPaging="True" OnPageIndexChanging="gvVideo_PageIndexChanging" Width="95%" 
                CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" CssClass="grid">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                <asp:TemplateField HeaderText="视频名称">
                        <ItemTemplate>
                            <a title="<%#Eval("videoTitle") %>"> <%#operateMethod.interceptStr((string )Eval("videoTitle"),5 ) %> </a>  
                        </ItemTemplate>
                    </asp:TemplateField> 
                          
                    <asp:BoundField DataField="userName" HeaderText="发布人" />
                    <asp:BoundField DataField="videoDate" HeaderText="发布日期" DataFormatString="{0:d}" HtmlEncode="False"  />
                    <asp:BoundField DataField="playSum" HeaderText="总点击率" />
                    <asp:BoundField DataField="Auditing" HeaderText="状态" />
                    <asp:TemplateField HeaderText="详细信息">
                        <ItemTemplate>
                                <a href ='../play.aspx?id=<%#Eval("id") %>' target="_blank"   >查看</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField HeaderText="操作" SelectText="通过/取消" ShowSelectButton="True" />
                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                </Columns>
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" HorizontalAlign="Center" />
                       
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />                       
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="40px" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div> <!-- /widget-content -->					
	</div> <!-- /widget -->
</asp:Content>