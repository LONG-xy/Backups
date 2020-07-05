<%@ Page Language="C#" AutoEventWireup="true" CodeFile="videoFilm.aspx.cs" Inherits="videoilm" MasterPageFile="~/MasterPage.master"%>
<%@ Register Src="webUser/WebUserControlVideoPlaySum.ascx" TagName="WebUserControlVideoPlaySum" TagPrefix="uc1" %>
<asp:Content  ContentPlaceHolderID="head" ID="HeadHoder" runat="server">
    <style type="text/css">
        .VideoNewList {
            width:100%;
        }
        .VideoNewListLeft {
            width:120px;
            float:left;
        }
        .VideoNewListRight {
            width:400px;
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
				<center><h2>电影视频</h2></center>
			</div>
		</div>
        <div class="row">
			<div class="col-4-1">
				<div class="wrap-col">
					<div class="post">
                        <asp:DataList ID="dlFilm" runat="server">
                            <ItemTemplate>                            
                                <div class="VideoNewList">
                                    <div class="VideoNewListLeft">
                                        <div class="VideoNewListImg">
                                            <a href='play.aspx?id=<%#Eval("id") %>'>
                                                <img border="0" alt='<%#Eval("videoTitle") %>' src='<%#Eval("videoPicture") %>' width="120" height="101"/>
                                            </a>
                                        </div>
                                        <div class="VideoNewListZan">
                                            <img alt="顶" src="images/shou.png" width="17" height="17" /><%#Eval("flower") %>&nbsp;&nbsp;
                                            <img alt="踩" src="images/jiao.png" width="17" height="17" /><%#Eval("tile") %>
                                        </div>
                                    </div>
                                    <div class="VideoNewListRight">
                                        <div> 
                                            <a href='play.aspx?id=<%#Eval("id") %>'><%#Eval("videoTitle") %></a>&nbsp;<span><%#Eval("videoDate") %></span>
                                        </div>
                                        <div>
                                            <span>发布人：</span><a href='userInfo.aspx?userName=<%#Eval("userName")%>'><%#Eval("userName") %></a>&nbsp;<span>视频人气：<%#Eval("playSum") %></span>
                                        </div>
                                        <div>
                                            <span>发布内容：</span><span><%#Eval("videoContent") %></span> 
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <table id="table1" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="font-size: 9pt; width: 579px; height: 17px; text-align: right">
                                    <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>
                                    [<asp:Label ID="labPage" runat="server" Text="1"></asp:Label>]
                                    <asp:Label ID="Label6" runat="server" Text="总页码为："></asp:Label>
                                    [<asp:Label ID="labBackPage" runat="server"></asp:Label>]
                                    <asp:LinkButton ID="lnkbtnFirst" runat="server" Font-Underline="False" OnClick="lnkbtnFirst_Click">第一页</asp:LinkButton>
                                    <asp:LinkButton ID="lnkbtnFront" runat="server" Font-Underline="False" OnClick="lnkbtnFront_Click">上一页</asp:LinkButton>
                                    <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>
                                    <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Underline="False" OnClick="lnkbtnLast_Click">最后一页</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </div>
				</div>
            </div>
        </div>
    </div>
    <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2>排行</h2></center>
			</div>
		</div>
        <div class="row">
			<div class="col-4-1">
				<div class="wrap-col">
					<div class="post">
                        <uc1:WebUserControlVideoPlaySum ID="WebUserControlVideoPlaySum1" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



