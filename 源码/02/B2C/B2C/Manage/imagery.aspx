<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manage/admin.master" CodeFile="imagery.aspx.cs" Inherits="Manger_imagegallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>上传商品图片</title>
    <style>
        .custom-list-row {
            margin-top:10px;
        }
        .custom-list-row-image {
            margin-top:20px;
        }
        .custom-control-cell {
            display:table-cell;
        }
        th,td {
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>上传商品图片</h3>
    <div class="row custom-list-row custom-list-row-image">
        <div class="col-sm-2 col-md-2 text-right">
            选择图片
        </div>
        <div class="col-sm-7 col-md-7">
            <asp:FileUpload ID="imageUpload" runat="server" Font-Size="9pt"/>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2 text-right">
            上传图片
        </div>
        <div class="col-sm-7 col-md-7">
            <asp:button id="UploadImage" Text="上传" runat="server" onclick="UploadImage_OnClick" CssClass="form-control custom-control-cell" Width="80"/>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
        </div>
        <div class="col-sm-7 col-md-7">
            <asp:DataList ID="dlImage" runat="server"   RepeatDirection="Horizontal" RepeatColumns="4" OnDeleteCommand="dlImage_DeleteCommand" Width="630">
                <ItemTemplate>
                    <table style="width:116px;">
                        <tr> 
                            <td>
                                <asp:Image ID="imgUrl"  runat="server"  ImageUrl='<%#DataBinder.Eval(Container.DataItem,"ImageUrl")%>'/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="labImageName" runat="server" Font-Bold="True" Font-Names="隶商品" Text='<%#DataBinder.Eval(Container.DataItem,"ImageName")%>'></asp:Label>
                            </td>    
                        </tr>
                        <tr>
                            <td>
                                <asp:LinkButton ID=lnkbtnDelete runat =server CommandName="delete"  CommandArgument =<%#DataBinder.Eval(Container.DataItem, "ImageID")%> >删除</asp:LinkButton>
                            </td>
                        </tr>                                           
                    </table>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:DataList>
        </div>
        <div class="col-sm-3 col-md-3">
        </div>
    </div>
    <div class="row custom-list-row">
        <div class="col-sm-2 col-md-2">
            
        </div>
        <div class="col-sm-7 col-md-7">
            <asp:Label ID="labCP" runat="server" Text="当前页码为："></asp:Label>
            [<asp:Label ID="labPage" runat="server" Text="1"></asp:Label>]
            <asp:Label ID="labTP" runat="server" Text="总页码为："></asp:Label>
            [<asp:Label ID="labBackPage" runat="server"></asp:Label>]
            <asp:LinkButton ID="lnkbtnOne" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnOne_Click">第一页</asp:LinkButton>&nbsp;
            <asp:LinkButton ID="lnkbtnUp" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnUp_Click">上一页</asp:LinkButton>&nbsp;
            <asp:LinkButton ID="lnkbtnNext" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnNext_Click">下一页</asp:LinkButton>&nbsp;
            <asp:LinkButton ID="lnkbtnBack" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lnkbtnBack_Click">最后一页</asp:LinkButton>&nbsp;
        </div>
    </div>
</asp:Content>