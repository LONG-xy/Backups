<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="index.aspx.cs" Inherits="_Default" %>
<%@ Register Src="webUser/WebUserControlLoopAD.ascx" TagName="WebUserControlLoopAD" TagPrefix="uc1" %>
<asp:Content  ContentPlaceHolderID="head" ID="HeadHoder" runat="server">
    
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="BodyHoder" runat="server">
    <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2>最新视频</h2></center>
			</div>
		</div>
		<div class="row">
			<div class="col-1-2">
				<div class="wrap-col">
					<div class="post">
						<uc1:WebUserControlLoopAD ID="WebUserControlLoopAD1" runat="server" />
					</div>
				</div>
			</div>
			<div class="col-1-2">
				<div class="wrap-col">
					<div class="post">
                        <asp:DataList ID="dlNewVideo" runat="server" RepeatColumns="3"  Width="367px" Height="265px" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <div style="text-align: center">                               
                                    <table width="33" height="76" cellpadding="0" cellspacing="0">
                                        <tr>
                                          <td><table width="124" height="94" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#999999">
                                              <tr>
                                                <td width="367" align="center" valign="middle" bgcolor="#FFFFFF">  <a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                    <asp:Image ID="Image1" runat="server" Height="90px"  ImageUrl='<%#Eval("videoPicture") %>' Width="120px"  /></a></td>
                                              </tr>
                                          </table></td>
                                        </tr>
                                        <tr>
                                          <td align="center" class="shenhong"><a class="shenhong"  title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                    <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                                </a></td>
                                        </tr>
                                    </table>    
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
					</div>
				</div>
			</div>
		</div>
	</div>
    <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2>搞笑视频</h2></center>
			</div>
		</div>    
        <div class="row">
			<div class="col-4-4">
				<div class="wrap-col">
					<div class="post">
						<asp:DataList ID="dlHumour" runat="server" RepeatColumns="5"  Width="692px" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <div style="text-align: center">                                                        
                                    <table width="33" height="76" cellpadding="0" cellspacing="0">
                                        <tr>
                                        <td><table width="124" height="94" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#999999">
                                            <tr>
                                                <td width="367" align="center" valign="middle" bgcolor="#FFFFFF"><a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                                            <asp:Image ID="Image1" runat="server" Height="90px"  ImageUrl='<%#Eval("videoPicture") %>' Width="120px"  /></a></td>
                                            </tr>
                                        </table></td>
                                        </tr>
                                        <tr>
                                        <td align="center" class="shenhong"> <a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                                            <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                                                        </a></td>
                                        </tr>
                                    </table>               
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
					</div>
				</div>
			</div>
		</div>
    </div>
    <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2>体育视频</h2></center>
			</div>
		</div>    
        <div class="row">
			<div class="col-4-4">
				<div class="wrap-col">
					<div class="post">
						<asp:DataList ID="dlSport" runat="server" RepeatColumns="5"  Width="692px" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <div style="text-align: center">                                                        
                                    <table width="33" height="76" cellpadding="0" cellspacing="0">
                                        <tr>
                                        <td><table width="124" height="94" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#999999">
                                            <tr>
                                                <td width="367" align="center" valign="middle" bgcolor="#FFFFFF"><a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                                            <asp:Image ID="Image1" runat="server" Height="90px"  ImageUrl='<%#Eval("videoPicture") %>' Width="120px"  /></a></td>
                                            </tr>
                                        </table></td>
                                        </tr>
                                        <tr>
                                        <td align="center" class="shenhong"> <a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                                            <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                                                        </a></td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
					</div>
				</div>
			</div>
		</div>
    </div>
    <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2>电影欣赏</h2></center>
			</div>
		</div>    
        <div class="row">
			<div class="col-4-4">
				<div class="wrap-col">
					<div class="post">
						<asp:DataList ID="dlFilm" runat="server" RepeatColumns="5"  Width="692px" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <div style="text-align: center">
                                    <table width="33" height="76" cellpadding="0" cellspacing="0">
                                        <tr>
                                        <td><table width="124" height="94" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#999999">
                                            <tr>
                                                <td width="367" align="center" valign="middle" bgcolor="#FFFFFF"><a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                                            <asp:Image ID="Image1" runat="server" Height="90px"  ImageUrl='<%#Eval("videoPicture") %>' Width="120px"  /></a></td>
                                            </tr>
                                        </table></td>
                                        </tr>
                                        <tr>
                                        <td align="center" class="shenhong"> <a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                                            <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                                                        </a></td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
					</div>
				</div>
			</div>
		</div>
    </div>
    <div class="movie">
		<div class="row type">
			<div class="title">
				<center><h2>卡通动漫</h2></center>
			</div>
		</div>    
        <div class="row">
			<div class="col-4-4">
				<div class="wrap-col">
					<div class="post">
						<asp:DataList ID="dlCartoon" runat="server" RepeatColumns="5"  Width="692px" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <div style="text-align: center">
                                    <table width="33" height="76" cellpadding="0" cellspacing="0">
                                        <tr>
                                        <td><table width="124" height="94" border="0" align="center" cellpadding="0" cellspacing="0"  bgcolor="#999999">
                                            <tr>
                                                <td width="367" align="center" valign="middle" bgcolor="#FFFFFF"><a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                                            <asp:Image ID="Image1" runat="server" Height="90px"  ImageUrl='<%#Eval("videoPicture") %>' Width="120px"  /></a></td>
                                            </tr>
                                        </table></td>
                                        </tr>
                                        <tr>
                                        <td align="center" class="shenhong"> <a title='<%#Eval("videoTitle") %>' target=_blank href='play.aspx?id=<%#Eval("id") %>' >
                                                                            <%#operateMethod.interceptStr((string)Eval("videoTitle"),6) %>
                                                                        </a></td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
					</div>
				</div>
			</div>
		</div>
    </div>
</asp:Content>