<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckInfo.aspx.cs" Inherits="BackGround_CheckInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <script type="text/javascript" src="../Scripts/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Css/DataList.css" rel="stylesheet" type="text/css" />
    <link href="../Css/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <table class="table table-hover">
            <thead><tr><th>ID</th><th>标题</th><th>联系人</th><th>电话</th><th>审核状态</th><th>操作</th></tr></thead>
            <tbody>
                <%
                    if (drs != null)
                    {
                        foreach (System.Data.DataRow dr in drs)
                        {
                %>
                        <tr>
                            <td><%=dr["id"] %></td>
                            <td><%=dr["title"] %></td>
                            <td><%=dr["LinkMan"] %></td>
                            <td><%=dr["tel"] %></td>
                            <td><%=dr["checkState"].ToString()=="True"?"<font color='green'>已审核</font>":"<font color='red'>未审核</font>" %></td>
                            <td>
                                <input type="submit" value="查看详细" class="btn btn-default" onclick="setOpear(<%=dr["id"]%>)"/>
                                <input type="submit" value="通过/取消" class="btn btn-default" onclick="setOpear(<%=dr["id"]%>,'<%=dr["checkState"] %>')"/>
                            </td>
                        </tr>
                <% 
                        }
                    }  
                %>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="6">
                        共<asp:Label ID="TotalPageIndex" runat="server" Text="1"></asp:Label>页&nbsp;
                        当前第<asp:Label ID="CurPageIndex" runat="server" Text="1"></asp:Label>页&nbsp;
                        <asp:LinkButton ID="UpPage" runat="server" OnClick="UpPage_Click">上一页</asp:LinkButton>
                        <asp:LinkButton ID="DownPage" runat="server" OnClick="DownPage_Click">下一页</asp:LinkButton>
                    </td>
                </tr>
            </tfoot>
        </table>
    </div>
    <script type="text/javascript">
        function setOpear(setID, setCheckState) {
            $("#opearID").val(setID);
            if (setCheckState == "True" || setCheckState == "False") {
                $("#opearCheckState").val(setCheckState);
            }
        }
    </script>
    <input type="hidden" id="opearID" name="opearID" value=""/>
    <input type="hidden" id="opearCheckState" name="opearCheckState" value=""/>
    </form>
</body>
</html>
