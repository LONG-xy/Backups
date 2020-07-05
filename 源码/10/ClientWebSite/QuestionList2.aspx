<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QuestionList2.aspx.cs" Inherits="QuestionList2" %>

<%@ Register src="UC_Header.ascx" tagname="UC_Header" tagprefix="uc1" %>
<%@ Register src="UC_Search.ascx" tagname="UC_Search" tagprefix="uc2" %>
<%@ Register src="UC_Navigation.ascx" tagname="UC_Navigation" tagprefix="uc3" %>

<%@ Register src="UC_Footer.ascx" tagname="UC_Footer" tagprefix="uc4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>明日知道-国内领先的IT技术搜素引擎</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.body {
	margin-left: 00px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <uc1:UC_Header ID="UC_Header1" runat="server" />
    <uc2:UC_Search ID="UC_Search1" runat="server" />
    <uc3:UC_Navigation ID="UC_Navigation1" runat="server" />

<br />
<table width="95%" height="26" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="huise1"><cc1:OurPager ID="OurPager1" runat="server" 
            onpagechanged="OurPager1_PageChanged"></cc1:OurPager>
      </td>
  </tr>
</table>
<table width="95%" height="56" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="Code">
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
            
            <table width="100%" height="62" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td class="huise1">
                <a href="QuestionAnswer.aspx?QuestionCode=<%#Eval("Code") %> " target="_blank" class="daohangh"><%#Eval("Title")%></a>
                </td>
                </tr>
              <tr>
                <td class="huise1"><div><a href="QuestionAnswer.aspx?QuestionCode=<%#Eval("Code") %> " target="_blank"></a> 
                    <%#Eval("Text") %>  
                </div>
                  <div></div>
                  </td>
              </tr>
              <tr>
                <td class="huise1"><span class="henhong">悬赏分数：<%#Eval("Mark") %></span>　<%#Eval("PostDatetime")%>　<a href="Index.aspx"class="huise">明日知道</a></td>
              </tr>
            </table>    
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:DataList>
    
    </td>
  </tr>
</table>





<table width="95%" height="26" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="huise1"><cc1:OurPager ID="OurPager2" runat="server" 
            onpagechanged="OurPager1_PageChanged"></cc1:OurPager>
      </td>
  </tr>
</table>
<br />
    <uc4:UC_Footer ID="UC_Footer1" runat="server" />
    </div>
    </form>
</body>
</html>
