<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manager/MasterPage.master" CodeFile="EngageManage.aspx.cs" Inherits="Manager_EngageManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>招聘信息管理</h3>
    <div class="container container-row-control1">
        <div class="row">
	        <div class="col-sm-3 text-center">招聘岗位：</div>
	        <div class="col-sm-6"><asp:TextBox ID="txtEPositon" runat="server" CssClass="form-control1" placeholder="请输入招聘岗位"></asp:TextBox></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">工作部门：</div>
	        <div class="col-sm-6"><asp:TextBox ID="txtDepartment" runat="server" CssClass="form-control1" placeholder="请输入工作部门"></asp:TextBox></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">要求学历：</div>
	        <div class="col-sm-6">
                <asp:DropDownList ID="ddlSchoolAge" runat="server" CssClass="form-control1">
                        <asp:ListItem>博士</asp:ListItem>
                        <asp:ListItem>硕士</asp:ListItem>
                        <asp:ListItem>研究生</asp:ListItem>
                        <asp:ListItem>本科</asp:ListItem>
                        <asp:ListItem>专科</asp:ListItem>
                        <asp:ListItem>高中</asp:ListItem>
                        <asp:ListItem>初中</asp:ListItem>
                        <asp:ListItem>小学</asp:ListItem>
                    </asp:DropDownList>
	        </div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">工作地点：</div>
	        <div class="col-sm-6"><asp:TextBox ID="txtPlace" runat="server" CssClass="form-control1" placeholder="请输入工作地点"></asp:TextBox></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">招聘人数：</div>
	        <div class="col-sm-6"><asp:TextBox ID="txtNum" runat="server" CssClass="form-control1" placeholder="请输入招聘人数"></asp:TextBox></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">联系邮件：</div>
	        <div class="col-sm-6"><asp:TextBox ID="txtEmail" runat="server" CssClass="form-control1" placeholder="请输入联系邮件"></asp:TextBox></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">岗位描述：</div>
	        <div class="col-sm-6"><asp:TextBox ID="txtPIntroduce" runat="server" TextMode="MultiLine" CssClass="form-control1" placeholder="请输入岗位描述"></asp:TextBox></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center">招聘要求：</div>
	        <div class="col-sm-6"><asp:TextBox ID="txtPRequest" runat="server" TextMode="MultiLine" CssClass="form-control1" placeholder="请输入招聘要求"></asp:TextBox></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
	        <div class="col-sm-3 text-center"></div>
	        <div class="col-sm-6">
                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="添加" CssClass="form-control1" Width="100"/>
                <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="修改" CssClass="form-control1" Width="100"/>
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="重置" CssClass="form-control1" Width="100"/>
	        </div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
    </div>
    <div class="panel-body">
        <div class="gv-search">
            选择查询字段：
            <asp:DropDownList ID="ddlCondition" runat="server" CssClass="form-control1" Width="180">
                <asp:ListItem>招聘岗位</asp:ListItem>
                <asp:ListItem>工作地点</asp:ListItem>
                <asp:ListItem>工作部门</asp:ListItem>
            </asp:DropDownList>
            &nbsp; &nbsp; 输入查询关键字：<asp:TextBox ID="txtConditon" runat="server" CssClass="form-control1" placeholder="请输入名称" Width="200"></asp:TextBox>
            <asp:Button ID="btnQuery" runat="server" Text="查询" OnClick="btnQuery_Click" CssClass="form-control1" Width="100"/>
        </div>
        <asp:GridView ID="gvEngageInfo" runat="server" CellPadding="4" Font-Size="9pt" ForeColor="#333333"
                GridLines="None" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="gvEngageInfo_PageIndexChanging" OnRowDeleting="gvEngageInfo_RowDeleting" Width="80%" OnSelectedIndexChanged="gvEngageInfo_SelectedIndexChanged" HorizontalAlign="Center">
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" Height="30px" />
                <EditRowStyle BackColor="#7C6F57" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#1C5E55" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Height="40px" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="EPosition" HeaderText="招聘职位" />
                    <asp:BoundField DataField="Num" HeaderText="招聘人数" />
                    <asp:BoundField DataField="PutTime" HeaderText="发布时间" />
                    <asp:TemplateField HeaderText="选择">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnSelect" runat="server" CommandName="select" Font-Underline="False"
                                ForeColor="Black">选择</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField HeaderText="删除" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
    </div>
</asp:Content>
