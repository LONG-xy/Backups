<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Top.ascx.cs" Inherits="WebUserControl" %>
<%@ Register Src="Search.ascx" TagName="Search" TagPrefix="uc1" %>
<header>
	<div class="top-bar">
		<div class="wrap-top zerogrid">
			<div class="row">
				<div class="col-1-2">
					<div class="wrap-col">
						<ul>
							<li class="mail"><p>MyMail@mailservice.com</p></li>
							<li class="phone"><p>84978982</p></li>
						</ul>
					</div>
				</div>
				<div class="col-1-2">
					<div class="wrap-col f-right">
						<ul class="head-char">
							<li><a href="http://www.mingrisoft.com">明日主站</a></li>
							<li><a href="http://www.mrbccd.com">明日编程词典</a></li>
                            <li><a href="#">明日论坛</a></li>
                            <li></li>                          
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="wrap-header zerogrid">
		<div class="row">
			<div class="col-1-2">
				<div class="wrap-col">
					<div class="logo"><a href="#"><img src="../images/mrbkw.jpg"/></a></div>	
				</div>
			</div>
			<div class="col-1-2">
				<div class="wrap-col f-right">
                    <uc1:Search ID="Search2" runat="server" />
				</div>
			</div>
		</div>
		<div class="row">
			<div id="menu">
				<nav>
					<div class="wrap-nav">
					    <ul>
						    <li class="<%=actives[0] %>"><a href ="../index.aspx?active=0">首页</a></li>
						    <li class="<%=actives[1] %>"><a href="../videoNew.aspx?active=1">最新视频</a></li>
                            <li class="<%=actives[2] %>"><a href="../videoPlaySum.aspx?active=2">人气视频</a></li>
                            <li class="<%=actives[3] %>"><a href="../videoHumour.aspx?active=3">搞笑</a></li>
                            <li class="<%=actives[4] %>"><a href="../videoSport.aspx?active=4">体育</a></li>
                            <li class="<%=actives[5] %>"><a href="../videoFilm.aspx?active=5">电影</a></li>
                            <li class="<%=actives[6] %>"><a href="../videoCartoon.aspx?active=6">动漫</a></li>
						    <li class="<%=actives[7] %>"><a href="../userPage.aspx?active=7">会员</a></li>
						    <li class="<%=actives[8] %>"><a href="../videoTaxis.aspx?active=8">排行榜</a></li>
						    <li class="<%=actives[9] %>"><a href="../user/userIndex.aspx?active=9">个人管理</a></li>
					    </ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</header>