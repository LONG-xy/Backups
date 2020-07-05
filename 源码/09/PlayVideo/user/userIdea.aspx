<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userIdea.aspx.cs" Inherits="user_userIdea" Title="视频的评论" %>
<%@ Register Src="~/webUser/UserNav.ascx" TagName="UserNav" TagPrefix="uc1" %>
<asp:Content  ContentPlaceHolderID="head" ID="HeadHoder" runat="server">
    <style type="text/css">
        .DataList1 {
            margin:0px auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UserNav ID="UserNav" runat="server" />
    <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2>视频的评论</h2></center>
			</div>
		</div>
		<div class="row">
			<div class="col-4-1">
				<div class="wrap-col">
					<div class="post">
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:GridView ID="gridViewName" runat="server" AutoGenerateColumns="False" OnRowDataBound="gridViewName_RowDataBound" OnSelectedIndexChanging="gridViewName_SelectedIndexChanging" AllowPaging="True" OnPageIndexChanging="gridViewName_PageIndexChanging" PageSize="2" HorizontalAlign="Center" Width="90%">
                                <Columns>
                                    <asp:BoundField DataField="videoTitle" HeaderText="视频名称" >
                                        <ItemStyle CssClass="huise1" />
                                        <HeaderStyle CssClass="hongcu" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="videoDate" HeaderText="发布日期" >
                                        <ItemStyle CssClass="huise1" />
                                        <HeaderStyle CssClass="hongcu" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="评论人数" >
                                        <ItemStyle CssClass="huise1" />
                                        <HeaderStyle CssClass="hongcu" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="flower" HeaderImageUrl="~/img/flower.gif" HeaderText="顶" >
                                        <ItemStyle CssClass="huise1" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="tile" HeaderImageUrl="~/img/tile.gif" HeaderText="踩" >
                                        <ItemStyle CssClass="huise1" />
                                    </asp:BoundField>
                                    <asp:CommandField HeaderText="查看评论" ShowSelectButton="True" SelectText="查看" >
                                        <ItemStyle Font-Underline="False" ForeColor="White"/>
                                        <ControlStyle Font-Underline="False" />
                                        <HeaderStyle />
                                    </asp:CommandField>
                                </Columns>
                                <HeaderStyle Height="40px" HorizontalAlign="Center" />
                                <RowStyle Height="30px" HorizontalAlign="Center" />
                            </asp:GridView>
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server" Visible="False" ScrollBars="Vertical">                          
                            <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" ForeColor="white" Font-Size="20">←返回</asp:LinkButton><br />
                            <asp:DataList ID="DataList1" runat="server" OnDeleteCommand="DataList1_DeleteCommand" OnUpdateCommand="DataList1_UpdateCommand" HorizontalAlign="Center" CssClass="DataList1" Width="90%">
                                <ItemTemplate>
                                    <div style="text-align:center;margin-top:20px;">
                                        <table>
                                            <tr>
                                                <td colspan="3" style="height:40px;text-align:left;color:white;"><%#Eval("userName")%>&nbsp;在<%#Eval("issuanceDate")%>&nbsp;时发布的评论：</td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="text-align:left"><%#operateMethod.resumeHtml((string)Eval("Content"))%> 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><asp:LinkButton ID="LinkButton1" runat="server" CommandName="update" ForeColor="white">回复评论</asp:LinkButton></td>
                                                <td><asp:LinkButton ID="LinkButton2" runat="server" CommandName="delete" ForeColor="white">删除评论</asp:LinkButton></td>
                                            </tr>
                                        </table>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

