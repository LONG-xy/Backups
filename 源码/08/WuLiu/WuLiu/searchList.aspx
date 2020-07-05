<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="searchList.aspx.cs" Inherits="searchList" Title="信息搜索"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="top-grid">
       <div class="grid-title"><h3>信息搜索</h3></div>
       <asp:GridView ID="gvCompany" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gvCompany_PageIndexChanging" CssClass="grid" Width="80%" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="CompanyName" HeaderText="企业名称" />
                <asp:BoundField DataField="Kind" HeaderText="企业性质" />
                <asp:BoundField DataField="Calling" HeaderText="所属行业" />
                <asp:BoundField DataField="Linkman" HeaderText="联系人" />
                <asp:BoundField DataField="Phone" HeaderText="联系电话" />
                <asp:TemplateField HeaderText="详细信息">
                    <ItemTemplate>
                        <a href="#" onclick='openPWD("companyInfo.aspx?ID=<%#Eval("ID")%>",400,500)'>详细信息</a>
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
       <asp:GridView ID="gvDepot" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gvDepot_PageIndexChanging" Width="80%" CssClass="grid" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
           <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
           <Columns>
                <asp:BoundField DataField="DepotType" HeaderText="仓库类型" />
                <asp:BoundField DataField="DepotCity" HeaderText="所在城市" />
                <asp:BoundField DataField="DepotAcreage" HeaderText="仓库面积" />
                <asp:BoundField DataField="DepotPrice" HeaderText="每间价格" />
                <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布时间"
                    HtmlEncode="False" />
                <asp:TemplateField HeaderText="详细信息">
                    <ItemTemplate>
                        <a href="#" onclick='openPWD("depotInfo.aspx?ID=<%#Eval("ID")%>",400,550)'>详细信息</a>
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
       <asp:GridView ID="gvFreight" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gvFreight_PageIndexChanging" Width="80%" CssClass="grid" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Start" HeaderText="出发地" />
                <asp:BoundField DataField="Terminal" HeaderText="到达地" />
                <asp:BoundField DataField="FreightType" HeaderText="货物种类" />
                <asp:TemplateField HeaderText="重量">
                    <ItemTemplate>
                        <%#Eval("FreightWeight") %>
                        <%#Eval("WeightUnit")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布日期"
                    HtmlEncode="False" />
                <asp:TemplateField HeaderText="详细信息">
                    <ItemTemplate>
                        <a href="#" onclick='openPWD("freightInfo.aspx?ID=<%#Eval("ID")%>",340,370)'>详细信息</a>
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
       <asp:GridView ID="gvJob" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gvJob_PageIndexChanging" CssClass="grid" Width="80%" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
           <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
           <Columns>
                <asp:BoundField DataField="Job" HeaderText="招聘职位" />
                <asp:BoundField DataField="Number" HeaderText="招聘人数" />
                <asp:BoundField DataField="Specialty" HeaderText="要求专业" />
                <asp:BoundField DataField="Knowledge" HeaderText="要求学历" />
                <asp:BoundField DataField="FBDate" HeaderText="发布日期" />
                <asp:TemplateField HeaderText="详细信息">
                    <ItemTemplate>
                        <a href="#" onclick='openPWD("jobInfo.aspx?ID=<%#Eval("JobID")%>")'>
                            <%#Eval("Job")%>
                        </a>
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
       <asp:GridView ID="gvSpecial" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gvSpecial_PageIndexChanging" Width="80%" CssClass="grid" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="start" HeaderText="出发地" />
                <asp:BoundField DataField="Terminal" HeaderText="到达地" />
                <asp:BoundField DataField="TruckType" HeaderText="车型" />
                <asp:BoundField DataField="specialPrice" HeaderText="专线报价" />
                <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布时间"
                    HtmlEncode="False" />
                <asp:TemplateField HeaderText="详细信息">
                    <ItemTemplate>
                        <a href="#" onclick='openPWD("specialInfo.aspx?ID=<%#Eval("ID")%>",400,550)'>详细信息</a>
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
       <asp:GridView ID="gvTruck" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gvTruck_PageIndexChanging" Width="80%" CssClass="grid" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="start" HeaderText="出发地" />
                <asp:BoundField DataField="Terminal" HeaderText="到达地" />
                <asp:BoundField DataField="TruckType" HeaderText="车型" />
                <asp:BoundField DataField="TruckLoad" HeaderText="载重" />
                <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布日期"
                    HtmlEncode="False" />
                <asp:TemplateField HeaderText="详细信息">
                    <ItemTemplate>
                        <a href="#" onclick='openPWD("truckInfo.aspx?ID=<%#Eval("ID")%>",340,370)'>详细信息</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Height="30px"/>
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

