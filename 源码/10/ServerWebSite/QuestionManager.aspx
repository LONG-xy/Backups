<%@ Page Language="C#" MasterPageFile="~/Themes/MasterPage.master" AutoEventWireup="true" CodeFile="QuestionManager.aspx.cs" Inherits="QuestionManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <table width="100%">
            <tr>
                <td>
                    <asp:Literal ID="Literal1" runat="server" Text="提问标题"></asp:Literal>
                    <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" Text="查询" onclick="btnSearch_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <cc1:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" 
                        DataKeyNames="Code" EmptyDataText="没有可显示的数据记录。" 
                        onrowcommand="GridView1_RowCommand" 
                        onrowdatabound="GridView1_RowDataBound" ShowFooter="True">
                        <Columns>
                            <asp:BoundField DataField="Code" HeaderText="Code" ReadOnly="True" Visible="false" 
                                SortExpression="Code" />
                            <asp:BoundField DataField="CatalogCode" HeaderText="类别"
                                SortExpression="CatalogCode" />
                            <asp:BoundField DataField="UserCode" HeaderText="用户名" 
                                SortExpression="UserCode" />
                            <asp:BoundField DataField="Title" HeaderText="提问标题" SortExpression="Title" 
                                ItemStyle-Width="50%" >
<ItemStyle Width="50%"></ItemStyle>
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="Text" HeaderText="提问内容" SortExpression="Text"  />--%>
                            <asp:BoundField DataField="Mark" HeaderText="悬赏分数" SortExpression="Mark" />
                            <asp:BoundField DataField="PostDatetime" HeaderText="发布时间" 
                                SortExpression="PostDatetime" />
                            <asp:BoundField DataField="State" HeaderText="状态" SortExpression="State" />
                            <asp:ButtonField CommandName="Del" Text="删除" />
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



