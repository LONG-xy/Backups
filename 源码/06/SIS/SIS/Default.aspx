<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" Title="供求信息网" %>
<asp:Content runat="server" ID="head1" ContentPlaceHolderID="head">
    <link href="css/index.css" rel="stylesheet" type="text/css" />
</asp:Content>

<%@ Register Src="UserControl/RecommendInfo.ascx" TagName="RecommendInfo" TagPrefix="uc1" %>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="row custom-show-list">
        <div class="col-sm-12 col-md-12">
            <div>
                <uc1:RecommendInfo ID="RecommendInfo1" runat="server" />
            </div>
        </div>
        <div class="col-sm-12 col-md-12 custom-content-image">
            <img src="images/newImg/pcard2.png"/>
        </div>
        <div class="col-sm-12 col-md-12 custom-content-info1">
            <div class="row">
                <div class="col-sm-4 col-md-4">
                    <div class="custom-left-title"><img src="../images/newImg/fk.png"/> 招聘信息</div>
                    <asp:DataList ID="dlZP" runat="server" CssClass="hong">
                        <ItemTemplate>
                            <table align="center" cellpadding="0" cellspacing="0" width="266">
                                <tr>
                                    <td>
                                        <span class="hong" style="color: #000000">
                                            <span>『<%#DataBinder.Eval(Container.DataItem,"type") %>』</span>
                                            ·<a class="huise" href="#" onclick="SetID(<%#DataBinder.Eval(Container.DataItem,"id") %>)" data-toggle="modal" data-target="#showLeaguer">
                                                <%#DataBinder.Eval(Container.DataItem,"title") %></a></span></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td>
                                        <img height="1" src="images/line.gif" width="266" /></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div class="col-sm-4 col-md-4">
                    <div class="custom-left-title"><img src="../images/newImg/fk.png"/> 培训信息</div>
                    <asp:DataList ID="dlPX" runat="server">
                        <ItemTemplate>
                            <table align="center" cellpadding="0" cellspacing="0" width="266">
                                <tr>
                                    <td>
                                        <span class="hong" style="color: #000000">
                                        <span>『<%#DataBinder.Eval(Container.DataItem,"type") %>』</span>
                                        ·<a class="huise" href="#" onclick="SetID(<%#DataBinder.Eval(Container.DataItem,"id") %>)" data-toggle="modal" data-target="#showLeaguer"><%#DataBinder.Eval(Container.DataItem,"title") %></a></span></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td>
                                        <img height="1" src="images/line.gif" width="266" /></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="row custom-content-info2">
                <div class="col-sm-4 col-md-4">
                    <div class="custom-left-title"><img src="../images/newImg/fk.png"/> 公寓信息</div>
                    <asp:DataList ID="dlGY" runat="server">
                        <ItemTemplate>
                            <table align="center" cellpadding="0" cellspacing="0" width="266">
                                <tr>
                                    <td>
                                        <span class="hong" style="color: #000000">
                                            <span>『<%#DataBinder.Eval(Container.DataItem,"type") %>』</span>
                                            ·<a class="huise" href="#" onclick="SetID(<%#DataBinder.Eval(Container.DataItem,"id") %>)" data-toggle="modal" data-target="#showLeaguer"><%#DataBinder.Eval(Container.DataItem,"title") %></a></span></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td>
                                        <img height="1" src="images/line.gif" width="266" /></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div class="col-sm-4 col-md-4">
                    <div class="custom-left-title"><img src="../images/newImg/fk.png"/> 家教信息</div>
                    <asp:DataList ID="dlJJ" runat="server">
                        <ItemTemplate>
                            <table align="center" cellpadding="0" cellspacing="0" width="266">
                                <tr>
                                    <td>
                                        <span class="hong" style="color: #000000">
                                            <span>『<%#DataBinder.Eval(Container.DataItem,"type") %>』</span>
                                            ·<a class="huise" href="#" onclick="SetID(<%#DataBinder.Eval(Container.DataItem,"id") %>)" data-toggle="modal" data-target="#showLeaguer"><%#DataBinder.Eval(Container.DataItem,"title") %></a></span></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td>
                                        <img height="1" src="images/line.gif" width="266" /></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="row custom-content-info3">
                <div class="col-sm-4 col-md-4">
                    <div class="custom-left-title"><img src="../images/newImg/fk.png"/> 物品求购</div>
                    <asp:DataList ID="dlWPQG" runat="server">
                        <ItemTemplate>
                            <table align="center" cellpadding="0" cellspacing="0" width="266">
                                <tr>
                                    <td>
                                        <span class="hong" style="color: #000000">
                                            <span>『<%#DataBinder.Eval(Container.DataItem,"type") %>』</span>
                                            ·<a class="huise" href="#" onclick="SetID(<%#DataBinder.Eval(Container.DataItem,"id") %>)" data-toggle="modal" data-target="#showLeaguer"><%#DataBinder.Eval(Container.DataItem,"title") %></a></span>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td>
                                        <img height="1" src="images/line.gif" width="266" /></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div class="col-sm-4 col-md-4">
                    <div class="custom-left-title"><img src="../images/newImg/fk.png"/> 物品出售</div>
                    <asp:DataList ID="dlWPCS" runat="server">
                        <ItemTemplate>
                            <table align="center" cellpadding="0" cellspacing="0" width="266">
                                <tr>
                                    <td>
                                        <span class="hong" style="color: #000000">
                                            <span>『<%#DataBinder.Eval(Container.DataItem,"type") %>』</span>
                                            ·<a class="huise" href="#" onclick="SetID(<%#DataBinder.Eval(Container.DataItem,"id") %>)" data-toggle="modal" data-target="#showLeaguer"
                                                ><%#DataBinder.Eval(Container.DataItem,"title") %></a></span></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td>
                                        <img height="1" src="images/line.gif" width="266" /></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="row custom-content-info3">
                <div class="col-sm-4 col-md-4">
                    <div class="custom-left-title"><img src="../images/newImg/fk.png"/> 求兑出兑</div>
                    <asp:DataList ID="dlQDCD" runat="server">
                        <ItemTemplate>
                            <table align="center" cellpadding="0" cellspacing="0" width="266">
                                <tr>
                                    <td>
                                        <span class="hong" style="color: #000000">
                                            <span>『<%#DataBinder.Eval(Container.DataItem,"type") %>』</span>
                                            ·<a class="huise" href="#" onclick="SetID(<%#DataBinder.Eval(Container.DataItem,"id") %>)" data-toggle="modal" data-target="#showLeaguer"><%#DataBinder.Eval(Container.DataItem,"title") %></a></span></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td>
                                        <img height="1" src="images/line.gif" width="266" /></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div class="col-sm-4 col-md-4">
                    <div class="custom-left-title"><img src="../images/newImg/fk.png"/> 车辆信息</div>
                    <asp:DataList ID="dlCL" runat="server">
                        <ItemTemplate>
                            <table align="center" cellpadding="0" cellspacing="0" width="266">
                                <tr>
                                    <td>
                                        <span class="hong" style="color: #000000">
                                            <span>『<%#DataBinder.Eval(Container.DataItem,"type") %>』</span>
                                            ·<a class="huise" href="#" onclick="SetID(<%#DataBinder.Eval(Container.DataItem,"id") %>)" data-toggle="modal" data-target="#showLeaguer"><%#DataBinder.Eval(Container.DataItem,"title") %></a></span></td>
                                </tr>
                                <tr style="color: #000000">
                                    <td>
                                        <img height="1" src="images/line.gif" width="266" /></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
