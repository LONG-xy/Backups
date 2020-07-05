<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMasterPage.master" AutoEventWireup="true" CodeFile="ReturnBook.aspx.cs" Inherits="BookBRManage_ReturnBook" Title="Untitled Page" EnableEventValidation="false"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <style type="text/css">
        .s1 {
            background-image:url('../images/tushuguihuan.gif');
        }
        .custom-one-row {
            margin-top:10px;
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
                    <div class="row custom-one-row">
                        <div class="col-md-3">
                            <p><img src="../images/zuzheyanzheng.gif" width="133" height="18"></p>
                            <p>读者编号：</p>
                            <p><asp:TextBox ID="txtReaderID" runat="server" Width="90px" CssClass="form-control custom-txt"></asp:TextBox>&nbsp;
                                <asp:Button ID="btnSure" runat="server" Text="确定" OnClick="btnSure_Click" CssClass="form-control custom-btn" Width="60"/></p>
                        </div>
                        <div class="col-md-1">
                            <img src="../images/shuxian.jpg" width="1" height="160">
                        </div>
                        <div class="col-md-4">
                            <span>姓名：</span><asp:TextBox ID="txtReader" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                            <span>证件类型：</span><asp:TextBox ID="txtRType" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                            <span>读者类型：</span><asp:TextBox ID="txtPaperType" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <span>性别：</span><asp:TextBox ID="txtSex" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                            <span>证件号码：</span><asp:TextBox ID="txtPaperNum" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                            <span>可借数量：</span><asp:TextBox ID="txtBNum" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <h5>&nbsp;&nbsp;&nbsp;&nbsp;图书归还</h5>
                    <asp:GridView ID="gvBorrowBook" runat="server" AllowPaging="True" AutoGenerateColumns="False" Font-Size="9pt" HorizontalAlign="Center"
                                OnPageIndexChanging="gvBorrowBook_PageIndexChanging" CssClass="custom-list-control"
                                PageSize="5" Width="90%" OnRowUpdating="gvBorrowBook_RowUpdating" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="借书编号" />
                            <asp:BoundField DataField="bookname" HeaderText="图书名称" />
                            <asp:BoundField DataField="borrowTime" HeaderText="借阅时间" />
                            <asp:BoundField DataField="ygbackTime" HeaderText="应还时间" />
                            <asp:BoundField DataField="pubname" HeaderText="出版社" />
                            <asp:BoundField DataField="bcase" HeaderText="书架" />
                            <asp:BoundField DataField="price" HeaderText="价格" />
                            <asp:TemplateField HeaderText="归还">
                                <ItemTemplate>
                                    <asp:Button ID="btnReturn" runat="server" CommandName="Update" Text="归还" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle HorizontalAlign="Center" Height="28px" />
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Height="30px" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

