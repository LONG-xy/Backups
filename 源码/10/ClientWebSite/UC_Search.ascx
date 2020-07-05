<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Search.ascx.cs" Inherits="UC_Search" %>
<%--<%@ OutputCache Duration="30" VaryByParam="none" VaryByControl="txtSearch;ibtnSearch" %>--%>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
</style>

<input id="hidCatalog" type="hidden" value="" runat="server"/>
<table width="95%" height="56" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="333"><img src="images/logo.gif" width="226" height="62" /></td>
    <td width="870"><table width="100%" height="62" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><table width="699" height="45" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="63">&nbsp;</td>
            <td width="480" class="hongcu">
                <table>
                    <tr>
                        <td class="hongcu"><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='1';">Java</a></td>
                        <td class="hongcu"><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='2';">Java web</a></td>
                        <td class="hongcu"><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='3';">C#</a></td>
                        <td class="hongcu"><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='4';">ASP.NET</a></td>
                        <td class="hongcu"><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='5';">Visual Basic</a></td>
                        <td class="hongcu"><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='6';">Visual C++</a></td>
                        <td class="hongcu"><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='7';">PHP</a></td>
                        <td class="hongcu"><a href="#" onclick="document.getElementById('<%=hidCatalog.ClientID %>').value ='8';">ASP</a></td>
                    
                    </tr>
                </table>                
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><table width="480" border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="378" height="35"><table width="359" height="35" border="0" cellpadding="0" cellspacing="0" background="images/text.gif">
                    <tr>
                      <td align="center">
                          <asp:TextBox ID="txtSearch" runat="server" Font-Size="Larger" 
                              Width="96%" BorderStyle="None" BorderWidth="0px"></asp:TextBox></td>
                    </tr>
                </table></td>
                <td width="113">
                <asp:ImageButton ID="ibtnSearch" ImageUrl="~/Images/so.gif" 
                  Width="109px" Height="35px" runat="server" onclick="ibtnSearch_Click" ValidationGroup="onlySelf" />
              </tr>
            </table></td>
            <td width="156" class="black14"> <span class="blacklin">&nbsp;<a href="Question.aspx" class="blacklin">我要提问</a><br />
              &nbsp;<a href="QuestionCatalog.aspx" class="blacklin">我要回答</a></span></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>