<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="UserAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ޱ���ҳ</title>
    <style type="text/css">
        .style1
        {
            width: 60%;
        }
        .style2
        {
            text-align: left;
        }
    </style>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	left:225px;
	top:11px;
	width:154px;
	height:54px;
	z-index:1;
}
body {
	margin-left: 00px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="28" valign="top" background="images/loginbg.gif">
      <table width="676" height="284" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="84" align="left">
        
        <table width="237" height="39" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" bgcolor="#FFFFFF"><img src="images/logo.gif" width="226" height="62" /></td>
          </tr>
        </table></td>
        
      </tr>
      <tr>
        <td><table id="__01" width="785" height="125" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30"><img src="images/login1_01.gif" width="785" height="30" alt="" /></td>
          </tr>
          <tr>
            <td height="18" background="images/login1_02.gif"><table width="728" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="361" align="left"><table width="354" height="198" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="30" valign="top" class="henhong"><table width="350" height="40" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td class="henhong" width="350" valign="top"><span class="henhong">���Լ��Ҹ���¼�ǳƣ�</span><br />
                              <asp:TextBox ID="txtUserName" runat="server" Width="350px"></asp:TextBox>
                            
                            <span class="huise1">��¼�ǳ�Ϊ2-15���ַ�֮�䣬��������ע���û���Ҫ��˴˲�ͬ</span>
                            <br />
                            <asp:RequiredFieldValidator 
                                ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" 
                                Display="Dynamic" ErrorMessage="�������¼�ǳƣ�Ϊ2-15���ַ�֮��"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                                ControlToValidate="txtUserName" Display="Dynamic" 
                                ErrorMessage="�õ�¼�ǳ�Ϊ2-15���ַ�֮��" 
                                onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                            <asp:CustomValidator ID="CustomValidator3" runat="server" 
                                ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="�õ�½�ǳ��Ѵ���" 
                                onservervalidate="CustomValidator3_ServerValidate"></asp:CustomValidator></td>
                        </tr>
                        <tr>
                          <td class="henhong" width="350" valign="top">����һ����¼���룺<br />
                          <asp:TextBox ID="txtPassword" runat="server" Width="350px" TextMode="Password"></asp:TextBox>
                            
                            <span class="huise1">��¼����Ϊ6-15���ַ�֮��</span>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtPassword" Display="Dynamic" 
                                ErrorMessage="���������6-15λ�ĵ�¼���룬������������ַ�����#��%��"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" 
                                ErrorMessage="�õ�¼����Ϊ6-15λ" 
                                onservervalidate="CustomValidator2_ServerValidate"></asp:CustomValidator></td>
                        </tr>
                        <tr>
                          <td class="henhong" width="350" valign="top">ȷ�����룺<br />
                            <asp:TextBox ID="txtPassword2" runat="server" Width="350px" TextMode="Password"></asp:TextBox>
                            
                            <span class="huise1">������һ�����룬ȷ��������ȷ</span>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtPassword2" Display="Dynamic" ErrorMessage="������ȷ������"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                ControlToCompare="txtPassword" ControlToValidate="txtPassword2" 
                                Display="Dynamic" ErrorMessage="����ǰ�����벻һ��"></asp:CompareValidator></td>
                        </tr>
                        <tr>
                          <td class="henhong" width="350" valign="top">�Ա�<br />
                            <asp:DropDownList ID="ddlSex" runat="server">
                                <asp:ListItem>��</asp:ListItem>
                                <asp:ListItem>Ů</asp:ListItem>
                            </asp:DropDownList>
                        </tr>
                        <tr>
                          <td class="henhong" width="350" valign="top">E-mail��<br />
                            <asp:TextBox ID="txtEmail" runat="server" Width="350px"></asp:TextBox>
                            
                            <span class="huise1">���������������ַ</span>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                                runat="server" ControlToValidate="txtEmail" Display="Dynamic" 
                                ErrorMessage="������Email��ַ"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                          <td class="henhong" width="350" valign="top">��֤�룺<br />
                              <asp:TextBox ID="txtCheckCode" runat="server"></asp:TextBox>
                              <cc1:ValidateCode ID="ValidateCode1" runat="server" />
                            <span class="huise1">�뽫ͼƬ�е��ַ���д����֤���ı�����ĸ�����ִ�Сд</span><br />
                              <asp:Label ID="lblMessage" runat="server" ForeColor="#FF3300"></asp:Label>
                            
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtCheckCode" Display="Dynamic" 
                                ErrorMessage="��������֤�룬��ĸ�����ִ�Сд"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        
                      </table>
                        <table width="332" height="40" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td align="center" valign="top">
                                <asp:ImageButton ID="ImageButton1" runat="server" Width="302px" Height="36px"
                                    ImageUrl="~/Images/btn_register.gif" onclick="ibtnLogin_Click" /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtMemo" runat="server" Rows="8" TextMode="MultiLine" 
                                        Width="350px">��ӭ�����뱾վ��μӽ��������ۣ�Ϊά�����Ϲ������������ȶ��������Ծ������������
1�� ���������ȷ�Ϻͽ��ɱ�վ���������Ȩ������Ȩ�鱾վ���С����ṩ�ķ�����밴���䷢���Ĺ�˾�³̣���������Ͳ��������ϸ�ִ�С�
�û�ͨ�����ע����򲢵��һ��&quot;��ͬ��&quot;�İ�ť�����ʾ�û��뱾վ���Э�鲢�������еķ������ 
2�� �����飺��վ�����Լ��Ĳ���ϵͳͨ�����ʻ�������Ϊ�û��ṩ������񣬶����ַ�������ѵġ��û����룺
(1) �ṩ�豸���������˵���һ̨�����ƽ����
һ�����䱸����װ�á�
(2) ����������֧����˷����йصĵ绰���á�
���ǵ���վ��Ʒ�������Ҫ�ԣ��û�ͬ�⣺ 
(1) �ṩ��ʱ���꾡��׼ȷ�ĸ������ϡ�
(2) ���ϸ���ע�����ϣ����ϼ�ʱ���꾡׼ȷ��
Ҫ������ԭʼ����� ���Ͻ�����Ϊע�����ϡ� 
���⣬�û�����Ȩ��վ�������͸¶��ע�����ϣ�
����վ���ܹ����û���������סַ��������ַ��
�������䡢�ʺš� ���ǣ�
(1) �û�Ҫ��վ����Ȩĳ��ͨ�������ʼ�����
͸¶��Щ��Ϣ��
(2) ��Ӧ�ķ��ɡ�����Ҫ�󼰳��������Ҫ��վ
�ṩ�û��ĸ������ϡ� ����û��ṩ�����ϲ�
׼ȷ������ʵ�����Ϸ���Ч����վ���������û�
ʹ�ñ�վ��������Ȩ�����û������ñ�վ����
�����ͬʱ��ͬ������ṩ�ĸ�����Ϣ����
                    ����            </asp:TextBox>
                                </td>
                            </tr>
                        </table>
                      </td>
                  </tr>
                </table>
                  </td>
                <td width="367" align="left" valign="top"><img src="images/zhuce.jpg" width="367" height="229" /></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="39">
                <asp:ImageButton ID="ibtnLogin" runat="server" ImageUrl="~/Images/login1_03.gif" onclick="ibtnLogin_Click" /></td>
          </tr>
          <tr>
            <td height="38" background="images/login1_04.gif"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="huise1">(C)��1999-2010����ʡ���տƼ����޹�˾</span> </td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="center">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
    
    
    
    
    </div>
    </form>
</body>
</html>
