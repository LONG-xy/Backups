<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="jobInfo.aspx.cs" Inherits="jobInfo" Title="招聘中心"%>
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
        <h4>公司名称:</h4>
        <span><%=CompanyName %></span>
        <h4>招聘职位:</h4>
        <span><%=Job %></span>
        <h4>招聘人数:</h4>
        <span><%=Number %></span>
        <h4>要求性别:</h4>
        <span><%=Sex %></span>
        <h4>要求年龄:</h4>
        <span><%=Age %></span>
        <h4>要求学历:</h4>
        <span><%=Knowledge %></span>
        <h4>要求专业:</h4>
        <span><%=Specialty %></span>
        <h4>工作经验:</h4>
        <span><%=Experience %></span>
        <h4>工作城市:</h4>
        <span><%=City %></span>
        <h4>月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;薪:</h4>
        <span><%=Pay %></span>
        <h4>详细信息:</h4>
        <span><%=ParticularInfo %></span>
        <h4>发布日期:</h4>
        <span><%=FBDate %></span>
        <h4>联&nbsp;&nbsp;系&nbsp;&nbsp;人:</h4>
        <span><%=Linkman %></span>
        <h4>联系电话:</h4>
        <span><%=CompanyPhone %></span>
        <h4>公司简介:</h4>
        <span><%=CompanyContent %></span>
    </div>
</asp:Content>