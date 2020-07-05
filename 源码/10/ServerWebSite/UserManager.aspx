<%@ Page Language="C#" MasterPageFile="~/Themes/MasterPage.master" AutoEventWireup="true" CodeFile="UserManager.aspx.cs" Inherits="UserManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <table width="100%">
            <tr>
                <td>
                    <asp:Literal ID="Literal1" runat="server" Text="用户名"></asp:Literal>
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="查询" onclick="btnSearch_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <cc1:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="Code" EmptyDataText="没有可显示的数据记录。">
                        <Columns>
                            <asp:BoundField DataField="Code" HeaderText="Code" ReadOnly="True" Visible="false" 
                                SortExpression="Code" />
                            <asp:BoundField DataField="UserName" HeaderText="用户名" 
                                SortExpression="UserName" />
                            <asp:BoundField DataField="Sex" HeaderText="性别" SortExpression="Sex" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Mark" HeaderText="积分" SortExpression="Mark" />
                            <asp:BoundField DataField="ACount" HeaderText="回答数" 
                                SortExpression="ACount" />
                            <asp:BoundField DataField="AAcceptCount" HeaderText="获得最佳答案数" 
                                SortExpression="AAcceptCount" />
                        </Columns>
                    </cc1:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <cc1:ourpager ID="OurPager1" runat="server" 
                        onpagechanged="OurPager1_PageChanged" />
                </td>
            </tr>
        </table>
    </div>

</asp:Content>