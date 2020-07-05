<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="jobList.aspx.cs" Inherits="jobList" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="top-grid">
        <div class="grid-title"><h3>招聘信息</h3></div>
        <asp:GridView ID="gvJob" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="gvJob_PageIndexChanging" CssClass="grid" Width="80%" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Job" HeaderText="招聘职位" />
                <asp:BoundField DataField="Number" HeaderText="招聘人数" />
                <asp:BoundField DataField="Specialty" HeaderText="要求专业" />
                <asp:BoundField DataField="Knowledge" HeaderText="要求学历" />
                <asp:BoundField DataField="FBDate" HeaderText="发布日期" />
                <asp:TemplateField HeaderText="详细信息">
                    <ItemTemplate>
                         <a  href="jobInfo.aspx?ID=<%#Eval("JobID")%>">详细信息</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#EC005F" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#EC005F" Font-Bold="True" ForeColor="White" Height="30px"/>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="20px"/>
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>
</asp:Content>

