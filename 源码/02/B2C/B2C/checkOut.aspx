<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkOut.aspx.cs" Inherits="checkOut" Title="Untitled Page" %>

<asp:Content id="head1" ContentPlaceHolderID="HeadPlaceHolder1"  runat="server">
   <style type="text/css">
       .custom-cart-useraddress 
       {
           margin-top:10px;
       }
       th{text-align:center;}
   </style> 
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 custom-body-main-content-list">
            <h4><a>商品销售服务台</a></h4>
            <p><asp:Label ID="labMessage" runat="server" Visible="False"></asp:Label></p>
            <h5>您的购物车：</h5>
            <asp:GridView ID="gvShopCart"  runat="server"  AutoGenerateColumns="False" Width="99%" >
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
                    <asp:BoundField DataField="Num" HeaderText="数量" ReadOnly="True">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>  
                    <asp:BoundField DataField="price" HeaderText="单价(￥)" ReadOnly="True">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>  
                    <asp:BoundField DataField="totalPrice" HeaderText="总价(￥)" ReadOnly="True">
                    <ItemStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>  
                </Columns>
                <HeaderStyle HorizontalAlign="Center" Height="30"/>
                <RowStyle HorizontalAlign="Center"  Height="30"/>
            </asp:GridView>
            <p>总价为： <asp:Label ID="labTotalPrice" runat="server" Text="0.00" ></asp:Label>￥ 商品数为：<asp:Label ID="labTotalNum" runat="server" Text="0 "></asp:Label>个</p>
            <p>如果需要修改，请到购物车处修改。如果已确认，请正确填写下面的信息</p>
            
            <h5 style="padding:10px 0;">收货人详细地址：</h5>
            <div class="row custom-cart-useraddress">
                <div class="col-xs-3 col-sm-4 col-md-3">
                    <span>配送及运费：</span>
                </div>
                <div class="col-xs-6 col-sm-5 col-md-5">
                    <asp:DropDownList id="ddlShipType" Width="200" runat="server" AutoPostBack="True" CssClass="form-control">
					    <asp:ListItem>请选择配送方式及运输费用</asp:ListItem>
                        <asp:ListItem Value="10">邮局邮寄普通包裹（10元/本）</asp:ListItem>
                        <asp:ListItem Value="30">邮局邮寄快递包裹（30元/本）</asp:ListItem>
                        <asp:ListItem Value="0">免费送货（长春）</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row custom-cart-useraddress">
                <div class="col-xs-3 col-sm-4 col-md-3">
                    <span>收货人姓名：</span>
                </div>
                <div class="col-xs-6 col-sm-5 col-md-5">
                    <asp:textbox id="txtReciverName" runat="server" Width="195px" CssClass="form-control"></asp:textbox>				    
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3">
                    <font color="red">
                        *<asp:RequiredFieldValidator ID="rfvReciverName" runat="server" ControlToValidate="txtReciverName" Font-Size="9pt">请填写收货姓名</asp:RequiredFieldValidator>
				    </font>
                </div>
            </div>
            <div class="row custom-cart-useraddress">
                <div class="col-xs-3 col-sm-4 col-md-3">
                    <span>联系电话：</span>                    
                </div>
                <div class="col-xs-6 col-sm-5 col-md-5">
                    <asp:textbox id="txtReceiverPhone" runat="server" Width="195px" CssClass="form-control"></asp:textbox>					
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3">
                    <font color="red">
                        *<asp:RequiredFieldValidator ID="rfvReceiverPhone" runat="server" ControlToValidate="txtReceiverPhone" Font-Size="9pt">请填写联系电话</asp:RequiredFieldValidator>
					</font>
                </div>
            </div>
            <div class="row custom-cart-useraddress">
                <div class="col-xs-3 col-sm-4 col-md-3">
                    <span>电子信箱：</span>                    
                </div>
                <div class="col-xs-6 col-sm-5 col-md-5">
                    <asp:textbox id="txtReceiverEmails" runat="server" Width="195px" CssClass="form-control"></asp:textbox>					
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3">
                    <font color="red">
                        *<asp:RequiredFieldValidator ID="rfvReceiverEmails" runat="server" ControlToValidate="txtReceiverEmails" Font-Size="9pt">请输入电子信箱</asp:RequiredFieldValidator>
					</font>
                </div>
            </div>
            <div class="row custom-cart-useraddress">
                <div class="col-xs-3 col-sm-4 col-md-3">
                    <span>邮编：</span>                    
                </div>
                <div class="col-xs-6 col-sm-5 col-md-5">
                    <asp:textbox id="txtReceiverPostCode" runat="server" Width="195px" CssClass="form-control"></asp:textbox>					
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3">
                    <font color="red">
                        *<asp:RequiredFieldValidator ID="rfvReceiverPostCode" runat="server" ControlToValidate="txtReceiverPostCode" Font-Size="9pt">请输入邮编</asp:RequiredFieldValidator>
					</font>
                </div>
            </div>
            <div class="row custom-cart-useraddress">
                <div class="col-xs-3 col-sm-4 col-md-3">
                    <span>收货人详细地址：</span>
                </div>
                <div class="col-xs-6 col-sm-5 col-md-5">
                    <asp:textbox id="txtReceiverAddress" runat="server" Width="259px" Height="53px" TextMode="MultiLine" CssClass="form-control"></asp:textbox>					
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3">
                    <font color="#ff0000">
                        *<asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtReceiverAddress" Font-Size="9pt">请输入详细地址</asp:RequiredFieldValidator>
					</font>
                </div>
            </div>
            <div class="row custom-cart-useraddress">
                <div class="col-xs-3 col-sm-4 col-md-3">
                    <span>备注：</span>
                </div>
                <div class="col-xs-3 col-sm-5 col-md-5">
                    <asp:TextBox ID="txtRemark" runat="server" Height="89px" MaxLength="200" Width="259px" CssClass="form-control"></asp:TextBox>                    
                </div>
            </div>
            <div class="row custom-cart-useraddress">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <font  color=#ff3333>您有什么要求，请在备注中注明。</font>
                </div>
            </div>
            <div class="row custom-cart-useraddress">
                <div class="col-xs-12 col-sm-12 col-md-12"><asp:button id="btnConfirm" Width="120" runat="server" Text="提交订单" OnClick="btnConfirm_Click" CssClass="form-control"></asp:button></div>
            </div>
        </div>
     </div>
</asp:Content>

