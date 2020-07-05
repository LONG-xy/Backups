<%@ Page Language="C#" AutoEventWireup="true" CodeFile="qyLeft.aspx.cs" Inherits="qyLeft" %>
<!DOCTYPE html >
<html>
<head runat="server">
    <style type="text/css">
        body {
	        margin:0px;
        }
        .leftnav {
            width:100%;
            height:500px;            
            background-color:#EC005F;
            border-bottom-left-radius:10px;
            border-bottom-right-radius:10px;
        }
        .leftnav ul{
            margin:0px;
            padding-top:50px;
            list-style-type:none;
        }
        .leftnav ul li{
            margin-top:20px;            
        }
        .leftnav>ul>li>a:hover {
            color: #464646;
            transition: 0.5s all;
            -webkit-transition: 0.5s all;
            -moz-transition: 0.5s all;
            -o-transition: 0.5s all;
            -ms-transition: 0.5s all;
        }
        .leftnav ul li a {
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size:14px;
            text-decoration:none;
            color:white;
        }        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="leftnav">
            <ul>
                <li><a target="rightFrame" class="huise1" href="issuanceTruck.aspx">发布车源信息▶</a></li>
                <li><a target="rightFrame" class="huise1" href="issuanceFreight.aspx">发布货源信息▶</a></li>
                <li><a target="rightFrame" class="huise1" href="issuanceDepot.aspx">发布仓储信息▶</a></li>
                <li><a target="rightFrame" class="huise1" href="issuanceSpecial.aspx">发布专线信息▶</a> </li>
                <li><a target="rightFrame" class="huise1" href="issuanceJob.aspx">发布招聘信息▶</a></li>
                <li><a target="rightFrame" class="huise1" href="newPass.aspx">修改密码▶</a> </li>
                <li> <a target="rightFrame" class="huise1" href="EditInfo.aspx">修改信息▶</a> </li>
                <li><a target="_parent" class="huise1" href="index.aspx">返回</a></li>
            </ul>
        </div>
    </form>
</body>
</html>
