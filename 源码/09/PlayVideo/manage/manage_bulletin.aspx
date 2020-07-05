<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/manage/MasterPage.master" CodeFile="manage_bulletin.aspx.cs" Inherits="manage_manage_bulletin" %>
<asp:Content  ContentPlaceHolderID="head" ID="HeadHoder" runat="server">
    <style>
        .grid {
            margin-top:10px;
            margin-bottom:10px;
        }
    </style>
    <link href="../css/pages/plans.css" rel="stylesheet" /> 
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" ID="BodyHoder" runat="server">
    <h1 class="page-title">
		<i class="icon-home"></i>
		当前位置：发布公告信息					
	</h1>
    <div class="widget widget-table">										
		<div class="widget-header">
			<i class="icon-th-list"></i>
			<h3>发布公告</h3>
		</div> <!-- /widget-header -->					
		<div class="widget-content">
            <div class="tabbable">
                <div class="tab-content">
					<div class="tab-pane active" id="1">
						<fieldset class="form-horizontal">
                            <br />
                            <br />
							<div class="control-group">											
								<label class="control-label" for="username">公告标题：</label>
								<div class="controls">
                                    <asp:TextBox ID="txtTitle" runat="server" CssClass="input-medium disabled" Width="80%"></asp:TextBox>
									<p class="help-block"></p>
								</div> <!-- /controls -->				
							</div> <!-- /control-group -->
                            <div class="control-group">											
								<label class="control-label" for="username">公告内容：</label>
								<div class="controls">
                                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" CssClass="input-medium disabled" Width="80%"></asp:TextBox>
                                </div> <!-- /controls -->				
							</div> <!-- /control-group -->
                            <div class="form-actions">
                                <asp:Button ID="btnEnd" runat="server" CssClass="btn btn-primary" OnClick="btnEnd_Click" Text="修 改" />
							</div>
						</fieldset>
					</div>
                </div>
            </div>            
        </div> <!-- /widget-content -->					
	</div> <!-- /widget -->
</asp:Content>