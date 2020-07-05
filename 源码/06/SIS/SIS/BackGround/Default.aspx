<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="BackGround_Default" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>供求信息网「后台管理」</title>
    <script type="text/javascript" src="../Scripts/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    
    <link href="../Css/BackGround-Default.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-right custom-header">
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/newImg/admin_index.png" OnClick="ImageButton1_Click"/>
                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/images/newImg/admin_exit.png" OnClick="ImageButton2_Click"/>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-3 col-sm-3 col-md-3 custom-menu">
                    <div class="custom-menu-title"></div>
                    <div class="custom-menu-content">
                         <asp:TreeView ID="TreeView1" runat="server" ImageSet="Simple" Width="120">
                            <ParentNodeStyle Font-Bold="False" />
                            <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                            <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
                            <Nodes>
                                <asp:TreeNode Text="招聘信息" Value="招聘信息">
                                    <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=招聘信息"
                                        Target="mainFrame"></asp:TreeNode>
                                    <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=招聘信息"
                                        Target="mainFrame"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="求职信息" Value="求职信息">
                                    <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=求职信息"
                                        Target="mainFrame"></asp:TreeNode>
                                    <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=求职信息"
                                        Target="mainFrame"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="培训信息" Value="培训信息">
                                    <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=培训信息"
                                        Target="mainFrame"></asp:TreeNode>
                                    <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=培训信息"
                                        Target="mainFrame"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="家教信息" Value="家教信息">
                                    <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=家教信息"
                                        Target="mainFrame"></asp:TreeNode>
                                    <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=家教信息"
                                        Target="mainFrame"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="公寓信息" Value="公寓信息">
                                    <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=公寓信息"
                                        Target="mainFrame"></asp:TreeNode>
                                    <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=公寓信息"
                                        Target="mainFrame"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="物品求购" Value="物品求购">
                                    <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=物品求购"
                                        Target="mainFrame"></asp:TreeNode>
                                    <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=物品求购"
                                        Target="mainFrame"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="物品出售" Value="物品出售">
                                    <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=物品出售"
                                        Target="mainFrame"></asp:TreeNode>
                                    <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=物品出售"
                                        Target="mainFrame"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="求兑出兑" Value="求兑出兑">
                                    <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=求兑出兑"
                                        Target="mainFrame"></asp:TreeNode>
                                    <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=求兑出兑"
                                        Target="mainFrame"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="车辆信息" Value="车辆信息">
                                    <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=车辆信息"
                                        Target="mainFrame"></asp:TreeNode>
                                    <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=车辆信息"
                                        Target="mainFrame"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="寻求合作" Value="寻求合作">
                                    <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=寻求合作"
                                        Target="mainFrame"></asp:TreeNode>
                                    <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=寻求合作"
                                        Target="mainFrame"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="企业广告" Value="企业广告">
                                    <asp:TreeNode Text="信息审核" Value="信息审核" NavigateUrl="~/BackGround/CheckInfo.aspx?id=企业广告"
                                        Target="mainFrame"></asp:TreeNode>
                                    <asp:TreeNode Text="信息删除" Value="信息删除" NavigateUrl="~/BackGround/DeleteInfo.aspx?id=企业广告"
                                        Target="mainFrame"></asp:TreeNode>
                                </asp:TreeNode>
                                <asp:TreeNode Text="收费信息" Value="收费信息">
                                    <asp:TreeNode Text="信息发布" Value="信息发布" Target="mainFrame" NavigateUrl="~/BackGround/LeaguerInfo.aspx">
                                    </asp:TreeNode>
                                    <asp:TreeNode Text="信息删除" Value="信息删除" Target="mainFrame" NavigateUrl="~/BackGround/LeaguerInfoDelete.aspx">
                                    </asp:TreeNode>
                                </asp:TreeNode>
                            </Nodes>
                            <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="0px"
                                NodeSpacing="0px" VerticalPadding="0px" />
                        </asp:TreeView>
                    </div>
                </div>
                <div class="col-xs-9 col-sm-9 col-md-9 custom-list">
                    <div class="custom-list-title">现在的位置：供求信息网 &gt; <span class="hong">后台管理系统</span> <span id="curNode" runat="server"></span></div>                    
                    <iframe id="iframe1" name="mainFrame" style="width:100%; height:780px" frameborder="0"></iframe>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
