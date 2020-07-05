<%@ Page Language="C#" AutoEventWireup="true" CodeFile="play.aspx.cs" Inherits="play" MasterPageFile="~/MasterPage.master"%>
<%@ Register Src="webUser/WebUserControlVideoPlaySum.ascx" TagName="WebUserControlVideoPlaySum" TagPrefix="uc4" %>
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
        .post p {
            width:452px;
            margin:0px auto;
            text-align:left;
        }
        .LiteralDiv {
            width:452px;
            height:360px;
            margin:0px auto;
        }
        .pinglun,.pinglun p{
            width:500px;
            margin:0px auto;
        }
        .pinglun p {
            font-size:18px;
        }
        .pinglun-btn-login {
            width:50%;
            float:left;
            text-align:left;
        }
        .pinglun-btn-fb {
            width:50%;
            float:left;
            text-align:right;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="BodyHoder" runat="server">
    <div class="movie">
	    <div class="row type">
		    <div class="title">
			    <center><h2>播放视频</h2></center>
		    </div>
	    </div>
        <div class="row">
		    <div class="col-4-1">
			    <div class="wrap-col">
				    <div class="post">
                        <p>人气: <%=playSum%>&nbsp;&nbsp;<asp:ImageButton ID="imgbtnD" runat="server" ImageUrl="~/images/shou.gif" OnClick="imgbtnD_Click" /><%=flower %>&nbsp;&nbsp;<asp:ImageButton ID="imgbtnC" runat="server" ImageUrl="~/images/jiao.gif" OnClick="imgbtnC_Click" /><%=tile%></p>
                        <div class="LiteralDiv"><asp:Literal ID="Literal1" runat="server"></asp:Literal></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-4-1">
			    <div class="wrap-col">
				    <div class="post">
                        <div class="pinglun">
                            <p>评论区</p>
                             <asp:Panel ID="PanelIdea" runat="server" ScrollBars="Vertical">
                                 <asp:DataList ID="dlIdea" runat="server" HorizontalAlign="Center" Width="99%">
                                    <ItemTemplate>            
                                        <table style="margin-top:20px;">
                                            <tr>
                                                <td><asp:Label ID="Label1" runat="server" Text='<%#Eval("userName") %>'></asp:Label>&nbsp;在<%#getIsDate(Convert.ToString(Eval("issuanceDate")))%>&nbsp;发布的评论：</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align:left;">&nbsp;<asp:Label ID="Label2"  runat="server" Text='<%#operateMethod.resumeHtml((string)Eval("content"))%>'></asp:Label></td>
                                            </tr>
                                        </table>                
                                    </ItemTemplate>
                                 </asp:DataList>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-4-1">
			    <div class="wrap-col">
				    <div class="post">
                        <div class="pinglun">
                            <p>发表评论区</p>
                            <p style="font-size:14px;">您还可以输入<asp:Label ID="labCount" runat="server" Text="500"></asp:Label>字符</p>
                            <asp:TextBox ID="txtContent" onKeyUp="change()" runat="server" Height="94px" TextMode="MultiLine" Width="500px"></asp:TextBox>
                            <div>
                                <div class="pinglun-btn-login">
                                    <asp:Panel ID="PanelLogin" runat="server">
                                        您当前是游客身份
                                        <asp:LinkButton ID="lkbtnLogin" runat="server" PostBackUrl="~/login.aspx" ForeColor="#ffffff" Font-Underline="true">登录</asp:LinkButton>
                                        <asp:LinkButton ID="lkbtnRegister" runat="server" PostBackUrl="~/Register.aspx" ForeColor="#ffffff" Font-Underline="true">注册</asp:LinkButton>
                                    </asp:Panel>
                                </div>
                                <div class="pinglun-btn-fb">
                                    <asp:Button ID="btnIdea" runat="server" Text="发表评论" OnClick="btnIdea_Click" Width="120" Height="30"/>
                                </div>
                            </div>
                        </div>
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
                        <uc4:WebUserControlVideoPlaySum ID="WebUserControlVideoPlaySum1" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>