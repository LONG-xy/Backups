﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="depotInfo.aspx.cs" Inherits="depotInfo" Title="仓储详细信息"%>
<asp:Content ID="Head1" ContentPlaceHolderID="HeadPlaceHolder1" Runat="Server">
    <style type="text/css">
        .top-grid h4 {
            font-size:16px;
            float:left;
            text-align:center;
            margin:0px;
            padding:3px 20px 20px 200px;
            box-sizing:border-box;
            -moz-box-sizing:border-box;
            -webkit-box-sizing:border-box;
        }
        .top-grid h4:nth-child(n+2) {
            clear:both;
        }
        .top-grid span {
            display:block;
            float:left;
            padding-bottom:20px;
            box-sizing:border-box;
            -moz-box-sizing:border-box;
            -webkit-box-sizing:border-box;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="top-grid">
        <h4>仓储类别：</h4>
        <span><%=DepotType %></span>
        <h4>所在城市：</h4>
        <span><%=DepotCity %></span>
        <h4>仓库地点：</h4>
        <span><%=DepotSite %></span>
        <h4>面&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;积：</h4>
        <span><%=DepotAcreage %></span>
        <h4>数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：</h4>
        <span><%=DepotSum %></span>
        <h4>价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：</h4>
        <span><%=DepotPrice %></span>
        <h4>配套服务：</h4>
        <span><%=AppendServer %></span>
        <h4>联&nbsp;&nbsp;系&nbsp;&nbsp;人：</h4>
        <span><%=Linkman %></span>
        <h4>联系电话：</h4>
        <span><%=Phone %></span>
        <h4>有效日期：</h4>
        <span><%=Term %></span>
        <h4>发布日期：</h4>
        <span><%=FBDate %></span>
        <h4>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</h4>
        <span><%=Content %></span>
    </div>
</asp:Content>