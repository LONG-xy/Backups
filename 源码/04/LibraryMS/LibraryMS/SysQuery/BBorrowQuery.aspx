<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMasterPage.master" AutoEventWireup="true" CodeFile="BBorrowQuery.aspx.cs" Inherits="SysQuery_BBorrowQuery" Title="Untitled Page" EnableEventValidation="false"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <link href="../Content/bootstrap-datepicker3.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap-datepicker.min.js"></script>
    <script src="../Scripts/bootstrap-datepicker.zh-CN.min.js"></script>    
    <style type="text/css">
        .s1 {
            background-image:url('../images/tushujieyuechaxun.gif');
        }
        .custom-search {
            padding-left:20px;
            margin-bottom:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="custom-col-content-img-s s1">
            </div>        
            <div class="custom-col-content-s">
                <div class="custom-col-content-s-list">
                    <div class="custom-search">
                        <img src="../images/chaxun tubiao.gif" width="32" height="27">请选择查询条件： 
                        <asp:DropDownList ID="ddlCondition" runat="server" Width="120px" CssClass="form-control custom-txt" CausesValidation="True" OnSelectedIndexChanged="ddlCondition_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem>图书条形码</asp:ListItem>
                            <asp:ListItem>图书名称</asp:ListItem>
                            <asp:ListItem>读者编号</asp:ListItem>
                            <asp:ListItem>读者名称</asp:ListItem>
                            <asp:ListItem>借阅时间</asp:ListItem>
                        </asp:DropDownList>&nbsp;
                        <asp:Label ID="Label1" runat="server" Text="从" Visible="False"></asp:Label>&nbsp;
                        <asp:TextBox ID="txtFTime" runat="server" Visible="False" Width="101px" CssClass="form-control custom-txt"></asp:TextBox>&nbsp;
                        <asp:Label ID="Label2" runat="server" Text="到" Visible="False"></asp:Label>&nbsp;
                        <asp:TextBox ID="txtTTime" runat="server" Visible="False" Width="101px" CssClass="form-control custom-txt"></asp:TextBox>
                        <asp:TextBox ID="txtCondition" runat="server" Width="118px" CssClass="form-control custom-txt"></asp:TextBox>&nbsp;
                        <asp:Button ID="btnQuery" runat="server" OnClick="btnQuery_Click" Text="查询" CssClass="form-control custom-btn" Width="60"/>
                    </div>
                    <div>
                         <asp:GridView ID="gvBorrowInfo" runat="server" AllowPaging="True" PageSize="5" AutoGenerateColumns="False" Font-Size="9pt" OnPageIndexChanging="gvBorrowInfo_PageIndexChanging" Width="90%" HorizontalAlign="Center" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                             <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle HorizontalAlign="Center" Height="28px" />
                             <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Height="30px" />
                            <Columns>
                                <asp:BoundField DataField="bookcode" HeaderText="图书条形码" ReadOnly="True" />
                                <asp:BoundField DataField="bookname" HeaderText="图书名称" />
                                <asp:BoundField DataField="readerid" HeaderText="读者编号" />
                                <asp:BoundField DataField="name" HeaderText="读者名称" />
                                <asp:BoundField DataField="borrowTime" HeaderText="借阅时间" />
                                <asp:BoundField DataField="ygbackTime" HeaderText="应还时间" />
                                <asp:BoundField DataField="isback" HeaderText="是否归还" />
                            </Columns>
                             <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                             <SortedAscendingCellStyle BackColor="#F7F7F7" />
                             <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                             <SortedDescendingCellStyle BackColor="#E5E5E5" />
                             <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="custom-col-foot-bg-s"></div>
        </div>
    </div>
    <script type="text/javascript">
        $('#<%=txtFTime.ClientID%>,#<%=txtTTime.ClientID%>').datepicker({
            language: "zh-CN",
            autoclose: true,//选中之后自动隐藏日期选择框
            clearBtn: true,//清除按钮
            todayBtn: true,//今日按钮
            pickerPosition: 'bottom-left',
            todayHighlight :true,
            format: "yyyy-mm-dd"
        });
    </script>
</asp:Content>

