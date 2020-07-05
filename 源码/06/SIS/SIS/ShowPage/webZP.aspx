<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="webZP.aspx.cs" Inherits="webZP" Title="供求信息---招聘信息" %>
<%@ Register Src="../UserControl/RecommendInfo.ascx" TagName="RecommendInfo" TagPrefix="uc2" %>
<asp:Content runat="server" ID="head1" ContentPlaceHolderID="head">
    <link href="../css/defaultList.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="row">
         <div class="col-sm-12 col-md-12">
            <div class="custom-left-title"><img src="../images/newImg/fk.png"/> 付费专区</div>         
            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <asp:DataList ID="dlCharge" runat="server" Width="800">
                        <ItemTemplate>
                            <table align="center" cellpadding="0" cellspacing="0" width="800">
                                <tr>
                                    <td>
                                        <p>
                                            <span class="hongcu">『<%# DataBinder.Eval(Container.DataItem,"type") %>』</span>
                                            <span class="chengse"><%# DataBinder.Eval(Container.DataItem,"title") %></span>
                                            <span class="huise1"><%#DataBinder.Eval(Container.DataItem,"date") %></span>
                                        </p>
                                        <p class="custom-content-p">                                        
                                            <span class="shenlan"><%#DataBinder.Eval(Container.DataItem,"info") %></span>
                                        <p/>
                                        <p class="custom-content-p">
                                            <span class="chengse">
                                                联系人：<%#DataBinder.Eval(Container.DataItem,"linkMan") %>
                                                联系电话：<%#DataBinder.Eval(Container.DataItem,"tel") %>
                                            </span>
                                        <p/>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td><img height="1" src="images/longline.gif" width="525" /></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td height="10"></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="row custom-content-banner">
                <div class="col-sm-12 col-md-12"><img src="images/banner1.jpg"/></div>
            </div>         
            <div class="custom-left-title custom-content-free"><img src="../images/newImg/fk.png"/> 免费专区</div>         
            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <asp:DataList ID="dlFree" runat="server">
                        <ItemTemplate>
                            <table align="center" cellpadding="0" cellspacing="0" width="543">
                                <tr>
                                    <td class="huise">
                                        <p>
                                            <span class="shenlancu">『<%# DataBinder.Eval(Container.DataItem,"type") %>』</span>
                                            <span class="banhui"><%# DataBinder.Eval(Container.DataItem,"title") %>[<%# DataBinder.Eval(Container.DataItem,"date") %>]</span>
                                        </p>
                                        <p class="custom-content-p">
                                            <span class="banhui"><%# DataBinder.Eval(Container.DataItem,"info") %></span>
                                        </p>
                                        <p class="custom-content-p">
                                            <span class="banhui">
                                                联系人：<%#DataBinder.Eval(Container.DataItem,"linkMan") %>
                                                联系电话：<%#DataBinder.Eval(Container.DataItem,"tel") %>
                                            </span>
                                        </p>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="center">
                                        <img height="1" src="images/longline.gif" width="525" /></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td height="10">
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 col-md-12">
                    当前页码为［<asp:Label ID="lblCurrentPage" runat="server" Text="1"></asp:Label>］页
                    总页码［<asp:Label ID="lblSumPage" runat="server" Text="0"></asp:Label>］页
                    <asp:LinkButton ID="lnkBtnFirst" runat="server" Font-Underline="False" OnClick="lnkBtnFirst_Click"> 第一页 </asp:LinkButton>
                    <asp:LinkButton ID="lnkBtnPrevious" runat="server" Font-Underline="False" OnClick="lnkBtnPrevious_Click"> 上一页 </asp:LinkButton>
                    <asp:LinkButton ID="lnkBtnNext" runat="server" Font-Underline="False" OnClick="lnkBtnNext_Click"> 下一页 </asp:LinkButton>
                    <asp:LinkButton ID="lnkBtnLast" runat="server" Font-Underline="False" OnClick="lnkBtnLast_Click"> 末一页 </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
