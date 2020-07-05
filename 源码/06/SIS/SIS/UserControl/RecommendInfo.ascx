<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RecommendInfo.ascx.cs" Inherits="UserControl_RecommendInfo"%>
<div class="custom-content-recommend">
    <div class="custom-left-title"><img src="../images/newImg/fk.png"/> 推荐信息</div>
    <table class="table">
        <%
            System.Data.DataRowCollection drs = null;
            if (ds.Tables.Count > 0) {
                if (ds.Tables[0].Rows.Count > 0) {
                    drs = ds.Tables[0].Rows;
                }
            }
            if (drs != null) {
                for (int i = 0; i < drs.Count && i < 10; i++) {
                    if (i % 2 == 0)
                    {
        %>
                        <tr>
        <% 
                    }

        %>                
                    <td>
                        <span class="tuijian">
                            <span>『<%=drs[i]["type"] %>』</span>
                            ·<a class="huise" href="#" onclick="SetID(<%=drs[i]["id"] %>)" data-toggle="modal" data-target="#showLeaguer">
                                <%=drs[i]["title"] %>
                            </a>
                        </span>
                    </td>
        <%
                    if (i % 2 != 0)
                    {
        %>
                        </tr>
        <%
                    }
                }
            }
        %>
    </table>
</div>