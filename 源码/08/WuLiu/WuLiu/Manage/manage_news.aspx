<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="MasterPage.master" CodeFile="manage_news.aspx.cs" Inherits="Manage_manage_news" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <h2 class="title">车源信息管理</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            &nbsp;
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:GridView ID="gvNews" runat="server" AutoGenerateColumns="False" OnRowDeleting="gvNews_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="90%" CssClass="grid">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="NewsTitle" HeaderText="新闻标题" />
                                    <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布日期"
                                        HtmlEncode="False" />
                                    <asp:TemplateField HeaderText="详细信息">
                                        <ItemTemplate>
                                            <a href="../news.aspx?NewsID=<%#Eval("ID")%>">详细信息</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Height="40px" HorizontalAlign="Center" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" Height="30px" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>