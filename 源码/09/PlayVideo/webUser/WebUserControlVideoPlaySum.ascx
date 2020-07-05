<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControlVideoPlaySum.ascx.cs" Inherits="WebUserControlVideoPlaySum" %>
 <asp:DataList ID="dlplaySum" runat="server">
    <ItemTemplate>
        <div class="VideoNewList">
            <div class="VideoNewListLeft">
                <div class="VideoNewListImg">
                    <a href='play.aspx?id=<%#Eval("id") %>'>
                        <img border="0" alt='<%#Eval("videoTitle") %>' src='<%#Eval("videoPicture") %>' width="120" height="101"/>
                    </a>
                </div>
                <div class="VideoNewListZan">
                    <img src="images/shou.png" width="17" height="17" /><%#Eval("flower") %>
                    <img src="images/jiao.png" width="17" height="17" /><%#Eval("tile") %>
                </div>
            </div>
            <div class="VideoNewListRight">
                <div> 
                    <span>视频名称：</span><span><a href='play.aspx?id=<%#Eval("id") %>' title='<%#Eval("videoTitle") %>'><%#operateMethod.interceptStr((string)Eval("videoTitle"),5) %></a></span>
                </div>
                <div>
                    <span>发布人：</span><span><a  href='userInfo.aspx?userName=<%#Eval("userName")%>' title='<%#Eval("userName") %>'><%#Eval("userName") %></a></span>
                </div>
                <div>
                    <span>类型：<%#Eval("videoType") %></span> 
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:DataList>
                        









