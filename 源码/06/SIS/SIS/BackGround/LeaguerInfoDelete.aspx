<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LeaguerInfoDelete.aspx.cs" Inherits="BackGround_LeaguerInfoDelete" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <script type="text/javascript" src="../Scripts/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../Css/DataList.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem Text="显示全部信息" Value="0" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="过期信息" Value="1"></asp:ListItem>
                        <asp:ListItem Text="未过期信息" Value="2"></asp:ListItem>
                    </asp:RadioButtonList>                                
                </div>
            </div>
            <table class="table table-hover">
                <thead><tr><th>ID</th><th>标题</th><th>联系人</th><th>有效时间</th><th>操作</th></tr></thead>
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
                                <td><%=Convert.ToDateTime(dr["showDay"]).ToString("yyyy-MM-dd") %></td>
                                <td>
                                    <input type="submit" value="查看" class="btn btn-default" onclick="setOpear(<%=dr["id"]%>,100)"/>
                                    <input type="submit" value="删除" class="btn btn-default" onclick="setOpear(<%=dr["id"]%>,200)"/>
                                    <input type="submit" value="<%=dr["checkState"].ToString()=="False"?"推荐":"取消" %>" class="btn btn-default" onclick="setOpear(<%=dr["id"]%>,'<%=dr["checkState"] %>')"/>
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
            function setOpear(setID, setStateValue) {
                $("#opearID").val(setID);
                $("#opearState").val(setStateValue);
            }
        </script>
        <input type="hidden" id="opearID" name="opearID" value=""/>
        <input type="hidden" id="opearState" name="opearState" value=""/>
    </form>
</body>
</html>
