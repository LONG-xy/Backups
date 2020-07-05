<%@ Page Language="C#" AutoEventWireup="true" CodeFile="userInfo.aspx.cs" Inherits="userInfo" MasterPageFile="~/MasterPage.master"%>
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
				<center><h2>会员详细信息</h2></center>
			</div>
		</div>
		<div class="row">
			<div class="col-1-2">
				<div class="wrap-col">
                    <table align="center" cellpadding="0" cellspacing="0" height="95" width="381">
                        <tr>
                            <td>
                                <table bgcolor="#999999" border="1" bordercolor="#ffffff" cellpadding="1" cellspacing="1"
                                    height="168" width="150">
                                    <tr>
                                        <td bgcolor="#ffffff" height="166" valign="top" width="141">
                                            <img id="uy" alt="" height="166" name="uy" src="<%=img %>" width="141" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td class="huise1" style="text-align: left">
                                会员名：<%=userName%>
                                当前积分：<span class="chengse"><%=sumMark%>
                                </span>
                                <br />
                                昵称：<%=nickName %>
                                <br />
                                性别：
                                <%=sex %>
                                <br />
                                QQ：<%=qq %>
                                <br />
                                所在城市：<%=city%>
                                <br />
                                注册时间：<%=registerDate %>
                                <br />
                                个人说明：</span><%=speak %>
                            </td>
                        </tr>
                    </table>
                    <asp:DataList ID="dlVideo" runat="server" Style="vertical-align: middle" HorizontalAlign="Center" Width="99%">
                        <ItemTemplate>
                            <div class="VideoNewList">
                                <div class="VideoNewListLeft">
                                    <div class="VideoNewListImg">
                                        <a href='play.aspx?id=<%#Eval("id") %>'>
                                            <img border="0" id="xiaotu" alt='<%#Eval("videoTitle") %>' src='<%#Eval("videoPicture") %>' height="85" name="xiaotu" width="114" />
                                        </a>
                                    </div>
                                    <div class="VideoNewListZan">
                                        <img height="17" alt="顶" src="images/shou.png" width="17" /><%#Eval("flower") %>
                                        <img height="17" alt="踩" src="images/jiao.png" width="17" /><%#Eval("tile") %>
                                    </div>
                                </div>
                                <div class="VideoNewListRight">
                                    <div> 
                                        <a href='play.aspx?id=<%#Eval("id") %>'><%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %></a>&nbsp;<span><%#Eval("videoDate") %></span></div>
                                    <div>
                                        <span>发布人：</span><span><%#Eval("userName") %></span><span>视频人气：<%#Eval("playSum") %></span></div>
                                    <div>
                                        <span>发布内容：</span><span><%#Eval("videoContent") %></span></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <table id="Table2" cellpadding="0" cellspacing="0" style="width: 456px; height: 17px">
                        <tr>
                            <td style="font-size: 9pt; width: 579px; height: 17px; text-align: right">
                                <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>
                                [
                                <asp:Label ID="labPage" runat="server" Text="1"></asp:Label>
                                &nbsp;]
                                <asp:Label ID="Label6" runat="server" Text="总页码为："></asp:Label>
                                [
                                <asp:Label ID="labBackPage" runat="server"></asp:Label>
                                &nbsp;]
                                <asp:LinkButton ID="lnkbtnFirst" runat="server" Font-Underline="False" ForeColor="Blue"
                                    OnClick="lnkbtnFirst_Click">第一页</asp:LinkButton>
                                <asp:LinkButton ID="lnkbtnFront" runat="server" Font-Underline="False" ForeColor="Blue"
                                    OnClick="lnkbtnFront_Click">上一页</asp:LinkButton>
                                <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Blue"
                                    OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="lnkbtnLast" runat="server" Font-Underline="False" ForeColor="Blue"
                                    OnClick="lnkbtnLast_Click">最后一页</asp:LinkButton>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>