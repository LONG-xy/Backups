<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="videoTaxis.aspx.cs" Inherits="videoTaxis" %>
<asp:Content  ContentPlaceHolderID="head" ID="HeadHoder" runat="server">
    <style type="text/css">
       
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="BodyHoder" runat="server">
    <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2>视频排行</h2></center>
			</div>
		</div>
		<div class="row">
			<div class="col-1-2">
				<div class="wrap-col">
					<div class="post">
						<h4>上月搞笑视频排行榜</h4>
                        <asp:GridView ID="gvHumourTaxis" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="暂无排名" HorizontalAlign="Center">
                            <Columns>
                                <asp:TemplateField HeaderText="排名">
                                    <ItemTemplate>
                                            <%#gvHumourTaxis.PageIndex*gvHumourTaxis.PageSize+gvHumourTaxis.Rows.Count+1 %>
                                    </ItemTemplate>
                                            <ItemStyle CssClass="huise1" />
                                </asp:TemplateField>
                                                    
                                <asp:TemplateField HeaderText="视频名称">
                                    <ItemTemplate>
                                        <a target="_blank" title='<%#Eval("videoTitle") %>' href="play.aspx?id=<%#Eval("videoId") %>"><%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %></a>
                                    </ItemTemplate>
                                        <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="发布日期" DataField="videoDate" DataFormatString="{0:d}" HtmlEncode="False" >
                                    <ItemStyle CssClass="huise1" />
                            </asp:BoundField>
                                <asp:TemplateField HeaderText="发布人">
                                    <ItemTemplate>
                                        <a  title='<%#Eval("userName")%> ' href ='userInfo.aspx?userName=<%#Eval("userName")%>' ><%#Eval("userName") %></a>
                                    </ItemTemplate>
                                        <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                </asp:TemplateField>
                                                         
                                <asp:BoundField HeaderText="上月人气" DataField="playSum" >
                                    <ItemStyle CssClass="huise1" />
                            </asp:BoundField>
                            </Columns>
                                <HeaderStyle CssClass="chengse" />
                        </asp:GridView>
					</div>
				</div>
			</div>
			<div class="col-1-2">
				<div class="wrap-col">
					<div class="post">
                        <h4>上月电影视频排行榜</h4>
                        <asp:GridView ID="gvFilmTaxis" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="暂无排名" HorizontalAlign="Center">
                            <Columns>
                                <asp:TemplateField HeaderText="排名">
                                    <ItemTemplate>
                                        <%#gvFilmTaxis.PageIndex * gvFilmTaxis.PageSize + gvFilmTaxis.Rows.Count + 1%>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="huise1" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="视频名称">
                                    <ItemTemplate>
                                        <a target="_blank" title='<%#Eval("videoTitle") %>' href="play.aspx?id=<%#Eval("videoId") %>">
                                            <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                                  
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="发布日期" DataField="videoDate" DataFormatString="{0:d}" HtmlEncode="False" >
                                    <ItemStyle CssClass="huise1" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="发布人">
                                    <ItemTemplate>
                                        <a  title='<%#Eval("userName")%> ' href ='userInfo.aspx?userName=<%#Eval("userName")%>' >
                                            <%#Eval("userName") %>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="上月人气" DataField="playSum" >
                                    <ItemStyle CssClass="huise1" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle BackColor="#DFF0F8" CssClass="chengse" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
			<div class="col-1-2">
				<div class="wrap-col">
					<div class="post">
						<h4>上月体育视频排行榜</h4>
                        <asp:GridView ID="gvSportTaxis" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="暂无排名" HorizontalAlign="Center" >
                            <Columns>
                                <asp:TemplateField HeaderText="排名">
                                    <ItemTemplate>
                                        <%#gvSportTaxis.PageIndex * gvSportTaxis.PageSize + gvSportTaxis.Rows.Count + 1%>
                                    </ItemTemplate>
                                        <ItemStyle CssClass="huise1" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="视频名称">
                                    <ItemTemplate>
                                        <a target="_blank" title='<%#Eval("videoTitle") %>' href="play.aspx?id=<%#Eval("videoId") %>">
                                            <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                        </a>
                                    </ItemTemplate>
                                        <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="发布日期" DataField="videoDate" DataFormatString="{0:d}" HtmlEncode="False" >
                                    <ItemStyle CssClass="huise1" />
                                        </asp:BoundField>
                                <asp:TemplateField HeaderText="发布人">
                                    <ItemTemplate>
                                        <a  title='<%#Eval("userName")%> ' href ='userInfo.aspx?userName=<%#Eval("userName")%>' >
                                            <%#Eval("userName") %>
                                        </a>
                                    </ItemTemplate>
                                            <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="上月人气" DataField="playSum" >
                                <ItemStyle CssClass="huise1" />
                                    </asp:BoundField>
                            </Columns>
                                            
                            <HeaderStyle BackColor="#DFF0F8" CssClass="chengse" />
                        </asp:GridView>
					</div>
				</div>
			</div>
			<div class="col-1-2">
				<div class="wrap-col">
					<div class="post">
                        <h4>上月动漫视频排行榜</h4>
                        <asp:GridView ID="gvCartoonTaxis" runat="server" AutoGenerateColumns="False" Width="99%" EmptyDataText="暂无排名" HorizontalAlign="Center">
                            <Columns>
                                <asp:TemplateField HeaderText="排名">
                                    <ItemTemplate>
                                        <%#gvCartoonTaxis.PageIndex * gvCartoonTaxis.PageSize + gvCartoonTaxis.Rows.Count + 1%>
                                    </ItemTemplate>
                                        <ItemStyle CssClass="huise1" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="视频名称">
                                    <ItemTemplate>
                                        <a target="_blank" title='<%#Eval("videoTitle") %>' href="play.aspx?id=<%#Eval("videoId") %>">
                                            <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                        </a>
                                    </ItemTemplate>
                                        <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="发布日期" DataField="videoDate" DataFormatString="{0:d}" HtmlEncode="False" >
                                    <ItemStyle CssClass="huise1" />
                                        </asp:BoundField>
                                <asp:TemplateField HeaderText="发布人">
                                    <ItemTemplate>
                                        <a  title='<%#Eval("userName")%> ' href ='userInfo.aspx?userName=<%#Eval("userName")%>' >
                                            <%#Eval("userName") %>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="shenhong" Font-Underline="False" />
                                </asp:TemplateField>                                    
                                <asp:BoundField HeaderText="上月人气" DataField="playSum" >
                                    <ItemStyle CssClass="huise1" />
                                </asp:BoundField>
                            </Columns>
                                <HeaderStyle BackColor="#DFF0F8" CssClass="chengse" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>