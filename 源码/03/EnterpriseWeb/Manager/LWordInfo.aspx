<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manager/MasterPage.master" CodeFile="LWordInfo.aspx.cs" Inherits="Manager_LWordInfo" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>留言详细信息</h3>
    <div class="container container-row-control1">
        <div class="row">
            <div class="col-sm-3"><h4>主题信息</h4></div>
            <div class="col-sm-6"></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3 text-center">留言主题：</div>
            <div class="col-sm-6"><asp:Label ID="labTitle" runat="server"></asp:Label></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3 text-center">留&nbsp;&nbsp;言&nbsp;&nbsp;人：</div>
            <div class="col-sm-6"><asp:Label ID="labHost" runat="server"></asp:Label></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3 text-center">留言时间：</div>
            <div class="col-sm-6"><asp:Label ID="labTime" runat="server"></asp:Label></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3 text-center">留言内容：</div>
            <div class="col-sm-6"><asp:Label ID="labContent" runat="server"></asp:Label></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-3"><h4>回复信息</h4></div>
            <div class="col-sm-6"></div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-8">
            <asp:DataList ID="dlRevertInfo" runat="server" RepeatColumns="1" RepeatDirection="vertical" Width="90%" OnDeleteCommand="dlRevertInfo_DeleteCommand">
                <ItemTemplate>
                    <table class="table table-bordered">
                        <tr>
                            <td>回复人：</td>
                            <td><%#DataBinder.Eval(Container.DataItem, "RevertUser")%></td>
                            <td>回复时间：</td>
                            <td><%#DataBinder.Eval(Container.DataItem, "RevertTime")%></td>
                            <td><asp:LinkButton ID="lbtnDel" runat="server" CommandName="Delete" ForeColor="Black">删除</asp:LinkButton></td>
                        </tr>
                        <tr>
                            <td>回复内容：</td>
                            <td colspan="4"><%#DataBinder.Eval(Container.DataItem, "Content")%></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <div class="col-sm-3">
		    <p class="help-block"></p>
	    </div>
    </div>
    <div class="row">
        <div class="col-sm-1"></div>
        <div class="col-sm-8">
            <FTB:FreeTextBox id="FreeTextBox1" runat="Server" Language="zh-cn"  SupportFolder="../aspnet_client/FreeTextBox/" Height="240px" Width="480px" HtmlModeDefaultsToMonoSpaceFont="True" DownLevelCols="50" DownLevelRows="10" ButtonDownImage="False" GutterBackColor="LightSteelBlue" ToolbarBackgroundImage="True" ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu|Bold,Italic,Underline,Strikethrough;Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage,InsertRule|Cut,Copy,Paste;Undo,Redo,Print" ToolbarStyleConfiguration="NotSet" />
        </div>
        <div class="col-sm-3">
		    <p class="help-block"></p>
	    </div>
    </div>
    <div class="container container-row-control1">
        <div class="row">
            <div class="col-sm-1 text-center"></div>
            <div class="col-sm-8">
                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="回复" CssClass="form-control1" Width="100"/>
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="重置" CssClass="form-control1" Width="100"/>
            </div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
        <div class="row">
            <div class="col-sm-1 text-center"></div>
            <div class="col-sm-8">
                <asp:Label ID="Label7" runat="server" Text="当前页码为："></asp:Label>
                [<asp:Label ID="labPage" runat="server" Text="1"></asp:Label>]
                <asp:Label ID="Label6" runat="server" Text="总页码为："></asp:Label>
                [<asp:Label ID="labBackPage" runat="server"></asp:Label>]
                <asp:LinkButton ID="lbtnOne" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lbtnOne_Click">第一页</asp:LinkButton>
                <asp:LinkButton ID="lbtnUp" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lbtnUp_Click">上一页</asp:LinkButton>
                <asp:LinkButton ID="lbtnNext" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lbtnNext_Click">下一页</asp:LinkButton>
                <asp:LinkButton ID="lbtnBack" runat="server" Font-Underline="False" ForeColor="Red" OnClick="lbtnBack_Click">最后一页</asp:LinkButton>
            </div>
	        <div class="col-sm-3">
		        <p class="help-block"></p>
	        </div>
        </div>
    </div>
</div>
</asp:Content>