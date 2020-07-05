<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userPage.aspx.cs" Inherits="userPage" MasterPageFile="~/MasterPage.master"%>
<asp:Content  ContentPlaceHolderID="head" ID="HeadHoder" runat="server">
    <style type="text/css">
        .VideoNewList {
            width:100%;
            padding:10px 0 10px 0;
        }
        .VideoNewListLeft {
            width:120px;
            float:left;
        }
        .VideoNewListRight {
            float:left;
            padding-left:10px;
        }
        .VideoNewListRight div {
            text-align:left;
        }
        .VideoNewListRight div a {
            color:#fff;
        }
        .VideoNewListImg {
             width:120px;
        }
        .VideoNewListZan {
             width:120px;
             padding-top:5px;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="BodyHoder" runat="server">
     <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2>会员排名</h2></center>
			</div>
		</div>
		<div class="row">
			<div class="col-1-2">
				<div class="wrap-col">
					<div class="post tab-p">
                        <h4>积分排名第一的会员</h4>
						<p><span>会员名：</span><span><%=userName%></span></p>
                        <p><span>当前积分：</span><span><%=sumMark %></span></p>                                   
                        <p><span>昵称：</span><span><%=nickName %></span></p>                                    
                        <p><span>性别：</span><span><%=sex %></span></p>
                        <p><span>QQ：</span><span><%=qq %></span></p>
                        <p><span>所在城市：</span><span><%=city%></span></p>
                        <p><span>注册时间：</span><span><%=registerDate %></span></p>
                        <p><span>个人说明：</span><span><%=speak%></span></p>
					</div>
				</div>
			</div>
			<div class="col-1-2">
				<div class="wrap-col">
					<div class="post">
                        <h4 style="margin-bottom:5px;">积分排行榜</h4>
                        <asp:GridView ID="gvUserTop" runat="server" AutoGenerateColumns="False" Width="99%" HorizontalAlign="Center">
                            <Columns>
                                <asp:TemplateField HeaderText="排名">
                                    <ItemTemplate>
                                        <%#this.gvUserTop.PageIndex*gvUserTop.PageSize+gvUserTop.Rows.Count+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="用户名">
                                    <ItemTemplate>
                                        <a style="color:#fff;" href='userInfo.aspx?userName=<%#Eval("userName") %>'><%#Eval("userName") %></a>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="shenhong" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="sumMark" HeaderText="积分" />
                            </Columns>
                            <RowStyle CssClass="huise1" />
                            <HeaderStyle CssClass="hongcu" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2></h2></center>
			</div>
		</div>
		<div class="row">
			<div class="col-4-1">
				<div class="wrap-col">
					<div class="post">
                        <asp:DataList ID="dlUserHaving" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <div class="VideoNewList">
                                    <div class="VideoNewListLeft">
                                        <div class="VideoNewListImg">
                                            <img src="<%#Eval("img") %>" alt="" name="uy" width="90" height="100" id="uy" />&nbsp;
                                        </div>
                                    </div>
                                    <div class="VideoNewListRight">
                                        <div> 
                                            <span>用户名：</span><a title="<%#Eval("userName") %>"  href="userInfo.aspx?userName=<%#Eval("userName") %>"><%#Eval("userName") %></a>  
                                        </div>
                                        <div>
                                            <span>昵称：</span><span><%#Eval("nickName") %> </span>
                                        </div>
                                        <div>
                                            <span>性别：</span><span><%#Eval("Sex") %><br /></span>
                                        </div>
                                        <div>
                                            <span>城市：</span><span><%#Eval("city") %></span>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <table id="table1" cellpadding="0" cellspacing="0" style="width: 604px; height: 17px">
                            <tr>
                                <td style="font-size: 9pt; width: 579px; height: 17px; text-align: right">
                                    <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>
                                    [<asp:Label ID="labPage" runat="server" Text="1"></asp:Label>]
                                    <asp:Label ID="Label6" runat="server" Text="总页码为："></asp:Label>
                                    [<asp:Label ID="labBackPage" runat="server"></asp:Label>]
                                    <asp:LinkButton ID="lnkbtnFirst" runat="server" Font-Underline="False" ForeColor="Blue" OnClick="lnkbtnFirst_Click">第一页</asp:LinkButton>
                                    <asp:LinkButton ID="lnkbtnFront" runat="server" Font-Underline="False" ForeColor="Blue" OnClick="lnkbtnFront_Click">上一页</asp:LinkButton>
                                    <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Blue" OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                                    <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Underline="False" ForeColor="Blue" OnClick="lnkbtnLast_Click">最后一页</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>