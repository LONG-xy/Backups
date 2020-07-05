<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="manage_Depot.aspx.cs" Inherits="Manage_manage_Depot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <h2 class="title">仓储信息管理</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <div class="form-group-col-2">
                                <div class="form-cont">
                                    <label class="radio">
                                        <asp:RadioButton ID="rdibtnS" runat="server" AutoPostBack="True" Checked="True" GroupName="info" OnCheckedChanged="rdibtnS_CheckedChanged" Text="所有信息" />
                                    </label>
                                    <label class="radio">
                                        <asp:RadioButton ID="rdibtnY" runat="server" AutoPostBack="True" GroupName="info" OnCheckedChanged="rdibtnY_CheckedChanged" Text="已审核信息" />
                                    </label>
                                    <label class="radio">
                                        <asp:RadioButton ID="rdibtnW" runat="server" AutoPostBack="True" GroupName="info" OnCheckedChanged="rdibtnW_CheckedChanged" Text="未审核信息" />
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-12">
                            <asp:GridView ID="gvDepot" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvDepot_RowDataBound" OnRowDeleting="gvDepot_RowDeleting"
                                 OnSelectedIndexChanging="gvDepot_SelectedIndexChanging" Font-Size="10pt" AllowPaging="True" OnPageIndexChanging="gvDepot_PageIndexChanging"
                                 CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="90%" CssClass="grid">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="DepotType" HeaderText="仓库类型" />
                                       <asp:BoundField DataField="DepotCity" HeaderText="所在城市" />
                                       <asp:BoundField DataField="DepotAcreage" HeaderText="仓库面积" />
                                       <asp:BoundField DataField="DepotPrice" HeaderText="每间价格" />
                                       <asp:BoundField DataField="FBDate" DataFormatString="{0:yy-MM-dd}" HeaderText="发布时间"  HtmlEncode="False" />                   
                                    <asp:TemplateField HeaderText="详细信息">
                                        <ItemTemplate>
                                            <a href="../depotInfo.aspx?ID=<%#Eval("ID")%>">详细信息</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField AccessibleHeaderText="sh" DataField="Auditing" HeaderText="状态" />
                                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True">
                                        <ControlStyle Font-Underline="False" />
                                    </asp:CommandField>
                                    <asp:CommandField HeaderText="审核" SelectText="通过/取消" ShowSelectButton="True" />
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