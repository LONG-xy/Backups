<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shopCart.aspx.cs" Inherits="shopCart" MasterPageFile ="~/MasterPage.master" Title ="购物车" %>
<asp:Content id="head1" ContentPlaceHolderID="HeadPlaceHolder1"  runat="server">
   <style type="text/css">th{text-align:center;}</style> 
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 custom-body-main-content-list">
            <h4><a>购物车</a></h4>
            <p><asp:Label ID="labMessage" runat="server" Visible="False"></asp:Label></p>
            <p>当前总金额为:<asp:Label ID="labTotalPrice" runat="server" Text="0.00 " ></asp:Label>￥</p>
            <asp:GridView ID="gvShopCart" DataKeyNames ="BookID"   runat="server"  AutoGenerateColumns="False"  AllowPaging="True" OnPageIndexChanging="gvShopCart_PageIndexChanging" BackColor="White" BorderColor="#336666" BorderWidth="0px" CellPadding="4" GridLines="Horizontal" BorderStyle="Double" Width="99%" >
                <Columns>
                    <asp:BoundField DataField="No" HeaderText="序号" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>  
                    <asp:BoundField DataField="BookID" HeaderText="商品ID" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>                                    
                    <asp:BoundField DataField="BookName" HeaderText="商品名称" ReadOnly="True">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>  
                    <asp:TemplateField HeaderText="数量">
                <ItemTemplate >
                    <asp:TextBox ID="txtNum" runat="server" Text =<%#Eval("Num") %> Width =60px  OnTextChanged="txtNum_TextChanged"></asp:TextBox>
                    <asp:RegularExpressionValidator
            ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNum"
            ErrorMessage="×" ValidationExpression="^\+?[1-9][0-9]*$"></asp:RegularExpressionValidator>
            </ItemTemplate>
            </asp:TemplateField>                                   
                    <asp:TemplateField HeaderText =单价>
                        <HeaderStyle HorizontalAlign=Center />
                        <ItemStyle HorizontalAlign =Center />
                        <ItemTemplate >
                        <%#Eval("price")%>￥
                        </ItemTemplate>    
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText =总价>
                        <HeaderStyle HorizontalAlign=Center />
                        <ItemStyle HorizontalAlign =Center />
                        <ItemTemplate >
                        <%#Eval("totalPrice")%>￥
                        </ItemTemplate>    
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderStyle HorizontalAlign=Center />
                        <ItemStyle HorizontalAlign =Center />
                        <ItemTemplate >
                            <asp:LinkButton ID="lnkbtnDelete" runat="server" CommandArgument ='<%#Eval("BookID") %>' OnCommand ="lnkbtnDelete_Command">删除</asp:LinkButton>
                        </ItemTemplate>    
                    </asp:TemplateField>                                     
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <RowStyle BackColor="White" ForeColor="#333333" Height="30px" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#339966" ForeColor="White" Font-Bold="True" />
                <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#487575" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#275353" />
            </asp:GridView>
            <br />
            <p>
                <asp:LinkButton ID="lnkbtnUpdate" runat="server" OnClick="lnkbtnUpdate_Click">更新购物车</asp:LinkButton>&nbsp;
                <asp:LinkButton ID="lnkbtnClear" runat="server" OnClick="lnkbtnClear_Click" >清空购物车</asp:LinkButton>
                <asp:LinkButton ID="lnkbtnContinue" runat="server" OnClick="lnkbtnContinue_Click" >继续购物</asp:LinkButton>  
                <asp:LinkButton ID="lnkbtnCheck" runat="server" OnClick="lnkbtnCheck_Click" >前往服务台</asp:LinkButton>
            </p>
            <p>*如果要修改商品数量，请单击“更新购物车”按钮</p>
            <p>*如果要取消某个商品，请直接单击表格控件中的“删除”</p>
        </div>
    </div>
</asp:Content>


