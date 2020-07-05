<%@ Page Language="C#" MasterPageFile="~/Common/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page"%>

<%@ Register Src="Common/NetProduct.ascx" TagName="NetProduct" TagPrefix="uc1" %>
<%@ Register Src="Common/JavaProduct.ascx" TagName="JavaProduct" TagPrefix="uc2" %>
<%@ Register Src="Common/ASPProduct.ascx" TagName="ASPProduct" TagPrefix="uc3" %>
<%@ Register Src="Common/VCProduct.ascx" TagName="VCProduct" TagPrefix="uc4" %>
<%@ Register Src="Common/VBProduct.ascx" TagName="VBProduct" TagPrefix="uc5" %>
<%@ Register Src="Common/DelphiProduct.ascx" TagName="DelphiProduct" TagPrefix="uc6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table width="505" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" background="../images/chanpin.gif">&nbsp;</td>
          </tr>
          <tr>
            <td valign="top" background="../images/chanpin2.gif"><table width="505" height="659" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="232" height="418" valign="top"><uc1:NetProduct ID="NetProduct1" runat="server" />
                  <uc3:ASPProduct ID="ASPProduct1" runat="server" /></td>
                <td width="273" valign="top"><uc2:JavaProduct ID="JavaProduct1" runat="server" />
                  <uc4:VCProduct ID="VCProduct1" runat="server" /></td>
              </tr>
              <tr>
                <td height="221" valign="top"><uc5:VBProduct ID="VBProduct1" runat="server" />
                  </td>
                <td valign="top"><uc6:DelphiProduct ID="DelphiProduct1" runat="server" />
                  </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="6" valign="top" background="../images/dibuzhong.gif"></td>
          </tr>
        </table> 
</asp:Content>

